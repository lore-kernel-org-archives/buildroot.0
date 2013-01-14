From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 14 Jan 2013 22:37:10 +0100
Subject: [Buildroot] [PATCH] curlftpfs: new package
In-Reply-To: <1351604119-23101-1-git-send-email-fenixk19@mail.ru> (Alexander
 Varnin's message of "Tue, 30 Oct 2012 17:35:19 +0400")
References: <1351604119-23101-1-git-send-email-fenixk19@mail.ru>
Message-ID: <87sj63phtl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexander" == Alexander Varnin <fenixk19@mail.ru> writes:

 Alexander> From: Richard Braun <rbraun@>
 Alexander> Signed-off-by: Richard Braun <rbraun@...>
 Alexander> Signed-off-by: Alexander Varnin <fenixk19@mail.ru>

Committed with minor changes, see below.

 Alexander> diff --git a/package/Config.in b/package/Config.in
 Alexander> index 85904fb..f11cd9d 100644
 Alexander> --- a/package/Config.in
 Alexander> +++ b/package/Config.in
 Alexander> @@ -523,6 +523,7 @@ source "package/ctorrent/Config.in"
 Alexander>  source "package/cifs-utils/Config.in"
 Alexander>  source "package/conntrack-tools/Config.in"
 Alexander>  source "package/cups/Config.in"
 Alexander> +source "package/curlftpfs/Config.in"

We now have a filesystem menu, so I've moved it there.

 Alexander> +++ b/package/curlftpfs/Config.in
 Alexander> @@ -0,0 +1,17 @@
 Alexander> +config BR2_PACKAGE_CURLFTPFS
 Alexander> +	bool "curlftpfs (FUSE)"
 Alexander> +	select BR2_PACKAGE_LIBFUSE
 Alexander> +	select BR2_PACKAGE_LIBGLIB2
 Alexander> +	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 Alexander> +	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE

libintl is gone, so I've removed that.

 Alexander> +	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 Alexander> +	select BR2_PACKAGE_OPENSSL
 Alexander> +	select BR2_PACKAGE_LIBCURL
 Alexander> +	depends on BR2_LARGEFILE
 Alexander> +	depends on BR2_USE_WCHAR # glib2

I've added the dependencies of libfuse (threads + mmu).

 Alexander> +	help
 Alexander> +	  CurlFtpFS is a filesystem for accessing FTP hosts based on FUSE
 Alexander> +	  and libcurl.
 Alexander> +

And the upstream URL.

 Alexander> +comment "curlftpfs requires a toolchain with LARGEFILE and WCHAR support"
 Alexander> +	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR

And adjusted this to match.


 Alexander> diff --git a/package/curlftpfs/curlftpfs-003-configureac-fix.patch b/package/curlftpfs/curlftpfs-003-configureac-fix.patch

It's not clear to me what this patch tries to do, the package doesn't
use it as AUTORECONF isn't set to yes and it builds ok without it here,
so I've dropped it.

 Alexander> diff --git a/package/curlftpfs/curlftpfs.mk b/package/curlftpfs/curlftpfs.mk
 Alexander> new file mode 100644
 Alexander> index 0000000..9e77eb0
 Alexander> --- /dev/null
 Alexander> +++ b/package/curlftpfs/curlftpfs.mk
 Alexander> @@ -0,0 +1,14 @@
 Alexander> +#############################################################
 Alexander> +#
 Alexander> +# curlftpfs
 Alexander> +#
 Alexander> +#############################################################
 Alexander> +
 Alexander> +CURLFTPFS_VERSION = 0.9.2
 Alexander> +CURLFTPFS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/curlftpfs/$(CURLFTPFS_VERSION)

I've updated this to a dowloads.sourceforge.net URL.

 Alexander> +CURLFTPFS_DEPENDENCIES = \
 Alexander> +	libglib2 libfuse openssl libcurl \
 Alexander> +	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) \

And dropped libintl.

-- 
Bye, Peter Korsgaard
