From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 19 Jul 2013 08:33:26 +0200
Subject: [Buildroot] [PATCHv2 4/4] toolchain: instrument external
	toolchain wrapper
In-Reply-To: <1374184490-13855-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Thu, 18 Jul 2013 23:54:50 +0200")
References: <574ef0eb7e941dcc6c9dba3540f4aa1c213472bc.1374182572.git.yann.morin.1998@free.fr>
 <1374184490-13855-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <871u6vvz2h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Yann> If BR_DEBUG_WRAPPER is set in the envirnment, dump the actual command
 Yann> being exec()uted, to ease debugging issues with the wrapper.

 Yann> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Yann> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 Yann> ---
 Yann> Changes v1 -> v2:
 Yann>   - style fixes (Thomas)
 Yann> ---
 Yann>  toolchain/toolchain-external/ext-toolchain-wrapper.c | 8 ++++++++
 Yann>  1 file changed, 8 insertions(+)

 Yann> diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c b/toolchain/toolchain-external/ext-toolchain-wrapper.c
 Yann> index 460f255..8e56414 100644
 Yann> --- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
 Yann> +++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
 Yann> @@ -136,6 +136,14 @@ int main(int argc, char **argv)
 Yann>  	/* finish with NULL termination */
 Yann>  	*cur = NULL;
 
 Yann> +	if( getenv("BR_DEBUG_WRAPPER") ) {
 Yann> +		fprintf( stderr, "path='%s'\n", path );
 Yann> +		int i;
 Yann> +		for( i=0; args[i]; i++ ) {
 Yann> +			fprintf(stderr, "argv[%d]='%s'\n", i, args[i] );
 Yann> +		}
 Yann> +	}
 Yann> +

That's still not really the code style used elsewhere in this file.

You could argue that this feature isn't really needed as you can just
run 'strace -s 1000 -e execve <wrapper>' for basically the same
information, but OK - This is perhaps a bit more user friendly.

With that in mind, I think a more sensible output format is something
you can directly cut'n'paste and execute in the shell (after perhaps
tweaking something), so I've changed it to simply print the args space
seperated like this:

BR_DEBUG_WRAPPER=1 ./output/host/usr/bin/arm-none-linux-gnueabi-gcc --version
Executing /home/peko/source/buildroot/output/host/opt/ext-toolchain/bin/arm-none-linux-gnueabi-gcc --sysroot /home/peko/source/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot -march=armv5te -mtune=arm926ej-s -mabi=aapcs-linux -mfloat-abi=soft -msoft-float -marm -pipe --version
arm-none-linux-gnueabi-gcc (Sourcery CodeBench Lite 2013.05-24) 4.7.3
Copyright (C) 2012 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

Committed with these changes, thanks.

-- 
Bye, Peter Korsgaard
