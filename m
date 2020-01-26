From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Jan 2020 15:53:14 +0100
Subject: [Buildroot] [git commit] package/ptm2human: new package
Message-ID: <20200126144321.9104783BE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=015dab9f4dbbf70ee461fc328d548195a8e5f258
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ptm2human is a decoder for trace data outputted by Program
Trace Macrocell (PTM) and Embedded Trace Macrocell (ETMv4).
It deconstructs ID packets and data packets from the
formatter of ARM Coresight ETB, and then translates the
trace data to a human-readable format.

./utils/test-pkg --package ptm2human --all
44 builds, 29 skipped, 0 build failed, 0 legal-info failed

Signed-off-by: Julien Olivain <juju@cotds.org>
[yann.morin.1998 at free.fr:
  - drop the host variant
  - introduce _ARCH_SUPPORTS
  - comment why we need autoreconf
  - drop spurious empty line
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 ...e.ac-remove-unneeded-check-for-c-compiler.patch | 29 ++++++++++++++++++++++
 package/ptm2human/Config.in                        | 18 ++++++++++++++
 package/ptm2human/ptm2human.hash                   |  3 +++
 package/ptm2human/ptm2human.mk                     | 16 ++++++++++++
 6 files changed, 68 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0c2cc49f9c..d5f7bdb8f7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1385,6 +1385,7 @@ F:	configs/imx8mmpico_defconfig
 F:	configs/imx8mpico_defconfig
 F:	package/fluid-soundfont/
 F:	package/fluidsynth/
+F:	package/ptm2human/
 
 N:	Julien Viard de Galbert <julien@vdg.name>
 F:	package/dieharder/
diff --git a/package/Config.in b/package/Config.in
index 57c634d58f..db35848fed 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -124,6 +124,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/pax-utils/Config.in"
 	source "package/pcm-tools/Config.in"
 	source "package/piglit/Config.in"
+	source "package/ptm2human/Config.in"
 	source "package/pv/Config.in"
 	source "package/racehound/Config.in"
 	source "package/ramsmp/Config.in"
diff --git a/package/ptm2human/0001-configure.ac-remove-unneeded-check-for-c-compiler.patch b/package/ptm2human/0001-configure.ac-remove-unneeded-check-for-c-compiler.patch
new file mode 100644
index 0000000000..b5c835a246
--- /dev/null
+++ b/package/ptm2human/0001-configure.ac-remove-unneeded-check-for-c-compiler.patch
@@ -0,0 +1,29 @@
+From 57b32b3785da1e48bd77c4f13ef41125a6abb83d Mon Sep 17 00:00:00 2001
+From: Julien Olivain <juju@cotds.org>
+Date: Fri, 24 Jan 2020 19:12:37 +0100
+Subject: [PATCH] configure.ac: remove unneeded check for c++ compiler
+
+If the c++ compiler is not present, the build configuration
+will fail. This patch remove the check for the c++ compiler
+because all the ptm2human code is written in C.
+
+Signed-off-by: Julien Olivain <juju@cotds.org>
+---
+ configure.ac | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 3b1f337..924dc77 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -7,7 +7,6 @@ AM_INIT_AUTOMAKE([foreign -Wall])
+ AC_CONFIG_HEADERS([config.h])
+ 
+ # Checks for programs.
+-AC_PROG_CXX
+ AC_PROG_CC
+ 
+ # Checks for libraries.
+-- 
+2.24.1
+
diff --git a/package/ptm2human/Config.in b/package/ptm2human/Config.in
new file mode 100644
index 0000000000..3d364394f4
--- /dev/null
+++ b/package/ptm2human/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_PTM2HUMAN_ARCH_SUPPORTS
+	bool
+	default y if BR2_arm
+	default y if BR2_armeb
+	default y if BR2_aarch64
+	default y if BR2_aarch64_be
+
+config BR2_PACKAGE_PTM2HUMAN
+	bool "ptm2human"
+	depends on BR2_PACKAGE_PTM2HUMAN_ARCH_SUPPORTS
+	help
+	  ptm2human is a decoder for trace data outputted by Program
+	  Trace Macrocell (PTM) and Embedded Trace Macrocell
+	  (ETMv4). It deconstructs ID packets and data packets
+	  from the formatter of ARM Coresight ETB, and then
+	  translates the trace data to a human-readable format.
+
+	  https://github.com/hwangcc23/ptm2human
diff --git a/package/ptm2human/ptm2human.hash b/package/ptm2human/ptm2human.hash
new file mode 100644
index 0000000000..b4372f77f6
--- /dev/null
+++ b/package/ptm2human/ptm2human.hash
@@ -0,0 +1,3 @@
+# Computed locally
+sha256 c3fd505949db82fde4f058cad0b78c8e96ef620c193dfff8acdbbd020d51fa1a  ptm2human-d7dd68ea6495daef50e00ef2d65c99810e0a594f.tar.gz
+sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE
diff --git a/package/ptm2human/ptm2human.mk b/package/ptm2human/ptm2human.mk
new file mode 100644
index 0000000000..8fa15ebf65
--- /dev/null
+++ b/package/ptm2human/ptm2human.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# ptm2human
+#
+################################################################################
+
+PTM2HUMAN_VERSION = d7dd68ea6495daef50e00ef2d65c99810e0a594f
+PTM2HUMAN_SITE = $(call github,hwangcc23,ptm2human,$(PTM2HUMAN_VERSION))
+PTM2HUMAN_LICENSE = GPL-2.0
+PTM2HUMAN_LICENSE_FILES = LICENSE
+
+# Straight out from an non-autoconfigured git tree, plus a patch:
+# 0001-configure.ac-remove-unneeded-check-for-c-compiler.patch
+PTM2HUMAN_AUTORECONF = YES
+
+$(eval $(autotools-package))
