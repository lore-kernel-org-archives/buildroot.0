From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Wed, 29 Nov 2017 01:29:34 +0200
Subject: [Buildroot] [PATCH 1/3 v3] zlib-ng: new package
Message-ID: <20171128232936.23067-1-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>

Changes v2 -> v3:

- Add myself to DEVELOPERS files (by Thomas).
- Update github download url.
- Keep only sha256 of the locally computed hashes.
- Add few cmake switches and also check for ARM support.
- Convert to use virtual package infrastructure (by Thomas).

---
 DEVELOPERS                   |  1 +
 package/zlib-ng/zlib-ng.hash |  6 ++++++
 package/zlib-ng/zlib-ng.mk   | 22 ++++++++++++++++++++++
 3 files changed, 29 insertions(+)
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
index 0000000000..a6f3df4774
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
-- 
2.13.6
