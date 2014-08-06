From: Martin Bark <martin@barkynet.com>
Date: Wed,  6 Aug 2014 01:02:07 +0100
Subject: [Buildroot] [v2 2/2] alsaequal: new package
In-Reply-To: <1407283327-5150-1-git-send-email-martin@barkynet.com>
References: <1407283327-5150-1-git-send-email-martin@barkynet.com>
Message-ID: <1407283327-5150-2-git-send-email-martin@barkynet.com>
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
CC: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---

Changes v1 -> v2:
  - Add description and Signed-off-by to patch files (Thomas Petazzoni)
  - Fixed use of $(TARGET_CONFIGURE_OPTS) and $(TARGET_MAKE_ENV) (Thomas Petazzoni)Petazzoni)

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/Config.in                                  |  1 +
 package/alsaequal/Config.in                        | 18 +++++
 .../alsaequal-01-fix-cross-compilation.patch       | 49 ++++++++++++
 package/alsaequal/alsaequal-02-fix-eq-name.patch   | 86 ++++++++++++++++++++++
 .../alsaequal/alsaequal-03-fix-caps-error.patch    | 37 ++++++++++
 package/alsaequal/alsaequal.mk                     | 24 ++++++
 package/alsaequal/readme.txt                       | 59 +++++++++++++++
 7 files changed, 274 insertions(+)
 create mode 100644 package/alsaequal/Config.in
 create mode 100644 package/alsaequal/alsaequal-01-fix-cross-compilation.patch
 create mode 100644 package/alsaequal/alsaequal-02-fix-eq-name.patch
 create mode 100644 package/alsaequal/alsaequal-03-fix-caps-error.patch
 create mode 100644 package/alsaequal/alsaequal.mk
 create mode 100644 package/alsaequal/readme.txt

diff --git a/package/Config.in b/package/Config.in
index 1a20bee..a84895b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -523,6 +523,7 @@ endmenu
 menu "Libraries"
 
 menu "Audio/Sound"
+	source "package/alsaequal/Config.in"
 	source "package/alsa-lib/Config.in"
 	source "package/audiofile/Config.in"
 	source "package/caps/Config.in"
diff --git a/package/alsaequal/Config.in b/package/alsaequal/Config.in
new file mode 100644
index 0000000..48bfa2b
--- /dev/null
+++ b/package/alsaequal/Config.in
@@ -0,0 +1,18 @@
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
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/alsaequal/alsaequal-01-fix-cross-compilation.patch b/package/alsaequal/alsaequal-01-fix-cross-compilation.patch
new file mode 100644
index 0000000..eee3aa0
--- /dev/null
+++ b/package/alsaequal/alsaequal-01-fix-cross-compilation.patch
@@ -0,0 +1,49 @@
+From bde241492b2b19015980a5097dbcfa2ef4480033 Mon Sep 17 00:00:00 2001
+From: Martin Bark <martin@barkynet.com>
+Date: Tue, 5 Aug 2014 22:21:59 +0100
+Subject: [PATCH 1/3] Fix cross compilation
+
+Update Makefile to allow setting CC, remove unnecessary flags from CFLAGS
+and LDFLAGS and set LD equal to CC.
+
+Signed-off-by: Martin Bark <martin@barkynet.com>
+---
+ Makefile | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 3b2aa7d..5eb5476 100644
+--- a/Makefile
++++ b/Makefile
+@@ -4,10 +4,10 @@ Q	?= @
+ #Q	?=
+ 
+ # Build Tools
+-CC 	:= gcc
+-CFLAGS := -I. -O2 -Wall -funroll-loops -ffast-math -fPIC -DPIC
+-LD := gcc
+-LDFLAGS := -O2 -Wall -shared -lasound
++CC 	?= gcc
++override CFLAGS += -I. -fPIC -DPIC
++LD := $(CC)
++override LDFLAGS := -shared -lasound
+ 
+ SND_PCM_OBJECTS = pcm_equal.o ladspa_utils.o
+ SND_PCM_LIBS =
+@@ -29,11 +29,11 @@ dep:
+ 
+ $(SND_PCM_BIN): $(SND_PCM_OBJECTS)
+ 	@echo LD $@
+-	$(Q)$(LD) $(LDFLAGS) $(SND_PCM_LIBS) $(SND_PCM_OBJECTS) -o $(SND_PCM_BIN)
++	$(Q)$(CC) $(LDFLAGS) $(SND_PCM_LIBS) $(SND_PCM_OBJECTS) -o $(SND_PCM_BIN)
+ 
+ $(SND_CTL_BIN): $(SND_CTL_OBJECTS)
+ 	@echo LD $@
+-	$(Q)$(LD) $(LDFLAGS) $(SND_CTL_LIBS) $(SND_CTL_OBJECTS) -o $(SND_CTL_BIN)
++	$(Q)$(CC) $(LDFLAGS) $(SND_CTL_LIBS) $(SND_CTL_OBJECTS) -o $(SND_CTL_BIN)
+ 
+ %.o: %.c
+ 	@echo GCC $<
+-- 
+1.9.1
+
diff --git a/package/alsaequal/alsaequal-02-fix-eq-name.patch b/package/alsaequal/alsaequal-02-fix-eq-name.patch
new file mode 100644
index 0000000..bb7cad5
--- /dev/null
+++ b/package/alsaequal/alsaequal-02-fix-eq-name.patch
@@ -0,0 +1,86 @@
+From f8804ccbfd5c7192826fbbb3e55e92bd1b4e112f Mon Sep 17 00:00:00 2001
+From: Martin Bark <martin@barkynet.com>
+Date: Tue, 5 Aug 2014 22:25:38 +0100
+Subject: [PATCH 2/3] Fix eq name
+
+Fix CAPS Eq plugin name. Fix from debian/patches/05_fix-eq-name.patch.
+
+Description: Fix CAPS Eq plugin name
+Origin: vendor
+Bug-Debian: http://bugs.debian.org/721355
+Forwarded: no
+Author: Alessandro Ghedini <ghedo@debian.org>
+Last-Update: 2013-08-30
+
+Signed-off-by: Martin Bark <martin@barkynet.com>
+---
+ README      | 8 ++++----
+ ctl_equal.c | 2 +-
+ pcm_equal.c | 2 +-
+ 3 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/README b/README
+index b77fd2d..2df3dc5 100644
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
+@@ -66,7 +66,7 @@ ctl.<name_equal> {
+ 	library -- location of the LADSPA library, the default is
+ 					"/usr/lib/ladspa/caps.so"
+ 	module -- module name within the LADSPA library, the deafault
+-					is "Eq"
++					is "Eq10"
+ 	channels -- number of channels, the default is 2
+ }
+ 
+@@ -81,7 +81,7 @@ pcm.<name_pcm> {
+ 	library -- location of the LADSPA library, the default is
+ 					"/usr/lib/ladspa/caps.so"
+ 	module -- module name within the LADSPA library, the deafault
+-					is "Eq"
++					is "Eq10"
+ 	channels -- number of channels, the default is 2
+ }
+ 
+diff --git a/ctl_equal.c b/ctl_equal.c
+index 40747d4..afba793 100644
+--- a/ctl_equal.c
++++ b/ctl_equal.c
+@@ -167,7 +167,7 @@ SND_CTL_PLUGIN_DEFINE_FUNC(equal)
+ 	snd_ctl_equal_t *equal;
+ 	const char *controls = ".alsaequal.bin";
+ 	const char *library = "/usr/lib/ladspa/caps.so";
+-	const char *module = "Eq";
++	const char *module = "Eq10";
+ 	long channels = 2;
+ 	const char *sufix = " Playback Volume";
+ 	int err, i, index;
+diff --git a/pcm_equal.c b/pcm_equal.c
+index 2bc87fb..b0b4265 100644
+--- a/pcm_equal.c
++++ b/pcm_equal.c
+@@ -151,7 +151,7 @@ SND_PCM_PLUGIN_DEFINE_FUNC(equal)
+ 	snd_config_t *sconf = NULL;
+ 	const char *controls = ".alsaequal.bin";
+ 	const char *library = "/usr/lib/ladspa/caps.so";
+-	const char *module = "Eq";
++	const char *module = "Eq10";
+ 	long channels = 2;
+ 	int err;
+ 	
+-- 
+1.9.1
+
diff --git a/package/alsaequal/alsaequal-03-fix-caps-error.patch b/package/alsaequal/alsaequal-03-fix-caps-error.patch
new file mode 100644
index 0000000..b27e439
--- /dev/null
+++ b/package/alsaequal/alsaequal-03-fix-caps-error.patch
@@ -0,0 +1,37 @@
+From f773aef9e1275f61577819ffc1ef9b8c8b739ec3 Mon Sep 17 00:00:00 2001
+From: Martin Bark <martin@barkynet.com>
+Date: Tue, 5 Aug 2014 22:28:57 +0100
+Subject: [PATCH 3/3] Fix caps error
+
+Fix a spurious error with newer caps versions. Fix from
+debian/patches/06_fix-caps-error.patch.
+
+Origin: vendor, https://aur.archlinux.org/packages/alsaequal/?comments=all
+Forwarded: no
+Author: Alessandro Ghedini <ghedo@debian.org>
+Last-Update: 2013-08-30
+Applied-Upstream: *** FIXME ***
+
+Signed-off-by: Martin Bark <martin@barkynet.com>
+---
+ ctl_equal.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/ctl_equal.c b/ctl_equal.c
+index afba793..bd0a8ba 100644
+--- a/ctl_equal.c
++++ b/ctl_equal.c
+@@ -263,8 +263,8 @@ SND_CTL_PLUGIN_DEFINE_FUNC(equal)
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
+-- 
+1.9.1
+
diff --git a/package/alsaequal/alsaequal.mk b/package/alsaequal/alsaequal.mk
new file mode 100644
index 0000000..8180d8e
--- /dev/null
+++ b/package/alsaequal/alsaequal.mk
@@ -0,0 +1,24 @@
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
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		all	-C $(@D)
+endef
+
+define ALSAEQUAL_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		DESTDIR=$(TARGET_DIR) install -C $(@D)
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
1.9.1
