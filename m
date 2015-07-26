From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 19:35:17 +0200
Subject: [Buildroot] [PATCH v8 1/1] mosh: new package
In-Reply-To: <1437928447-26907-1-git-send-email-christian@paral.in>
References: <1437928447-26907-1-git-send-email-christian@paral.in>
Message-ID: <20150726193517.40776cc8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christian,

On Sun, 26 Jul 2015 09:34:07 -0700, Christian Stewart wrote:
> Adding mosh, the mobile shell. Mosh uses ssh or dropbear as an initial transport to
> start mosh-server which uses UDP to communicate with the client.
> Supports a predictive model to enhance performance on weak connections
> and compensate for general lag. Also supports disconnections and
> reconnections seamlessly.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>

I applied, with some more changes:

    [Thomas:
      - Add missing dependency on host-pkgconf, as noticed by Yann
        E. Morin.
      - Indicate that openssh/dropbear is a runtime dependency.
      - Pass some variables in the configure environment to tell that SSP
        support is not available when it isn't. Otherwise, it misdetects
        the SSP support as being available, causing a build failure.]

The last item clearly meant that the build was never tested with
uClibc, which is our default C library. Please do at least a test build
with uClibc before submitting new packages.

Also, one comment below.


> diff --git a/package/mosh/0001-remove-system-locale-calls.patch b/package/mosh/0001-remove-system-locale-calls.patch
> new file mode 100644
> index 0000000..114e6ed
> --- /dev/null
> +++ b/package/mosh/0001-remove-system-locale-calls.patch
> @@ -0,0 +1,46 @@
> +The locale command is not available on many systems. As this variable
> +is unused and appears to have been written with the intent of
> +displaying the locale settings to the user, it's not really necessary.
> +As this breaks Mosh on a lot of systems, it's best to remove the calls.
> +
> +Upstream status: refused, see: https://github.com/keithw/mosh/issues/650

I think upstream refused it, because the approach of your patch is not
acceptable upstream.

> +Signed-off-by: Christian Stewart <christian@paral.in>
> +---
> + src/frontend/mosh-server.cc | 4 +++-
> + src/frontend/stmclient.cc   | 4 +++-
> + 2 files changed, 6 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/frontend/mosh-server.cc b/src/frontend/mosh-server.cc
> +index 76ed2ed..0d2f222 100644
> +--- a/src/frontend/mosh-server.cc
> ++++ b/src/frontend/mosh-server.cc
> +@@ -313,7 +313,9 @@ int main( int argc, char *argv[] )
> +       fprintf( stderr, "mosh-server needs a UTF-8 native locale to run.\n\n" );
> +       fprintf( stderr, "Unfortunately, the local environment (%s) specifies\nthe character set \"%s\",\n\n", native_ctype.str().c_str(), native_charset.c_str() );
> +       fprintf( stderr, "The client-supplied environment (%s) specifies\nthe character set \"%s\".\n\n", client_ctype.str().c_str(), client_charset.c_str() );
> +-      int unused __attribute((unused)) = system( "locale" );
> ++
> ++      fprintf( stderr, "This is a buildroot system, 'locale' debug output has been removed." );

Here is what your patch should do instead:

	if (locale command exists)
		int unused __attribute((unused)) = system( "locale" );
	else
		fprintf( stderr, "locale command not found, cannot show related debug output." );

I'm pretty sure this is going to make your patch much more acceptable
upstream. Can you retry with something like that?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
