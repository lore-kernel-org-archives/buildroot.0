From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Sep 2019 09:19:04 +0200
Subject: [Buildroot] [git commit] package/cbootimage: bump to version 1.8
Message-ID: <20190915071604.7714B8E052@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e3d0793604edecce88bb724d4857d9a642d6c681
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove patch (already in version)
- Remove glic or uclibc toolchain dependency, not needed since
  https://github.com/NVIDIA/cbootimage/commit/3b3c3cccf0640326229935be5ff702ac948fd51b
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...on-t-crash-on-devices-without-RSA-support.patch | 43 ----------------------
 package/cbootimage/Config.in                       |  7 ----
 package/cbootimage/cbootimage.hash                 |  3 +-
 package/cbootimage/cbootimage.mk                   |  2 +-
 4 files changed, 3 insertions(+), 52 deletions(-)

diff --git a/package/cbootimage/0001-bct_dump-don-t-crash-on-devices-without-RSA-support.patch b/package/cbootimage/0001-bct_dump-don-t-crash-on-devices-without-RSA-support.patch
deleted file mode 100644
index 587d67fc47..0000000000
--- a/package/cbootimage/0001-bct_dump-don-t-crash-on-devices-without-RSA-support.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 64045f993c2cd8989838aeaad3d22107d96d5596 Mon Sep 17 00:00:00 2001
-From: Stephen Warren <swarren@nvidia.com>
-Date: Thu, 28 Jul 2016 11:37:45 -0600
-Subject: [PATCH] bct_dump: don't crash on devices without RSA support
-
-format_rsa_param() currently crashes on chips that don't implement
-soc_config->get_value_size(); that is, on all chips before T124. Fix the
-function not to crash. Better might be to avoid even dumping RSA
-parameters on chips which don't support RSA, but that's a larger change
-that needs much more work.
-
-Fixes: 3c3b992a6814 ("Add support to dump rsa related fields for t210")
-Cc: Jimmy Zhang <jimmzhang@nvidia.com>
-Signed-off-by: Stephen Warren <swarren@nvidia.com>
-Signed-off-by: Misha Komarovskiy <zombah@gmail.com>
----
- src/bct_dump.c | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/src/bct_dump.c b/src/bct_dump.c
-index 4f50fa2..b4ca9fc 100644
---- a/src/bct_dump.c
-+++ b/src/bct_dump.c
-@@ -133,10 +133,14 @@ static void format_rsa_param(parse_token id, char const * message, void * data)
- {
- #define MAX_BYTE_NUMBER_PER_LINE	16
- 	u_int8_t *rsa = (u_int8_t *)data;
--	int size = g_soc_config->get_value_size(id);
--	int byte_index;
-+	int size, byte_index;
- 
- 	printf("%s", message);
-+
-+	if (!g_soc_config->get_value_size)
-+		return;
-+
-+	size = g_soc_config->get_value_size(id);
- 	for (byte_index = 0; byte_index < size; ++byte_index) {
- 		printf(" %02x", *rsa++);
- 
--- 
-2.1.4
-
diff --git a/package/cbootimage/Config.in b/package/cbootimage/Config.in
index b798e5d988..1a7fef0b39 100644
--- a/package/cbootimage/Config.in
+++ b/package/cbootimage/Config.in
@@ -1,16 +1,9 @@
 config BR2_PACKAGE_CBOOTIMAGE
 	bool "cbootimage"
 	depends on BR2_arm || BR2_armeb
-	# uses non-standard u_intXX_t types
-	# https://github.com/NVIDIA/cbootimage/pull/7
-	depends on !BR2_TOOLCHAIN_USES_MUSL
 	help
 	  This project provides a tool which compiles BCT (Boot
 	  Configuration Table) images to place into the boot flash of
 	  a Tegra-based device.
 
 	  https://github.com/NVIDIA/cbootimage
-
-comment "cbootimage needs a glibc or uClibc toolchain"
-	depends on BR2_arm || BR2_armeb
-	depends on BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/cbootimage/cbootimage.hash b/package/cbootimage/cbootimage.hash
index 01342cdc91..7113f84f1b 100644
--- a/package/cbootimage/cbootimage.hash
+++ b/package/cbootimage/cbootimage.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 373c108d7b6778c62a33e59ad0cd5ea9ebb379319a0c8b4cf469eaa8bec5521b  cbootimage-1.7.tar.gz
+sha256 46cce01f07df977668de9e1d49884d8ed539169994215606a9719d17b9db8804  cbootimage-1.8.tar.gz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/cbootimage/cbootimage.mk b/package/cbootimage/cbootimage.mk
index 107ae70920..19819e4b76 100644
--- a/package/cbootimage/cbootimage.mk
+++ b/package/cbootimage/cbootimage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CBOOTIMAGE_VERSION = 1.7
+CBOOTIMAGE_VERSION = 1.8
 CBOOTIMAGE_SITE = $(call github,NVIDIA,cbootimage,v$(CBOOTIMAGE_VERSION))
 CBOOTIMAGE_LICENSE = GPL-2.0
 CBOOTIMAGE_LICENSE_FILES = COPYING
