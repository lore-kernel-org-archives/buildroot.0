From: arnaud.aujon at gmail.com <arnaud.aujon@gmail.com>
Date: Tue,  8 Oct 2013 12:28:09 +0200
Subject: [Buildroot] [PATCH v2] Add new package espeak,
	a speech synthesizer software
Message-ID: <1381228089-3151-1-git-send-email-arnaud.aujon@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Arnaud Aujon <arnaud.aujon@gmail.com>

Signed-off-by: Arnaud Aujon <arnaud.aujon@gmail.com>
---
 package/Config.in                                  |  1 +
 package/espeak/Config.in                           | 53 ++++++++++++++++++++++
 .../espeak-1-do-not-compil-when-install.patch      | 15 ++++++
 package/espeak/espeak.mk                           | 41 +++++++++++++++++
 4 files changed, 110 insertions(+)
 create mode 100644 package/espeak/Config.in
 create mode 100644 package/espeak/espeak-1-do-not-compil-when-install.patch
 create mode 100644 package/espeak/espeak.mk

diff --git a/package/Config.in b/package/Config.in
index 424e40d..b5f411f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -6,6 +6,7 @@ menu "Audio and video applications"
 source "package/alsa-utils/Config.in"
 source "package/aumix/Config.in"
 source "package/bellagio/Config.in"
+source "package/espeak/Config.in"
 source "package/faad2/Config.in"
 source "package/ffmpeg/Config.in"
 source "package/flac/Config.in"
diff --git a/package/espeak/Config.in b/package/espeak/Config.in
new file mode 100644
index 0000000..5fd1715
--- /dev/null
+++ b/package/espeak/Config.in
@@ -0,0 +1,53 @@
+comment "eSpeak requires a toolchain with C++ and WCHAR support"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR)
+
+config BR2_PACKAGE_ESPEAK
+	bool "eSpeak"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR
+	help
+	  eSpeak is a speech synthesizer software for English and other languages.
+
+	  http://espeak.sourceforge.net/
+
+
+
+if BR2_PACKAGE_ESPEAK
+
+config BR2_PACKAGE_ESPEAK_SOUND
+	bool
+choice
+	prompt "choose audio backend"
+	default BR2_PACKAGE_ESPEAK_SOUND_NOSOUND
+	help
+	  Select the audio backend you want to use
+
+	config BR2_PACKAGE_ESPEAK_SOUND_NOSOUND
+		bool "No sound backend, only produce wav files"
+
+	comment "ALSA backend requires a toolchain with threads support"
+	depends on !(BR2_TOOLCHAIN_HAS_THREADS)
+
+	config BR2_PACKAGE_ESPEAK_SOUND_ALSA
+		bool "Portaudio and ALSA"
+		select BR2_PACKAGE_PORTAUDIO
+		select BR2_PACKAGE_PORTAUDIO_CXX
+		depends on BR2_TOOLCHAIN_HAS_THREADS #portaudio
+		help
+		  Allow eSpeak to output sound using ALSA
+
+	comment "Pulseaudio backend requires a toolchain with WCHAR, LARGEFILE and threads support"
+	depends on !(BR2_TOOLCHAIN_HAS_THREADS && BR2_USE_WCHAR && BR2_LARGEFILE)
+
+	config BR2_PACKAGE_ESPEAK_SOUND_PULSEAUDIO
+		bool "pulseaudio"
+		select BR2_PACKAGE_PULSEAUDIO
+		depends on BR2_TOOLCHAIN_HAS_THREADS # pulseaudio
+		depends on BR2_USE_WCHAR # pulseaudio
+		depends on BR2_LARGEFILE # pulseaudio
+		help
+		  Allow eSpeak to output sound using Pulseaudio
+
+
+endchoice
+endif #BR2_PACKAGE_ESPEAK
diff --git a/package/espeak/espeak-1-do-not-compil-when-install.patch b/package/espeak/espeak-1-do-not-compil-when-install.patch
new file mode 100644
index 0000000..744af62
--- /dev/null
+++ b/package/espeak/espeak-1-do-not-compil-when-install.patch
@@ -0,0 +1,15 @@
+Index: espeak-1.47.11-source/src/Makefile
+Makefile: do not executethe rule "all" when executing "install"
+signed-off-by Arnaud Aujon <arnaud.aujon@gmail.com>
+===================================================================
+--- espeak-1.47.11-source.orig/src/Makefile
++++ espeak-1.47.11-source/src/Makefile
+@@ -131,7 +131,7 @@
+ 	rm -f $(BIN2_NAME)
+ 	rm -f $(LIB_NAME)*
+ 
+-install: all
++install:
+ 	# Create directories
+ 	rm -rf $(DESTDIR)$(DATADIR)
+ 	$(MKDIR) $(DESTDIR)$(BINDIR)
diff --git a/package/espeak/espeak.mk b/package/espeak/espeak.mk
new file mode 100644
index 0000000..47ecc0a
--- /dev/null
+++ b/package/espeak/espeak.mk
@@ -0,0 +1,41 @@
+###############################################################################
+#
+# eSpeak
+#
+################################################################################
+ESPEAK_VERSION = 1.47.11-source
+ESPEAK_SOURCE = espeak-$(ESPEAK_VERSION).zip
+ESPEAK_SITE = http://sourceforge.net/projects/espeak/files/espeak/espeak-1.47
+ESPEAK_LICENSE = GPLv3
+ESPEAK_LICENSE_FILES = Licence.txt
+
+ifeq ($(BR2_PACKAGE_ESPEAK_SOUND_ALSA), y)
+AUDIO = portaudio
+ESPEAK_DEPENDENCIES = portaudio
+endif
+ifeq ($(BR2_PACKAGE_ESPEAK_SOUND_PULSEAUDIO), y)
+AUDIO = pulseaudio
+ESPEAK_DEPENDENCIES = pulseaudio
+endif
+ifeq ($(BR2_PACKAGE_ESPEAK_SOUND_NOSOUND), y)
+AUDIO =
+endif
+
+define ESPEAK_EXTRACT_CMDS
+	unzip $(DL_DIR)/$(ESPEAK_SOURCE) -d $(BUILD_DIR)
+endef
+
+define ESPEAK_CONFIGURE_CMDS
+	# next command is required because buildroot provides portaudio V19, this is explained in package ReadMe file.
+	cp $(@D)/src/portaudio19.h $(@D)/src/portaudio.h
+endef
+
+define ESPEAK_BUILD_CMDS
+	$(MAKE) CXX="$(TARGET_CXX)" LD="$(TARGET_LD)" AUDIO="$(AUDIO)" -C $(@D)/src all
+endef
+
+define ESPEAK_INSTALL_TARGET_CMDS
+	$(MAKE) install DESTDIR="$(TARGET_DIR)" -C $(@D)/src
+endef
+
+$(eval $(generic-package))
-- 
1.8.3.1
