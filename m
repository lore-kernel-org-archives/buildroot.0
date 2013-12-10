From: Anders Darander <anders@chargestorm.se>
Date: Tue, 10 Dec 2013 12:59:41 +0100
Subject: [Buildroot] [PATCH v5 1/1] ktap: new package
Message-ID: <1386676781-22541-1-git-send-email-anders@chargestorm.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add ktap, a script-based dynamic tracing tool.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---

Changes v4 -> v5:
	- Remove trailing whitespace that was added by mistake in
	last version.

Changes v3 -> v4:
        - Rename patches to start with package name.
        - Fix language in Config.in help text. (I.e.
        fix typos from ktap README).
        - Remove alignment of =
        - Use the new github helper to retrieve tarball.

Changes v2 -> v3:
        - Fix typo in TARGET_CONFIGURE_OPTS. The typo was added after
        building and running on a beaglebone, but prior to pure build
        testing on another target. ktap successfully built, but for the
        host arch...

        No update to ktap v0.4, as this will require more configure options
        to get a deterministic build. I'll update to v0.4 as soon as my
        schedule allows me some time for testing.

Changes v1 -> v2:
        - Change {} to () around e.g. LINUX_VERSION_PROBED
        - Use TARGET_CONFIGURE_OPTS instead of setting CC
        - Explicitly install to file instead of directory
        - Add depends on BR2_TOOLCHAIN_HAS_THREADS

 package/Config.in                                  |  1 +
 package/ktap/Config.in                             | 26 ++++++++++++++++++++
 ...p-0001-interpreter-vm.c-include-uaccess.h.patch | 27 +++++++++++++++++++++
 package/ktap/ktap-0002-Set-PWD-in-Makefile.patch   | 28 ++++++++++++++++++++++
 package/ktap/ktap.mk                               | 25 +++++++++++++++++++
 5 files changed, 107 insertions(+)
 create mode 100644 package/ktap/Config.in
 create mode 100644 package/ktap/ktap-0001-interpreter-vm.c-include-uaccess.h.patch
 create mode 100644 package/ktap/ktap-0002-Set-PWD-in-Makefile.patch
 create mode 100644 package/ktap/ktap.mk

diff --git a/package/Config.in b/package/Config.in
index aa928ec..40c9e31 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -50,6 +50,7 @@ source "package/duma/Config.in"
 source "package/gdb/Config.in"
 source "package/iozone/Config.in"
 source "package/kexec/Config.in"
+source "package/ktap/Config.in"
 source "package/latencytop/Config.in"
 source "package/lmbench/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/ktap/Config.in b/package/ktap/Config.in
new file mode 100644
index 0000000..43195df
--- /dev/null
+++ b/package/ktap/Config.in
@@ -0,0 +1,26 @@
+config BR2_PACKAGE_KTAP
+	bool "ktap"
+	depends on BR2_LINUX_KERNEL
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  ktap is a script-based dynamic tracing tool for Linux
+
+	  It uses a scripting language and lets users trace the Linux kernel
+	  dynamically. ktap is designed to give operational insights with
+	  interoperability that allows users to tune, troubleshoot and extend
+	  kernel and application. It's similar to Linux Systemtap and
+	  Solaris Dtrace.
+
+	  ktap doesn't support kernels older than 3.1.
+
+	  Your kernel must have CONFIG_EVENT_TRACING,
+	  CONFIG_PERF_EVENTS, and CONFIG_DEBUG_FS enabled to compile.
+
+	  http://www.ktap.org
+
+comment "ktap requires a linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
+comment "ktap needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
diff --git a/package/ktap/ktap-0001-interpreter-vm.c-include-uaccess.h.patch b/package/ktap/ktap-0001-interpreter-vm.c-include-uaccess.h.patch
new file mode 100644
index 0000000..c7c6bbe
--- /dev/null
+++ b/package/ktap/ktap-0001-interpreter-vm.c-include-uaccess.h.patch
@@ -0,0 +1,27 @@
+From 343cb5a8b11a1dfdf4262fce326113e889f13496 Mon Sep 17 00:00:00 2001
+From: Anders Darander <anders@chargestorm.se>
+Date: Sat, 9 Nov 2013 23:05:05 +0100
+Subject: [PATCH] interpreter/vm.c: include uaccess.h
+
+otherwise functions, such as copy_from_user, is implicitly defined.
+
+Signed-off-by: Anders Darander <anders@chargestorm.se>
+---
+ interpreter/vm.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/interpreter/vm.c b/interpreter/vm.c
+index bc7b951..f7cb794 100644
+--- a/interpreter/vm.c
++++ b/interpreter/vm.c
+@@ -28,6 +28,7 @@
+ #include <linux/signal.h>
+ #include <linux/sched.h>
+ #include "../include/ktap.h"
++#include <linux/uaccess.h>
+ 
+ #define KTAP_MINSTACK 20
+ 
+-- 
+1.8.4.2
+
diff --git a/package/ktap/ktap-0002-Set-PWD-in-Makefile.patch b/package/ktap/ktap-0002-Set-PWD-in-Makefile.patch
new file mode 100644
index 0000000..e62d4f1
--- /dev/null
+++ b/package/ktap/ktap-0002-Set-PWD-in-Makefile.patch
@@ -0,0 +1,28 @@
+From 90a8dd877b7766b1ba722c19569cffb68625288b Mon Sep 17 00:00:00 2001
+From: Anders Darander <anders@chargestorm.se>
+Date: Mon, 11 Nov 2013 13:04:36 +0100
+Subject: Set PWD in Makefile
+
+When cross-compiling using e.g. buildroot, PWD was not reset in the Makefile.
+That caused PWD to have an incorrect value, and thus building the module failed.
+
+Signed-off-by: Anders Darander <anders@chargestorm.se>
+---
+ Makefile | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile b/Makefile
+index 372b41a..939d25e 100644
+--- a/Makefile
++++ b/Makefile
+@@ -25,6 +25,7 @@ ktapvm-y	:= $(INTP_OBJS)
+ 
+ KVERSION ?= $(shell uname -r)
+ KERNEL_SRC ?= /lib/modules/$(KVERSION)/build
++PWD := $(shell pwd)
+ mod:
+ 	$(MAKE) -C $(KERNEL_SRC) M=$(PWD) modules
+ 
+-- 
+1.8.4.2
+
diff --git a/package/ktap/ktap.mk b/package/ktap/ktap.mk
new file mode 100644
index 0000000..a5d277a
--- /dev/null
+++ b/package/ktap/ktap.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# ktap, script-based dynamic tracing tool
+#
+################################################################################
+
+KTAP_VERSION = v0.3
+KTAP_SITE = $(call github,ktap,ktap,$(KTAP_VERSION))
+KTAP_SOURCE = v$(KTAP_VERSION).tar.gz
+KTAP_LICENSE = GPLv2
+KTAP_LICENSE_FILES = LICENSE-GPL
+
+KTAP_DEPENDENCIES = linux
+
+define KTAP_BUILD_CMDS
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) ktap
+	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KERNEL_SRC=$(LINUX_DIR) KVERSION=$(LINUX_VERSION_PROBED) mod
+endef
+
+define KTAP_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m755 $(@D)/ktap  $(TARGET_DIR)/usr/bin/ktap
+	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KERNEL_SRC=$(LINUX_DIR) KVERSION=$(LINUX_VERSION_PROBED) modules_install
+endef
+
+$(eval $(generic-package))
-- 
1.8.5.1
