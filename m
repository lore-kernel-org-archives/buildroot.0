From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Wed, 29 Nov 2017 16:47:13 +0200
Subject: [Buildroot] [PATCH v4 2/2] zlib-ng: new package
In-Reply-To: <20171129144713.20269-1-stefan.froberg@petroprogram.com>
References: <20171129144713.20269-1-stefan.froberg@petroprogram.com>
Message-ID: <20171129144713.20269-2-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

zlib-ng, fast Zlib replacement

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---

Changes v3 -> v4:

- Reorder patches (by Thomas Petazzoni)

 DEVELOPERS                   |  1 +
 package/zlib-ng/zlib-ng.hash |  6 ++++++
 package/zlib-ng/zlib-ng.mk   | 22 ++++++++++++++++++++++
 package/zlib/Config.in       | 10 ++++++++++
 4 files changed, 39 insertions(+)
 create mode 100644 package/zlib-ng/zlib-ng.hash
 create mode 100644 package/zlib-ng/zlib-ng.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 20fe70253d..9438981de5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1541,6 +1541,7 @@ F:	package/elfutils/
 F:	package/libtasn1/
 F:	package/proxychains-ng/
 F:	package/yasm/
+F:	package/zlib-ng/
 
 N:	Stefan S?rensen <stefan.sorensen@spectralink.com>
 F:	package/cracklib/
diff --git a/package/zlib-ng/zlib-ng.hash b/package/zlib-ng/zlib-ng.hash
new file mode 100644
index 0000000000..b86bcd6a40
--- /dev/null
+++ b/package/zlib-ng/zlib-ng.hash
@@ -0,0 +1,6 @@
+# Locally calculated
+
+sha256	e76d90720373b0e06de10541dc5ae6b12f967239782da43840a9cadf4a08549c  zlib-ng-860d7a30f20f0c1e71bc0d8b0d84b88293326f6c.tar.gz
+
+sha256	d3c80be055d94d798eaa786116e84fa0b010bc11420b5d2060d978ea77845436 LICENSE.md
+
diff --git a/package/zlib-ng/zlib-ng.mk b/package/zlib-ng/zlib-ng.mk
new file mode 100644
index 0000000000..2ed29f3b2e
--- /dev/null
+++ b/package/zlib-ng/zlib-ng.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# zlib-ng
+#
+################################################################################
+
+ZLIB_NG_VERSION = 860d7a30f20f0c1e71bc0d8b0d84b88293326f6c
+ZLIB_NG_SITE = $(call github,Dead2,zlib-ng,$(ZLIB_NG_VERSION))
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
index 043c3cefa4..5ca3365462 100644
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
+	  https://github.com/Dead2/zlib-ng
+
 endchoice
 
 config BR2_PACKAGE_HAS_ZLIB
@@ -28,5 +37,6 @@ config BR2_PACKAGE_HAS_ZLIB
 config BR2_PACKAGE_PROVIDES_ZLIB
 	string
 	default "libzlib" if BR2_PACKAGE_LIBZLIB
+	default "zlib-ng" if BR2_PACKAGE_ZLIB_NG
 
 endif
-- 
2.13.6
