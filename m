From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Sep 2018 14:16:12 +0200
Subject: [Buildroot] [PATCH 1/1] netsnmp: fix static build with openssl
In-Reply-To: <20180909085119.27976-1-fontaine.fabrice@gmail.com>
References: <20180909085119.27976-1-fontaine.fabrice@gmail.com>
Message-ID: <20180909141612.43915a59@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

Thanks for working on this!

On Sun,  9 Sep 2018 10:51:19 +0200, Fabrice Fontaine wrote:

> +diff --git a/configure.d/config_os_libs2 b/configure.d/config_os_libs2
> +index 74bed6bf7..84ebb77f5 100644
> +--- a/configure.d/config_os_libs2
> ++++ b/configure.d/config_os_libs2
> +@@ -309,13 +309,13 @@ if test "x$tryopenssl" != "xno" -a "x$tryopenssl" != "xinternal"; then
> +         LIBS="$netsnmp_save_LIBS"
> + 
> +         if test x$CRYPTO = x; then
> +-            AC_CHECK_LIB([crypto], [EVP_md5], [CRYPTO="crypto"])
> ++            AC_CHECK_LIB([crypto], [EVP_md5], [CRYPTO="crypto"], [], -lz)
> +         fi
> + 
> +         if test x$CRYPTO != x; then
> +             AC_DEFINE(HAVE_LIBCRYPTO, 1,
> +                 [Define to 1 if you have the OpenSSL library (-lcrypto or -leay32).])
> +-            LIBCRYPTO="-l${CRYPTO}"
> ++            LIBCRYPTO="-l${CRYPTO} -lz"
> +             netsnmp_save_LIBS="$LIBS"
> +             LIBS="$LIBCRYPTO"
> +             AC_CHECK_FUNCS([AES_cfb128_encrypt]dnl
> +@@ -345,7 +345,7 @@ if test "x$tryopenssl" != "xno" -a "x$tryopenssl" != "xinternal"; then
> +             LIBS="$netsnmp_save_LIBS"
> +         fi
> +         netsnmp_save_LIBS="$LIBS"
> +-        LIBS="-lssl"
> ++        LIBS="-lssl $LIBCRYPTO"
> +         AC_CHECK_FUNCS([TLS_method TLSv1_method DTLS_method DTLSv1_method]dnl
> +                        [SSL_library_init SSL_load_error_strings])
> +         LIBS="$netsnmp_save_LIBS"

If you're patching the configure.ac stuff, what about doing the right
thing, and use pkg-config ? :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
