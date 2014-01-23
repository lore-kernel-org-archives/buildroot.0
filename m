From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 23 Jan 2014 08:17:27 +0100
Subject: [Buildroot] [PATCH] zlog: new package
Message-ID: <1390461447-17521-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                                  |    1 +
 package/zlog/Config.in                             |   12 +++++++
 .../zlog/zlog-01-fix-compiling-on-Buildroot.patch  |   32 ++++++++++++++++++++
 package/zlog/zlog.mk                               |   26 ++++++++++++++++
 4 files changed, 71 insertions(+), 0 deletions(-)
 create mode 100644 package/zlog/Config.in
 create mode 100644 package/zlog/zlog-01-fix-compiling-on-Buildroot.patch
 create mode 100644 package/zlog/zlog.mk

diff --git a/package/Config.in b/package/Config.in
index 397cc11..cdf7b95 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -763,6 +763,7 @@ source "package/protobuf-c/Config.in"
 source "package/schifra/Config.in"
 source "package/startup-notification/Config.in"
 source "package/tzdata/Config.in"
+source "package/zlog/Config.in"
 endmenu
 
 menu "Security"
diff --git a/package/zlog/Config.in b/package/zlog/Config.in
new file mode 100644
index 0000000..478b2f8
--- /dev/null
+++ b/package/zlog/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_ZLOG
+	bool "zlog"
+	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  zlog is a reliable, high-performance, thread safe, flexible,
+	  clear-model, pure C logging library.
+
+	  https://github.com/HardySimpson/zlog
+
+comment "zlog needs a toolchain w/ threads, largefile"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE
diff --git a/package/zlog/zlog-01-fix-compiling-on-Buildroot.patch b/package/zlog/zlog-01-fix-compiling-on-Buildroot.patch
new file mode 100644
index 0000000..32aa7d6
--- /dev/null
+++ b/package/zlog/zlog-01-fix-compiling-on-Buildroot.patch
@@ -0,0 +1,32 @@
+From a9f6a55bdb29a2bebc96a68ab53077906c25a9df Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Wed, 22 Jan 2014 15:04:42 +0100
+Subject: [PATCH] Fix compiling on Buildroot
+
+Buildroot always specifies -D_LARGEFILE_SOURCE, -D_LARGEFILE64_SOURCE,
+-D_FILE_OFFSET_BITS=64, so define them only if they are not already
+defined.
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ src/fmacros.h |    4 ++++
+ 1 files changed, 4 insertions(+), 0 deletions(-)
+
+diff --git a/src/fmacros.h b/src/fmacros.h
+index fa37948..059dfeb 100644
+--- a/src/fmacros.h
++++ b/src/fmacros.h
+@@ -14,7 +14,11 @@
+ #define _XOPEN_SOURCE
+ #endif
+
++#ifndef _LARGEFILE_SOURCE
+ #define _LARGEFILE_SOURCE
++#endif
++#ifndef _FILE_OFFSET_BITS
+ #define _FILE_OFFSET_BITS 64
++#endif
+
+ #endif
+--
+1.7.7
diff --git a/package/zlog/zlog.mk b/package/zlog/zlog.mk
new file mode 100644
index 0000000..65ce9b7
--- /dev/null
+++ b/package/zlog/zlog.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# zlog
+#
+################################################################################
+
+ZLOG_VERSION = ca6162be1608839e99c6388c28488c51ccf98e4a
+ZLOG_SITE = $(call github,HardySimpson,zlog,$(ZLOG_VERSION))
+ZLOG_LICENSE = GPLv2.1
+ZLOG_LICENSE_FILES = COPYING
+ZLOG_INSTALL_STAGING = YES
+
+define ZLOG_BUILD_CMDS
+	$(MAKE1) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
+		-C $(@D) all
+endef
+
+define ZLOG_INSTALL_STAGING_CMDS
+	$(MAKE) PREFIX=$(STAGING_DIR)/usr INCLUDE_PATH=include LIBRARY_PATH=lib  -C $(@D) install
+endef
+
+define ZLOG_INSTALL_TARGET_CMDS
+	$(MAKE) PREFIX=$(TARGET_DIR)/usr INCLUDE_PATH=include LIBRARY_PATH=lib -C $(@D) install
+endef
+
+$(eval $(generic-package))
-- 
1.7.7
