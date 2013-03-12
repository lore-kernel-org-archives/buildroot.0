From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 12 Mar 2013 05:58:42 +0100
Subject: [Buildroot] [PATCH 4/5] flite: new package
In-Reply-To: <cover.1363063832.git.s.martin49@gmail.com>
References: <cover.1363063832.git.s.martin49@gmail.com>
Message-ID: <359a800fb351cc1d10532e184d9dc7d30c5cd991.1363063832.git.s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: Eric Jarrige <eric.jarrige@armadeus.org>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
Changes since v1:
- fix dependencies
---
 package/multimedia/Config.in       |  1 +
 package/multimedia/flite/Config.in | 15 ++++++++++
 package/multimedia/flite/flite.mk  | 58 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 74 insertions(+)
 create mode 100644 package/multimedia/flite/Config.in
 create mode 100644 package/multimedia/flite/flite.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 931e6d3..9e91dbb 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -4,6 +4,7 @@ source "package/multimedia/aumix/Config.in"
 source "package/multimedia/bellagio/Config.in"
 source "package/multimedia/faad2/Config.in"
 source "package/multimedia/flac/Config.in"
+source "package/multimedia/flite/Config.in"
 source "package/multimedia/ffmpeg/Config.in"
 source "package/multimedia/gstreamer/Config.in"
 source "package/multimedia/gst-ffmpeg/Config.in"
diff --git a/package/multimedia/flite/Config.in b/package/multimedia/flite/Config.in
new file mode 100644
index 0000000..6655cc3
--- /dev/null
+++ b/package/multimedia/flite/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_FLITE
+	bool "flite"
+	depends on BR2_USE_WCHAR
+	help
+	  Flite: a small, fast run time synthesis engine.
+	  Flite (festival-lite) is a small, fast run-time synthesis engine
+	  developed at CMU and primarily designed for small embedded machines
+	  and/or large servers. Flite is designed as an alternative synthesis
+	  engine to Festival for voices built using the FestVox suite of voice
+	  building tools.
+
+	  http://www.speech.cs.cmu.edu/flite
+
+comment "flite require a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
diff --git a/package/multimedia/flite/flite.mk b/package/multimedia/flite/flite.mk
new file mode 100644
index 0000000..266114f
--- /dev/null
+++ b/package/multimedia/flite/flite.mk
@@ -0,0 +1,58 @@
+#############################################################
+#
+# flite
+#
+#############################################################
+
+FLITE_VERSION = 1.4
+FLITE_SOURCE = flite-$(FLITE_VERSION)-release.tar.bz2
+FLITE_SITE = http://www.speech.cs.cmu.edu/flite/packed/flite-$(FLITE_VERSION)
+FLITE_LICENSE = BSD-4c
+FLITE_LICENSE_FILES = COPYING
+
+FLITE_INSTALL_STAGING = YES
+
+# Sadly, Flite does not support parallel build,
+# especially when building its shared libraries.
+FLITE_MAKE = $(MAKE1)
+
+FLITE_CONF_OPT = \
+	$(if $(BR2_PREFER_STATIC_LIB),,--enable-shared)
+
+FLITE_INSTALL_STAGING_OPT = \
+	INSTALLBINDIR=$(STAGING_DIR)/usr/bin \
+	INSTALLLIBDIR=$(STAGING_DIR)/usr/lib \
+	INSTALLINCDIR=$(STAGING_DIR)/usr/include/flite \
+	install
+
+FLITE_INSTALL_TARGET_OPT = \
+	INSTALLBINDIR=$(TARGET_DIR)/usr/bin \
+	INSTALLLIBDIR=$(TARGET_DIR)/usr/lib \
+	INSTALLINCDIR=$(TARGET_DIR)/usr/include/flite \
+	install
+
+# Flite totally screw up their tarball generation, so that:
+#
+#   $ tar tf flite-1.4-release.tar.bz2
+#   ...
+#   flite-1.4-release//install-sh
+#   flite-1.4-release//mkinstalldirs
+#   flite-1.4-release//Exports.def
+#   flite-1.4-release//flite.sln
+#   flite-1.4-release//fliteDll.vcproj
+#   flite-1.4-release/config/Makefile
+#   flite-1.4-release/config/common_make_rules
+#   flite-1.4-release/config/project.mak
+#   flite-1.4-release/config/config.in
+#   flite-1.4-release/config/system.mak.in
+#
+# So, the strip-component trick does not work at all.
+# Let's redefine the extract command.
+define FLITE_EXTRACT_CMDS
+	$(RM) -rf $(FLITE_DIR)
+	$(INFLATE$(suffix $(FLITE_SOURCE))) $(DL_DIR)/$(FLITE_SOURCE) | \
+		$(TAR) -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	mv $(BUILD_DIR)/$(subst .tar.bz2,,$(FLITE_SOURCE)) $(FLITE_DIR)
+endef
+
+$(eval $(autotools-package))
-- 
1.8.1.5
