From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Oct 2015 16:04:01 +0200
Subject: [Buildroot] [git commit] dvblast: new package
Message-ID: <20151018140454.EA6C0801F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=43d6e6caa891b7db080ac86f2e07a0c7d8dbc465
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

DVBlast is a simple and powerful MPEG-2/TS demux and streaming
application.

[Thomas:
 - add missing hash file.
 - rewrap Config.in help text
 - remove unneeded "DVBLAST_INSTALL_TARGET = YES", since this is the
   default behavior
 - pass TARGET_MAKE_ENV in the environment when calling make.
 - use TARGET_CONFIGURE_OPTS instead of just CC/LD.]

Signed-off-by: Julian Scheel <julian@jusst.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in            |    1 +
 package/dvblast/Config.in    |   10 ++++++++++
 package/dvblast/dvblast.hash |    4 ++++
 package/dvblast/dvblast.mk   |   22 ++++++++++++++++++++++
 4 files changed, 37 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index c2f12f3..7746742 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -7,6 +7,7 @@ menu "Audio and video applications"
 	source "package/alsa-utils/Config.in"
 	source "package/aumix/Config.in"
 	source "package/bellagio/Config.in"
+	source "package/dvblast/Config.in"
 	source "package/dvdauthor/Config.in"
 	source "package/dvdrw-tools/Config.in"
 	source "package/espeak/Config.in"
diff --git a/package/dvblast/Config.in b/package/dvblast/Config.in
new file mode 100644
index 0000000..ac8b4ae
--- /dev/null
+++ b/package/dvblast/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_DVBLAST
+	bool "dvblast"
+	select BR2_PACKAGE_BITSTREAM
+	select BR2_PACKAGE_LIBEV
+	depends on !BR2_bfin  # libev
+	help
+	  DVBlast is a simple and powerful MPEG-2/TS demux and
+	  streaming application.
+
+	  http://www.videolan.org/projects/dvblast.html
diff --git a/package/dvblast/dvblast.hash b/package/dvblast/dvblast.hash
new file mode 100644
index 0000000..198549f
--- /dev/null
+++ b/package/dvblast/dvblast.hash
@@ -0,0 +1,4 @@
+# from https://get.videolan.org/dvblast/3.0/dvblast-3.0.tar.bz2.md5
+md5 89ea9ffb16476d47b8853e52a8a3ee63 dvblast-3.0.tar.bz2
+# locally calculated
+sha256 4fc3eb2a3d3545cb76a5c515a16671d1c34fe2f5dad57b71e89bd54c14c3045e dvblast-3.0.tar.bz2
diff --git a/package/dvblast/dvblast.mk b/package/dvblast/dvblast.mk
new file mode 100644
index 0000000..11a2dc8
--- /dev/null
+++ b/package/dvblast/dvblast.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# dvblast
+#
+################################################################################
+
+DVBLAST_VERSION = 3.0
+DVBLAST_SOURCE = dvblast-$(DVBLAST_VERSION).tar.bz2
+DVBLAST_SITE = https://get.videolan.org/dvblast/$(DVBLAST_VERSION)
+DVBLAST_LICENSE = GPLv2+, WTFPL
+DVBLAST_LICENSE_FILES = COPYING COPYING.WTFPL
+DVBLAST_DEPENDENCIES = bitstream libev
+
+define DVBLAST_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
+
+define DVBLAST_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) PREFIX=/usr install
+endef
+
+$(eval $(generic-package))
