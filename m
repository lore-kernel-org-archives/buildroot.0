From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Dec 2013 21:29:36 +0100
Subject: [Buildroot] [git commit] ktap: update to v0.4
Message-ID: <20131219203519.669429C0E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=12a9c3f29538c78e54e14f6817a952ee77a6aa72
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a check for BR2_PACKAGE_ELFUTILS; if this is enabled, then try to link
against libelf from the elfutils package.  This allows ktap to resolve
symbols in userspace.

The new FFI functionality in ktap is not exposed, as it currently only
supports x86_64...

Signed-off-by: Anders Darander <anders@chargestorm.se>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ktap/Config.in                             |    3 ++
 ...p-0001-interpreter-vm.c-include-uaccess.h.patch |   27 -------------------
 package/ktap/ktap-0002-Set-PWD-in-Makefile.patch   |   28 --------------------
 package/ktap/ktap.mk                               |   10 +++++-
 4 files changed, 11 insertions(+), 57 deletions(-)

diff --git a/package/ktap/Config.in b/package/ktap/Config.in
index 7f40ce2..e665211 100644
--- a/package/ktap/Config.in
+++ b/package/ktap/Config.in
@@ -13,6 +13,9 @@ config BR2_PACKAGE_KTAP
 
 	  ktap doesn't support kernels older than 3.1.
 
+	  To be able to resolve symbols in DSO and for sdt, you need to enable
+	  elfutils.
+
 	  Your kernel must have CONFIG_EVENT_TRACING,
 	  CONFIG_PERF_EVENTS, and CONFIG_DEBUG_FS enabled to compile.
 
diff --git a/package/ktap/ktap-0001-interpreter-vm.c-include-uaccess.h.patch b/package/ktap/ktap-0001-interpreter-vm.c-include-uaccess.h.patch
deleted file mode 100644
index c7c6bbe..0000000
--- a/package/ktap/ktap-0001-interpreter-vm.c-include-uaccess.h.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 343cb5a8b11a1dfdf4262fce326113e889f13496 Mon Sep 17 00:00:00 2001
-From: Anders Darander <anders@chargestorm.se>
-Date: Sat, 9 Nov 2013 23:05:05 +0100
-Subject: [PATCH] interpreter/vm.c: include uaccess.h
-
-otherwise functions, such as copy_from_user, is implicitly defined.
-
-Signed-off-by: Anders Darander <anders@chargestorm.se>
----
- interpreter/vm.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/interpreter/vm.c b/interpreter/vm.c
-index bc7b951..f7cb794 100644
---- a/interpreter/vm.c
-+++ b/interpreter/vm.c
-@@ -28,6 +28,7 @@
- #include <linux/signal.h>
- #include <linux/sched.h>
- #include "../include/ktap.h"
-+#include <linux/uaccess.h>
- 
- #define KTAP_MINSTACK 20
- 
--- 
-1.8.4.2
-
diff --git a/package/ktap/ktap-0002-Set-PWD-in-Makefile.patch b/package/ktap/ktap-0002-Set-PWD-in-Makefile.patch
deleted file mode 100644
index e62d4f1..0000000
--- a/package/ktap/ktap-0002-Set-PWD-in-Makefile.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 90a8dd877b7766b1ba722c19569cffb68625288b Mon Sep 17 00:00:00 2001
-From: Anders Darander <anders@chargestorm.se>
-Date: Mon, 11 Nov 2013 13:04:36 +0100
-Subject: Set PWD in Makefile
-
-When cross-compiling using e.g. buildroot, PWD was not reset in the Makefile.
-That caused PWD to have an incorrect value, and thus building the module failed.
-
-Signed-off-by: Anders Darander <anders@chargestorm.se>
----
- Makefile | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Makefile b/Makefile
-index 372b41a..939d25e 100644
---- a/Makefile
-+++ b/Makefile
-@@ -25,6 +25,7 @@ ktapvm-y	:= $(INTP_OBJS)
- 
- KVERSION ?= $(shell uname -r)
- KERNEL_SRC ?= /lib/modules/$(KVERSION)/build
-+PWD := $(shell pwd)
- mod:
- 	$(MAKE) -C $(KERNEL_SRC) M=$(PWD) modules
- 
--- 
-1.8.4.2
-
diff --git a/package/ktap/ktap.mk b/package/ktap/ktap.mk
index a5d277a..2c73138 100644
--- a/package/ktap/ktap.mk
+++ b/package/ktap/ktap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KTAP_VERSION = v0.3
+KTAP_VERSION = v0.4
 KTAP_SITE = $(call github,ktap,ktap,$(KTAP_VERSION))
 KTAP_SOURCE = v$(KTAP_VERSION).tar.gz
 KTAP_LICENSE = GPLv2
@@ -12,8 +12,14 @@ KTAP_LICENSE_FILES = LICENSE-GPL
 
 KTAP_DEPENDENCIES = linux
 
+ifeq ($(BR2_PACKAGE_ELFUTILS),y)
+KTAP_DEPENDENCIES += elfutils
+else
+KTAP_FLAGS += NO_LIBELF=1
+endif
+
 define KTAP_BUILD_CMDS
-	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) ktap
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) $(KTAP_FLAGS) ktap
 	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KERNEL_SRC=$(LINUX_DIR) KVERSION=$(LINUX_VERSION_PROBED) mod
 endef
 
