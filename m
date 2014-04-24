From: Martin Bark <martin@barkynet.com>
Date: Thu, 24 Apr 2014 22:19:44 +0100
Subject: [Buildroot] [PATCH 3/3] alsaequal: new package
In-Reply-To: <1398374384-8814-1-git-send-email-martin@barkynet.com>
References: <1398374384-8814-1-git-send-email-martin@barkynet.com>
Message-ID: <1398374384-8814-3-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alsaequal is a real-time adjustable equalizer plugin for ALSA. It
can be adjusted using an ALSA compatible mixer, like alsamixergui
or alsamixer.

Alsaequal uses the Eq CAPS LADSPA Plugin as it's default
equalizer.

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/Config.in                                  |    1 +
 package/alsaequal/Config.in                        |   19 ++++++
 .../alsaequal/alsaequal-01-cross-compile-fix.patch |   17 ++++++
 package/alsaequal/alsaequal-05_fix-eq-name.patch   |   63 ++++++++++++++++++++
 .../alsaequal/alsaequal-06_fix-caps-error.patch    |   20 +++++++
 package/alsaequal/alsaequal.mk                     |   22 +++++++
 package/alsaequal/readme.txt                       |   59 ++++++++++++++++++
 7 files changed, 201 insertions(+)
 create mode 100644 package/alsaequal/Config.in
 create mode 100644 package/alsaequal/alsaequal-01-cross-compile-fix.patch
 create mode 100644 package/alsaequal/alsaequal-05_fix-eq-name.patch
 create mode 100644 package/alsaequal/alsaequal-06_fix-caps-error.patch
 create mode 100644 package/alsaequal/alsaequal.mk
 create mode 100644 package/alsaequal/readme.txt

diff --git a/package/Config.in b/package/Config.in
index 33d16ac..4f0d61c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -489,6 +489,7 @@ endmenu
 menu "Libraries"
 
 menu "Audio/Sound"
+source "package/alsaequal/Config.in"
 source "package/alsa-lib/Config.in"
 source "package/audiofile/Config.in"
 source "package/caps/Config.in"
diff --git a/package/alsaequal/Config.in b/package/alsaequal/Config.in
new file mode 100644
index 0000000..857e4d0
--- /dev/null
+++ b/package/alsaequal/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_ALSAEQUAL
+	bool "alsaequal"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
+	select BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_CAPS # Runtime dependency
+	help
+	  Alsaequal is a real-time adjustable equalizer plugin for ALSA. It
+	  can be adjusted using an ALSA compatible mixer, like alsamixergui
+	  or alsamixer.
+
+	  Alsaequal uses the Eq CAPS LADSPA Plugin as it's default
+	  equalizer.
+
+	  http://www.thedigitalmachine.net/alsaequal.html
+
+comment "alsaequal needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
diff --git a/package/alsaequal/alsaequal-01-cross-compile-fix.patch b/package/alsaequal/alsaequal-01-cross-compile-fix.patch
new file mode 100644
index 0000000..6133106
--- /dev/null
+++ b/package/alsaequal/alsaequal-01-cross-compile-fix.patch
@@ -0,0 +1,17 @@
+--- alsaequal-0.6.original/Makefile	2010-03-05 17:30:39.000000000 +0000
++++ alsaequal-0.6/Makefile	2014-04-24 16:25:59.468030181 +0100
+@@ -4,10 +4,10 @@
+ #Q	?=
+ 
+ # Build Tools
+-CC 	:= gcc
+-CFLAGS := -I. -O2 -Wall -funroll-loops -ffast-math -fPIC -DPIC
+-LD := gcc
+-LDFLAGS := -O2 -Wall -shared -lasound
++CC 	?= gcc
++CFLAGS += -I. -Wall -ffast-math -fPIC -DPIC
++LD := $(CC)
++LDFLAGS := -shared -lasound
+ 
+ SND_PCM_OBJECTS = pcm_equal.o ladspa_utils.o
+ SND_PCM_LIBS =
diff --git a/package/alsaequal/alsaequal-05_fix-eq-name.patch b/package/alsaequal/alsaequal-05_fix-eq-name.patch
new file mode 100644
index 0000000..7317214
--- /dev/null
+++ b/package/alsaequal/alsaequal-05_fix-eq-name.patch
@@ -0,0 +1,63 @@
+Description: Fix CAPS Eq plugin name
+Origin: vendor
+Bug-Debian: http://bugs.debian.org/721355
+Forwarded: no
+Author: Alessandro Ghedini <ghedo@debian.org>
+Last-Update: 2013-08-30
+
+--- a/ctl_equal.c
++++ b/ctl_equal.c
+@@ -167,7 +167,7 @@
+ 	snd_ctl_equal_t *equal;
+ 	const char *controls = ".alsaequal.bin";
+ 	const char *library = "/usr/lib/ladspa/caps.so";
+-	const char *module = "Eq";
++	const char *module = "Eq10";
+ 	long channels = 2;
+ 	const char *sufix = " Playback Volume";
+ 	int err, i, index;
+--- a/pcm_equal.c
++++ b/pcm_equal.c
+@@ -151,7 +151,7 @@
+ 	snd_config_t *sconf = NULL;
+ 	const char *controls = ".alsaequal.bin";
+ 	const char *library = "/usr/lib/ladspa/caps.so";
+-	const char *module = "Eq";
++	const char *module = "Eq10";
+ 	long channels = 2;
+ 	int err;
+ 	
+--- a/README
++++ b/README
+@@ -1,11 +1,11 @@
+ Alsaequal is a real-time adjustable equalizer plugin for ALSA. It can
+ be adjusted using any ALSA compatible mixer, e.g. alsamixergui.
+ 
+-Alsaequal uses the Eq CAPS LADSPA Plugin for audio processing, actually
++Alsaequal uses the Eq10 CAPS LADSPA Plugin for audio processing, actually
+ alsaequal is a generic LADSPA plugin interface with real-time access to
+ the LADSPA controls (the LADSPA plugin included with alsa doesn't allow
+ for real-time controls) but it was developed for and only tested with
+-Eq CAPS LADSPA plugin. You are welcome to try it with other plugins, it
++Eq10 CAPS LADSPA plugin. You are welcome to try it with other plugins, it
+ may work. Let me know how it goes, you can reach me at
+ <charles@thedigitalmachine.net>.
+ 
+@@ -66,7 +66,7 @@
+ 	library -- location of the LADSPA library, the default is
+ 					"/usr/lib/ladspa/caps.so"
+ 	module -- module name within the LADSPA library, the deafault
+-					is "Eq"
++					is "Eq10"
+ 	channels -- number of channels, the default is 2
+ }
+ 
+@@ -81,7 +81,7 @@
+ 	library -- location of the LADSPA library, the default is
+ 					"/usr/lib/ladspa/caps.so"
+ 	module -- module name within the LADSPA library, the deafault
+-					is "Eq"
++					is "Eq10"
+ 	channels -- number of channels, the default is 2
+ }
+ 
diff --git a/package/alsaequal/alsaequal-06_fix-caps-error.patch b/package/alsaequal/alsaequal-06_fix-caps-error.patch
new file mode 100644
index 0000000..85e205f
--- /dev/null
+++ b/package/alsaequal/alsaequal-06_fix-caps-error.patch
@@ -0,0 +1,20 @@
+Description: Fix a spurious error with newer caps versions
+Origin: vendor, https://aur.archlinux.org/packages/alsaequal/?comments=all
+Forwarded: no
+Author: Alessandro Ghedini <ghedo@debian.org>
+Last-Update: 2013-08-30
+Applied-Upstream: *** FIXME ***
+
+--- a/ctl_equal.c
++++ b/ctl_equal.c
+@@ -263,8 +263,8 @@
+ 	for(i = 0; i < equal->num_input_controls; i++) {
+ 		if(equal->control_data->control[i].type == LADSPA_CNTRL_INPUT) {
+ 			index = equal->control_data->control[i].index;
+-			if(equal->klass->PortDescriptors[index] !=
+-					(LADSPA_PORT_INPUT | LADSPA_PORT_CONTROL)) {
++			if((equal->klass->PortDescriptors[index] &
++					(LADSPA_PORT_INPUT | LADSPA_PORT_CONTROL)) == 0) {
+ 				SNDERR("Problem with control file %s, %d.", controls, index);
+ 				return -1;
+ 			}
diff --git a/package/alsaequal/alsaequal.mk b/package/alsaequal/alsaequal.mk
new file mode 100644
index 0000000..5669b55
--- /dev/null
+++ b/package/alsaequal/alsaequal.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# alsaequal
+#
+################################################################################
+
+ALSAEQUAL_VERSION = 0.6
+ALSAEQUAL_SOURCE = alsaequal-$(ALSAEQUAL_VERSION).tar.bz2
+ALSAEQUAL_SITE = http://www.thedigitalmachine.net/tools/
+ALSAEQUAL_LICENSE = LGPLv2.1
+ALSAEQUAL_LICENSE_FILES = COPYING
+ALSAEQUAL_DEPENDENCIES = alsa-lib
+
+define ALSAEQUAL_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) all
+endef
+
+define ALSAEQUAL_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) install DESTDIR=$(TARGET_DIR)
+endef
+
+$(eval $(generic-package))
diff --git a/package/alsaequal/readme.txt b/package/alsaequal/readme.txt
new file mode 100644
index 0000000..579706d
--- /dev/null
+++ b/package/alsaequal/readme.txt
@@ -0,0 +1,59 @@
+
+Alsaequal is a real-time adjustable equalizer plugin for ALSA. It
+can be adjusted using an ALSA compatible mixer, like alsamixergui
+or alsamixer.
+
+For example, add the following line to /etc/asound.conf
+
+ctl.equal {
+    type equal;
+}
+
+pcm.plugequal {
+    type equal;
+    slave.pcm "plughw:0,0";
+}
+
+pcm.equal{
+    type plug;
+    slave.pcm plugequal;
+}
+
+you can now adjust the 10 band equaliser using
+
+    alsamixer -D equal
+
+and then play using
+
+    aplay -D equal some_audio.wav
+
+By default alsaequal uses the 10 band equaliser (Eq10) from the alsa
+ladspa plugin caps.  You can bypass alsaequal and directly use caps in
+/etc/asound.conf. This can be useful if you want to fix the equaliser
+settings.
+
+Add the following lines to /etc/asound.conf to add a fixed 10 band
+equaliser setup to attenuate frequencies below 500Hz
+
+pcm.plugequal_fixed {
+    type equal;
+    slave.pcm "plughw:0,0";
+}
+
+pcm.equal_fixed {
+    type ladspa
+    slave.pcm plugequal_fixed;
+    path "/usr/lib/ladspa";
+    plugins [{
+        label Eq10
+        input {
+            # bands (Hz)   31   63   125  250  500  1000 2000 4000 8000 16000
+            controls     [ -48  -48  -48  -48  -48  0    0    0    0    0     ]
+        }
+    }]
+}
+
+
+Further reading:
+    http://alsa.opensrc.org/Ladspa_(plugin)
+    http://quitte.de/dsp/caps.html#Eq10
-- 
1.7.9.5
