From: Matthew Weber <matt@thewebers.ws>
Date: Fri, 22 Apr 2016 21:22:42 -0500
Subject: [Buildroot] [V4 3/3] dropbear: use libtomath & libtomcrypt
In-Reply-To: <1460300126-11046-3-git-send-email-francois.perrad@gadz.org>
References: <1460300126-11046-1-git-send-email-francois.perrad@gadz.org>
 <1460300126-11046-3-git-send-email-francois.perrad@gadz.org>
Message-ID: <CAFt09wN3kvzxMu64vabe=WnL8BOnirs3bAEf5TdP2QbBSgB8oA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Francois,

On Sun, Apr 10, 2016 at 9:55 AM, Francois Perrad <fperrad@gmail.com> wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/dropbear/0001-fix-linking.patch | 36 +++++++++++++++++++++++++++++++++
>  package/dropbear/Config.in              |  1 +
>  package/dropbear/dropbear.mk            |  2 ++
>  3 files changed, 39 insertions(+)
>  create mode 100644 package/dropbear/0001-fix-linking.patch
>
> diff --git a/package/dropbear/0001-fix-linking.patch b/package/dropbear/0001-fix-linking.patch
> new file mode 100644
> index 0000000..93925eb
> --- /dev/null
> +++ b/package/dropbear/0001-fix-linking.patch
> @@ -0,0 +1,36 @@
> +fix linking
> +
> +see https://github.com/mkj/dropbear/pull/28
> +
> +Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> +
> +diff --git a/Makefile.in b/Makefile.in
> +index d9bfdfa..0356b0f 100644
> +--- a/Makefile.in
> ++++ b/Makefile.in
> +@@ -16,12 +16,12 @@ endif
> + STATIC_LTC=libtomcrypt/libtomcrypt.a
> + STATIC_LTM=libtommath/libtommath.a
> +
> +-LIBTOM_LIBS=@LIBTOM_LIBS@
> ++LIBTOM_LIBS=-ltomcrypt -ltommath
> +
> + ifeq (@BUNDLED_LIBTOM@, 1)
> + LIBTOM_DEPS=$(STATIC_LTC) $(STATIC_LTM)
> + CFLAGS+=-I$(srcdir)/libtomcrypt/src/headers/
> +-LIBTOM_LIBS=$(STATIC_LTC) $(STATIC_LTM)
> ++LDFLAGS+=-L ./libtomcrypt -L ./libtommath

Since you are changing the dropbear package from using the bundled
library set that would match up a set of versions, do you think there
will be an issue when they are broken out?  ie. a bump of dropbear
would also need to take into account a bump of one or both libs.

> + endif
> +
> + COMMONOBJS=dbutil.o buffer.o dbhelpers.o \
> +@@ -84,7 +84,7 @@ INSTALL=@INSTALL@
> + CPPFLAGS=@CPPFLAGS@
> + CFLAGS+=-I. -I$(srcdir) $(CPPFLAGS) @CFLAGS@
> + LIBS+=@LIBS@
> +-LDFLAGS=@LDFLAGS@
> ++LDFLAGS+=@LDFLAGS@
> +
> + EXEEXT=@EXEEXT@
> +
> +--
> +
> diff --git a/package/dropbear/Config.in b/package/dropbear/Config.in
> index d92361f..ef4f2ad 100644
> --- a/package/dropbear/Config.in
> +++ b/package/dropbear/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_DROPBEAR
>         bool "dropbear"
>         select BR2_PACKAGE_ZLIB if !BR2_PACKAGE_DROPBEAR_SMALL
> +       select BR2_PACKAGE_LIBTOMCRYPT

I'm not sure if you should also provide the select for the LIBTOMMATH
so that it's clear it's a required dependency for this build.
Hopefully someone else weighs in.

>         help
>           A small SSH 2 server designed for small memory environments.
>
> diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
> index 32e2167..fa3642c 100644
> --- a/package/dropbear/dropbear.mk
> +++ b/package/dropbear/dropbear.mk
> @@ -9,6 +9,8 @@ DROPBEAR_SITE = http://matt.ucc.asn.au/dropbear/releases
>  DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
>  DROPBEAR_LICENSE = MIT, BSD-2c-like, BSD-2c
>  DROPBEAR_LICENSE_FILES = LICENSE
> +DROPBEAR_DEPENDENCIES = libtomcrypt

Shouldn't this also capture the libtommath library as your patch above
is explicitly linking against it?

-- 
Thanks,
Matt
