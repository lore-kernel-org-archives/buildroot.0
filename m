From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 31 May 2013 22:05:33 +0200
Subject: [Buildroot] [PATCH] ext-toolchain-wrapper: fix paths if
	executable was resolved by PATH
In-Reply-To: <51A5CD3F.1070100@fh-kl.de> (Patrick Ziegler's message of "Wed,
 29 May 2013 11:41:19 +0200")
References: <51A5CD3F.1070100@fh-kl.de>
Message-ID: <87ppw6x6cy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Patrick" == Patrick Ziegler <patrick.ziegler@fh-kl.de> writes:

 Patrick> If ext-toolchain-wrapper or any symbolic link to it was
 Patrick> resolved by PATH, the wrapper takes the working directory to
 Patrick> calculate the relative paths.

 Patrick> Now '/proc/self/exe' is used to resolve the absolute path to
 Patrick> the toolchain directory if the wrapper was called neither with
 Patrick> a relative nor an absolute path.

 Patrick> Signed-off-by: Patrick Ziegler <patrick.ziegler@fh-kl.de>
 Patrick> ---
 Patrick>  toolchain/toolchain-external/ext-toolchain-wrapper.c | 16 ++++++++++++++--
 Patrick>  1 file changed, 14 insertions(+), 2 deletions(-)

 Patrick> diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c b/toolchain/toolchain-external/ext-toolchain-wrapper.c
 Patrick> index 9a2fc70..e71a90a 100644
 Patrick> --- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
 Patrick> +++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
 Patrick> @@ -61,7 +61,7 @@ int main(int argc, char **argv)
 Patrick>  	char *relbasedir, *absbasedir;
 Patrick>  	char *progpath = argv[0];
 Patrick>  	char *basename;
 Patrick> -	int ret;
 Patrick> +	int ret, i, count = 0;
 
 Patrick>  	/* Calculate the relative paths */
 Patrick>  	basename = strrchr(progpath, '/');
 Patrick> @@ -77,7 +77,19 @@ int main(int argc, char **argv)
 Patrick>  		absbasedir = realpath(relbasedir, NULL);
 Patrick>  	} else {
 Patrick>  		basename = progpath;
 Patrick> -		absbasedir = realpath("../..", NULL);
 Patrick> +		absbasedir = malloc(PATH_MAX + 1);
 Patrick> +		ret = readlink("/proc/self/exe", absbasedir, PATH_MAX);
 Patrick> +		if (ret < 0) {
 Patrick> +			perror(__FILE__ ": readlink");
 Patrick> +			return 2;
 Patrick> +		}

 Patrick> +		for (i = ret; i > 0; i--) {
 Patrick> +			if ('/' == absbasedir[i]) {

The output of readlink is NOT null terminated, so you end up accessing
uninitialized data on the first iteration of this loop. I've fixed it by
an explicit:

absbasedir[ret] = '\0';

In the rest of the file we don't do the reverse order checks (value ==
var), so I've swapped those.

The toolchain wrapper has unfortunately grown quite complicated since
I've added it. I THINK we can simply always resolve /proc/self/exe and
get rid of the conditional here, but as we're this close to the release
I decided to apply your patch as it seems the safest option.

Committed, thanks.

-- 
Bye, Peter Korsgaard
