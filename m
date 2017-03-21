From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 21 Mar 2017 09:41:02 +0100
Subject: [Buildroot] [PATCH] irssi: add patch to fix static linking
In-Reply-To: <20170321034553.5357-1-rprebello@gmail.com>
References: <20170321034553.5357-1-rprebello@gmail.com>
Message-ID: <22310065-0e30-32bc-e1a3-9957ac59d791@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21-03-17 04:45, Rodrigo Rebello wrote:
> An upstream change which removed the option to build Irssi without SSL
> support (v1.0.0 and later) also eliminated the use of PKG_CHECK_MODULES
> to find the OpenSSL library, relying only on a test with AC_CHECK_LIB
> for that purpose.
> 
> This unfortunately broke static linking since the flag to link with
> zlib, used by OpenSSL, is missed completely.
> 
> The newly added patch therefore adds PKG_CHECK_MODULES back into the
> configure script.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/e8b51f65525246d1205a26859d418393aaebf48c/
>   http://autobuild.buildroot.net/results/35d952b3b36e295723bf8ed1badb4c9439201822/
>   http://autobuild.buildroot.net/results/ea8af1458edf3ce0e2b1c444d2ae29ac1e5d2fbf/
>   [...]
> 
> Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>

 Excellent patch!
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 One question though...

> ---
[snip]
> ++dnl **
> ++dnl ** OpenSSL checks
> ++dnl **
> ++PKG_CHECK_MODULES([OPENSSL], [openssl], [
> ++	CFLAGS="$CFLAGS $OPENSSL_CFLAGS"
> ++	LIBS="$LIBS $OPENSSL_LIBS"
> ++], [
> ++	AC_CHECK_LIB([ssl], [SSL_library_init], [
> ++		LIBS="$LIBS -lssl -lcrypto"

 Is it useful to fall back to the non-pkg-config case? Due to glib2, pkg-config
is a hard requirement now, so this would only be to support pre-pkg-config
openssl versions, and I believe those are so ancient that they likely would
break API. I didn't actually check that, however.

 Regards,
 Arnout

> ++	], [
> ++		AC_MSG_ERROR([The OpenSSL library was not found])
> ++	])
> ++])
> + 
> + dnl **
> + dnl ** curses checks
> +-- 
> +2.11.0
> +
> diff --git a/package/irssi/irssi.mk b/package/irssi/irssi.mk
> index 7df7bbc44..dfb1e2878 100644
> --- a/package/irssi/irssi.mk
> +++ b/package/irssi/irssi.mk
> @@ -13,6 +13,9 @@ IRSSI_LICENSE = GPLv2+
>  IRSSI_LICENSE_FILES = COPYING
>  IRSSI_DEPENDENCIES = host-pkgconf libglib2 ncurses openssl
>  
> +# We're patching configure.ac, so we need to autoreconf
> +IRSSI_AUTORECONF = YES
> +
>  IRSSI_CONF_OPTS = \
>  	--disable-glibtest \
>  	--with-ncurses=$(STAGING_DIR)/usr \
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
