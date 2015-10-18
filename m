From: Julian Scheel <julian@jusst.de>
Date: Sun, 18 Oct 2015 14:34:10 +0200
Subject: [Buildroot] [PATCH v2 1/2] bitstream: new package
Message-ID: <1445171651-28330-1-git-send-email-julian@jusst.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BiTStream is a set of headers to ease processing of mpeg ts streams. It is
used by dvblast.

Signed-off-by: Julian Scheel <julian@jusst.de>
---
Changelog v2:

Address review comments by Yann E. Morin (thanks for review!)
- Lowercase package name
- Add comment about installation settings
- Fix install command

---
 package/Config.in              |  1 +
 package/bitstream/Config.in    |  8 ++++++++
 package/bitstream/bitstream.mk | 20 ++++++++++++++++++++
 3 files changed, 29 insertions(+)
 create mode 100644 package/bitstream/Config.in
 create mode 100644 package/bitstream/bitstream.mk

diff --git a/package/Config.in b/package/Config.in
index 98dcd78..53a312c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -954,6 +954,7 @@ menu "Logging"
 endmenu
 
 menu "Multimedia"
+	source "package/bitstream/Config.in"
 	source "package/libass/Config.in"
 	source "package/libbluray/Config.in"
 	source "package/libdcadec/Config.in"
diff --git a/package/bitstream/Config.in b/package/bitstream/Config.in
new file mode 100644
index 0000000..35d778a
--- /dev/null
+++ b/package/bitstream/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_BITSTREAM
+	bool "bitstream"
+	help
+	  biTStream is a set of C headers allowing a simpler access to
+	  binary structures such as specified by MPEG, DVB, IETF, SMPTE,
+	  IEEE, SCTE, etc.
+
+	  http://www.videolan.org/developers/bitstream.html
diff --git a/package/bitstream/bitstream.mk b/package/bitstream/bitstream.mk
new file mode 100644
index 0000000..cf57c1d
--- /dev/null
+++ b/package/bitstream/bitstream.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# biTStream
+#
+################################################################################
+
+BITSTREAM_VERSION = 1.1
+BITSTREAM_SOURCE = bitstream-$(BITSTREAM_VERSION).tar.bz2
+BITSTREAM_SITE = https://get.videolan.org/bitstream/$(BITSTREAM_VERSION)
+BITSTREAM_LICENSE = MIT
+
+# package consists of header files only
+BITSTREAM_INSTALL_STAGING = YES
+BITSTREAM_INSTALL_TARGET = NO
+
+define BITSTREAM_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) PREFIX=/usr install
+endef
+
+$(eval $(generic-package))
-- 
2.6.0
