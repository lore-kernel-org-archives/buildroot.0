From: Julien Olivain <juju@cotds.org>
Date: Mon,  9 Dec 2019 21:03:24 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/fluidsynth: new package
In-Reply-To: <20191205203336.27806-1-juju@cotds.org>
References: <20191205203336.27806-1-juju@cotds.org>
Message-ID: <20191209200324.11065-1-juju@cotds.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

FluidSynth is a real-time software synthesizer based on the
SoundFont 2 specifications and has reached widespread
distribution. FluidSynth itself does not have a graphical
user interface, but due to its powerful API several
applications utilize it and it has even found its way onto
embedded systems and is used in some mobile apps.

http://www.fluidsynth.org/

Signed-off-by: Julien Olivain <juju@cotds.org>
---
Changes v1 -> v2:
Included all Gilles' comments:
  - Add comments for dependencies
  - Clarified "float" option
  - Removed useless "thread" option
  - Add LICENSE file hash
  - Removed "v" in VERSION
  - Fixed LICENSE to LGPL-2.1+

---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/fluidsynth/Config.in       | 91 ++++++++++++++++++++++++++++++
 package/fluidsynth/fluidsynth.hash |  3 +
 package/fluidsynth/fluidsynth.mk   | 68 ++++++++++++++++++++++
 5 files changed, 164 insertions(+)
 create mode 100644 package/fluidsynth/Config.in
 create mode 100644 package/fluidsynth/fluidsynth.hash
 create mode 100644 package/fluidsynth/fluidsynth.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 61bcd99d43..d0cfec3bac 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1352,6 +1352,7 @@ F:	board/technexion/imx8mmpico/
 F:	board/technexion/imx8mpico/
 F:	configs/imx8mmpico_defconfig
 F:	configs/imx8mpico_defconfig
+F:	package/fluidsynth/
 
 N:	Julien Viard de Galbert <julien@vdg.name>
 F:	package/dieharder/
diff --git a/package/Config.in b/package/Config.in
index 307583d01f..962d2f2612 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -23,6 +23,7 @@ menu "Audio and video applications"
 	source "package/ffmpeg/Config.in"
 	source "package/flac/Config.in"
 	source "package/flite/Config.in"
+	source "package/fluidsynth/Config.in"
 	source "package/gmrender-resurrect/Config.in"
 	source "package/gstreamer/Config.in"
 	source "package/gstreamer1/Config.in"
diff --git a/package/fluidsynth/Config.in b/package/fluidsynth/Config.in
new file mode 100644
index 0000000000..6e319a80bb
--- /dev/null
+++ b/package/fluidsynth/Config.in
@@ -0,0 +1,91 @@
+config BR2_PACKAGE_FLUIDSYNTH
+	bool "fluidsynth"
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  FluidSynth is a real-time software synthesizer based on the
+	  SoundFont 2 specifications and has reached widespread
+	  distribution. FluidSynth itself does not have a graphical
+	  user interface, but due to its powerful API several
+	  applications utilize it and it has even found its way onto
+	  embedded systems and is used in some mobile apps.
+
+	  http://www.fluidsynth.org/
+
+if BR2_PACKAGE_FLUIDSYNTH
+
+comment "Output support"
+
+config BR2_PACKAGE_FLUIDSYNTH_ALSA_LIB
+	bool "alsa"
+	default y
+	select BR2_PACKAGE_ALSA_LIB
+	help
+	  Enable alsa support.
+
+config BR2_PACKAGE_FLUIDSYNTH_JACK2
+	bool "jack2"
+	# See: https://sourceware.org/bugzilla/show_bug.cgi?id=19908
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
+	depends on !BR2_STATIC_LIBS # jack2
+	depends on BR2_INSTALL_LIBSTDCPP # jack2
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # jack2
+	select BR2_PACKAGE_JACK2
+	help
+	  Enable jack support.
+
+comment "jack support needs a toolchain w/ dynamic library"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_STATIC_LIBS
+
+config BR2_PACKAGE_FLUIDSYNTH_LIBSNDFILE
+	bool "libsndfile"
+	select BR2_PACKAGE_LIBSNDFILE
+	help
+	  Enable libsndfile support, for writing output to WAV files.
+
+config BR2_PACKAGE_FLUIDSYNTH_PORTAUDIO
+	bool "portaudio"
+	select BR2_PACKAGE_PORTAUDIO
+	help
+	  Enable portaudio support.
+
+config BR2_PACKAGE_FLUIDSYNTH_PULSEAUDIO
+	bool "pulseaudio"
+	# See: https://sourceware.org/bugzilla/show_bug.cgi?id=19908
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
+	depends on !BR2_STATIC_LIBS # pulseaudio
+	select BR2_PACKAGE_PULSEAUDIO
+	help
+	  Enable PulseAudio support.
+
+comment "pulseaudio support needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
+comment "Misc options"
+
+config BR2_PACKAGE_FLUIDSYNTH_DBUS
+	bool "dbus"
+	select BR2_PACKAGE_DBUS
+	help
+	  Enable dbus support.
+
+config BR2_PACKAGE_FLUIDSYNTH_FLOATS
+	bool "32-bit single precision float"
+	help
+	  Enable 32-bit single precision float support, instead of
+	  64-bit double precision floats for DSP samples.
+
+config BR2_PACKAGE_FLUIDSYNTH_READLINE
+	bool "readline"
+	select BR2_PACKAGE_READLINE
+	help
+	  Enable readline support, for better line editing in FluidSynth
+	  shell.
+
+endif # BR2_PACKAGE_FLUIDSYNTH
+
+comment "fluidsynth needs a toolchain w/ threads, wchar"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/fluidsynth/fluidsynth.hash b/package/fluidsynth/fluidsynth.hash
new file mode 100644
index 0000000000..5c5c226cbc
--- /dev/null
+++ b/package/fluidsynth/fluidsynth.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 526addc6d8445035840d3af7282d3ba89567df209d28e183da04a1a877da2da3  fluidsynth-2.1.0.tar.gz
+sha256 9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  LICENSE
diff --git a/package/fluidsynth/fluidsynth.mk b/package/fluidsynth/fluidsynth.mk
new file mode 100644
index 0000000000..4ef0a6f40d
--- /dev/null
+++ b/package/fluidsynth/fluidsynth.mk
@@ -0,0 +1,68 @@
+################################################################################
+#
+# fluidsynth
+#
+################################################################################
+
+FLUIDSYNTH_VERSION = 2.1.0
+FLUIDSYNTH_SITE = $(call github,FluidSynth,fluidsynth,v$(FLUIDSYNTH_VERSION))
+FLUIDSYNTH_LICENSE = LGPL-2.1+
+FLUIDSYNTH_LICENSE_FILES = LICENSE
+FLUIDSYNTH_DEPENDENCIES = libglib2
+
+ifeq ($(BR2_PACKAGE_FLUIDSYNTH_ALSA_LIB),y)
+FLUIDSYNTH_CONF_OPTS += -Denable-alsa=1
+FLUIDSYNTH_DEPENDENCIES += alsa-lib
+else
+FLUIDSYNTH_CONF_OPTS += -Denable-alsa=0
+endif
+
+ifeq ($(BR2_PACKAGE_FLUIDSYNTH_DBUS),y)
+FLUIDSYNTH_CONF_OPTS += -Denable-dbus=1
+FLUIDSYNTH_DEPENDENCIES += dbus
+else
+FLUIDSYNTH_CONF_OPTS += -Denable-dbus=0
+endif
+
+ifeq ($(BR2_PACKAGE_FLUIDSYNTH_FLOATS),y)
+FLUIDSYNTH_CONF_OPTS += -Denable-floats=1
+else
+FLUIDSYNTH_CONF_OPTS += -Denable-floats=0
+endif
+
+ifeq ($(BR2_PACKAGE_FLUIDSYNTH_JACK2),y)
+FLUIDSYNTH_CONF_OPTS += -Denable-jack=1
+FLUIDSYNTH_DEPENDENCIES += jack2
+else
+FLUIDSYNTH_CONF_OPTS += -Denable-jack=0
+endif
+
+ifeq ($(BR2_PACKAGE_FLUIDSYNTH_LIBSNDFILE),y)
+FLUIDSYNTH_CONF_OPTS += -Denable-libsndfile=1
+FLUIDSYNTH_DEPENDENCIES += libsndfile
+else
+FLUIDSYNTH_CONF_OPTS += -Denable-libsndfile=0
+endif
+
+ifeq ($(BR2_PACKAGE_FLUIDSYNTH_PORTAUDIO),y)
+FLUIDSYNTH_CONF_OPTS += -Denable-portaudio=1
+FLUIDSYNTH_DEPENDENCIES += portaudio
+else
+FLUIDSYNTH_CONF_OPTS += -Denable-portaudio=0
+endif
+
+ifeq ($(BR2_PACKAGE_FLUIDSYNTH_PULSEAUDIO),y)
+FLUIDSYNTH_CONF_OPTS += -Denable-pulseaudio=1
+FLUIDSYNTH_DEPENDENCIES += pulseaudio
+else
+FLUIDSYNTH_CONF_OPTS += -Denable-pulseaudio=0
+endif
+
+ifeq ($(BR2_PACKAGE_FLUIDSYNTH_READLINE),y)
+FLUIDSYNTH_CONF_OPTS += -Denable-readline=1
+FLUIDSYNTH_DEPENDENCIES += readline
+else
+FLUIDSYNTH_CONF_OPTS += -Denable-readline=0
+endif
+
+$(eval $(cmake-package))
-- 
2.23.0
