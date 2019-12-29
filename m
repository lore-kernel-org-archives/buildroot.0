From: Julien Olivain <juju@cotds.org>
Date: Sun, 29 Dec 2019 19:58:23 +0100
Subject: [Buildroot] [PATCH 1/1] package/fluid-soundfont: new package
Message-ID: <20191229185823.211745-1-juju@cotds.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

FluidR3 is the third release of Frank Wen's pro-quality GM/GS
soundfont. The soundfont has lots of excellent samples, including all
the GM instruments along side with the GS instruments that are
recycled and reprogrammed versions of the GM presets.

This package contains Fluid General Midi (GM) soundfont in soundfont
2.0 (.sf2) format.

This soundfont can be used with a software synthesizer, like
FluidSynth.

Signed-off-by: Julien Olivain <juju@cotds.org>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/fluid-soundfont/Config.in            | 16 +++++++++++++++
 package/fluid-soundfont/fluid-soundfont.hash |  3 +++
 package/fluid-soundfont/fluid-soundfont.mk   | 21 ++++++++++++++++++++
 5 files changed, 42 insertions(+)
 create mode 100644 package/fluid-soundfont/Config.in
 create mode 100644 package/fluid-soundfont/fluid-soundfont.hash
 create mode 100644 package/fluid-soundfont/fluid-soundfont.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1931b3e942..7308439f06 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1369,6 +1369,7 @@ F:	board/technexion/imx8mmpico/
 F:	board/technexion/imx8mpico/
 F:	configs/imx8mmpico_defconfig
 F:	configs/imx8mpico_defconfig
+F:	package/fluid-soundfont/
 F:	package/fluidsynth/
 
 N:	Julien Viard de Galbert <julien@vdg.name>
diff --git a/package/Config.in b/package/Config.in
index 6aac0f7e26..888373422f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -23,6 +23,7 @@ menu "Audio and video applications"
 	source "package/ffmpeg/Config.in"
 	source "package/flac/Config.in"
 	source "package/flite/Config.in"
+	source "package/fluid-soundfont/Config.in"
 	source "package/fluidsynth/Config.in"
 	source "package/gmrender-resurrect/Config.in"
 	source "package/gstreamer/Config.in"
diff --git a/package/fluid-soundfont/Config.in b/package/fluid-soundfont/Config.in
new file mode 100644
index 0000000000..67f5ea1113
--- /dev/null
+++ b/package/fluid-soundfont/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_FLUID_SOUNDFONT
+	bool "fluid-soundfont"
+	help
+	  FluidR3 is the third release of Frank Wen's pro-quality
+	  GM/GS soundfont.  The soundfont has lots of excellent
+	  samples, including all the GM instruments along side with
+	  the GS instruments that are recycled and reprogrammed
+	  versions of the GM presets.
+
+	  This package contains Fluid General Midi (GM) soundfont in
+	  soundfont 2.0 (.sf2) format.
+
+	  This soundfont can be used with the FluidSynth real-time
+	  software synthesizer.
+
+	  http://www.hammersound.net
diff --git a/package/fluid-soundfont/fluid-soundfont.hash b/package/fluid-soundfont/fluid-soundfont.hash
new file mode 100644
index 0000000000..7aaac60084
--- /dev/null
+++ b/package/fluid-soundfont/fluid-soundfont.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 2621acaa1c78e4abdb24bdd163230cc577e61276936d6aa6e3180582142f0343  fluid-soundfont_3.1.orig.tar.gz
+sha256 8ef830b65c97a976b86e34bb5fde08d99dfb1db13c4149b5b20bc837ac6c4568  COPYING
diff --git a/package/fluid-soundfont/fluid-soundfont.mk b/package/fluid-soundfont/fluid-soundfont.mk
new file mode 100644
index 0000000000..f8fd986ced
--- /dev/null
+++ b/package/fluid-soundfont/fluid-soundfont.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# fluid-soundfont
+#
+################################################################################
+
+FLUID_SOUNDFONT_VERSION = 3.1
+FLUID_SOUNDFONT_SOURCE = fluid-soundfont_$(FLUID_SOUNDFONT_VERSION).orig.tar.gz
+# The http://www.hammersound.net archive site seems unreliable (show HTTP 500
+# error), and also publish the file in the sfArk format, which is inconvenient
+# to be used in automated build. We use here the Debian mirror publishing the
+# file in a more convenient format (inative sf2 in a tar.gz archive).
+FLUID_SOUNDFONT_SITE = http://http.debian.net/debian/pool/main/f/fluid-soundfont
+FLUID_SOUNDFONT_LICENSE = MIT
+FLUID_SOUNDFONT_LICENSE_FILES = COPYING
+
+define FLUID_SOUNDFONT_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/FluidR3_GM.sf2 $(TARGET_DIR)/usr/share/soundfonts/FluidR3_GM.sf2
+endef
+
+$(eval $(generic-package))
-- 
2.24.1
