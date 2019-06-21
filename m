From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Fri, 21 Jun 2019 22:22:29 +0200
Subject: [Buildroot] [PATCH 1/2] package/uboot-tools: bump to version 2019.04
Message-ID: <1561148550-3766-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 - Bump to version 2019.04.
 - remove the patch that have been upstreamed.
 - Refresh patches for the new version.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 .../uboot-tools/0001-drop-configh-from-tools.patch | 10 +++---
 ...-Makefile-build-host-tools-with-std-gnu99.patch | 42 ----------------------
 ...le-fix-HOSTCFLAGS-with-CROSS_BUILD_TOOLS.patch} |  0
 package/uboot-tools/uboot-tools.hash               |  2 +-
 package/uboot-tools/uboot-tools.mk                 |  2 +-
 5 files changed, 8 insertions(+), 48 deletions(-)
 delete mode 100644 package/uboot-tools/0004-tools-Makefile-build-host-tools-with-std-gnu99.patch
 rename package/uboot-tools/{0005-tools-Makefile-fix-HOSTCFLAGS-with-CROSS_BUILD_TOOLS.patch => 0004-tools-Makefile-fix-HOSTCFLAGS-with-CROSS_BUILD_TOOLS.patch} (100%)

diff --git a/package/uboot-tools/0001-drop-configh-from-tools.patch b/package/uboot-tools/0001-drop-configh-from-tools.patch
index f19cebe..59e5686 100644
--- a/package/uboot-tools/0001-drop-configh-from-tools.patch
+++ b/package/uboot-tools/0001-drop-configh-from-tools.patch
@@ -1,4 +1,4 @@
-From 216832de3bc3e6ef093305c6d07f464f7606f2d6 Mon Sep 17 00:00:00 2001
+From ab8b54cfc9d3fddba297c343a2d8dea9dbe20017 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
 Date: Tue, 4 Aug 2015 22:13:20 +0200
 Subject: [PATCH] drop configh from tools
@@ -16,16 +16,18 @@ Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
 [Romain: update for version 2017.05
     after commit 9d80b49a671c9922931adcd823aab0ed319a42d1]
 Signed-off-by: Romain Naour <romain.naour@gmail.com>
+[Pierre-Jean: update for version 2019.04]
+Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
 ---
  tools/env/fw_env_private.h | 11 -----------
  1 file changed, 11 deletions(-)
 
 diff --git a/tools/env/fw_env_private.h b/tools/env/fw_env_private.h
-index 0c27da0..e550463 100644
+index 86be16d..3c62ac4 100644
 --- a/tools/env/fw_env_private.h
 +++ b/tools/env/fw_env_private.h
-@@ -5,17 +5,6 @@
-  * SPDX-License-Identifier:	GPL-2.0+
+@@ -4,17 +4,6 @@
+  * Wolfgang Denk, DENX Software Engineering, wd at denx.de.
   */
  
 -/* Pull in the current config to define the default environment */
diff --git a/package/uboot-tools/0004-tools-Makefile-build-host-tools-with-std-gnu99.patch b/package/uboot-tools/0004-tools-Makefile-build-host-tools-with-std-gnu99.patch
deleted file mode 100644
index 60ad37d..0000000
--- a/package/uboot-tools/0004-tools-Makefile-build-host-tools-with-std-gnu99.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From aaabed350ec51f7bb9a07290ffb3ce6e794c8f22 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Tue, 19 Mar 2019 23:01:50 +0100
-Subject: [PATCH] tools/Makefile: build host tools with -std=gnu99
-
-Parts of the code are using C99 constructs (such as variables declared
-inside loops), but also GNU extensions (such as typeof), so using
--std=gnu99 is necessary to build with older versions of gcc that don't
-default to building with gnu99.
-
-It fixes the following build failure:
-
-./tools/../lib/crc16.c: In function "crc16_ccitt":
-./tools/../lib/crc16.c:70:2: error: "for" loop initial declarations are only allowed in C99 mode
-  for (int i = 0;  i < len;  i++)
-  ^
-./tools/../lib/crc16.c:70:2: note: use option -std=c99 or -std=gnu99 to compile your code
-
-when building the host tools with gcc 4.7.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- tools/Makefile | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/tools/Makefile b/tools/Makefile
-index 081383d7a7..d377d85f74 100644
---- a/tools/Makefile
-+++ b/tools/Makefile
-@@ -254,7 +254,8 @@ HOST_EXTRACFLAGS += -include $(srctree)/include/compiler.h \
- 		-I$(srctree)/tools \
- 		-DUSE_HOSTCC \
- 		-D__KERNEL_STRICT_NAMES \
--		-D_GNU_SOURCE
-+		-D_GNU_SOURCE \
-+		-std=gnu99
- 
- __build:	$(LOGO-y)
- 
--- 
-2.20.1
-
diff --git a/package/uboot-tools/0005-tools-Makefile-fix-HOSTCFLAGS-with-CROSS_BUILD_TOOLS.patch b/package/uboot-tools/0004-tools-Makefile-fix-HOSTCFLAGS-with-CROSS_BUILD_TOOLS.patch
similarity index 100%
rename from package/uboot-tools/0005-tools-Makefile-fix-HOSTCFLAGS-with-CROSS_BUILD_TOOLS.patch
rename to package/uboot-tools/0004-tools-Makefile-fix-HOSTCFLAGS-with-CROSS_BUILD_TOOLS.patch
diff --git a/package/uboot-tools/uboot-tools.hash b/package/uboot-tools/uboot-tools.hash
index df2b8ca..9a92018 100644
--- a/package/uboot-tools/uboot-tools.hash
+++ b/package/uboot-tools/uboot-tools.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  50bd7e5a466ab828914d080d5f6a432345b500e8fba1ad3b7b61e95e60d51c22  u-boot-2019.01.tar.bz2
+sha256  76b7772d156b3ddd7644c8a1736081e55b78828537ff714065d21dbade229bef  u-boot-2019.04.tar.bz2
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 61c70b7..ba6b6db 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UBOOT_TOOLS_VERSION = 2019.01
+UBOOT_TOOLS_VERSION = 2019.04
 UBOOT_TOOLS_SOURCE = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
 UBOOT_TOOLS_SITE = ftp://ftp.denx.de/pub/u-boot
 UBOOT_TOOLS_LICENSE = GPL-2.0+
-- 
2.7.4
