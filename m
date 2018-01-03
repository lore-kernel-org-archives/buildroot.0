From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Jan 2018 22:42:52 +0100
Subject: [Buildroot] [git commit] zlib-ng: new package
Message-ID: <20180103215303.DBEDD83B16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e6e40c45927371bbf76df9ebb03a433083e6918a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

zlib-ng, a fast Zlib replacement

Signed-off-by: Stefan Fr??berg <stefan.froberg@petroprogram.com>
[Thomas: drop host variant.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                   |  1 +
 package/zlib-ng/zlib-ng.hash |  3 +++
 package/zlib-ng/zlib-ng.mk   | 22 ++++++++++++++++++++++
 package/zlib/Config.in       | 10 ++++++++++
 4 files changed, 36 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 458b452..a9a9ac5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1638,6 +1638,7 @@ F:	package/elfutils/
 F:	package/libtasn1/
 F:	package/proxychains-ng/
 F:	package/yasm/
+F:	package/zlib-ng/
 
 N:	Stefan S??rensen <stefan.sorensen@spectralink.com>
 F:	package/cracklib/
diff --git a/package/zlib-ng/zlib-ng.hash b/package/zlib-ng/zlib-ng.hash
new file mode 100644
index 0000000..2e89a8d
--- /dev/null
+++ b/package/zlib-ng/zlib-ng.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256	2ec78c8c13530bffaebfc10be2f4695c47cf50fe2fbc2104606467703836fa0e zlib-ng-a17fefa147942edbf80ab22a16bcbc2419def12d.tar.gz
+sha256	d3c80be055d94d798eaa786116e84fa0b010bc11420b5d2060d978ea77845436 LICENSE.md
diff --git a/package/zlib-ng/zlib-ng.mk b/package/zlib-ng/zlib-ng.mk
new file mode 100644
index 0000000..3d9651c
--- /dev/null
+++ b/package/zlib-ng/zlib-ng.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# zlib-ng
+#
+################################################################################
+
+ZLIB_NG_VERSION = a17fefa147942edbf80ab22a16bcbc2419def12d
+ZLIB_NG_SITE = $(call github,mtl1979,zlib-ng,$(ZLIB_NG_VERSION))
+ZLIB_NG_LICENSE = Zlib
+ZLIB_NG_LICENSE_FILES = LICENSE.md
+ZLIB_NG_INSTALL_STAGING = YES
+ZLIB_NG_PROVIDES = zlib
+
+# Build with zlib compatible API, gzFile support and optimizations on
+ZLIB_NG_CONF_OPTS += -DZLIB_COMPAT=1 -DWITH_GZFILEOP=1 -DWITH_OPTIM=1 -DCC=$(TARGET_CC)
+
+# Enable NEON and ACLE on ARM
+ifeq ($(BR2_arm),y)
+ZLIB_NG_CONF_OPTS += -DWITH_ACLE=1 -DWITH_NEON=1
+endif
+
+$(eval $(cmake-package))
diff --git a/package/zlib/Config.in b/package/zlib/Config.in
index bdc1da6..87abc2b 100644
--- a/package/zlib/Config.in
+++ b/package/zlib/Config.in
@@ -20,6 +20,15 @@ config BR2_PACKAGE_LIBZLIB
 
 	  http://www.zlib.net
 
+config BR2_PACKAGE_ZLIB_NG
+	bool "zlib-ng"
+	select BR2_PACKAGE_HAS_ZLIB
+	help
+	  Zlib replacement with optimizations for
+	  "next generation" systems.
+
+	  https://github.com/mtl1979/zlib-ng/tree/renamelib
+
 endchoice
 
 config BR2_PACKAGE_HAS_ZLIB
@@ -28,6 +37,7 @@ config BR2_PACKAGE_HAS_ZLIB
 config BR2_PACKAGE_PROVIDES_ZLIB
 	string
 	default "libzlib" if BR2_PACKAGE_LIBZLIB
+	default "zlib-ng" if BR2_PACKAGE_ZLIB_NG
 
 endif
 
