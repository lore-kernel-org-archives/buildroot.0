From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 23 Nov 2015 19:06:02 -0300
Subject: [Buildroot] [PATCH] minizip: new package
Message-ID: <1448316362-19184-1-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/Config.in          |  1 +
 package/minizip/Config.in  | 15 +++++++++++++++
 package/minizip/minizip.mk | 17 +++++++++++++++++
 3 files changed, 33 insertions(+)
 create mode 100644 package/minizip/Config.in
 create mode 100644 package/minizip/minizip.mk

diff --git a/package/Config.in b/package/Config.in
index f9af31c..d6d5505 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -746,6 +746,7 @@ menu "Compression and decompression"
 	source "package/libsquish/Config.in"
 	source "package/libzip/Config.in"
 	source "package/lzo/Config.in"
+	source "package/minizip/Config.in"
 	source "package/snappy/Config.in"
 	source "package/szip/Config.in"
 	source "package/zlib/Config.in"
diff --git a/package/minizip/Config.in b/package/minizip/Config.in
new file mode 100644
index 0000000..7205e00
--- /dev/null
+++ b/package/minizip/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_MINIZIP
+	bool "minizip"
+	select BR2_PACKAGE_ZLIB
+	help
+	  Enables to extract files from a .zip archive file.
+	  It is compatible with PKZip 2.04g, WinZip, InfoZip,
+	  MimarSinan Codex Suite 2002 tools, and compatible sofware.
+
+	  https://github.com/nmoinvaz/minizip
+
+config BR2_PACKAGE_MINIZIP_DEMOS
+	bool "miniunzip/minizip"
+	depends on BR2_PACKAGE_MINIZIP
+	help
+	  Enable miniunzip/minizip binary tools.
diff --git a/package/minizip/minizip.mk b/package/minizip/minizip.mk
new file mode 100644
index 0000000..aa77c56
--- /dev/null
+++ b/package/minizip/minizip.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# minizip
+#
+################################################################################
+
+MINIZIP_VERSION = 977afb22966e6ab0ee401293a8e85fe808133f9a
+MINIZIP_SITE = https://github.com/nmoinvaz/minizip.git
+MINIZIP_SITE_METHOD = git
+MINIZIP_DEPENDENCIES = zlib
+MINIZIP_AUTORECONF = YES
+MINIZIP_INSTALL_STAGING = YES
+MINIZIP_CONF_OPTS = $(if $(BR2_PACKAGE_MINIZIP_DEMOS),--enable-demos)
+MINIZIP_LICENSE = zlib license
+MINIZIP_LICENSE_FILES = LICENSE
+
+$(eval $(autotools-package))
-- 
2.4.10
