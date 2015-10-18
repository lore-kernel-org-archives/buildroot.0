From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Oct 2015 15:53:05 +0200
Subject: [Buildroot] [git commit] bitstream: new package
Message-ID: <20151018135407.25A617FBBE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=29e875313c18732b6677d0d0610ad5977896da4b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BiTStream is a set of headers to ease processing of mpeg ts
streams. It is used by dvblast.

[Thomas:
 - add missing hash file.
 - add missing BITSTREAM_LICENSE_FILES information.
 - rewrap Config.in help text.
 - use lowercase name for the package in the comment header in
   bitstream.mk.]

Signed-off-by: Julian Scheel <julian@jusst.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                |    1 +
 package/bitstream/Config.in      |    8 ++++++++
 package/bitstream/bitstream.hash |    4 ++++
 package/bitstream/bitstream.mk   |   21 +++++++++++++++++++++
 4 files changed, 34 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 8e3c64a..c2f12f3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -953,6 +953,7 @@ menu "Logging"
 endmenu
 
 menu "Multimedia"
+	source "package/bitstream/Config.in"
 	source "package/libass/Config.in"
 	source "package/libbluray/Config.in"
 	source "package/libdcadec/Config.in"
diff --git a/package/bitstream/Config.in b/package/bitstream/Config.in
new file mode 100644
index 0000000..9d967a0
--- /dev/null
+++ b/package/bitstream/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_BITSTREAM
+	bool "bitstream"
+	help
+	  biTStream is a set of C headers allowing a simpler access to
+	  binary structures such as specified by MPEG, DVB, IETF,
+	  SMPTE, IEEE, SCTE, etc.
+
+	  http://www.videolan.org/developers/bitstream.html
diff --git a/package/bitstream/bitstream.hash b/package/bitstream/bitstream.hash
new file mode 100644
index 0000000..7a3b7f8
--- /dev/null
+++ b/package/bitstream/bitstream.hash
@@ -0,0 +1,4 @@
+# from https://get.videolan.org/bitstream/1.1/bitstream-1.1.tar.bz2.md5
+md5 88e6e786242196b4d73a5b6075aeb1a2 bitstream-1.1.tar.bz2
+# locally calculated
+sha256 90b65f619895d31e652386d5d7d2d2d62cccd44383c1fac9145d659013a2de9e bitstream-1.1.tar.bz2
diff --git a/package/bitstream/bitstream.mk b/package/bitstream/bitstream.mk
new file mode 100644
index 0000000..a76c3c4
--- /dev/null
+++ b/package/bitstream/bitstream.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# bitstream
+#
+################################################################################
+
+BITSTREAM_VERSION = 1.1
+BITSTREAM_SOURCE = bitstream-$(BITSTREAM_VERSION).tar.bz2
+BITSTREAM_SITE = https://get.videolan.org/bitstream/$(BITSTREAM_VERSION)
+BITSTREAM_LICENSE = MIT
+BITSTREAM_LICENSE_FILES = COPYING
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
