From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 13 Apr 2020 13:53:01 +0200
Subject: [Buildroot] [PATCH 1/2] package/alsa-lib: bump version to 1.2.2
Message-ID: <20200413115302.854756-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog: https://www.alsa-project.org/wiki/Changes_v1.2.1.2_v1.2.2

Removed patch applied upstream:
https://github.com/alsa-project/alsa-lib/commit/8e2c70add782f997f7c269ed3f722888e56ff024

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...c-ucm-main.c-fix-build-without-mixer.patch | 39 -------------------
 package/alsa-lib/alsa-lib.hash                |  2 +-
 package/alsa-lib/alsa-lib.mk                  |  2 +-
 3 files changed, 2 insertions(+), 41 deletions(-)
 delete mode 100644 package/alsa-lib/0002-src-ucm-main.c-fix-build-without-mixer.patch

diff --git a/package/alsa-lib/0002-src-ucm-main.c-fix-build-without-mixer.patch b/package/alsa-lib/0002-src-ucm-main.c-fix-build-without-mixer.patch
deleted file mode 100644
index 4d3ad11175..0000000000
--- a/package/alsa-lib/0002-src-ucm-main.c-fix-build-without-mixer.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 65eb51668f87668d994f260f36a6325f248cdff3 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 3 Dec 2019 18:56:40 +0100
-Subject: [PATCH] src/ucm/main.c: fix build without mixer
-
-Commit 4ce38a5ff466d18039b2606938f866ea3a6c9f3c breaks the build without
-mixer on:
-
-  CCLD     libasound.la
-/home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/8.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: ucm/.libs/libucm.a(main.o): in function `snd_use_case_set':
-main.c:(.text+0x185c): undefined reference to `snd_mixer_selem_id_parse'
-
-Fixes:
- - http://autobuild.buildroot.org/results/4d91c9f82a2a61c50c457a851073b85cc09ea345
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/alsa-project/alsa-lib/pull/15]
----
- src/ucm/main.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/ucm/main.c b/src/ucm/main.c
-index d2078a23..61922f10 100644
---- a/src/ucm/main.c
-+++ b/src/ucm/main.c
-@@ -2115,8 +2115,10 @@ int snd_use_case_parse_selem_id(snd_mixer_selem_id_t *dst,
- 				const char *ucm_id,
- 				const char *value)
- {
-+#ifdef BUILD_MIXER
- 	if (strcmp(ucm_id, "PlaybackMixerId") == 0 ||
- 	    strcmp(ucm_id, "CaptureMixerId") == 0)
- 		return snd_mixer_selem_id_parse(dst, value);
-+#endif
- 	return -EINVAL;
- }
--- 
-2.24.0
-
diff --git a/package/alsa-lib/alsa-lib.hash b/package/alsa-lib/alsa-lib.hash
index 2f34a12fb5..628c5984e4 100644
--- a/package/alsa-lib/alsa-lib.hash
+++ b/package/alsa-lib/alsa-lib.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 958e260e3673f1f6ff6b2d2c0df3fc2e469bea5b2957163ce96ce17f23e87943  alsa-lib-1.2.1.2.tar.bz2
+sha256 d8e853d8805574777bbe40937812ad1419c9ea7210e176f0def3e6ed255ab3ec  alsa-lib-1.2.2.tar.bz2
 sha256 32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
 sha256 bfe16cf823bcff261fc6a062c07ee96660e3c39678f42f39a788a68dbc234ced  aserver/COPYING
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index 38bd0fb70a..1855eb3d08 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_LIB_VERSION = 1.2.1.2
+ALSA_LIB_VERSION = 1.2.2
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE = https://www.alsa-project.org/files/pub/lib
 ALSA_LIB_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (aserver)
-- 
2.25.0
