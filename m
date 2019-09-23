From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Sep 2019 22:05:57 +0200
Subject: [Buildroot] [git commit] package/devmem2: remove package
Message-ID: <20190923200109.CBB538F180@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2b2579afebfc7a9b8a458af1f2d206101fbfa19c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It was here just for backwards compatibility and is not used by any
package or board after commits

  59856480b6 packages/devmem2: remove from all board configurations
  2f6e3eae55 package/ti-gfx: do not use devmem2 in script

There are address casting issues with 32bit access on a 64bit bus (like
on the SoC FPGA ARM processors) with this tool. The Busybox version of
devmem is the most up to date and supports quadword access.

Fixes: https://bugs.busybox.net/show_bug.cgi?id=10171

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                                   |  7 +++
 DEVELOPERS                                         |  1 -
 .../devmem2/0001-be-coherent-in-type-usage.patch   | 52 ----------------------
 package/devmem2/Config.in                          |  7 ---
 package/devmem2/devmem2.hash                       |  3 --
 package/devmem2/devmem2.mk                         | 30 -------------
 6 files changed, 7 insertions(+), 93 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index b8b550e5ee..aeeeba04dd 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2019.11"
 
+config BR2_PACKAGE_DEVMEM2
+	bool "devmem2 package was removed"
+	select BR2_LEGACY
+	help
+	  Use the the Busybox devmem utility, instead, which provides
+	  the same functionality.
+
 config BR2_PACKAGE_USTR
 	bool "ustr package removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index b427fd92ae..9e68a153a5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1516,7 +1516,6 @@ F:	package/cgroupfs-mount/
 F:	package/crda/
 F:	package/cunit/
 F:	package/dacapo/
-F:	package/devmem2/
 F:	package/dnsmasq/
 F:	package/dosfstools/
 F:	package/eigen/
diff --git a/package/devmem2/0001-be-coherent-in-type-usage.patch b/package/devmem2/0001-be-coherent-in-type-usage.patch
deleted file mode 100644
index 1777387734..0000000000
--- a/package/devmem2/0001-be-coherent-in-type-usage.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 6570e7afe1eebd64022b871b9ebd9a76be267f57 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sun, 29 Jun 2014 16:27:49 +0200
-Subject: [PATCH] Be coherent in type usage
-
-- no need to use off_t because it is read from strtoul()
-- print unsigned int type correctly
-
-When built with _FILE_OFFSET_BITS=64, off_t becomes an long long int
-and was printed as an unsigned int which lead to a garbled output.
-
-Signed-off-by: Colin Didier <colin.didier@devialet.com>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- devmem2.c | 7 +++----
- 1 file changed, 3 insertions(+), 4 deletions(-)
-
-diff --git a/devmem2.c b/devmem2.c
-index 7732ecb..7aa5c79 100644
---- a/devmem2.c
-+++ b/devmem2.c
-@@ -58,8 +58,7 @@
- int main(int argc, char **argv) {
-     int fd;
-     void *map_base, *virt_addr; 
--	unsigned long read_result, writeval;
--	off_t target;
-+	unsigned long target, read_result, writeval;
- 	int access_type = 'w';
- 	
- 	if(argc < 2) {
-@@ -101,7 +100,7 @@ int main(int argc, char **argv) {
- 			fprintf(stderr, "Illegal data type '%c'.\n", access_type);
- 			exit(2);
- 	}
--    printf("Value at address 0x%X (%p): 0x%X\n", target, virt_addr, read_result); 
-+    printf("Value@address 0x%lX (%p): 0x%X\n", target, virt_addr, read_result); 
-     fflush(stdout);
- 
- 	if(argc > 3) {
-@@ -120,7 +119,7 @@ int main(int argc, char **argv) {
- 				read_result = *((unsigned long *) virt_addr);
- 				break;
- 		}
--		printf("Written 0x%X; readback 0x%X\n", writeval, read_result); 
-+		printf("Written 0x%lX; readback 0x%X\n", writeval, read_result); 
- 		fflush(stdout);
- 	}
- 	
--- 
-2.0.0
-
diff --git a/package/devmem2/Config.in b/package/devmem2/Config.in
deleted file mode 100644
index 1ccb0553b4..0000000000
--- a/package/devmem2/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_DEVMEM2
-	bool "devmem2"
-	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-	help
-	  Simple program to read/write from/to any location in memory.
-
-	  http://bootlin.com/pub/mirror/devmem2.c
diff --git a/package/devmem2/devmem2.hash b/package/devmem2/devmem2.hash
deleted file mode 100644
index aa638d631d..0000000000
--- a/package/devmem2/devmem2.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256 3b15515693bae1ebd14d914e46d388edfec2175829ea1576a7a0c8606ebbe639  devmem2.c
-sha256 560913d09310d446920c16bd0aca1ff21d3b6fedd527195bacfc832ce343e0ae  devmem2.c.license
diff --git a/package/devmem2/devmem2.mk b/package/devmem2/devmem2.mk
deleted file mode 100644
index e1bbee3b78..0000000000
--- a/package/devmem2/devmem2.mk
+++ /dev/null
@@ -1,30 +0,0 @@
-################################################################################
-#
-# devmem2
-#
-################################################################################
-
-DEVMEM2_SITE = http://bootlin.com/pub/mirror
-DEVMEM2_SOURCE = devmem2.c
-DEVMEM2_VERSION = 1
-DEVMEM2_LICENSE = GPL-2.0+
-DEVMEM2_LICENSE_FILES = devmem2.c.license
-
-define DEVMEM2_EXTRACT_CMDS
-	cp $(DEVMEM2_DL_DIR)/$($(PKG)_SOURCE) $(@D)/
-endef
-
-define DEVMEM2_EXTRACT_LICENSE
-	head -n 38 $(@D)/devmem2.c >$(@D)/devmem2.c.license
-endef
-DEVMEM2_PRE_PATCH_HOOKS += DEVMEM2_EXTRACT_LICENSE
-
-define DEVMEM2_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) devmem2
-endef
-
-define DEVMEM2_INSTALL_TARGET_CMDS
-	$(INSTALL) -D $(@D)/devmem2 $(TARGET_DIR)/sbin/devmem2
-endef
-
-$(eval $(generic-package))
