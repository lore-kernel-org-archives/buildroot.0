From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Thu,  5 Jul 2018 09:56:52 +0200
Subject: [Buildroot] [PATCHv2 2/3] pigz: new package
In-Reply-To: <20180705075653.27758-1-thomas.de_schampheleire@nokia.com>
References: <20180705075653.27758-1-thomas.de_schampheleire@nokia.com>
Message-ID: <20180705075653.27758-3-thomas.de_schampheleire@nokia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Alfredo Alvarez Fernandez <alfredo.alvarez_fernandez@nokia.com>

A parallel implementation of gzip for modern
multi-processor, multi-core machines.

Signed-off-by: Alfredo Alvarez Fernandez <alfredo.alvarez_fernandez@nokia.com>
Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

---
v2:
- add entry to DEVELOPERS
- set github as source, because the website only seems to contain the last
  release. The URL will thus likely become invalid once the new release
  appears.

 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/pigz/Config.in | 14 ++++++++++++++
 package/pigz/pigz.hash |  2 ++
 package/pigz/pigz.mk   | 21 +++++++++++++++++++++
 5 files changed, 39 insertions(+)
 create mode 100644 package/pigz/Config.in
 create mode 100644 package/pigz/pigz.hash
 create mode 100644 package/pigz/pigz.mk

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
index 0000000000..86826155d2
--- /dev/null
+++ b/package/pigz/pigz.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  e228e7d18b34c4ece8d596eb6eee97bde533c6beedbb728d07d3abe90b4b1b52  pigz-v2.4.tar.gz
diff --git a/package/pigz/pigz.mk b/package/pigz/pigz.mk
new file mode 100644
index 0000000000..ac4f94027c
--- /dev/null
+++ b/package/pigz/pigz.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# pigz
+#
+################################################################################
+
+PIGZ_VERSION = v2.4
+PIGZ_SITE = $(call github,madler,pigz,$(PIGZ_VERSION))
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
-- 
2.16.4
