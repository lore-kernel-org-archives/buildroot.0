From: arnaud at intelibre.fr <arnaud@intelibre.fr>
Date: Tue,  5 Aug 2014 12:08:24 +0200
Subject: [Buildroot] [PATCH 1/1] espeak: bump to version 1.48.04 + depends
	on threads
Message-ID: <1407233304-19400-1-git-send-email-arnaud@intelibre.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Arnaud Aujon <arnaud@intelibre.fr>

* Bump to new upstream version 1.48.04
* Add depends on threads, fixes autobuild failure :
 http://autobuild.buildroot.org/results/f39/f3903d2b4a16226df2d460dcd2e26c7fb87613ab

Signed-off-by: Arnaud Aujon <arnaud@intelibre.fr>
---
 package/espeak/Config.in                                  | 15 +++++----------
 package/espeak/espeak-01-do-not-compil-when-install.patch |  4 ++--
 package/espeak/espeak.mk                                  |  4 ++--
 3 files changed, 9 insertions(+), 14 deletions(-)

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
diff --git a/package/espeak/espeak-01-do-not-compil-when-install.patch b/package/espeak/espeak-01-do-not-compil-when-install.patch
index 983cd1c..ab75e4e 100644
--- a/package/espeak/espeak-01-do-not-compil-when-install.patch
+++ b/package/espeak/espeak-01-do-not-compil-when-install.patch
@@ -2,8 +2,8 @@ Makefile: do not execute the rule "all" when executing "install"
 
 signed-off-by: Arnaud Aujon <arnaud@intelibre.fr>
 ===================================================================
---- espeak-1.47.11-source.orig/src/Makefile
-+++ espeak-1.47.11-source/src/Makefile
+--- espeak-1.48.04-source.orig/src/Makefile
++++ espeak-1.48.04-source/src/Makefile
 @@ -131,7 +131,7 @@
  	rm -f $(BIN2_NAME)
  	rm -f $(LIB_NAME)*
diff --git a/package/espeak/espeak.mk b/package/espeak/espeak.mk
index 571b730..9c32752 100644
--- a/package/espeak/espeak.mk
+++ b/package/espeak/espeak.mk
@@ -4,8 +4,8 @@
 #
 ###############################################################################
 
-ESPEAK_VERSION_MAJOR = 1.47
-ESPEAK_VERSION = $(ESPEAK_VERSION_MAJOR).11
+ESPEAK_VERSION_MAJOR = 1.48
+ESPEAK_VERSION = $(ESPEAK_VERSION_MAJOR).04
 ESPEAK_SOURCE = espeak-$(ESPEAK_VERSION)-source.zip
 ESPEAK_SITE = http://downloads.sourceforge.net/project/espeak/espeak/espeak-$(ESPEAK_VERSION_MAJOR)
 ESPEAK_LICENSE = GPLv3+
-- 
1.9.3
