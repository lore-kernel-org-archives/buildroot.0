From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Aug 2015 13:00:05 +0200
Subject: [Buildroot] [git commit branch/next] package/uboot-tools: bump to
	version 2015.07
Message-ID: <20150808110011.B905A8188A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c64f1022200c80c32184aa8dad44900b96c35d1c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Also:
  - update patch #1
  - remove patch #3 and #4 -> applied upstream

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../uboot-tools/0001-drop-configh-from-tools.patch |   25 ++++++-
 package/uboot-tools/0003-Fix-musl-build.patch      |   71 --------------------
 ...kg-config-when-available-to-get-SSL-flags.patch |   39 -----------
 package/uboot-tools/uboot-tools.hash               |    2 +-
 package/uboot-tools/uboot-tools.mk                 |    2 +-
 5 files changed, 24 insertions(+), 115 deletions(-)

diff --git a/package/uboot-tools/0001-drop-configh-from-tools.patch b/package/uboot-tools/0001-drop-configh-from-tools.patch
index a36332f..e77a301 100644
--- a/package/uboot-tools/0001-drop-configh-from-tools.patch
+++ b/package/uboot-tools/0001-drop-configh-from-tools.patch
@@ -1,18 +1,33 @@
+From 2e54434e4dd178773e8e11e48afc81299771f3e7 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Tue, 4 Aug 2015 22:13:20 +0200
+Subject: [PATCH 1/1] drop configh from tools
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
 We need to build u-boot tools without a board configuration for the target.
 fw_env just uses config.h to define the default environment of the created
 image, so it really isn't mandatory.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+[J??rg Krause: update for version 2015.07]
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
+---
+ tools/env/fw_env.h | 11 -----------
+ 1 file changed, 11 deletions(-)
 
 diff --git a/tools/env/fw_env.h b/tools/env/fw_env.h
-index aff471b..dfe7439 100644
+index 60c0517..1c5daaa 100644
 --- a/tools/env/fw_env.h
 +++ b/tools/env/fw_env.h
-@@ -5,14 +5,6 @@
+@@ -5,17 +5,6 @@
   * SPDX-License-Identifier:	GPL-2.0+
   */
  
 -/* Pull in the current config to define the default environment */
+-#include <linux/kconfig.h>
+-
 -#ifndef __ASSEMBLY__
 -#define __ASSEMBLY__ /* get only #defines from config.h */
 -#include <config.h>
@@ -20,6 +35,10 @@ index aff471b..dfe7439 100644
 -#else
 -#include <config.h>
 -#endif
- 
+-
  /*
   * To build the utility with the static configuration
+  * comment out the next line.
+-- 
+2.5.0
+
diff --git a/package/uboot-tools/0003-Fix-musl-build.patch b/package/uboot-tools/0003-Fix-musl-build.patch
deleted file mode 100644
index 7c07daf..0000000
--- a/package/uboot-tools/0003-Fix-musl-build.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From bf738fda390787a10db0c9a4be9fcafd6707a90e Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Sat, 18 Apr 2015 08:00:46 +0200
-Subject: [PATCH 1/1] Fix musl build
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This patch fixes cross-compiling U-Boot tools with the musl C library:
-  * including <sys/types.h> is needed for ulong
-  * defining _GNU_SOURCE is needed for loff_t
-
-Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
----
- include/image.h    | 1 +
- tools/env/fw_env.c | 2 ++
- tools/imagetool.h  | 1 +
- tools/proftool.c   | 1 +
- 4 files changed, 5 insertions(+)
-
-diff --git a/include/image.h b/include/image.h
-index 3844be6..ac2fd6e 100644
---- a/include/image.h
-+++ b/include/image.h
-@@ -18,6 +18,7 @@
-
- #include "compiler.h"
- #include <asm/byteorder.h>
-+#include <sys/types.h>
-
- /* Define this to avoid #ifdefs later on */
- struct lmb;
-diff --git a/tools/env/fw_env.c b/tools/env/fw_env.c
-index 1173eea..daa02a7 100644
---- a/tools/env/fw_env.c
-+++ b/tools/env/fw_env.c
-@@ -8,6 +8,8 @@
-  * SPDX-License-Identifier:	GPL-2.0+
-  */
-
-+#define _GNU_SOURCE
-+
- #include <errno.h>
- #include <env_flags.h>
- #include <fcntl.h>
-diff --git a/tools/imagetool.h b/tools/imagetool.h
-index 3e15b4e..b7874f4 100644
---- a/tools/imagetool.h
-+++ b/tools/imagetool.h
-@@ -16,6 +16,7 @@
- #include <stdlib.h>
- #include <string.h>
- #include <sys/stat.h>
-+#include <sys/types.h>
- #include <time.h>
- #include <unistd.h>
- #include <u-boot/sha1.h>
-diff --git a/tools/proftool.c b/tools/proftool.c
-index 3482951..9ce7a77 100644
---- a/tools/proftool.c
-+++ b/tools/proftool.c
-@@ -16,6 +16,7 @@
- #include <string.h>
- #include <unistd.h>
- #include <sys/param.h>
-+#include <sys/types.h>
-
- #include <compiler.h>
- #include <trace.h>
---
-2.3.5
diff --git a/package/uboot-tools/0004-tools-use-pkg-config-when-available-to-get-SSL-flags.patch b/package/uboot-tools/0004-tools-use-pkg-config-when-available-to-get-SSL-flags.patch
deleted file mode 100644
index 9eb7483..0000000
--- a/package/uboot-tools/0004-tools-use-pkg-config-when-available-to-get-SSL-flags.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 99bc38ac6ebdd3b5d741cb9e50d842fa13d409f7 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 12 May 2015 22:54:29 +0200
-Subject: [PATCH] tools: use pkg-config when available to get SSL flags
-
-Instead of hardcoding -lssl -lcrypto as the flags needed to build
-mkimage with FIT signature enabled, use pkg-config when
-available. This allows to properly support cases where static linking
-is used, which requires linking with -lz, since OpenSSL uses zlib
-internally.
-
-We gracefully fallback on the previous behavior of hardcoding -lssl
--lcrypto if pkg-config is not available or fails with an error.
-
-Patch submitted upstream at
-http://lists.denx.de/pipermail/u-boot/2015-May/214489.html
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- tools/Makefile | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/tools/Makefile b/tools/Makefile
-index 4bbb153..8ff9c2e 100644
---- a/tools/Makefile
-+++ b/tools/Makefile
-@@ -122,7 +122,8 @@ endif
- 
- # MXSImage needs LibSSL
- ifneq ($(CONFIG_MX23)$(CONFIG_MX28)$(CONFIG_FIT_SIGNATURE),)
--HOSTLOADLIBES_mkimage += -lssl -lcrypto
-+HOSTLOADLIBES_mkimage += \
-+	$(shell pkg-config --libs libssl libcrypto 2> /dev/null || echo "-lssl -lcrypto")
- endif
- 
- HOSTLOADLIBES_dumpimage := $(HOSTLOADLIBES_mkimage)
--- 
-2.1.0
-
diff --git a/package/uboot-tools/uboot-tools.hash b/package/uboot-tools/uboot-tools.hash
index 9cc96f6..3b687d5 100644
--- a/package/uboot-tools/uboot-tools.hash
+++ b/package/uboot-tools/uboot-tools.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	0a1a70df586655f527befa6f12e184e96ed61b126e5a567382321b17200f5d60  u-boot-2015.04.tar.bz2
+sha256	0b48c9bd717f2c322ef791f8282e14c88be942dc7d1226df7e31a812a3af94d9  u-boot-2015.07.tar.bz2
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 3ae346e..5a239ab 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UBOOT_TOOLS_VERSION = 2015.04
+UBOOT_TOOLS_VERSION = 2015.07
 UBOOT_TOOLS_SOURCE = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
 UBOOT_TOOLS_SITE = ftp://ftp.denx.de/pub/u-boot
 UBOOT_TOOLS_LICENSE = GPLv2+
