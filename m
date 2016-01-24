From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 24 Jan 2016 13:29:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/tinyalsa: bump version to fix musl
	build
Message-ID: <1453638552-28416-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The autobuilders did not catch the error yet because they failed
earlier with other packages, but I am continuing the build based
on the defconfig from:
http://autobuild.buildroot.net/results/6cc/6cc0f8c067e07deea688b9b97284601a596b898c/

The header-related bug

In file included from mixer.c:43:0:
include/sound/asound.h:337:18: error: field ?trigger_tstamp? has incomplete type
  struct timespec trigger_tstamp;
                  ^
include/sound/asound.h:338:18: error: field ?tstamp? has incomplete type
  struct timespec tstamp;
                  ^
was fixed with this commit:
https://github.com/tinyalsa/tinyalsa/commit/c8333f8c7a4e4b9549abeef7530b2cd20a18e537

Removed 0001-tinypcminfo-make-function-pcm_get_format_name-static.patch,
applied upstream:
https://github.com/tinyalsa/tinyalsa/commit/7d204edfe87f4e22105bcaeb750d69ac769afdd6

Added hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...-make-function-pcm_get_format_name-static.patch | 45 ----------------------
 package/tinyalsa/tinyalsa.hash                     |  2 +
 package/tinyalsa/tinyalsa.mk                       |  2 +-
 3 files changed, 3 insertions(+), 46 deletions(-)
 delete mode 100644 package/tinyalsa/0001-tinypcminfo-make-function-pcm_get_format_name-static.patch
 create mode 100644 package/tinyalsa/tinyalsa.hash

diff --git a/package/tinyalsa/0001-tinypcminfo-make-function-pcm_get_format_name-static.patch b/package/tinyalsa/0001-tinypcminfo-make-function-pcm_get_format_name-static.patch
deleted file mode 100644
index 4c8d48f..0000000
--- a/package/tinyalsa/0001-tinypcminfo-make-function-pcm_get_format_name-static.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 10d82df8d920ceec4be9028a4939f96d6f407e81 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 26 Aug 2015 09:20:13 +0200
-Subject: [PATCH] tinypcminfo: make function pcm_get_format_name() static
-
-When building tinyalsa with gcc 5.x, the following warnings appear:
-
-tinypcminfo.c:97:52: warning: 'format_lookup' is static but used in inline function 'pcm_get_format_name' which is not static
-     return bit_index < ARRAY_SIZE(format_lookup) ? format_lookup[bit_index] : NULL;
-                                                    ^
-tinypcminfo.c:97:35: warning: 'format_lookup' is static but used in inline function 'pcm_get_format_name' which is not static
-     return bit_index < ARRAY_SIZE(format_lookup) ? format_lookup[bit_index] : NULL;
-
-And the build fails with:
-
-tinypcminfo.o: In function `main':
-tinypcminfo.c:(.text+0x2f0): undefined reference to `pcm_get_format_name'
-collect2: error: ld returned 1 exit status
-
-To fix this, this patch marks the pcm_get_format_name() as static,
-since it's anyway only used in tinypcminfo.c.
-
-Submitted upstream: https://github.com/tinyalsa/tinyalsa/pull/61
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- tinypcminfo.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tinypcminfo.c b/tinypcminfo.c
-index b2d11bc..99eec34 100644
---- a/tinypcminfo.c
-+++ b/tinypcminfo.c
-@@ -92,7 +92,7 @@ static const char *format_lookup[] = {
- /* Returns a human readable name for the format associated with bit_index,
-  * NULL if bit_index is not known.
-  */
--inline const char *pcm_get_format_name(unsigned bit_index)
-+static inline const char *pcm_get_format_name(unsigned bit_index)
- {
-     return bit_index < ARRAY_SIZE(format_lookup) ? format_lookup[bit_index] : NULL;
- }
--- 
-2.5.0
-
diff --git a/package/tinyalsa/tinyalsa.hash b/package/tinyalsa/tinyalsa.hash
new file mode 100644
index 0000000..e4a584c
--- /dev/null
+++ b/package/tinyalsa/tinyalsa.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	fb355a1cb125c2120cfc36d0af04824c20a4301ffd7f287d4cec00583235a9de	tinyalsa-ad66b45add9677c4a732fc3a020f7b5d19c38def.tar.gz
diff --git a/package/tinyalsa/tinyalsa.mk b/package/tinyalsa/tinyalsa.mk
index e470b47..c18bc7a 100644
--- a/package/tinyalsa/tinyalsa.mk
+++ b/package/tinyalsa/tinyalsa.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINYALSA_VERSION = f2a7b6d3d81bd337a540d56704b4aaa7bdb046fe
+TINYALSA_VERSION = ad66b45add9677c4a732fc3a020f7b5d19c38def
 TINYALSA_SITE = $(call github,tinyalsa,tinyalsa,$(TINYALSA_VERSION))
 TINYALSA_LICENSE = BSD-3c
 TINYALSA_INSTALL_STAGING = YES
-- 
2.7.0.rc3
