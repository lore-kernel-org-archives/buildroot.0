From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 22 Dec 2016 11:59:34 -0800
Subject: [Buildroot] [PATCH] package/xen: Update to version 4.8.0
In-Reply-To: <1482433133-25363-1-git-send-email-alistair.francis@xilinx.com>
References: <1482433133-25363-1-git-send-email-alistair.francis@xilinx.com>
Message-ID: <CAKmqyKNSwbOXSo1JEvUOLY2VyH0XWmLpaSdBxwSyZ+kE0_9BXA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 22, 2016 at 10:58 AM, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> Update Xen to version 4.8.0 and update the patches to allow Xen
> hypervisor and Xen tools to build.
>
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> ---
>  ...1-Remove-hardcoded-strict-Werror-checking.patch | 53 +++++++++++++++++++---
>  ...ktap2-vhd-Remove-unused-struct-stat-stats.patch | 28 ++++++++++++
>  ...mk-fix-build-with-CFLAGS-from-environment.patch | 36 ---------------
>  ...003-tools-blktap2-Fix-missing-header-file.patch | 30 ++++++++++++
>  ...ools-libxl-Disable-strict-Werror-checking.patch | 26 -----------
>  ...p2-drivers-Remove-non-existent-sys-sysctl.patch | 30 ++++++++++++
>  package/xen/xen.hash                               |  2 +-
>  package/xen/xen.mk                                 |  6 ++-
>  8 files changed, 140 insertions(+), 71 deletions(-)
>  create mode 100644 package/xen/0002-tools-blktap2-vhd-Remove-unused-struct-stat-stats.patch
>  delete mode 100644 package/xen/0002-xen-Rules.mk-fix-build-with-CFLAGS-from-environment.patch
>  create mode 100644 package/xen/0003-tools-blktap2-Fix-missing-header-file.patch
>  delete mode 100644 package/xen/0003-tools-libxl-Disable-strict-Werror-checking.patch
>  create mode 100644 package/xen/0004-tools-blktap2-drivers-Remove-non-existent-sys-sysctl.patch
>
> diff --git a/package/xen/0001-Remove-hardcoded-strict-Werror-checking.patch b/package/xen/0001-Remove-hardcoded-strict-Werror-checking.patch
> index ca772dd..e46aaa2 100644
> --- a/package/xen/0001-Remove-hardcoded-strict-Werror-checking.patch
> +++ b/package/xen/0001-Remove-hardcoded-strict-Werror-checking.patch
> @@ -1,18 +1,21 @@
> -From 234847440a5d3cf95540ea79f7a08d50cccfef73 Mon Sep 17 00:00:00 2001
> +From c5faab74636ae26f605bad2acc4e85ebc32303e7 Mon Sep 17 00:00:00 2001
>  From: Alistair Francis <alistair.francis@xilinx.com>
>  Date: Tue, 13 Sep 2016 10:48:31 -0700
> -Subject: [PATCH] Remove hardcoded strict -Werror checking
> +Subject: [PATCH 1/4] Remove hardcoded strict -Werror checking
>
>  Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>  ---
> - Config.mk | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> + Config.mk                      | 2 +-
> + tools/blktap2/drivers/Makefile | 1 -
> + tools/libxl/Makefile           | 2 +-
> + tools/xentrace/Makefile        | 2 --
> + 4 files changed, 2 insertions(+), 5 deletions(-)
>
>  diff --git a/Config.mk b/Config.mk
> -index bd991c6..e7ac662 100644
> +index 73e2ba9..3b7a4bd 100644
>  --- a/Config.mk
>  +++ b/Config.mk
> -@@ -36,7 +36,7 @@ CONFIG_$(XEN_OS) := y
> +@@ -34,7 +34,7 @@ CONFIG_$(XEN_OS) := y
>   SHELL     ?= /bin/sh
>
>   # Tools to run on system hosting the build
> @@ -21,6 +24,44 @@ index bd991c6..e7ac662 100644
>   HOSTCFLAGS += -fno-strict-aliasing
>
>   DISTDIR     ?= $(XEN_ROOT)/dist
> +diff --git a/tools/blktap2/drivers/Makefile b/tools/blktap2/drivers/Makefile
> +index 5328c40..7a62a3f 100644
> +--- a/tools/blktap2/drivers/Makefile
> ++++ b/tools/blktap2/drivers/Makefile
> +@@ -9,7 +9,6 @@ QCOW_UTIL  = img2qcow qcow-create qcow2raw
> + LOCK_UTIL  = lock-util
> + INST_DIR   = $(sbindir)
> +
> +-CFLAGS    += -Werror
> + CFLAGS    += -Wno-unused
> + CFLAGS    += -fno-strict-aliasing
> + CFLAGS    += -I$(BLKTAP_ROOT)/include -I$(BLKTAP_ROOT)/drivers
> +diff --git a/tools/libxl/Makefile b/tools/libxl/Makefile
> +index ef01785..a4c31f8 100644
> +--- a/tools/libxl/Makefile
> ++++ b/tools/libxl/Makefile
> +@@ -11,7 +11,7 @@ MINOR = 0
> + XLUMAJOR = 4.8
> + XLUMINOR = 0
> +
> +-CFLAGS += -Werror -Wno-format-zero-length -Wmissing-declarations \
> ++CFLAGS += -Wno-format-zero-length -Wmissing-declarations \
> +       -Wno-declaration-after-statement -Wformat-nonliteral
> + CFLAGS += -I. -fPIC
> +
> +diff --git a/tools/xentrace/Makefile b/tools/xentrace/Makefile
> +index c8c36a8..ac5c534 100644
> +--- a/tools/xentrace/Makefile
> ++++ b/tools/xentrace/Makefile
> +@@ -1,8 +1,6 @@
> + XEN_ROOT=$(CURDIR)/../..
> + include $(XEN_ROOT)/tools/Rules.mk
> +
> +-CFLAGS += -Werror
> +-
> + CFLAGS += $(CFLAGS_libxenevtchn)
> + CFLAGS += $(CFLAGS_libxenctrl)
> + LDLIBS += $(LDLIBS_libxenevtchn)
>  --
>  2.7.4
>
> diff --git a/package/xen/0002-tools-blktap2-vhd-Remove-unused-struct-stat-stats.patch b/package/xen/0002-tools-blktap2-vhd-Remove-unused-struct-stat-stats.patch
> new file mode 100644
> index 0000000..eafe62e
> --- /dev/null
> +++ b/package/xen/0002-tools-blktap2-vhd-Remove-unused-struct-stat-stats.patch
> @@ -0,0 +1,28 @@
> +From 407cd5fae855fe938b19908f1a4ad7b22dd3ef42 Mon Sep 17 00:00:00 2001
> +From: Alistair Francis <alistair.francis@xilinx.com>
> +Date: Fri, 16 Dec 2016 13:28:47 -0800
> +Subject: [PATCH 2/4] tools/blktap2/vhd: Remove unused struct stat stats
> +
> +The unsued variable 'struct stat stats' causes build errors in some
> +situations. As it isn't used just remove it.
> +
> +Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> +---
> + tools/blktap2/vhd/lib/libvhd-journal.c | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/tools/blktap2/vhd/lib/libvhd-journal.c b/tools/blktap2/vhd/lib/libvhd-journal.c
> +index 26e26e7..862890f 100644
> +--- a/tools/blktap2/vhd/lib/libvhd-journal.c
> ++++ b/tools/blktap2/vhd/lib/libvhd-journal.c
> +@@ -1260,7 +1260,6 @@ vhd_journal_create(vhd_journal_t *j, const char *file, const char *jfile)
> +       int i, err;
> +       size_t size;
> +       off_t off;
> +-      struct stat stats;
> +
> +       memset(j, 0, sizeof(vhd_journal_t));
> +       j->jfd = -1;
> +--
> +2.7.4
> +
> diff --git a/package/xen/0002-xen-Rules.mk-fix-build-with-CFLAGS-from-environment.patch b/package/xen/0002-xen-Rules.mk-fix-build-with-CFLAGS-from-environment.patch
> deleted file mode 100644
> index 0d4e581..0000000
> --- a/package/xen/0002-xen-Rules.mk-fix-build-with-CFLAGS-from-environment.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From 2a310549aaeaba05f640ade43488bb893101ce4a Mon Sep 17 00:00:00 2001
> -From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> -Date: Sat, 29 Oct 2016 16:35:26 +0200
> -Subject: [PATCH] xen/Rules.mk: fix build with CFLAGS from environment
> -
> -When CFLAGS are passed from the environment, the first-level make
> -invocation will append -D__OBJECT_FILE__ to it, then call a second
> -make invocation, that will have those new CFLAGS in its environment,
> -but will also append -D__OBJECT_FILE__ to those.
> -
> -Then, the compiler fails because __OBEJECT_FILE__ is defined twice.
> -
> -Just undefine it before defining it again, as a *workaround* to this
> -issue.
> -
> -Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ----
> - xen/Rules.mk | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/xen/Rules.mk b/xen/Rules.mk
> -index a9fda71..09ccbfa 100644
> ---- a/xen/Rules.mk
> -+++ b/xen/Rules.mk
> -@@ -49,7 +49,7 @@ ALL_OBJS-$(CONFIG_CRYPTO)   += $(BASEDIR)/crypto/built_in.o
> - CFLAGS += -nostdinc -fno-builtin -fno-common
> - CFLAGS += -Werror -Wredundant-decls -Wno-pointer-arith
> - CFLAGS += -pipe -g -D__XEN__ -include $(BASEDIR)/include/xen/config.h
> --CFLAGS += '-D__OBJECT_FILE__="$@"'
> -+CFLAGS += -U__OBJECT_FILE__ '-D__OBJECT_FILE__="$@"'
> -
> - ifneq ($(clang),y)
> - # Clang doesn't understand this command line argument, and doesn't appear to
> ---
> -2.7.4
> -
> diff --git a/package/xen/0003-tools-blktap2-Fix-missing-header-file.patch b/package/xen/0003-tools-blktap2-Fix-missing-header-file.patch
> new file mode 100644
> index 0000000..8674c28
> --- /dev/null
> +++ b/package/xen/0003-tools-blktap2-Fix-missing-header-file.patch
> @@ -0,0 +1,30 @@
> +From 62436d3d0f8a2d027f57b3b9108b43e2d84795fd Mon Sep 17 00:00:00 2001
> +From: Alistair Francis <alistair.francis@xilinx.com>
> +Date: Fri, 16 Dec 2016 14:16:39 -0800
> +Subject: [PATCH 3/4] tools/blktap2: Fix missing header file
> +
> +To avoid build errors relating to missing declarations of ssize_t add
> +the appropriate header file to atomic.h.
> +
> +Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> +Reviewed-by: Doug Goldstein <cardoe@cardoe.com>
> +---
> + tools/blktap2/include/atomicio.h | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/tools/blktap2/include/atomicio.h b/tools/blktap2/include/atomicio.h
> +index 7eccf20..5a1120e 100644
> +--- a/tools/blktap2/include/atomicio.h
> ++++ b/tools/blktap2/include/atomicio.h
> +@@ -25,6 +25,8 @@
> +  * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> +  */
> +
> ++#include <sys/types.h>
> ++
> + /*
> +  * Ensure all of data on socket comes through. f==read || f==vwrite
> +  */
> +--
> +2.7.4
> +
> diff --git a/package/xen/0003-tools-libxl-Disable-strict-Werror-checking.patch b/package/xen/0003-tools-libxl-Disable-strict-Werror-checking.patch
> deleted file mode 100644
> index 80c0b32..0000000
> --- a/package/xen/0003-tools-libxl-Disable-strict-Werror-checking.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -From 19f1e70041044fde1542109a0525424cc6d5d053 Mon Sep 17 00:00:00 2001
> -From: Alistair Francis <alistair.francis@xilinx.com>
> -Date: Wed, 7 Dec 2016 11:35:10 -0800
> -Subject: [PATCH] tools/libxl: Disable strict Werror checking
> -
> -Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> ----
> - tools/libxl/Makefile | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/tools/libxl/Makefile b/tools/libxl/Makefile
> -index defeb40..239faf3 100644
> ---- a/tools/libxl/Makefile
> -+++ b/tools/libxl/Makefile
> -@@ -11,7 +11,7 @@ MINOR = 0
> - XLUMAJOR = 4.7
> - XLUMINOR = 0
> -
> --CFLAGS += -Werror -Wno-format-zero-length -Wmissing-declarations \
> -+CFLAGS += -Wno-format-zero-length -Wmissing-declarations \
> -       -Wno-declaration-after-statement -Wformat-nonliteral
> - CFLAGS += -I. -fPIC
> -
> ---
> -2.7.4
> -
> diff --git a/package/xen/0004-tools-blktap2-drivers-Remove-non-existent-sys-sysctl.patch b/package/xen/0004-tools-blktap2-drivers-Remove-non-existent-sys-sysctl.patch
> new file mode 100644
> index 0000000..feb7468
> --- /dev/null
> +++ b/package/xen/0004-tools-blktap2-drivers-Remove-non-existent-sys-sysctl.patch
> @@ -0,0 +1,30 @@
> +From a004ac0b26020fdeff453b2620124ef3ae6502f4 Mon Sep 17 00:00:00 2001
> +From: Alistair Francis <alistair.francis@xilinx.com>
> +Date: Mon, 19 Dec 2016 10:42:01 -0800
> +Subject: [PATCH 4/4] tools/blktap2/drivers: Remove non-existent sys/sysctl.h
> + include
> +
> +To avoid build errors related to missing file 'sys/sysctl.h' by removing
> +the #include statement.
> +
> +Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> +Reviewed-by: Doug Goldstein <cardoe@cardoe.com>
> +---
> + tools/blktap2/drivers/block-remus.c | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/tools/blktap2/drivers/block-remus.c b/tools/blktap2/drivers/block-remus.c
> +index 079588d..7401800 100644
> +--- a/tools/blktap2/drivers/block-remus.c
> ++++ b/tools/blktap2/drivers/block-remus.c
> +@@ -54,7 +54,6 @@
> + #include <netinet/in.h>
> + #include <arpa/inet.h>
> + #include <sys/param.h>
> +-#include <sys/sysctl.h>
> + #include <unistd.h>
> + #include <sys/stat.h>
> +
> +--
> +2.7.4
> +
> diff --git a/package/xen/xen.hash b/package/xen/xen.hash
> index c3df243..ac04a87 100644
> --- a/package/xen/xen.hash
> +++ b/package/xen/xen.hash
> @@ -1,2 +1,2 @@
>  # Locally computed
> -sha256 e87f4b0575e78657ee23d31470a15ecf1ce8c3a92a771cda46bbcd4d0d671ffe xen-4.7.1.tar.gz
> +sha256 1e15c713ab7ba3bfda8b4a285ed973529364fd1100e6dd5a61f29583dc667b04 xen-4.8.0.tar.gz
> diff --git a/package/xen/xen.mk b/package/xen/xen.mk
> index 7d32e52..6d8ca69 100644
> --- a/package/xen/xen.mk
> +++ b/package/xen/xen.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -XEN_VERSION = 4.7.1
> +XEN_VERSION = 4.8.0
>  XEN_SITE = http://bits.xensource.com/oss-xen/release/$(XEN_VERSION)
>  XEN_LICENSE = GPLv2
>  XEN_LICENSE_FILES = COPYING
> @@ -23,7 +23,9 @@ XEN_CONF_ENV = PYTHON=$(HOST_DIR)/usr/bin/python2
>  XEN_MAKE_ENV = \
>         XEN_TARGET_ARCH=$(XEN_ARCH) \
>         CROSS_COMPILE=$(TARGET_CROSS) \
> -       $(TARGET_CONFIGURE_OPTS)
> +       $(TARGET_CONFIGURE_OPTS) \
> +       APPEND_CFLAGS="$(CFLAGS) -Wno-error" \
> +       unset CFLAGS;

Woops, this isn't right. I need an actual way to unset CFLAGS.

Thanks,

Alistair

>
>  ifeq ($(BR2_PACKAGE_XEN_HYPERVISOR),y)
>  XEN_MAKE_OPTS += dist-xen
> --
> 2.7.4
>
