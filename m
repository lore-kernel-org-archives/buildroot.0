From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 31 Mar 2017 11:11:14 -0700
Subject: [Buildroot] [PATCH v3] package/xen: Update to version 4.8.0
Message-ID: <20170331181114.968-1-alistair.francis@xilinx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update Xen to version 4.8.0 and update the patches to allow Xen
hypervisor and Xen tools to build.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---
Changes since v2:
 - Don't overwrite the global TARGET_CONFIGURE_OPTS variable

 ...1-Remove-hardcoded-strict-Werror-checking.patch | 26 --------------
 ...ktap2-vhd-Remove-unused-struct-stat-stats.patch | 30 ++++++++++++++++
 ...002-tools-blktap2-Fix-missing-header-file.patch | 31 ++++++++++++++++
 ...mk-fix-build-with-CFLAGS-from-environment.patch | 36 -------------------
 ...p2-remove-unused-inclusion-of-sys-sysctl..patch | 31 ++++++++++++++++
 ...ools-libxl-Disable-strict-Werror-checking.patch | 26 --------------
 ...e-Propagate-APPEND_CFLAGS-to-teh-kconfig-.patch | 42 ++++++++++++++++++++++
 package/xen/xen.hash                               |  2 +-
 package/xen/xen.mk                                 |  7 ++--
 9 files changed, 140 insertions(+), 91 deletions(-)
 delete mode 100644 package/xen/0001-Remove-hardcoded-strict-Werror-checking.patch
 create mode 100644 package/xen/0001-tools-blktap2-vhd-Remove-unused-struct-stat-stats.patch
 create mode 100644 package/xen/0002-tools-blktap2-Fix-missing-header-file.patch
 delete mode 100644 package/xen/0002-xen-Rules.mk-fix-build-with-CFLAGS-from-environment.patch
 create mode 100644 package/xen/0003-tools-blktap2-remove-unused-inclusion-of-sys-sysctl..patch
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
index 0000000..533a688
--- /dev/null
+++ b/package/xen/0001-tools-blktap2-vhd-Remove-unused-struct-stat-stats.patch
@@ -0,0 +1,30 @@
+From 341c75bf4661aa0b5411d5dcc6334ab22e0bb158 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@xilinx.com>
+Date: Tue, 20 Dec 2016 11:46:58 -0800
+Subject: [PATCH] tools/blktap2/vhd: Remove unused struct stat stats
+
+The unsued variable 'struct stat stats' causes build errors in some
+situations. As it isn't used just remove it.
+
+Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
+Reviewed-by: Doug Goldstein <cardoe@cardoe.com>
+Acked-by: Wei Liu <wei.liu2@citrix.com>
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
index 0000000..5d6f0cb
--- /dev/null
+++ b/package/xen/0002-tools-blktap2-Fix-missing-header-file.patch
@@ -0,0 +1,31 @@
+From 1226317351b4154ed6460b778f2490614f47b9d4 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@xilinx.com>
+Date: Tue, 20 Dec 2016 11:46:59 -0800
+Subject: [PATCH] tools/blktap2: Fix missing header file
+
+To avoid build errors relating to missing declarations of ssize_t add
+the appropriate header file to atomic.h.
+
+Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
+Reviewed-by: Doug Goldstein <cardoe@cardoe.com>
+Acked-by: Wei Liu <wei.liu2@citrix.com>
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
diff --git a/package/xen/0003-tools-blktap2-remove-unused-inclusion-of-sys-sysctl..patch b/package/xen/0003-tools-blktap2-remove-unused-inclusion-of-sys-sysctl..patch
new file mode 100644
index 0000000..2d82be4
--- /dev/null
+++ b/package/xen/0003-tools-blktap2-remove-unused-inclusion-of-sys-sysctl..patch
@@ -0,0 +1,31 @@
+From 74858c9eaf335658b4c19cb4a848bb721065c233 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@xilinx.com>
+Date: Tue, 20 Dec 2016 11:47:00 -0800
+Subject: [PATCH] tools/blktap2: remove unused inclusion of sys/sysctl.l
+
+That header file is not used. Removing it would avoid build error with
+musl libc, which doesn't have that header file.
+
+Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
+Reviewed-by: Doug Goldstein <cardoe@cardoe.com>
+[ wei: rewrote commit message ]
+Acked-by: Wei Liu <wei.liu2@citrix.com>
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
index 0000000..7c60d7a
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
+    - Convert diff posted on a mailing list into a patch.
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
index 7d32e52..a8300a7 100644
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
@@ -17,13 +17,16 @@ else ifeq ($(ARCH),arm)
 XEN_ARCH = arm32
 endif
 
+# We need to change CFLAGS to APPEND_CFLAGS for the Xen build system to work
+XEN_TARGET_CONFIGURE_OPTS := $(subst CFLAGS=",APPEND_CFLAGS="-Wno-error ,$(TARGET_CONFIGURE_OPTS))
+
 XEN_CONF_OPTS = --disable-ocamltools
 
 XEN_CONF_ENV = PYTHON=$(HOST_DIR)/usr/bin/python2
 XEN_MAKE_ENV = \
 	XEN_TARGET_ARCH=$(XEN_ARCH) \
 	CROSS_COMPILE=$(TARGET_CROSS) \
-	$(TARGET_CONFIGURE_OPTS)
+	$(XEN_TARGET_CONFIGURE_OPTS)
 
 ifeq ($(BR2_PACKAGE_XEN_HYPERVISOR),y)
 XEN_MAKE_OPTS += dist-xen
-- 
2.9.3
