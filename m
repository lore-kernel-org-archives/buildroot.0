From: Arnaud Aujon <arnaud.aujon@gmail.com>
Date: Mon, 14 Oct 2013 21:01:33 +0200
Subject: [Buildroot]  [PATCH v7] espeak: new package
Message-ID: <1381777293-22979-1-git-send-email-arnaud.aujon@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnaud Aujon <arnaud.aujon@gmail.com>
---
Changes v6 -> v7:
	- remove comment fromm v5 again
Changes v5 -> v6:
        - fix indent
        - rename patch
        - fix licence to GPLv3+
Changes v4 -> v5:
        - remove useless comment line
Changes v3 -> v4:
        - remove extre new lines
        - remove useless help
        - remove -source from ESPEAK_VERSION
        - update extract command to remove -source
---
 package/Config.in                                  |  1 +
 package/espeak/Config.in                           | 41 +++++++++++++++++++++
 .../espeak-01-do-not-compil-when-install.patch     | 15 ++++++++
 package/espeak/espeak.mk                           | 43 ++++++++++++++++++++++
 4 files changed, 100 insertions(+)
 create mode 100644 package/espeak/Config.in
 create mode 100644 package/espeak/espeak-01-do-not-compil-when-install.patch
 create mode 100644 package/espeak/espeak.mk

diff --git a/package/Config.in b/package/Config.in
index 41d828a..31f6274 100644
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
index 0000000..09b4920
--- /dev/null
+++ b/package/espeak/Config.in
@@ -0,0 +1,41 @@
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
+if BR2_PACKAGE_ESPEAK
+choice
+prompt "choose audio backend"
+default BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_NONE
+
+config BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_NONE
+	bool "No sound backend, only produce wav files"
+
+comment "ALSA backend requires a toolchain with threads support"
+depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_ALSA
+	bool "ALSA via Portaudio"
+	select BR2_PACKAGE_PORTAUDIO
+	select BR2_PACKAGE_PORTAUDIO_CXX
+	depends on BR2_TOOLCHAIN_HAS_THREADS #portaudio
+
+comment "Pulseaudio backend requires a toolchain with WCHAR, LARGEFILE and threads support"
+depends on !(BR2_TOOLCHAIN_HAS_THREADS && BR2_USE_WCHAR && BR2_LARGEFILE)
+
+config BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_PULSEAUDIO
+	bool "pulseaudio"
+	select BR2_PACKAGE_PULSEAUDIO
+	depends on BR2_TOOLCHAIN_HAS_THREADS # pulseaudio
+	depends on BR2_USE_WCHAR # pulseaudio
+	depends on BR2_LARGEFILE # pulseaudio
+
+endchoice
+endif # BR2_PACKAGE_ESPEAK
diff --git a/package/espeak/espeak-01-do-not-compil-when-install.patch b/package/espeak/espeak-01-do-not-compil-when-install.patch
new file mode 100644
index 0000000..983cd1c
--- /dev/null
+++ b/package/espeak/espeak-01-do-not-compil-when-install.patch
@@ -0,0 +1,15 @@
+Makefile: do not execute the rule "all" when executing "install"
+
+signed-off-by: Arnaud Aujon <arnaud.aujon@gmail.com>
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
index 0000000..427784c
--- /dev/null
+++ b/package/espeak/espeak.mk
@@ -0,0 +1,43 @@
+###############################################################################
+#
+# espeak
+#
+###############################################################################
+
+ESPEAK_VERSION = 1.47.11
+ESPEAK_SOURCE = espeak-$(ESPEAK_VERSION)-source.zip
+ESPEAK_SITE = http://downloads.sourceforge.net/project/espeak/espeak/espeak-1.47
+ESPEAK_LICENSE = GPLv3+
+ESPEAK_LICENSE_FILES = Licence.txt
+
+ifeq ($(BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_ALSA),y)
+ESPEAK_AUDIO_BACKEND = portaudio
+ESPEAK_DEPENDENCIES = portaudio
+endif
+ifeq ($(BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_PULSEAUDIO),y)
+ESPEAK_AUDIO_BACKEND = pulseaudio
+ESPEAK_DEPENDENCIES = pulseaudio
+endif
+
+define ESPEAK_EXTRACT_CMDS
+	unzip -d $(@D) $(DL_DIR)/$(ESPEAK_SOURCE)
+	mv $(@D)/espeak-$(ESPEAK_VERSION)-source/* $(@D)
+	$(RM) -r $(@D)/espeak-$(ESPEAK_VERSION)-source
+endef
+
+define ESPEAK_CONFIGURE_CMDS
+	# Buildroot provides portaudio V19, see ReadMe file for more details.
+	cp $(@D)/src/portaudio19.h $(@D)/src/portaudio.h
+endef
+
+define ESPEAK_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		AUDIO="$(ESPEAK_AUDIO_BACKEND)" \
+		-C $(@D)/src all
+endef
+
+define ESPEAK_INSTALL_TARGET_CMDS
+	$(MAKE) install DESTDIR="$(TARGET_DIR)" -C $(@D)/src
+endef
+
+$(eval $(generic-package))
-- 
1.8.3.1
