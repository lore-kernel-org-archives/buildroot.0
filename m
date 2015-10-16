From: Julian Scheel <julian@jusst.de>
Date: Fri, 16 Oct 2015 15:54:40 +0200
Subject: [Buildroot] [PATCH 2/2] dvblast: new package
In-Reply-To: <1445003680-26003-1-git-send-email-julian@jusst.de>
References: <1445003680-26003-1-git-send-email-julian@jusst.de>
Message-ID: <1445003680-26003-2-git-send-email-julian@jusst.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

DVBlast is a simple and powerful MPEG-2/TS demux and streaming application.

Signed-off-by: Julian Scheel <julian@jusst.de>
---
 package/Config.in          |  1 +
 package/dvblast/Config.in  |  9 +++++++++
 package/dvblast/dvblast.mk | 25 +++++++++++++++++++++++++
 3 files changed, 35 insertions(+)
 create mode 100644 package/dvblast/Config.in
 create mode 100644 package/dvblast/dvblast.mk

diff --git a/package/Config.in b/package/Config.in
index 53a312c..cf0e46d 100644
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
index 0000000..769d86f
--- /dev/null
+++ b/package/dvblast/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_DVBLAST
+	bool "dvblast"
+	select BR2_PACKAGE_BITSTREAM
+	select BR2_PACKAGE_LIBEV
+	help
+	  DVBlast is a simple and powerful MPEG-2/TS demux and streaming
+	  application.
+
+	  http://www.videolan.org/projects/dvblast.html
diff --git a/package/dvblast/dvblast.mk b/package/dvblast/dvblast.mk
new file mode 100644
index 0000000..bcf3c69
--- /dev/null
+++ b/package/dvblast/dvblast.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# dvblast
+#
+################################################################################
+
+DVBLAST_VERSION = 3.0
+DVBLAST_SOURCE = dvblast-$(DVBLAST_VERSION).tar.bz2
+DVBLAST_SITE = https://get.videolan.org/dvblast/$(DVBLAST_VERSION)
+DVBLAST_LICENSE = GPLv2
+
+DVBLAST_DEPENDENCIES = bitstream libev
+
+DVBLAST_INSTALL_STAGING = NO
+DVBLAST_INSTALL_TARGET = YES
+
+define DVBLAST_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
+endef
+
+define DVBLAST_INSTALL_TARGET_CMDS
+	(cd $(@D); $(MAKE) PREFIX=$(TARGET_DIR)/usr install)
+endef
+
+$(eval $(generic-package))
-- 
2.6.0
