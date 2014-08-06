From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Aug 2014 19:50:11 +0200
Subject: [Buildroot] [git commit] espeak: depends on threads
Message-ID: <20140806175035.370309D3C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d6ee2869efc977da84c0361ed440511a24746bb2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes autobuild failure : http://autobuild.buildroot.org/results/f39/f3903d2b4a16226df2d460dcd2e26c7fb87613ab

Signed-off-by: Arnaud Aujon <arnaud@intelibre.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/espeak/Config.in |   15 +++++----------
 1 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/package/espeak/Config.in b/package/espeak/Config.in
index 3e052d9..ec81893 100644
--- a/package/espeak/Config.in
+++ b/package/espeak/Config.in
@@ -1,10 +1,11 @@
-comment "espeak needs a toolchain w/ C++, wchar"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
+comment "espeak needs a toolchain w/ C++, wchar, threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
 
 config BR2_PACKAGE_ESPEAK
 	bool "espeak"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  espeak is a speech synthesizer software for English and
 	  other languages.
@@ -20,23 +21,17 @@ choice
 config BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_NONE
        bool "No sound backend, only produce wav files"
 
-comment "alsa backend needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
-
 config BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_ALSA
 	bool "alsa via portaudio"
 	select BR2_PACKAGE_PORTAUDIO
 	select BR2_PACKAGE_PORTAUDIO_CXX
-	depends on BR2_TOOLCHAIN_HAS_THREADS # portaudio
 
-comment "pulseaudio backend needs a toolchain w/ wchar, largefile, threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || !BR2_LARGEFILE
+comment "pulseaudio backend needs a toolchain with largefile"
+	depends on !BR2_LARGEFILE
 
 config BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_PULSEAUDIO
 	bool "pulseaudio"
 	select BR2_PACKAGE_PULSEAUDIO
-	depends on BR2_TOOLCHAIN_HAS_THREADS # pulseaudio
-	depends on BR2_USE_WCHAR # pulseaudio
 	depends on BR2_LARGEFILE # pulseaudio
 
 endchoice
