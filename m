From: Alistair Francis <alistair.francis@xilinx.com>
Date: Thu, 22 Dec 2016 14:21:57 -0800
Subject: [Buildroot] [PATCH v2] package/xen: Update to version 4.8.0
Message-ID: <1482445317-9435-1-git-send-email-alistair.francis@xilinx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update Xen to version 4.8.0 and update the patches to allow Xen
hypervisor and Xen tools to build.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---
 ...1-Remove-hardcoded-strict-Werror-checking.patch | 26 --------------
 ...ktap2-vhd-Remove-unused-struct-stat-stats.patch | 28 +++++++++++++++
 ...002-tools-blktap2-Fix-missing-header-file.patch | 30 ++++++++++++++++
 ...mk-fix-build-with-CFLAGS-from-environment.patch | 36 -------------------
 ...p2-drivers-Remove-non-existent-sys-sysctl.patch | 30 ++++++++++++++++
 ...ools-libxl-Disable-strict-Werror-checking.patch | 26 --------------
 ...e-Propagate-APPEND_CFLAGS-to-teh-kconfig-.patch | 42 ++++++++++++++++++++++
 package/xen/xen.hash                               |  2 +-
 package/xen/xen.mk                                 |  4 ++-
 9 files changed, 134 insertions(+), 90 deletions(-)
 delete mode 100644 package/xen/0001-Remove-hardcoded-strict-Werror-checking.patch
 create mode 100644 package/xen/0001-tools-blktap2-vhd-Remove-unused-struct-stat-stats.patch
 create mode 100644 package/xen/0002-tools-blktap2-Fix-missing-header-file.patch
 delete mode 100644 package/xen/0002-xen-Rules.mk-fix-build-with-CFLAGS-from-environment.patch
 create mode 100644 package/xen/0003-tools-blktap2-drivers-Remove-non-existent-sys-sysctl.patch
 delete mode 100644 package/xen/0003-tools-libxl-Disable-strict-Werror-checking.patch
 create mode 100644 package/xen/0004-xen-Makefile-Propagate-APPEND_CFLAGS-to-teh-kconfig-.patch

diff --git a/package/xen/0001-Remove-hardcoded-strict-Werror-checking.patch b/package/xen/0001-Remove-hardcoded-strict-Werror-checking.patch
deleted file mode 100644
index ca772dd..0000000
--- a/package/xen/0001-Remove-hardcoded-strict-Werror-checking.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 234847440a5d3cf95540ea79f7a08d50cccfef73 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@xilinx.com>
-Date: Tue, 13 Sep 2016 10:48:31 -0700
-Subject: [PATCH] Remove hardcoded strict -Werror checking
-
-Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
----
- Config.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Config.mk b/Config.mk
-index bd991c6..e7ac662 100644
---- a/Config.mk
-+++ b/Config.mk
-@@ -36,7 +36,7 @@ CONFIG_$(XEN_OS) := y
- SHELL     ?= /bin/sh
- 
- # Tools to run on system hosting the build
--HOSTCFLAGS  = -Wall -Werror -Wstrict-prototypes -O2 -fomit-frame-pointer
-+HOSTCFLAGS  = -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer
- HOSTCFLAGS += -fno-strict-aliasing
- 
- DISTDIR     ?= $(XEN_ROOT)/dist
--- 
-2.7.4
-
diff --git a/package/xen/0001-tools-blktap2-vhd-Remove-unused-struct-stat-stats.patch b/package/xen/0001-tools-blktap2-vhd-Remove-unused-struct-stat-stats.patch
new file mode 100644
index 0000000..b514c81
--- /dev/null
+++ b/package/xen/0001-tools-blktap2-vhd-Remove-unused-struct-stat-stats.patch
@@ -0,0 +1,28 @@
+From a30e49a6227af540441a19ebb04ed6300ea51526 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@xilinx.com>
+Date: Fri, 16 Dec 2016 13:28:47 -0800
+Subject: [PATCH 1/4] tools/blktap2/vhd: Remove unused struct stat stats
+
+The unsued variable 'struct stat stats' causes build errors in some
+situations. As it isn't used just remove it.
+
+Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
+---
+ tools/blktap2/vhd/lib/libvhd-journal.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/tools/blktap2/vhd/lib/libvhd-journal.c b/tools/blktap2/vhd/lib/libvhd-journal.c
+index 26e26e7..862890f 100644
+--- a/tools/blktap2/vhd/lib/libvhd-journal.c
++++ b/tools/blktap2/vhd/lib/libvhd-journal.c
+@@ -1260,7 +1260,6 @@ vhd_journal_create(vhd_journal_t *j, const char *file, const char *jfile)
+ 	int i, err;
+ 	size_t size;
+ 	off_t off;
+-	struct stat stats;
+ 
+ 	memset(j, 0, sizeof(vhd_journal_t));
+ 	j->jfd = -1;
+-- 
+2.7.4
+
diff --git a/package/xen/0002-tools-blktap2-Fix-missing-header-file.patch b/package/xen/0002-tools-blktap2-Fix-missing-header-file.patch
new file mode 100644
index 0000000..78f873b
--- /dev/null
+++ b/package/xen/0002-tools-blktap2-Fix-missing-header-file.patch
@@ -0,0 +1,30 @@
+From 5ec1d1014a84b4d52ef2b2f580d48677eaddcff0 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@xilinx.com>
+Date: Fri, 16 Dec 2016 14:16:39 -0800
+Subject: [PATCH 2/4] tools/blktap2: Fix missing header file
+
+To avoid build errors relating to missing declarations of ssize_t add
+the appropriate header file to atomic.h.
+
+Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
+Reviewed-by: Doug Goldstein <cardoe@cardoe.com>
+---
+ tools/blktap2/include/atomicio.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tools/blktap2/include/atomicio.h b/tools/blktap2/include/atomicio.h
+index 7eccf20..5a1120e 100644
+--- a/tools/blktap2/include/atomicio.h
++++ b/tools/blktap2/include/atomicio.h
+@@ -25,6 +25,8 @@
+  * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
++#include <sys/types.h>
++
+ /*
+  * Ensure all of data on socket comes through. f==read || f==vwrite
+  */
+-- 
+2.7.4
+
diff --git a/package/xen/0002-xen-Rules.mk-fix-build-with-CFLAGS-from-environment.patch b/package/xen/0002-xen-Rules.mk-fix-build-with-CFLAGS-from-environment.patch
deleted file mode 100644
index 0d4e581..0000000
--- a/package/xen/0002-xen-Rules.mk-fix-build-with-CFLAGS-from-environment.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 2a310549aaeaba05f640ade43488bb893101ce4a Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Sat, 29 Oct 2016 16:35:26 +0200
-Subject: [PATCH] xen/Rules.mk: fix build with CFLAGS from environment
-
-When CFLAGS are passed from the environment, the first-level make
-invocation will append -D__OBJECT_FILE__ to it, then call a second
-make invocation, that will have those new CFLAGS in its environment,
-but will also append -D__OBJECT_FILE__ to those.
-
-Then, the compiler fails because __OBEJECT_FILE__ is defined twice.
-
-Just undefine it before defining it again, as a *workaround* to this
-issue.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
- xen/Rules.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/xen/Rules.mk b/xen/Rules.mk
-index a9fda71..09ccbfa 100644
---- a/xen/Rules.mk
-+++ b/xen/Rules.mk
-@@ -49,7 +49,7 @@ ALL_OBJS-$(CONFIG_CRYPTO)   += $(BASEDIR)/crypto/built_in.o
- CFLAGS += -nostdinc -fno-builtin -fno-common
- CFLAGS += -Werror -Wredundant-decls -Wno-pointer-arith
- CFLAGS += -pipe -g -D__XEN__ -include $(BASEDIR)/include/xen/config.h
--CFLAGS += '-D__OBJECT_FILE__="$@"'
-+CFLAGS += -U__OBJECT_FILE__ '-D__OBJECT_FILE__="$@"'
- 
- ifneq ($(clang),y)
- # Clang doesn't understand this command line argument, and doesn't appear to
--- 
-2.7.4
-
diff --git a/package/xen/0003-tools-blktap2-drivers-Remove-non-existent-sys-sysctl.patch b/package/xen/0003-tools-blktap2-drivers-Remove-non-existent-sys-sysctl.patch
new file mode 100644
index 0000000..20ed1c1
--- /dev/null
+++ b/package/xen/0003-tools-blktap2-drivers-Remove-non-existent-sys-sysctl.patch
@@ -0,0 +1,30 @@
+From a85d98b76fd7d77c1d6d69c7135b2cdc979e293a Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@xilinx.com>
+Date: Mon, 19 Dec 2016 10:42:01 -0800
+Subject: [PATCH 3/4] tools/blktap2/drivers: Remove non-existent sys/sysctl.h
+ include
+
+To avoid build errors related to missing file 'sys/sysctl.h' by removing
+the #include statement.
+
+Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
+Reviewed-by: Doug Goldstein <cardoe@cardoe.com>
+---
+ tools/blktap2/drivers/block-remus.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/tools/blktap2/drivers/block-remus.c b/tools/blktap2/drivers/block-remus.c
+index 079588d..7401800 100644
+--- a/tools/blktap2/drivers/block-remus.c
++++ b/tools/blktap2/drivers/block-remus.c
+@@ -54,7 +54,6 @@
+ #include <netinet/in.h>
+ #include <arpa/inet.h>
+ #include <sys/param.h>
+-#include <sys/sysctl.h>
+ #include <unistd.h>
+ #include <sys/stat.h>
+ 
+-- 
+2.7.4
+
diff --git a/package/xen/0003-tools-libxl-Disable-strict-Werror-checking.patch b/package/xen/0003-tools-libxl-Disable-strict-Werror-checking.patch
deleted file mode 100644
index 80c0b32..0000000
--- a/package/xen/0003-tools-libxl-Disable-strict-Werror-checking.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 19f1e70041044fde1542109a0525424cc6d5d053 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@xilinx.com>
-Date: Wed, 7 Dec 2016 11:35:10 -0800
-Subject: [PATCH] tools/libxl: Disable strict Werror checking
-
-Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
----
- tools/libxl/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/libxl/Makefile b/tools/libxl/Makefile
-index defeb40..239faf3 100644
---- a/tools/libxl/Makefile
-+++ b/tools/libxl/Makefile
-@@ -11,7 +11,7 @@ MINOR = 0
- XLUMAJOR = 4.7
- XLUMINOR = 0
- 
--CFLAGS += -Werror -Wno-format-zero-length -Wmissing-declarations \
-+CFLAGS += -Wno-format-zero-length -Wmissing-declarations \
- 	-Wno-declaration-after-statement -Wformat-nonliteral
- CFLAGS += -I. -fPIC
- 
--- 
-2.7.4
-
diff --git a/package/xen/0004-xen-Makefile-Propagate-APPEND_CFLAGS-to-teh-kconfig-.patch b/package/xen/0004-xen-Makefile-Propagate-APPEND_CFLAGS-to-teh-kconfig-.patch
new file mode 100644
index 0000000..aedf444
--- /dev/null
+++ b/package/xen/0004-xen-Makefile-Propagate-APPEND_CFLAGS-to-teh-kconfig-.patch
@@ -0,0 +1,42 @@
+From 2453c392b4b7f2889f6f1969a434c81e6a67c3fa Mon Sep 17 00:00:00 2001
+From: Andrew Cooper <andrew.cooper3@citrix.com>
+Date: Thu, 22 Dec 2016 14:11:14 -0800
+Subject: [PATCH 4/4] xen/Makefile: Propagate APPEND_CFLAGS to the kconfig make
+
+Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
+[ Changes by AF:
+    - Convert diff posted on a mailing list into a patch
+]
+Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
+Reviewed-by: Doug Goldstein <cardoe@cardoe.com>
+Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
+Tested-by: Alistair Francis <alistair.francis@xilinx.com>
+---
+ xen/Makefile | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/xen/Makefile b/xen/Makefile
+index 269eee2..2f1570d 100644
+--- a/xen/Makefile
++++ b/xen/Makefile
+@@ -253,14 +253,14 @@ kconfig := silentoldconfig oldconfig config menuconfig defconfig \
+ 	randconfig
+ .PHONY: $(kconfig)
+ $(kconfig):
+-	$(MAKE) -f $(BASEDIR)/tools/kconfig/Makefile.kconfig ARCH=$(ARCH) SRCARCH=$(SRCARCH) HOSTCC="$(HOSTCC)" HOSTCXX="$(HOSTCXX)" $@
++	$(MAKE) -f $(BASEDIR)/tools/kconfig/Makefile.kconfig ARCH=$(ARCH) SRCARCH=$(SRCARCH) HOSTCC="$(HOSTCC)" HOSTCXX="$(HOSTCXX)" HOST_EXTRACFLAGS="$(APPEND_CFLAGS)" $@
+ 
+ include/config/%.conf: include/config/auto.conf.cmd $(KCONFIG_CONFIG)
+-	$(MAKE) -f $(BASEDIR)/tools/kconfig/Makefile.kconfig ARCH=$(ARCH) SRCARCH=$(SRCARCH) HOSTCC="$(HOSTCC)" HOSTCXX="$(HOSTCXX)" silentoldconfig
++	$(MAKE) -f $(BASEDIR)/tools/kconfig/Makefile.kconfig ARCH=$(ARCH) SRCARCH=$(SRCARCH) HOSTCC="$(HOSTCC)" HOSTCXX="$(HOSTCXX)" HOST_EXTRACFLAGS="$(APPEND_CFLAGS)" silentoldconfig
+ 
+ # Allow people to just run `make` as before and not force them to configure
+ $(KCONFIG_CONFIG):
+-	$(MAKE) -f $(BASEDIR)/tools/kconfig/Makefile.kconfig ARCH=$(ARCH) SRCARCH=$(SRCARCH) HOSTCC="$(HOSTCC)" HOSTCXX="$(HOSTCXX)" defconfig
++	$(MAKE) -f $(BASEDIR)/tools/kconfig/Makefile.kconfig ARCH=$(ARCH) SRCARCH=$(SRCARCH) HOSTCC="$(HOSTCC)" HOSTCXX="$(HOSTCXX)" HOST_EXTRACFLAGS="$(APPEND_CFLAGS)" defconfig
+ 
+ # Break the dependency chain for the first run
+ include/config/auto.conf.cmd: ;
+-- 
+2.7.4
+
diff --git a/package/xen/xen.hash b/package/xen/xen.hash
index c3df243..ac04a87 100644
--- a/package/xen/xen.hash
+++ b/package/xen/xen.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 e87f4b0575e78657ee23d31470a15ecf1ce8c3a92a771cda46bbcd4d0d671ffe xen-4.7.1.tar.gz
+sha256 1e15c713ab7ba3bfda8b4a285ed973529364fd1100e6dd5a61f29583dc667b04 xen-4.8.0.tar.gz
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index 7d32e52..bff86fe 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XEN_VERSION = 4.7.1
+XEN_VERSION = 4.8.0
 XEN_SITE = http://bits.xensource.com/oss-xen/release/$(XEN_VERSION)
 XEN_LICENSE = GPLv2
 XEN_LICENSE_FILES = COPYING
@@ -17,6 +17,8 @@ else ifeq ($(ARCH),arm)
 XEN_ARCH = arm32
 endif
 
+TARGET_CONFIGURE_OPTS := $(subst CFLAGS=",APPEND_CFLAGS="-Wno-error ,$(TARGET_CONFIGURE_OPTS))
+
 XEN_CONF_OPTS = --disable-ocamltools
 
 XEN_CONF_ENV = PYTHON=$(HOST_DIR)/usr/bin/python2
-- 
2.7.4
