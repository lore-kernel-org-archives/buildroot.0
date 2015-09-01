From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 01 Sep 2015 08:31:06 -0000
Subject: [Buildroot] [git commit] package/uboot-tools: bump to version
	2015.07
Message-ID: <20150901083105.D723281EC5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c64f1022200c80c32184aa8dad44900b96c35d1c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Patch is too large, so refusing to show it
Patch is too large, so refusing to show it
