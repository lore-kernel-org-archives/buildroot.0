From: Julian Scheel <julian@jusst.de>
Date: Wed, 27 Jan 2016 09:40:11 +0100
Subject: [Buildroot] [PATCH] package/multicat: Add package
Message-ID: <1453884011-15524-1-git-send-email-julian@jusst.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

multicat is a simple and efficient multicast and transport stream manipulation
tool.

Signed-off-by: Julian Scheel <julian@jusst.de>
---
 package/Config.in              |  1 +
 package/multicat/Config.in     | 11 +++++++++++
 package/multicat/multicat.hash |  4 ++++
 package/multicat/multicat.mk   | 23 +++++++++++++++++++++++
 4 files changed, 39 insertions(+)
 create mode 100644 package/multicat/Config.in
 create mode 100644 package/multicat/multicat.hash
 create mode 100644 package/multicat/multicat.mk

diff --git a/package/Config.in b/package/Config.in
index 0075cd5..63aa8df 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -28,6 +28,7 @@ menu "Audio and video applications"
 	source "package/mpd-mpc/Config.in"
 	source "package/mpg123/Config.in"
 	source "package/mplayer/Config.in"
+	source "package/multicat/Config.in"
 	source "package/musepack/Config.in"
 	source "package/ncmpc/Config.in"
 	source "package/on2-8170-libs/Config.in"
diff --git a/package/multicat/Config.in b/package/multicat/Config.in
new file mode 100644
index 0000000..8dfb6c1
--- /dev/null
+++ b/package/multicat/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_MULTICAT
+	bool "multicat"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_BITSTREAM
+	help
+	  Simple and efficient multicast and transport stream manipulation.
+
+	  http://www.videolan.org/projects/multicat.html
+
+comment 'multicat needs a toolchain w/ threads'
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/multicat/multicat.hash b/package/multicat/multicat.hash
new file mode 100644
index 0000000..38cf9d7
--- /dev/null
+++ b/package/multicat/multicat.hash
@@ -0,0 +1,4 @@
+# from https://get.videolan.org/multicat/2.1/multicat-2.1.tar.bz2.md5
+md5 2e3ecd8dee64f5bd32a61733d4cc2226 multicat-2.1.tar.bz2
+# locally calculated
+sha256 5eabe8d9a3dde452b2d348683cc7da213680551a9d4059c356f7319c6aa9b3d1 multicat-2.1.tar.bz2
diff --git a/package/multicat/multicat.mk b/package/multicat/multicat.mk
new file mode 100644
index 0000000..5909bc5
--- /dev/null
+++ b/package/multicat/multicat.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# multicat
+#
+################################################################################
+
+MULTICAT_VERSION = 2.1
+MULTICAT_SOURCE = multicat-$(MULTICAT_VERSION).tar.bz2
+MULTICAT_SITE = https://get.videolan.org/multicat/$(MULTICAT_VERSION)
+MULTICAT_LICENSE = GPLv2+
+MULTICAT_LICENSE_FILES = COPYING
+
+MULTICAT_MAKE_ENV = $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS)
+
+define MULTICAT_BUILD_CMDS
+	$(MULTICAT_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define MULTICAT_INSTALL_TARGET_CMDS
+	$(MULTICAT_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) PREFIX=/usr install
+endef
+
+$(eval $(generic-package))
-- 
2.7.0
