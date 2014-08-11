From: arnaud at intelibre.fr <arnaud@intelibre.fr>
Date: Mon, 11 Aug 2014 18:03:51 +0200
Subject: [Buildroot] [PATCH v2] espeak : depends on MMU
Message-ID: <1407773031-12872-1-git-send-email-arnaud@intelibre.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Arnaud Aujon <arnaud@intelibre.fr>

Fixes http://autobuild.buildroot.net/results/dae/dae5c59dfa127e1c3f9e3885cdd1b97e54d8fe41/
and http://autobuild.buildroot.net/results/fa0/fa04a0fe7d7a201c5f733bd798c0da50ffb81271/
espeak uses fork(), don't work on non-MMU platforms

Signed-off-by: Arnaud Aujon <arnaud@intelibre.fr>
---
Changes v1 -> v2
  - Move comment to head of file

---
 package/espeak/Config.in | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/espeak/Config.in b/package/espeak/Config.in
index ec81893..e57f0c7 100644
--- a/package/espeak/Config.in
+++ b/package/espeak/Config.in
@@ -1,11 +1,13 @@
 comment "espeak needs a toolchain w/ C++, wchar, threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
+        depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
+        depends on BR2_USE_MMU
 
 config BR2_PACKAGE_ESPEAK
 	bool "espeak"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
 	help
 	  espeak is a speech synthesizer software for English and
 	  other languages.
@@ -26,14 +28,14 @@ config BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_ALSA
 	select BR2_PACKAGE_PORTAUDIO
 	select BR2_PACKAGE_PORTAUDIO_CXX
 
-comment "pulseaudio backend needs a toolchain with largefile"
-	depends on !BR2_LARGEFILE
-
 config BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_PULSEAUDIO
 	bool "pulseaudio"
 	select BR2_PACKAGE_PULSEAUDIO
 	depends on BR2_LARGEFILE # pulseaudio
 
+comment "pulseaudio backend needs a toolchain with largefile"
+        depends on !BR2_LARGEFILE
+
 endchoice
 
 endif # BR2_PACKAGE_ESPEAK
-- 
1.9.3
