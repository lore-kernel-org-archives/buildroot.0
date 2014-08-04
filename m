From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Aug 2014 22:40:45 +0200
Subject: [Buildroot] [git commit] espeak: new package
Message-ID: <20140804204104.191B79D3A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=10b6d10009c70262cfb492b2abaa3a091a8fb4aa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: minor formatting tweaks to the Config.in and .mk file.]

Signed-off-by: Arnaud Aujon <arnaud@intelibre.fr>
Tested-by: Marcelo Gutierrez <kuyurix@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 package/espeak/Config.in                           |   44 ++++++++++++++++++++
 .../espeak-01-do-not-compil-when-install.patch     |   15 +++++++
 package/espeak/espeak.mk                           |   43 +++++++++++++++++++
 4 files changed, 103 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 2f92c19..4520ba6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -6,6 +6,7 @@ menu "Audio and video applications"
 	source "package/alsa-utils/Config.in"
 	source "package/aumix/Config.in"
 	source "package/bellagio/Config.in"
+	source "package/espeak/Config.in"
 	source "package/faad2/Config.in"
 	source "package/ffmpeg/Config.in"
 	source "package/flac/Config.in"
diff --git a/package/espeak/Config.in b/package/espeak/Config.in
new file mode 100644
index 0000000..3e052d9
--- /dev/null
+++ b/package/espeak/Config.in
@@ -0,0 +1,44 @@
+comment "espeak needs a toolchain w/ C++, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
+
+config BR2_PACKAGE_ESPEAK
+	bool "espeak"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR
+	help
+	  espeak is a speech synthesizer software for English and
+	  other languages.
+
+	  http://espeak.sourceforge.net/
+
+if BR2_PACKAGE_ESPEAK
+
+choice
+	prompt "choose audio backend"
+	default BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_NONE
+
+config BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_NONE
+       bool "No sound backend, only produce wav files"
+
+comment "alsa backend needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_ALSA
+	bool "alsa via portaudio"
+	select BR2_PACKAGE_PORTAUDIO
+	select BR2_PACKAGE_PORTAUDIO_CXX
+	depends on BR2_TOOLCHAIN_HAS_THREADS # portaudio
+
+comment "pulseaudio backend needs a toolchain w/ wchar, largefile, threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || !BR2_LARGEFILE
+
+config BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_PULSEAUDIO
+	bool "pulseaudio"
+	select BR2_PACKAGE_PULSEAUDIO
+	depends on BR2_TOOLCHAIN_HAS_THREADS # pulseaudio
+	depends on BR2_USE_WCHAR # pulseaudio
+	depends on BR2_LARGEFILE # pulseaudio
+
+endchoice
+
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
index 0000000..571b730
--- /dev/null
+++ b/package/espeak/espeak.mk
@@ -0,0 +1,43 @@
+###############################################################################
+#
+# espeak
+#
+###############################################################################
+
+ESPEAK_VERSION_MAJOR = 1.47
+ESPEAK_VERSION = $(ESPEAK_VERSION_MAJOR).11
+ESPEAK_SOURCE = espeak-$(ESPEAK_VERSION)-source.zip
+ESPEAK_SITE = http://downloads.sourceforge.net/project/espeak/espeak/espeak-$(ESPEAK_VERSION_MAJOR)
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
+	$(MAKE) -C $(@D)/src  $(TARGET_CONFIGURE_OPTS) \
+		AUDIO="$(ESPEAK_AUDIO_BACKEND)" all
+endef
+
+define ESPEAK_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D)/src DESTDIR="$(TARGET_DIR)" install
+endef
+
+$(eval $(generic-package))
