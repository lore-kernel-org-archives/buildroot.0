From: Louis-Paul Cordier <lpdev@cordier.org>
Date: Tue, 10 Mar 2020 10:58:16 +0100
Subject: [Buildroot] [PATCH 1/1] package/pigz: add host package support
Message-ID: <20200310095816.5404-1-lpdev@cordier.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Louis-Paul Cordier <lpdev@cordier.org>
---
 package/Config.in.host      |  1 +
 package/pigz/Config.in      |  1 +
 package/pigz/Config.in.host |  9 +++++++++
 package/pigz/pigz.mk        | 10 ++++++++++
 4 files changed, 21 insertions(+)
 create mode 100644 package/pigz/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index c0ac4fbbcc..8eed4727bd 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -50,6 +50,7 @@ menu "Host utilities"
 	source "package/opkg-utils/Config.in.host"
 	source "package/parted/Config.in.host"
 	source "package/patchelf/Config.in.host"
+	source "package/pigz/Config.in.host"
 	source "package/pkgconf/Config.in.host"
 	source "package/pru-software-support/Config.in.host"
 	source "package/pwgen/Config.in.host"
diff --git a/package/pigz/Config.in b/package/pigz/Config.in
index af229060cf..a76146d8fc 100644
--- a/package/pigz/Config.in
+++ b/package/pigz/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PIGZ
 	bool "pigz"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_HOST_ZLIB
 	help
 	  pigz, which stands for parallel implementation of gzip, is a
 	  fully functional replacement for gzip that exploits multiple
diff --git a/package/pigz/Config.in.host b/package/pigz/Config.in.host
new file mode 100644
index 0000000000..9903cada7d
--- /dev/null
+++ b/package/pigz/Config.in.host
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_HOST_PIGZ
+	bool "host pigz"
+	help
+	  pigz, which stands for parallel implementation of gzip, is a
+	  fully functional replacement for gzip that exploits multiple
+	  processors and multiple cores to the hilt when compressing
+	  data.
+
+	  http://www.zlib.net/pigz/
diff --git a/package/pigz/pigz.mk b/package/pigz/pigz.mk
index b4f28c048e..634b6a9b9d 100644
--- a/package/pigz/pigz.mk
+++ b/package/pigz/pigz.mk
@@ -9,13 +9,23 @@ PIGZ_SITE = $(call github,madler,pigz,v$(PIGZ_VERSION))
 PIGZ_DEPENDENCIES = zlib
 PIGZ_LICENSE = Zlib
 PIGZ_LICENSE_FILES = README
+HOST_PIGZ_DEPENDENCIES += host-zlib
 
 define PIGZ_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
 endef
 
+define HOST_PIGZ_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D)
+endef
+
 define PIGZ_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/pigz $(TARGET_DIR)/usr/bin/pigz
 endef
 
+define HOST_PIGZ_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/pigz $(HOST_DIR)/bin/pigz
+endef
+
 $(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.20.1
