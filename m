From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sat, 18 Apr 2015 08:46:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/uboot-tools: bump to version 2015.04
Message-ID: <1429339603-12415-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to version 2015.04:
  * Enable optional support for FIT Signature Verification
  * Remove patch 0002-nostrip, it's upstream
  * Add musl patch
  * Add hash file

This patch supersedes "package/uboot-tools: bump to version 2015.01"
http://patchwork.ozlabs.org/patch/440396/

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uboot-tools/0002-nostrip.patch             | 61 -------------------
 .../0002-tools-only-in-no-dot-config-targets.patch | 39 ++++++++++++
 package/uboot-tools/0003-Fix-musl-build.patch      | 71 ++++++++++++++++++++++
 package/uboot-tools/Config.in                      | 18 ++++++
 package/uboot-tools/Config.in.host                 | 21 +++++++
 package/uboot-tools/uboot-tools.hash               |  2 +
 package/uboot-tools/uboot-tools.mk                 | 23 ++++++-
 7 files changed, 172 insertions(+), 63 deletions(-)
 delete mode 100644 package/uboot-tools/0002-nostrip.patch
 create mode 100644 package/uboot-tools/0002-tools-only-in-no-dot-config-targets.patch
 create mode 100644 package/uboot-tools/0003-Fix-musl-build.patch
 create mode 100644 package/uboot-tools/uboot-tools.hash

diff --git a/package/uboot-tools/0002-nostrip.patch b/package/uboot-tools/0002-nostrip.patch
deleted file mode 100644
index 7333f41..0000000
--- a/package/uboot-tools/0002-nostrip.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 17e0d6ddd1dc5d04b8032bde2f2076134b0c6dd7 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 27 Aug 2014 14:21:32 +0200
-Subject: [PATCH] tools/env: change stripping strategy to allow no-stripping
-
-When building the U-Boot tools for non-ELF platforms (such as Blackfin
-FLAT), since commit 79fc0c5f498c3982aa4740c273ab1a9255063d9c
-("tools/env: cross-compile fw_printenv without setting HOSTCC"), the
-build fails because it tries to strip a FLAT binary, which does not
-make sense.
-
-This commit solves this by changing the stripping logic in
-tools/env/Makefile to be similar to the one in tools/Makefile. This
-logic continues to apply strip to the final binary, but does not abort
-the build if it fails, and does the stripping in place on the final
-binary. This allows the logic to work fine if stripping doesn't work,
-as it leaves the final binary untouched.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>
-Cc: Sonic Zhang <sonic.zhang@analog.com>
----
-An improved solution would be to be able to override STRIP completely
-by setting it to /bin/true, but the main Makefile enforces STRIP =
-$(CROSS_COMPILE)strip.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- tools/env/Makefile | 14 ++++++++------
- 1 file changed, 8 insertions(+), 6 deletions(-)
-
-diff --git a/tools/env/Makefile b/tools/env/Makefile
-index f5368bc..d047aa5 100644
---- a/tools/env/Makefile
-+++ b/tools/env/Makefile
-@@ -21,14 +21,16 @@ HOST_EXTRACFLAGS += -DMTD_OLD
- endif
- 
- always := fw_printenv
--hostprogs-y := fw_printenv_unstripped
-+hostprogs-y := fw_printenv
- 
--fw_printenv_unstripped-objs := fw_env.o fw_env_main.o \
-+fw_printenv-objs := fw_env.o fw_env_main.o \
- 	crc32.o ctype.o linux_string.o \
- 	env_attr.o env_flags.o aes.o
- 
--quiet_cmd_strip = STRIP   $@
--      cmd_strip = $(STRIP) -o $@ $<
-+quiet_cmd_crosstools_strip = STRIP   $^
-+      cmd_crosstools_strip = $(STRIP) $^; touch $@
- 
--$(obj)/fw_printenv: $(obj)/fw_printenv_unstripped FORCE
--	$(call if_changed,strip)
-+$(obj)/.strip: $(obj)/fw_printenv
-+	$(call cmd,crosstools_strip)
-+
-+always += .strip
--- 
-2.0.0
-
diff --git a/package/uboot-tools/0002-tools-only-in-no-dot-config-targets.patch b/package/uboot-tools/0002-tools-only-in-no-dot-config-targets.patch
new file mode 100644
index 0000000..fedf9be
--- /dev/null
+++ b/package/uboot-tools/0002-tools-only-in-no-dot-config-targets.patch
@@ -0,0 +1,39 @@
+From 7d9bac7bf8d9ef39ab6b6e8d436e3dbdee5cd120 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Sun, 1 Feb 2015 21:53:47 +0100
+Subject: [PATCH 1/1] tools only in no dot config targets
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Revert upstream commit c7ad5cbb1ef2c33883f0fa7d0455095004fd306d:
+
+    Makefile: drop "tools-only" from no-dot-config-targets
+
+This indirectly pulls in a build-dependency on libssl-dev used for FIT
+image support, and possibly GPL/OpenSSL licensing incompatibility
+issues.
+
+Based on Debian patch from u-boot-tools:
+http://ftp.de.debian.org/debian/pool/main/u/u-boot/u-boot_2014.10+dfsg1-2.1.debian.tar.xz
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 36a9a28..f85c194 100644
+--- a/Makefile
++++ b/Makefile
+@@ -417,7 +417,7 @@ timestamp_h := include/generated/timestamp_autogenerated.h
+
+ no-dot-config-targets := clean clobber mrproper distclean \
+			 help %docs check% coccicheck \
+-			 ubootversion backup
++			 ubootversion backup tools-only
+
+ config-targets := 0
+ mixed-targets  := 0
+--
+2.3.0
diff --git a/package/uboot-tools/0003-Fix-musl-build.patch b/package/uboot-tools/0003-Fix-musl-build.patch
new file mode 100644
index 0000000..7c07daf
--- /dev/null
+++ b/package/uboot-tools/0003-Fix-musl-build.patch
@@ -0,0 +1,71 @@
+From bf738fda390787a10db0c9a4be9fcafd6707a90e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Sat, 18 Apr 2015 08:00:46 +0200
+Subject: [PATCH 1/1] Fix musl build
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This patch fixes cross-compiling U-Boot tools with the musl C library:
+  * including <sys/types.h> is needed for ulong
+  * defining _GNU_SOURCE is needed for loff_t
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ include/image.h    | 1 +
+ tools/env/fw_env.c | 2 ++
+ tools/imagetool.h  | 1 +
+ tools/proftool.c   | 1 +
+ 4 files changed, 5 insertions(+)
+
+diff --git a/include/image.h b/include/image.h
+index 3844be6..ac2fd6e 100644
+--- a/include/image.h
++++ b/include/image.h
+@@ -18,6 +18,7 @@
+
+ #include "compiler.h"
+ #include <asm/byteorder.h>
++#include <sys/types.h>
+
+ /* Define this to avoid #ifdefs later on */
+ struct lmb;
+diff --git a/tools/env/fw_env.c b/tools/env/fw_env.c
+index 1173eea..daa02a7 100644
+--- a/tools/env/fw_env.c
++++ b/tools/env/fw_env.c
+@@ -8,6 +8,8 @@
+  * SPDX-License-Identifier:	GPL-2.0+
+  */
+
++#define _GNU_SOURCE
++
+ #include <errno.h>
+ #include <env_flags.h>
+ #include <fcntl.h>
+diff --git a/tools/imagetool.h b/tools/imagetool.h
+index 3e15b4e..b7874f4 100644
+--- a/tools/imagetool.h
++++ b/tools/imagetool.h
+@@ -16,6 +16,7 @@
+ #include <stdlib.h>
+ #include <string.h>
+ #include <sys/stat.h>
++#include <sys/types.h>
+ #include <time.h>
+ #include <unistd.h>
+ #include <u-boot/sha1.h>
+diff --git a/tools/proftool.c b/tools/proftool.c
+index 3482951..9ce7a77 100644
+--- a/tools/proftool.c
++++ b/tools/proftool.c
+@@ -16,6 +16,7 @@
+ #include <string.h>
+ #include <unistd.h>
+ #include <sys/param.h>
++#include <sys/types.h>
+
+ #include <compiler.h>
+ #include <trace.h>
+--
+2.3.5
diff --git a/package/uboot-tools/Config.in b/package/uboot-tools/Config.in
index 7c8f17c..66045af 100644
--- a/package/uboot-tools/Config.in
+++ b/package/uboot-tools/Config.in
@@ -13,6 +13,24 @@ config BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE
 	  The mkimage tool from Das U-Boot bootloader, which allows
 	  generation of U-Boot images in various formats.
 
+if BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE
+config BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SIGNATURE_SUPPORT
+	bool "FIT signature verification support"
+	select BR2_PACKAGE_OPENSSL
+	help
+	  Enables support for FIT Signature Verification.
+
+	  Flat Image Trees (FIT) supports hashing of images so that these
+	  hashes can be checked on loading. This protects against corruption
+	  of the image. However it does not prevent the substitution of one
+	  image for another.
+
+	  The signature feature allows the hash to be signed with a private
+	  key such that it can be verified using a public key later. Provided
+	  that the private key is kept secret and the public key is stored in
+	  a non-volatile place, any image can be verified in this way.
+endif
+
 config BR2_PACKAGE_UBOOT_TOOLS_MKENVIMAGE
 	bool "mkenvimage"
 	help
diff --git a/package/uboot-tools/Config.in.host b/package/uboot-tools/Config.in.host
index 7a844e9..8494b16 100644
--- a/package/uboot-tools/Config.in.host
+++ b/package/uboot-tools/Config.in.host
@@ -4,3 +4,24 @@ config BR2_PACKAGE_HOST_UBOOT_TOOLS
 	  Companion tools for Das U-Boot bootloader.
 
 	  http://www.denx.de/wiki/U-Boot/WebHome
+
+if BR2_PACKAGE_HOST_UBOOT_TOOLS
+config BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT
+	bool "FIT signature verification support"
+	help
+	  Enables support for FIT Signature Verification.
+
+	  Flat Image Trees (FIT) supports hashing of images so that these
+	  hashes can be checked on loading. This protects against corruption
+	  of the image. However it does not prevent the substitution of one
+	  image for another.
+
+	  The signature feature allows the hash to be signed with a private
+	  key such that it can be verified using a public key later. Provided
+	  that the private key is kept secret and the public key is stored in
+	  a non-volatile place, any image can be verified in this way.
+
+	  Enabling this option indirectly pulls in a build-dependency on
+	  libssl and libcrypto, and possibly GPL/OpenSSL licensing
+	  incompatibility issues.
+endif
diff --git a/package/uboot-tools/uboot-tools.hash b/package/uboot-tools/uboot-tools.hash
new file mode 100644
index 0000000..9cc96f6
--- /dev/null
+++ b/package/uboot-tools/uboot-tools.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256	0a1a70df586655f527befa6f12e184e96ed61b126e5a567382321b17200f5d60  u-boot-2015.04.tar.bz2
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 413207d..1c6d542 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -4,18 +4,24 @@
 #
 ################################################################################
 
-UBOOT_TOOLS_VERSION = 2014.07
+UBOOT_TOOLS_VERSION = 2015.04
 UBOOT_TOOLS_SOURCE = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
 UBOOT_TOOLS_SITE = ftp://ftp.denx.de/pub/u-boot
 UBOOT_TOOLS_LICENSE = GPLv2+
 UBOOT_TOOLS_LICENSE_FILES = Licenses/gpl-2.0.txt
 
+define UBOOT_TOOLS_CONFIGURE_CMDS
+	mkdir -p $(@D)/include/config
+	touch $(@D)/include/config/auto.conf
+endef
+
 define UBOOT_TOOLS_BUILD_CMDS
 	$(MAKE) -C $(@D) 			\
 		CROSS_COMPILE="$(TARGET_CROSS)"	\
 		CFLAGS="$(TARGET_CFLAGS)"	\
 		LDFLAGS="$(TARGET_LDFLAGS)"	\
 		CROSS_BUILD_TOOLS=y		\
+		CONFIG_FIT_SIGNATURE=$(BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SIGNATURE_SUPPORT) \
 		tools-only
 	$(MAKE) -C $(@D) 			\
 		CROSS_COMPILE="$(TARGET_CROSS)"	\
@@ -28,7 +34,10 @@ ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE),y)
 define UBOOT_TOOLS_INSTALL_MKIMAGE
 	$(INSTALL) -m 0755 -D $(@D)/tools/mkimage $(TARGET_DIR)/usr/bin/mkimage
 endef
-endif
+ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SIGNATURE_SUPPORT),y)
+UBOOT_TOOLS_DEPENDENCIES = openssl
+endif # BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SIGNATURE_SUPPORT
+endif # BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE
 
 ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_MKENVIMAGE),y)
 define UBOOT_TOOLS_INSTALL_MKENVIMAGE
@@ -49,8 +58,18 @@ define UBOOT_TOOLS_INSTALL_TARGET_CMDS
 	$(UBOOT_TOOLS_INSTALL_FWPRINTENV)
 endef
 
+ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),y)
+HOST_UBOOT_TOOLS_DEPENDENCIES = host-openssl
+endif
+
+define HOST_UBOOT_TOOLS_CONFIGURE_CMDS
+	mkdir -p $(@D)/include/config
+	touch $(@D)/include/config/auto.conf
+endef
+
 define HOST_UBOOT_TOOLS_BUILD_CMDS
 	$(MAKE1) -C $(@D) 			\
+		CONFIG_FIT_SIGNATURE=$(BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SIGNATURE_SUPPORT) \
 		HOSTCC="$(HOSTCC)"		\
 		HOSTCFLAGS="$(HOST_CFLAGS)"	\
 		HOSTLDFLAGS="$(HOST_LDFLAGS)"	\
-- 
2.3.5
