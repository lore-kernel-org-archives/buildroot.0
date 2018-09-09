From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 9 Sep 2018 14:43:41 +0200
Subject: [Buildroot] [PATCH 1/1] netsnmp: fix static build with openssl
In-Reply-To: <20180909141612.43915a59@windsurf.home>
References: <20180909085119.27976-1-fontaine.fabrice@gmail.com>
 <20180909141612.43915a59@windsurf.home>
Message-ID: <CAPi7W81tAT9=LeVBT6gCR7a57S72ynpganrm4rSLq5viv4oUqw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Le dim. 9 sept. 2018 ? 14:16, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
a ?crit :

> Hello Fabrice,
>
> Thanks for working on this!
>
> On Sun,  9 Sep 2018 10:51:19 +0200, Fabrice Fontaine wrote:
>
> > +diff --git a/configure.d/config_os_libs2 b/configure.d/config_os_libs2
> > +index 74bed6bf7..84ebb77f5 100644
> > +--- a/configure.d/config_os_libs2
> > ++++ b/configure.d/config_os_libs2
> > +@@ -309,13 +309,13 @@ if test "x$tryopenssl" != "xno" -a "x$tryopenssl"
> != "xinternal"; then
> > +         LIBS="$netsnmp_save_LIBS"
> > +
> > +         if test x$CRYPTO = x; then
> > +-            AC_CHECK_LIB([crypto], [EVP_md5], [CRYPTO="crypto"])
> > ++            AC_CHECK_LIB([crypto], [EVP_md5], [CRYPTO="crypto"], [],
> -lz)
> > +         fi
> > +
> > +         if test x$CRYPTO != x; then
> > +             AC_DEFINE(HAVE_LIBCRYPTO, 1,
> > +                 [Define to 1 if you have the OpenSSL library (-lcrypto
> or -leay32).])
> > +-            LIBCRYPTO="-l${CRYPTO}"
> > ++            LIBCRYPTO="-l${CRYPTO} -lz"
> > +             netsnmp_save_LIBS="$LIBS"
> > +             LIBS="$LIBCRYPTO"
> > +             AC_CHECK_FUNCS([AES_cfb128_encrypt]dnl
> > +@@ -345,7 +345,7 @@ if test "x$tryopenssl" != "xno" -a "x$tryopenssl"
> != "xinternal"; then
> > +             LIBS="$netsnmp_save_LIBS"
> > +         fi
> > +         netsnmp_save_LIBS="$LIBS"
> > +-        LIBS="-lssl"
> > ++        LIBS="-lssl $LIBCRYPTO"
> > +         AC_CHECK_FUNCS([TLS_method TLSv1_method DTLS_method
> DTLSv1_method]dnl
> > +                        [SSL_library_init SSL_load_error_strings])
> > +         LIBS="$netsnmp_save_LIBS"
>
> If you're patching the configure.ac stuff, what about doing the right
> thing, and use pkg-config ? :-)
>
Because the last time I tried to use pkg-config, the upstream project
decided to refuse the merge request and use ac_search_libs instead:
https://gitlab.com/muttmua/mutt/merge_requests/25 :-(
I know that netsnmp is already using pkg-config, but only for libnl perhaps
they would agree to use it also for ssl. I'll ask them and if they agree
I'll update my patch.

>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com


Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180909/d3951079/attachment.html>
