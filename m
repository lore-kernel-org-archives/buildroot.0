From: Alistair Francis <alistair23@gmail.com>
Date: Sun, 4 Jul 2021 20:30:51 +1000
Subject: [Buildroot] [PATCH 1/1] package/xen: fix build with -DNDEBUG
In-Reply-To: <20210702170742.891023-1-fontaine.fabrice@gmail.com>
References: <20210702170742.891023-1-fontaine.fabrice@gmail.com>
Message-ID: <CAKmqyKOODSr_w5ZBezvy91U_X6tBOsGNrZq1qtrYQAtxYZtkAA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jul 3, 2021 at 3:08 AM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> Fix build failure with -DNDEBUG raised since commit
> 5a8c50fe05afacc3cbe8e7347e238da9f242fab0
>
> Fixes:
>  - http://autobuild.buildroot.org/results/66573ad0abc4244c0dfeac8b684a7bfcc31c0d4d
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  .../xen/0002-xen-Makefile-drop-Werror.patch   | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/xen/0002-xen-Makefile-drop-Werror.patch
>
> diff --git a/package/xen/0002-xen-Makefile-drop-Werror.patch b/package/xen/0002-xen-Makefile-drop-Werror.patch
> new file mode 100644
> index 0000000000..f3f13dae8f
> --- /dev/null
> +++ b/package/xen/0002-xen-Makefile-drop-Werror.patch
> @@ -0,0 +1,38 @@
> +From e87870cf2645a4dafeea6afce290c6e6574c37ea Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Fri, 2 Jul 2021 19:00:30 +0200
> +Subject: [PATCH] xen/Makefile: drop -Werror
> +
> +Drop -Werror to avoid the following build failure with -DNDEBUG:
> +
> +In file included from <command-line>:0:0:
> +/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/build/xen-4.14.2/xen/include/xen/config.h:94:0: error: "NDEBUG" redefined [-Werror]
> + #define NDEBUG
> +
> +<command-line>:0:0: note: this is the location of the previous definition
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/66573ad0abc4244c0dfeac8b684a7bfcc31c0d4d
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: sent to xen-devel at lists.xenproject.org]
> +---
> + xen/Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/xen/Makefile b/xen/Makefile
> +index 89879fad4c..cf9f83b1fb 100644
> +--- a/xen/Makefile
> ++++ b/xen/Makefile
> +@@ -210,7 +210,7 @@ CFLAGS += -fomit-frame-pointer
> + endif
> +
> + CFLAGS += -nostdinc -fno-builtin -fno-common
> +-CFLAGS += -Werror -Wredundant-decls -Wno-pointer-arith
> ++CFLAGS += -Wredundant-decls -Wno-pointer-arith
> + $(call cc-option-add,CFLAGS,CC,-Wvla)
> + CFLAGS += -pipe -D__XEN__ -include $(BASEDIR)/include/xen/config.h
> + CFLAGS-$(CONFIG_DEBUG_INFO) += -g
> +--
> +2.30.2
> +
> --
> 2.30.2
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
