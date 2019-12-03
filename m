From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 3 Dec 2019 22:51:46 +0100
Subject: [Buildroot] [git commit] package/alsa-lib: fix build without mixer
Message-ID: <20191203214429.7933B810FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=99767380edd34ccb560922707d41ec844c3b649f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/4d91c9f82a2a61c50c457a851073b85cc09ea345

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...02-src-ucm-main.c-fix-build-without-mixer.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/alsa-lib/0002-src-ucm-main.c-fix-build-without-mixer.patch b/package/alsa-lib/0002-src-ucm-main.c-fix-build-without-mixer.patch
new file mode 100644
index 0000000000..4d3ad11175
--- /dev/null
+++ b/package/alsa-lib/0002-src-ucm-main.c-fix-build-without-mixer.patch
@@ -0,0 +1,39 @@
+From 65eb51668f87668d994f260f36a6325f248cdff3 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 3 Dec 2019 18:56:40 +0100
+Subject: [PATCH] src/ucm/main.c: fix build without mixer
+
+Commit 4ce38a5ff466d18039b2606938f866ea3a6c9f3c breaks the build without
+mixer on:
+
+  CCLD     libasound.la
+/home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/8.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: ucm/.libs/libucm.a(main.o): in function `snd_use_case_set':
+main.c:(.text+0x185c): undefined reference to `snd_mixer_selem_id_parse'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/4d91c9f82a2a61c50c457a851073b85cc09ea345
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/alsa-project/alsa-lib/pull/15]
+---
+ src/ucm/main.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/ucm/main.c b/src/ucm/main.c
+index d2078a23..61922f10 100644
+--- a/src/ucm/main.c
++++ b/src/ucm/main.c
+@@ -2115,8 +2115,10 @@ int snd_use_case_parse_selem_id(snd_mixer_selem_id_t *dst,
+ 				const char *ucm_id,
+ 				const char *value)
+ {
++#ifdef BUILD_MIXER
+ 	if (strcmp(ucm_id, "PlaybackMixerId") == 0 ||
+ 	    strcmp(ucm_id, "CaptureMixerId") == 0)
+ 		return snd_mixer_selem_id_parse(dst, value);
++#endif
+ 	return -EINVAL;
+ }
+-- 
+2.24.0
+
