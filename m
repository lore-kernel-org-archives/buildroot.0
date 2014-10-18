From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 18 Oct 2014 14:24:37 +0200
Subject: [Buildroot] [PATCH] btrfs-progs: bump to version 3.17
In-Reply-To: <1413632093-16706-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413632093-16706-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <CAGduivyATYUwBrY=kj_+gvHjeT4OLZM7OmtGo95jpiUPP+MKuQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo, all,

Compiled and tested using qemu (simply ran a btrfs --version) using
this toolchain:
http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-glibc-2014.08.tar.bz2

Tested-by: "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>

On Sat, Oct 18, 2014 at 1:34 PM, Gustavo Zacarias
<gustavo@zacarias.com.ar> wrote:
> Patch now silently upstream.
>
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ...001-add-option-to-disable-backtrace-usage.patch | 88 ----------------------
>  package/btrfs-progs/btrfs-progs.hash               |  2 +-
>  package/btrfs-progs/btrfs-progs.mk                 |  2 +-
>  3 files changed, 2 insertions(+), 90 deletions(-)
>  delete mode 100644 package/btrfs-progs/btrfs-progs-0001-add-option-to-disable-backtrace-usage.patch
>
> diff --git a/package/btrfs-progs/btrfs-progs-0001-add-option-to-disable-backtrace-usage.patch b/package/btrfs-progs/btrfs-progs-0001-add-option-to-disable-backtrace-usage.patch
> deleted file mode 100644
> index bcc19b6..0000000
> --- a/package/btrfs-progs/btrfs-progs-0001-add-option-to-disable-backtrace-usage.patch
> +++ /dev/null
> @@ -1,88 +0,0 @@
> -From eb8d1bbdfea80a50ce9fbf3238062a543036f855 Mon Sep 17 00:00:00 2001
> -From: Gustavo Zacarias <gustavo@zacarias.com.ar>
> -Date: Tue, 7 Oct 2014 11:03:03 -0300
> -Subject: [PATCH] btrfs-progs: add option to disable backtrace usage
> -
> -This commit adds the support for a make variable named
> -"DISABLE_BACKTRACE" which allows to disable the support for backtrace()
> -usage on ASSERT(), BUG() and BUG_ON() calls.
> -This is useful because some alternative C libraries like uClibc have
> -optional support for backtrace() which is rarely built when debugging
> -isn't taking place.
> -
> -Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ----
> - Makefile     |  4 ++++
> - kerncompat.h | 15 +++++++++++++++
> - 2 files changed, 19 insertions(+)
> -
> -diff --git a/Makefile b/Makefile
> -index 7cc7783..03a4779 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -63,6 +63,10 @@ BUILDDIRS = $(patsubst %,build-%,$(SUBDIRS))
> - INSTALLDIRS = $(patsubst %,install-%,$(SUBDIRS))
> - CLEANDIRS = $(patsubst %,clean-%,$(SUBDIRS))
> -
> -+ifeq ($(DISABLE_BACKTRACE),1)
> -+AM_CFLAGS += -DBTRFS_DISABLE_BACKTRACE
> -+endif
> -+
> - ifneq ($(DISABLE_DOCUMENTATION),1)
> - BUILDDIRS += build-Documentation
> - INSTALLDIRS += install-Documentation
> -diff --git a/kerncompat.h b/kerncompat.h
> -index 19c7fa5..889d94c 100644
> ---- a/kerncompat.h
> -+++ b/kerncompat.h
> -@@ -29,7 +29,9 @@
> - #include <stddef.h>
> - #include <linux/types.h>
> - #include <stdint.h>
> -+#ifndef BTRFS_DISABLE_BACKTRACE
> - #include <execinfo.h>
> -+#endif
> -
> - #define ptr_to_u64(x) ((u64)(uintptr_t)x)
> - #define u64_to_ptr(x) ((void *)(uintptr_t)x)
> -@@ -55,6 +57,7 @@
> - #define ULONG_MAX       (~0UL)
> - #endif
> -
> -+#ifndef BTRFS_DISABLE_BACKTRACE
> - #define MAX_BACKTRACE 16
> - static inline void print_trace(void)
> - {
> -@@ -81,6 +84,9 @@ static inline void assert_trace(const char *assertion, const char *filename,
> - }
> -
> - #define BUG() assert_trace(NULL, __FILE__, __func__, __LINE__, 0)
> -+#else
> -+#define BUG() assert(0)
> -+#endif
> -
> - #ifdef __CHECKER__
> - #define __force    __attribute__((force))
> -@@ -264,10 +270,19 @@ static inline long IS_ERR(const void *ptr)
> - #define kstrdup(x, y) strdup(x)
> - #define kfree(x) free(x)
> -
> -+#ifndef BTRFS_DISABLE_BACKTRACE
> - #define BUG_ON(c) assert_trace(#c, __FILE__, __func__, __LINE__, !(c))
> -+#else
> -+#define BUG_ON(c) assert(!(c))
> -+#endif
> -
> - #define WARN_ON(c) BUG_ON(c)
> -+
> -+#ifndef BTRFS_DISABLE_BACKTRACE
> - #define       ASSERT(c) assert_trace(#c, __FILE__, __func__, __LINE__, (c))
> -+#else
> -+#define ASSERT(c) assert(c)
> -+#endif
> -
> - #define container_of(ptr, type, member) ({                      \
> -         const typeof( ((type *)0)->member ) *__mptr = (ptr);    \
> ---
> -2.0.4
> -
> diff --git a/package/btrfs-progs/btrfs-progs.hash b/package/btrfs-progs/btrfs-progs.hash
> index af4c9cd..497f142 100644
> --- a/package/btrfs-progs/btrfs-progs.hash
> +++ b/package/btrfs-progs/btrfs-progs.hash
> @@ -1,2 +1,2 @@
>  # From https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/sha256sums.asc
> -sha256 d4d62abe0c2b8e86888f96e4bd21ca7e25c2d53120a3b9e8c6f987344147732b        btrfs-progs-v3.16.2.tar.xz
> +sha256 ecafbf71e729c7e907dac488c2e0c94983dd38420f56dce85e2a4310a06bf0a0        btrfs-progs-v3.17.tar.xz
> diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
> index d0b56cd..67d2e37 100644
> --- a/package/btrfs-progs/btrfs-progs.mk
> +++ b/package/btrfs-progs/btrfs-progs.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -BTRFS_PROGS_VERSION = 3.16.2
> +BTRFS_PROGS_VERSION = 3.17
>  BTRFS_PROGS_SITE = https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs
>  BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
>  BTRFS_PROGS_DEPENDENCIES = acl attr e2fsprogs lzo util-linux zlib
> --
> 2.0.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
