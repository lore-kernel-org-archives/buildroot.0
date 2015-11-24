From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 Nov 2015 22:26:28 +0100
Subject: [Buildroot] [git commit branch/next] minizip: new package
Message-ID: <20151124213758.498328191E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=23e48191071d0b187073dee807ba25b7d4a9255c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in            |    1 +
 package/minizip/Config.in    |   15 +++++++++++++++
 package/minizip/minizip.hash |    2 ++
 package/minizip/minizip.mk   |   16 ++++++++++++++++
 4 files changed, 34 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 3656c54..988fe84 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -741,6 +741,7 @@ menu "Compression and decompression"
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
diff --git a/package/minizip/minizip.hash b/package/minizip/minizip.hash
new file mode 100644
index 0000000..a303b2c
--- /dev/null
+++ b/package/minizip/minizip.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	b39158bdf3d8bf81d3a7412dc761851fda398bc93d8989d5e940ed4ae5bbb52c	minizip-977afb22966e6ab0ee401293a8e85fe808133f9a.tar.gz
diff --git a/package/minizip/minizip.mk b/package/minizip/minizip.mk
new file mode 100644
index 0000000..5b87786
--- /dev/null
+++ b/package/minizip/minizip.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# minizip
+#
+################################################################################
+
+MINIZIP_VERSION = 977afb22966e6ab0ee401293a8e85fe808133f9a
+MINIZIP_SITE = $(call github,nmoinvaz,minizip,$(MINIZIP_VERSION))
+MINIZIP_DEPENDENCIES = zlib
+MINIZIP_AUTORECONF = YES
+MINIZIP_INSTALL_STAGING = YES
+MINIZIP_CONF_OPTS = $(if $(BR2_PACKAGE_MINIZIP_DEMOS),--enable-demos)
+MINIZIP_LICENSE = zlib license
+MINIZIP_LICENSE_FILES = LICENSE
+
+$(eval $(autotools-package))
