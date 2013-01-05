From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat,  5 Jan 2013 08:30:43 -0300
Subject: [Buildroot] [PATCH] alsa-lib: fix build failures for nommu
Message-ID: <1357385443-31702-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable the pcm_shm plugin (aserver) and alisp for nommu systems since
they use fork()
Fixes
http://autobuild.buildroot.net/results/7e59e73e516579045538e7cc0efbc22744a45d75

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/alsa-lib/Config.in |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/alsa-lib/Config.in b/package/alsa-lib/Config.in
index ca063d8..2ba6886 100644
--- a/package/alsa-lib/Config.in
+++ b/package/alsa-lib/Config.in
@@ -37,7 +37,8 @@ config BR2_PACKAGE_ALSA_LIB_DEVDIR
 
 config BR2_PACKAGE_ALSA_LIB_PCM_PLUGINS
 	string "built PCM plugins"
-	default "all"
+	default "all" if BR2_USE_MMU
+	default "copy linear route mulaw alaw adpcm rate plug multi file null empty share meter hooks lfloat ladspa dmix dshare dsnoop asym iec958 softvol extplug ioplug mmap_emul" if !BR2_MMU
 
 config BR2_PACKAGE_ALSA_LIB_CTL_PLUGINS
 	string "built control plugins"
@@ -69,6 +70,7 @@ config BR2_PACKAGE_ALSA_LIB_SEQ
 
 config BR2_PACKAGE_ALSA_LIB_ALISP
 	bool "alisp"
+	depends on BR2_USE_MMU
 	default y
 
 config BR2_PACKAGE_ALSA_LIB_OLD_SYMBOLS
-- 
1.7.8.6
