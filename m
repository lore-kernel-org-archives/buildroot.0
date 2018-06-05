From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Jun 2018 19:00:10 +0200
Subject: [Buildroot] [git commit] flatcc: new package
Message-ID: <20180605172018.942CE839A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bfbfa5b8e2abcea6f18ee439660321f1788a7e82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This adds flatcc as a new package, pulling v0.5.1 from github. flatcc
has both a host tool (the compiler), and libraries for the target.

Signed-off-by: Steve deRosier <steve.derosier@lairdtech.com>
Signed-off-by: Joel Carlson <joel.carlson@cosmicaes.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Thomas: add entry in DEVELOPERS file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                 |  3 +++
 package/Config.in          |  1 +
 package/flatcc/Config.in   |  8 ++++++++
 package/flatcc/flatcc.hash |  2 ++
 package/flatcc/flatcc.mk   | 29 +++++++++++++++++++++++++++++
 5 files changed, 43 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1ad3edcd78..e5d5a26e1f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -949,6 +949,9 @@ F:	package/batctl/
 N:	Jeremy Rosen <jeremy.rosen@openwide.fr>
 F:	package/fxload/
 
+N:	Joel Carlson <joel.carlson@cosmicaes.com>
+F:	package/flatcc/
+
 N:	Joel Stanley <joel@jms.id.au>
 F:	package/pdbg/
 F:	board/qemu/ppc64le-pseries/
diff --git a/package/Config.in b/package/Config.in
index 1730201bf3..9640ab2d4e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1508,6 +1508,7 @@ menu "Other"
 	source "package/fftw/Config.in"
 	source "package/flann/Config.in"
 	source "package/flatbuffers/Config.in"
+	source "package/flatcc/Config.in"
 	source "package/gconf/Config.in"
 	source "package/gflags/Config.in"
 	source "package/glibmm/Config.in"
diff --git a/package/flatcc/Config.in b/package/flatcc/Config.in
new file mode 100644
index 0000000000..6273f2b500
--- /dev/null
+++ b/package/flatcc/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_FLATCC
+	bool "flatcc"
+	help
+	  flatcc is C language implementation of Google Flatbuffers. It
+	  consists of both a library for the target as well as a
+	  flatbuffer compiler tool for the host.
+
+	  https://github.com/dvidelabs/flatcc
diff --git a/package/flatcc/flatcc.hash b/package/flatcc/flatcc.hash
new file mode 100644
index 0000000000..357d8b707d
--- /dev/null
+++ b/package/flatcc/flatcc.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	8c4560ca32e3c555716d9363bed469e2c60e0f443ec32bc08e7abfe681e25ca9  flatcc-v0.5.1.tar.gz
diff --git a/package/flatcc/flatcc.mk b/package/flatcc/flatcc.mk
new file mode 100644
index 0000000000..55356445a2
--- /dev/null
+++ b/package/flatcc/flatcc.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# FLATCC
+#
+################################################################################
+
+FLATCC_VERSION = v0.5.1
+FLATCC_SITE = $(call github,dvidelabs,flatcc,$(FLATCC_VERSION))
+FLATCC_LICENSE = Apache-2.0
+FLATCC_LICENSE_FILES = LICENSE
+FLATCC_INSTALL_STAGING = YES
+FLATCC_DEPENDENCIES = host-flatcc
+
+# Disable build of tests and samples
+FLATCC_CONF_OPTS += -DFLATCC_TEST=OFF
+HOST_FLATCC_CONF_OPTS += -DFLATCC_TEST=OFF
+
+# Enable install targets
+FLATCC_CONF_OPTS += -DFLATCC_INSTALL=ON
+HOST_FLATCC_CONF_OPTS += -DFLATCC_INSTALL=ON
+
+define FLATCC_TARGET_REMOVE_FLATCC_COMPILER
+	rm $(TARGET_DIR)/usr/bin/flatcc
+endef
+
+FLATCC_POST_INSTALL_TARGET_HOOKS += FLATCC_TARGET_REMOVE_FLATCC_COMPILER
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
