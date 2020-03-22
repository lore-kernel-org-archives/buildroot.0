From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Mar 2020 22:42:32 +0100
Subject: [Buildroot] [git commit] package/pigz: add host package support
Message-ID: <20200322213014.4B33E86BF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=77d9217083005465926788f15c1597320935dcdb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Louis-Paul Cordier <lpdev@cordier.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in.host                     |  1 +
 package/pigz/Config.in                     |  1 +
 package/pigz/{Config.in => Config.in.host} |  9 ++-------
 package/pigz/pigz.mk                       | 10 ++++++++++
 4 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/package/Config.in.host b/package/Config.in.host
index 64a88f7630..eb8f63f689 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -52,6 +52,7 @@ menu "Host utilities"
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
diff --git a/package/pigz/Config.in b/package/pigz/Config.in.host
similarity index 56%
copy from package/pigz/Config.in
copy to package/pigz/Config.in.host
index af229060cf..9903cada7d 100644
--- a/package/pigz/Config.in
+++ b/package/pigz/Config.in.host
@@ -1,7 +1,5 @@
-config BR2_PACKAGE_PIGZ
-	bool "pigz"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_ZLIB
+config BR2_PACKAGE_HOST_PIGZ
+	bool "host pigz"
 	help
 	  pigz, which stands for parallel implementation of gzip, is a
 	  fully functional replacement for gzip that exploits multiple
@@ -9,6 +7,3 @@ config BR2_PACKAGE_PIGZ
 	  data.
 
 	  http://www.zlib.net/pigz/
-
-comment "pigz needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/pigz/pigz.mk b/package/pigz/pigz.mk
index b4f28c048e..23df0f5fcb 100644
--- a/package/pigz/pigz.mk
+++ b/package/pigz/pigz.mk
@@ -7,6 +7,7 @@
 PIGZ_VERSION = 2.4
 PIGZ_SITE = $(call github,madler,pigz,v$(PIGZ_VERSION))
 PIGZ_DEPENDENCIES = zlib
+HOST_PIGZ_DEPENDENCIES = host-zlib
 PIGZ_LICENSE = Zlib
 PIGZ_LICENSE_FILES = README
 
@@ -14,8 +15,17 @@ define PIGZ_BUILD_CMDS
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
