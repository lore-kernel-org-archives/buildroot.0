From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Mar 2014 21:50:02 +0100
Subject: [Buildroot] [git commit] zlog: new package
Message-ID: <20140303205752.B01219BCC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4a9e8a8db122e6825276b5efb81070f4e79832be
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 package/zlog/Config.in                             |   13 ++++++++
 .../zlog/zlog-01-fix-compiling-on-Buildroot.patch  |   32 ++++++++++++++++++++
 package/zlog/zlog.mk                               |   26 ++++++++++++++++
 4 files changed, 72 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 6edf18e..c099138 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -800,6 +800,7 @@ source "package/protobuf-c/Config.in"
 source "package/schifra/Config.in"
 source "package/startup-notification/Config.in"
 source "package/tzdata/Config.in"
+source "package/zlog/Config.in"
 endmenu
 
 menu "Security"
diff --git a/package/zlog/Config.in b/package/zlog/Config.in
new file mode 100644
index 0000000..4217370
--- /dev/null
+++ b/package/zlog/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_ZLOG
+	bool "zlog"
+	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_PREFER_STATIC_LIB
+	help
+	  zlog is a reliable, high-performance, thread safe, flexible,
+	  clear-model, pure C logging library.
+
+	  https://github.com/HardySimpson/zlog
+
+comment "zlog needs a toolchain w/ threads, largefile, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE || BR2_PREFER_STATIC_LIB
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
index 0000000..fb8762c
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
+ZLOG_LICENSE = LGPLv2.1
+ZLOG_LICENSE_FILES = COPYING
+ZLOG_INSTALL_STAGING = YES
+
+define ZLOG_BUILD_CMDS
+	$(MAKE1) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
+		-C $(@D) all
+endef
+
+define ZLOG_INSTALL_STAGING_CMDS
+	$(MAKE) PREFIX=$(STAGING_DIR)/usr -C $(@D) install
+endef
+
+define ZLOG_INSTALL_TARGET_CMDS
+	$(MAKE) PREFIX=$(TARGET_DIR)/usr -C $(@D) install
+endef
+
+$(eval $(generic-package))
