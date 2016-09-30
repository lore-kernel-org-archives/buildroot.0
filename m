From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 30 Sep 2016 09:31:15 +0200
Subject: [Buildroot] [PATCH] uclibc: fix compile if locales are enabled
In-Reply-To: <20160929104355.GA24031@waldemar-brodkorb.de>
References: <20160929104355.GA24031@waldemar-brodkorb.de>
Message-ID: <CAGm1_kvrfqd_XxczKZwYaraCBQCGE_vqXPf6rkogtsX==_K5EA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 29, 2016 at 12:43 PM, Waldemar Brodkorb <wbx@openadk.org> wrote:
> Reported via #buildroot, the newly activated locale
> tool should only build for the target, not for the host.
>
> Fix from upstream.
>
> Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>

Tested-by: Yegor Yefremov <yegorslists@googlemail.com>

Thanks for fixing this.

Yegor

> ---
>  ...remove-building-for-the-host-as-it-breaks.patch | 48 ++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 package/uclibc/0001-locale-remove-building-for-the-host-as-it-breaks.patch
>
> diff --git a/package/uclibc/0001-locale-remove-building-for-the-host-as-it-breaks.patch b/package/uclibc/0001-locale-remove-building-for-the-host-as-it-breaks.patch
> new file mode 100644
> index 0000000..a04c6c6
> --- /dev/null
> +++ b/package/uclibc/0001-locale-remove-building-for-the-host-as-it-breaks.patch
> @@ -0,0 +1,48 @@
> +From 8c53e7524dfb9127b006e773307fdaa4df899a04 Mon Sep 17 00:00:00 2001
> +From: Waldemar Brodkorb <wbx@uclibc-ng.org>
> +Date: Thu, 29 Sep 2016 11:40:52 +0200
> +Subject: [PATCH] locale: remove building for the host, as it breaks
> +
> +Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
> +---
> + utils/Makefile.in | 10 +---------
> + 1 file changed, 1 insertion(+), 9 deletions(-)
> +
> +diff --git a/utils/Makefile.in b/utils/Makefile.in
> +index 5457776..8666f89 100644
> +--- a/utils/Makefile.in
> ++++ b/utils/Makefile.in
> +@@ -64,10 +64,6 @@ BUILD_CFLAGS-ldd.host      := \
> +                               -I$(top_srcdir)ldso/ldso/$(TARGET_ARCH) \
> +                               -I$(top_srcdir)ldso/include \
> +                               -include $(top_srcdir)include/elf.h
> +-BUILD_CFLAGS-locale.host   := \
> +-                              -DNOT_IN_libc \
> +-                              -I$(top_srcdir)utils/ \
> +-                              -I.
> + BUILD_CFLAGS-iconv.host    := \
> +                       -include $(top_builddir)extra/locale/c8tables.h \
> +                       -I$(top_srcdir)libc/misc/wchar -DL_iconv_main
> +@@ -97,7 +93,6 @@ endif
> + utils_OBJ := $(patsubst %,$(utils_OUT)/%,$(utils_OBJ))
> +
> + hostutils_OBJ := $(patsubst %,%.host,$(utils_OBJ))
> +-hostutils_LOCALE_OBJ := $(patsubst %,%.host,$(utils_LOCALE_OBJ))
> +
> + utils: $(utils_OBJ) $(utils_LOCALE_OBJ)
> +
> +@@ -109,10 +104,7 @@ $(utils_OBJ): $(utils_OUT)/% : $(utils_DIR)/%.c | $(libc)
> + $(utils_OUT)/locale: $(top_srcdir)extra/locale/programs/locale.c | $(libc)
> +       $(compile.u)
> +
> +-$(utils_OUT)/locale.host: $(top_srcdir)extra/locale/programs/locale.c | $(libc)
> +-      $(hcompile.u)
> +-
> +-hostutils: $(hostutils_OBJ) $(hostutils_LOCALE_OBJ)
> ++hostutils: $(hostutils_OBJ)
> +
> + $(hostutils_OBJ): $(utils_OUT)/%.host : $(utils_DIR)/%.c
> +       $(hcompile.u)
> +--
> +2.1.4
> +
> --
> 2.1.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
