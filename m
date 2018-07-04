From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 4 Jul 2018 22:28:09 +0200
Subject: [Buildroot] [git commit] pigz: new package
Message-ID: <20180704202457.3BE62870E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ec0ae23c45c790cfcdaac9012ed470063b2558f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A parallel implementation of gzip for modern
multi-processor, multi-core machines.

Signed-off-by: Alfredo Alvarez Fernandez <alfredo.alvarez_fernandez@nokia.com>
Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
[Thomas: add entry to DEVELOPERS file, add hash for license file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/pigz/Config.in | 14 ++++++++++++++
 package/pigz/pigz.hash |  3 +++
 package/pigz/pigz.mk   | 21 +++++++++++++++++++++
 5 files changed, 40 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 803d248b4f..1fa0020dbb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1914,6 +1914,7 @@ F:	package/civetweb/
 N:	Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 F:	docs/manual/
 F:	package/opkg-utils/
+F:	package/pigz/
 F:	support/scripts/size-stats
 F:	utils/size-stats-compare
 F:	toolchain/
diff --git a/package/Config.in b/package/Config.in
index e94a6a8c12..20fe5ad8ff 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -70,6 +70,7 @@ menu "Compressors and decompressors"
 	source "package/lzip/Config.in"
 	source "package/lzop/Config.in"
 	source "package/p7zip/Config.in"
+	source "package/pigz/Config.in"
 	source "package/pixz/Config.in"
 	source "package/unrar/Config.in"
 	source "package/unzip/Config.in"
diff --git a/package/pigz/Config.in b/package/pigz/Config.in
new file mode 100644
index 0000000000..af229060cf
--- /dev/null
+++ b/package/pigz/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_PIGZ
+	bool "pigz"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_ZLIB
+	help
+	  pigz, which stands for parallel implementation of gzip, is a
+	  fully functional replacement for gzip that exploits multiple
+	  processors and multiple cores to the hilt when compressing
+	  data.
+
+	  http://www.zlib.net/pigz/
+
+comment "pigz needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/pigz/pigz.hash b/package/pigz/pigz.hash
new file mode 100644
index 0000000000..850e94f079
--- /dev/null
+++ b/package/pigz/pigz.hash
@@ -0,0 +1,3 @@
+# From https://zlib.net/pigz/
+sha256  a4f816222a7b4269bd232680590b579ccc72591f1bb5adafcd7208ca77e14f73  pigz-2.4.tar.gz
+sha256	dc8f78258cdb4478b5922f4c00eb63d3cbac06c171dc829648fd414bb0cf4493  README
diff --git a/package/pigz/pigz.mk b/package/pigz/pigz.mk
new file mode 100644
index 0000000000..82f3049519
--- /dev/null
+++ b/package/pigz/pigz.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# pigz
+#
+################################################################################
+
+PIGZ_VERSION = 2.4
+PIGZ_SITE = http://www.zlib.net/pigz
+PIGZ_DEPENDENCIES = zlib
+PIGZ_LICENSE = Zlib
+PIGZ_LICENSE_FILES = README
+
+define PIGZ_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define PIGZ_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/pigz $(TARGET_DIR)/usr/bin/pigz
+endef
+
+$(eval $(generic-package))
