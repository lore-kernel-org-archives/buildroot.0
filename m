From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Jan 2013 15:07:26 +0100
Subject: [Buildroot] [git commit] libfslcodec: new package
Message-ID: <20130114152701.92B1E9A0E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=98163a02980f1a5e93d987a4f58d4817a94a3e61
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                  |    1 +
 package/libfslcodec/Config.in      |    8 +++++++
 package/libfslcodec/libfslcodec.mk |   40 ++++++++++++++++++++++++++++++++++++
 3 files changed, 49 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 44e83f9..e19e8b9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -468,6 +468,7 @@ menu "Multimedia"
 source "package/libdvdread/Config.in"
 source "package/libdvdnav/Config.in"
 source "package/libebml/Config.in"
+source "package/libfslcodec/Config.in"
 source "package/libfslparser/Config.in"
 source "package/libfslvpuwrap/Config.in"
 source "package/libmatroska/Config.in"
diff --git a/package/libfslcodec/Config.in b/package/libfslcodec/Config.in
new file mode 100644
index 0000000..7b31b7a
--- /dev/null
+++ b/package/libfslcodec/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBFSLCODEC
+	bool "libfslcodec"
+	depends on BR2_arm # Only relevant for i.MX
+	help
+	  Binary codec libraries for the Freescale i.MX SoCs.
+
+	  This library is provided by Freescale as-is and doesn't have
+	  an upstream.
diff --git a/package/libfslcodec/libfslcodec.mk b/package/libfslcodec/libfslcodec.mk
new file mode 100644
index 0000000..a2b57b8
--- /dev/null
+++ b/package/libfslcodec/libfslcodec.mk
@@ -0,0 +1,40 @@
+#############################################################
+#
+# buildroot makefile for libfslcodec
+#
+#############################################################
+
+LIBFSLCODEC_VERSION = 3.0.1
+# No official download site from freescale, just this mirror
+LIBFSLCODEC_SITE = http://download.ossystems.com.br/bsp/freescale/source
+LIBFSLCODEC_SOURCE = libfslcodec-$(LIBFSLCODEC_VERSION).bin
+LIBFSLCODEC_LICENSE = Freescale Semiconductor Software License Agreement, BSD-3c (flac, ogg headers)
+LIBFSLCODEC_LICENSE_FILES = EULA EULA.txt
+# This is a legal minefield: the EULA in the bin file specifies that
+# the Board Support Package includes software and hardware (sic!)
+# for which a separate license is needed...
+LIBFSLCODEC_REDISTRIBUTE = NO
+
+LIBFSLCODEC_INSTALL_STAGING = YES
+
+# The archive is a shell-self-extractor of a bzipped tar. It happens
+# to extract in the correct directory (libfslcodec-x.y.z)
+# The --force makes sure it doesn't fail if the source dir already exists.
+# The --auto-accept skips the license check - not needed for us
+# because we have legal-info.
+# Since the EULA in the bin file differs from the one in the tar file,
+# extract the one from the bin file as well.
+define LIBFSLCODEC_EXTRACT_CMDS
+	awk 'BEGIN      { start=0; } \
+	     /^EOEULA/  { start = 0; } \
+	                { if (start) print; } \
+	     /<<EOEULA/ { start=1; }'\
+	    $(DL_DIR)/$(LIBFSLCODEC_SOURCE) > $(@D)/EULA
+	cd $(BUILD_DIR); \
+	sh $(DL_DIR)/$(LIBFSLCODEC_SOURCE) --force --auto-accept
+endef
+
+# FIXME The Makefile installs both the arm9 and arm11 versions of the
+# libraries, but we only need one of them.
+
+$(eval $(autotools-package))
