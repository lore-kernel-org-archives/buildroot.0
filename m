From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 23:46:22 +0100
Subject: [Buildroot] [git commit branch/next] package/multicat: Add package
Message-ID: <20160221230123.2ACDA80333@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ddc2285ff2be6841e5144d3a5749d14fa21ea425
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

multicat is a simple and efficient multicast and transport stream manipulation
tool.

Signed-off-by: Julian Scheel <julian@jusst.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in              |  1 +
 package/multicat/Config.in     | 11 +++++++++++
 package/multicat/multicat.hash |  4 ++++
 package/multicat/multicat.mk   | 23 +++++++++++++++++++++++
 4 files changed, 39 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index c69d632..dc68184 100644
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
