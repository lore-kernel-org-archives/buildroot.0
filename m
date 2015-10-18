From: Julian Scheel <julian@jusst.de>
Date: Sun, 18 Oct 2015 14:34:11 +0200
Subject: [Buildroot] [PATCH v2 2/2] dvblast: new package
In-Reply-To: <1445171651-28330-1-git-send-email-julian@jusst.de>
References: <1445171651-28330-1-git-send-email-julian@jusst.de>
Message-ID: <1445171651-28330-2-git-send-email-julian@jusst.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

DVBlast is a simple and powerful MPEG-2/TS demux and streaming application.

Signed-off-by: Julian Scheel <julian@jusst.de>
---
Changelog v2:

Address review comments by Yann E. Morin (thanks for review!)
- Complete license information
- Remove explicit INSTALL_STAGING=no
- Fix install command

The build cmd is not changed to use TARGET_CONFIGURE_OPTS as it breaks the
build.
---
 package/Config.in          |  1 +
 package/dvblast/Config.in  | 10 ++++++++++
 package/dvblast/dvblast.mk | 25 +++++++++++++++++++++++++
 3 files changed, 36 insertions(+)
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
index 0000000..3b9b8d1
--- /dev/null
+++ b/package/dvblast/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_DVBLAST
+	bool "dvblast"
+	select BR2_PACKAGE_BITSTREAM
+	select BR2_PACKAGE_LIBEV
+	depends on !BR2_bfin  # libev
+	help
+	  DVBlast is a simple and powerful MPEG-2/TS demux and streaming
+	  application.
+
+	  http://www.videolan.org/projects/dvblast.html
diff --git a/package/dvblast/dvblast.mk b/package/dvblast/dvblast.mk
new file mode 100644
index 0000000..5768f28
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
+DVBLAST_LICENSE = GPLv2+, WTFPL
+DVBLAST_LICENSE_FILES = COPYING COPYING.WTFPL
+
+DVBLAST_DEPENDENCIES = bitstream libev
+
+DVBLAST_INSTALL_TARGET = YES
+
+define DVBLAST_BUILD_CMDS
+	$(MAKE) -C $(@D) CC="$(TARGET_CC)" LD="$(TARGET_LD)"
+endef
+
+define DVBLAST_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) PREFIX=/usr install
+endef
+
+$(eval $(generic-package))
-- 
2.6.0
