From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Jan 2013 15:04:48 +0100
Subject: [Buildroot] [git commit] libfslparser: new package
Message-ID: <20130114152701.6928497183@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=26fbc4dba9f8e15048763aa16f75cac757887f74
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                    |    1 +
 package/libfslparser/Config.in       |    8 ++++++
 package/libfslparser/libfslparser.mk |   40 ++++++++++++++++++++++++++++++++++
 3 files changed, 49 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index f87e143..44e83f9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -468,6 +468,7 @@ menu "Multimedia"
 source "package/libdvdread/Config.in"
 source "package/libdvdnav/Config.in"
 source "package/libebml/Config.in"
+source "package/libfslparser/Config.in"
 source "package/libfslvpuwrap/Config.in"
 source "package/libmatroska/Config.in"
 source "package/libmms/Config.in"
diff --git a/package/libfslparser/Config.in b/package/libfslparser/Config.in
new file mode 100644
index 0000000..e3ab980
--- /dev/null
+++ b/package/libfslparser/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBFSLPARSER
+	bool "libfslparser"
+	depends on BR2_arm # Only relevant for i.MX
+	help
+	  Binary parser libraries for the Freescale i.MX SoCs.
+
+	  This library is provided by Freescale as-is and doesn't have
+	  an upstream.
diff --git a/package/libfslparser/libfslparser.mk b/package/libfslparser/libfslparser.mk
new file mode 100644
index 0000000..66f48cc
--- /dev/null
+++ b/package/libfslparser/libfslparser.mk
@@ -0,0 +1,40 @@
+#############################################################
+#
+# buildroot makefile for libfslparser
+#
+#############################################################
+
+LIBFSLPARSER_VERSION = 3.0.1
+# No official download site from freescale, just this mirror
+LIBFSLPARSER_SITE = http://download.ossystems.com.br/bsp/freescale/source
+LIBFSLPARSER_SOURCE = libfslparser-$(LIBFSLPARSER_VERSION).bin
+LIBFSLPARSER_LICENSE = Freescale Semiconductor Software License Agreement
+LIBFSLPARSER_LICENSE_FILES = EULA EULA.txt
+# This is a legal minefield: the EULA in the bin file specifies that
+# the Board Support Package includes software and hardware (sic!)
+# for which a separate license is needed...
+LIBFSLPARSER_REDISTRIBUTE = NO
+
+LIBFSLPARSER_INSTALL_STAGING = YES
+
+# The archive is a shell-self-extractor of a bzipped tar. It happens
+# to extract in the correct directory (libfslparser-x.y.z)
+# The --force makes sure it doesn't fail if the source dir already exists.
+# The --auto-accept skips the license check - not needed for us
+# because we have legal-info
+# Since the EULA in the bin file differs from the one in the tar file,
+# extract the one from the bin file as well.
+define LIBFSLPARSER_EXTRACT_CMDS
+	awk 'BEGIN      { start=0; } \
+	     /^EOEULA/  { start = 0; } \
+	                { if (start) print; } \
+	     /<<EOEULA/ { start=1; }'\
+	    $(DL_DIR)/$(LIBFSLPARSER_SOURCE) > $(@D)/EULA
+	cd $(BUILD_DIR); \
+	sh $(DL_DIR)/$(LIBFSLPARSER_SOURCE) --force --auto-accept
+endef
+
+# The Makefile installs several versions of the libraries, but we only
+# need one of them, depending on the platform.
+
+$(eval $(autotools-package))
