From: Joel Carlson <joel.carlson@cosmicaes.com>
Date: Thu, 31 May 2018 11:04:29 -0600
Subject: [Buildroot] [PATCH v4 1/1] flatcc: new package
Message-ID: <1527786269-11147-1-git-send-email-joel.carlson@cosmicaes.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This adds flatcc as a new package, pulling v0.5.1 from github. flatcc
has both a host tool (the compiler), and libraries for the target.

Signed-off-by: Steve deRosier <steve.derosier@lairdtech.com>
Signed-off-by: Joel Carlson <joel.carlson@cosmicaes.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
Changes v3 -> v4
  - Put back in Sob line of original submitter (suggested by Arnout)
  - Removed pruning of host files (suggested by Arnout)
---
 package/Config.in          |  1 +
 package/flatcc/Config.in   |  8 ++++++++
 package/flatcc/flatcc.hash |  2 ++
 package/flatcc/flatcc.mk   | 29 +++++++++++++++++++++++++++++
 4 files changed, 40 insertions(+)
 create mode 100644 package/flatcc/Config.in
 create mode 100644 package/flatcc/flatcc.hash
 create mode 100644 package/flatcc/flatcc.mk

diff --git a/package/Config.in b/package/Config.in
index ecee493..4de10b1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1501,6 +1501,7 @@ menu "Other"
 	source "package/fftw/Config.in"
 	source "package/flann/Config.in"
 	source "package/flatbuffers/Config.in"
+	source "package/flatcc/Config.in"
 	source "package/gconf/Config.in"
 	source "package/gflags/Config.in"
 	source "package/glibmm/Config.in"
diff --git a/package/flatcc/Config.in b/package/flatcc/Config.in
new file mode 100644
index 0000000..6273f2b
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
index 0000000..357d8b7
--- /dev/null
+++ b/package/flatcc/flatcc.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	8c4560ca32e3c555716d9363bed469e2c60e0f443ec32bc08e7abfe681e25ca9  flatcc-v0.5.1.tar.gz
diff --git a/package/flatcc/flatcc.mk b/package/flatcc/flatcc.mk
new file mode 100644
index 0000000..51995d4
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
+FLATCC_SITE =$(call github,dvidelabs,flatcc,$(FLATCC_VERSION))
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
-- 
2.7.4
