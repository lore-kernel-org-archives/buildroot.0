From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 14 Apr 2013 23:48:26 +0200
Subject: [Buildroot] [git commit] ne10: new package
Message-ID: <20130414215028.4CEFD9B6AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=318f3db0dcc052aa770ca57c143b5f7bc40cdaf3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Ne10 project has been set up to provide a set of common, useful
functions which have been heavily optimized for the ARM Architecture
and provide consistent well tested behavior that can be easily
incorporated into applications. C interfaces to the functions are
provided for both assembler and NEON implementations.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in      |    1 +
 package/ne10/Config.in |   12 ++++++++++++
 package/ne10/ne10.mk   |   39 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 52 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 322e005..4282185 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -466,6 +466,7 @@ source "package/libusb/Config.in"
 source "package/libusb-compat/Config.in"
 source "package/libv4l/Config.in"
 source "package/mtdev/Config.in"
+source "package/ne10/Config.in"
 source "package/neardal/Config.in"
 source "package/pcsc-lite/Config.in"
 source "package/urg/Config.in"
diff --git a/package/ne10/Config.in b/package/ne10/Config.in
new file mode 100644
index 0000000..d0c4983
--- /dev/null
+++ b/package/ne10/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_NE10
+	bool "ne10"
+	depends on BR2_arm && BR2_ARM_CPU_HAS_NEON
+	help
+	  The Ne10 project has been set up to provide a set of common,
+	  useful functions which have been heavily optimized for the
+	  ARM Architecture and provide consistent well tested behavior
+	  that can be easily incorporated into applications. C
+	  interfaces to the functions are provided for both assembler
+	  and NEON implementations.
+
+	  http://projectne10.github.io/Ne10/
diff --git a/package/ne10/ne10.mk b/package/ne10/ne10.mk
new file mode 100644
index 0000000..184f0f8
--- /dev/null
+++ b/package/ne10/ne10.mk
@@ -0,0 +1,39 @@
+#############################################################
+#
+# ne10
+#
+#############################################################
+
+# We use a Git commit ID because the last tagged version is more than
+# one year old.
+NE10_VERSION = 88c18f02199947b2c8b57796f5a3ca53160aff96
+NE10_SITE = git://github.com/projectNe10/Ne10.git
+NE10_LICENSE = BSD-3c or Apache 2.0
+NE10_LICENSE_FILES = doc/LICENSE
+
+ifeq ($(BR2_PREFER_STATIC_LIB),)
+NE10_CONF_OPT = \
+	-DNE10_BUILD_SHARED=ON
+endif
+
+# The package does not have any install target, so have to provide
+# INSTALL_STAGING_CMDS and INSTALL_TARGET_CMDS.
+
+ifeq ($(BR2_PREFER_STATIC_LIB),)
+define NE10_INSTALL_STAGING_SHARED_LIB
+	cp -dpf $(@D)/modules/libNE10*.so* $(STAGING_DIR)/usr/lib/
+endef
+endif
+
+define NE10_INSTALL_STAGING_CMDS
+	cp -dpf $(@D)/inc/NE10*h $(STAGING_DIR)/usr/include/
+	cp -dpf $(@D)/modules/libNE10.a $(STAGING_DIR)/usr/lib/
+	$(NE10_INSTALL_STAGING_SHARED_LIB)
+endef
+
+
+define NE10_INSTALL_TARGET_CMDS
+	cp -dpf $(@D)/modules/libNE10*.so* $(TARGET_DIR)/usr/lib/
+endef
+
+$(eval $(cmake-package))
