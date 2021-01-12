From: jmfriedt <friedtj@free.fr>
Date: Tue, 12 Jan 2021 14:44:53 +0100
Subject: [Buildroot] [PATCH] package/ft8_lib: new package
Message-ID: <20210112134453.937629-1-friedtj@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: jfriedt <jean-michel.friedt@femto-st.fr>

A C++ implementation of FT8 protocol, mostly intended for
experimental use on microcontrollers.

Signed-off-by: jfriedt <jean-michel.friedt@femto-st.fr>
---
 DEVELOPERS                   |  3 +++
 package/Config.in            |  1 +
 package/ft8_lib/Config.in    |  7 +++++++
 package/ft8_lib/ft8_lib.hash |  4 ++++
 package/ft8_lib/ft8_lib.mk   | 27 +++++++++++++++++++++++++++
 5 files changed, 42 insertions(+)
 create mode 100644 package/ft8_lib/Config.in
 create mode 100644 package/ft8_lib/ft8_lib.hash
 create mode 100644 package/ft8_lib/ft8_lib.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 05b509c9c4..2e1f423fbe 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1241,6 +1241,9 @@ F:	package/librtlsdr/
 N:	Jean Burgat <jeanburgat33@gmail.com>
 F:	package/openfpgaloader/
 
+N:	Jean-Michel Friedt <friedtj@free.fr>
+F:	package/ft8_lib/
+
 N:	Jens Kleintje <scooby22@web.de>
 F:	package/gcnano-binaries/
 
diff --git a/package/Config.in b/package/Config.in
index 5a16814ca8..526335b80d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1866,6 +1866,7 @@ menu "Other"
 	source "package/flann/Config.in"
 	source "package/flatbuffers/Config.in"
 	source "package/flatcc/Config.in"
+	source "package/ft8_lib/Config.in"
 	source "package/gconf/Config.in"
 	source "package/gflags/Config.in"
 	source "package/gli/Config.in"
diff --git a/package/ft8_lib/Config.in b/package/ft8_lib/Config.in
new file mode 100644
index 0000000000..b0e449789b
--- /dev/null
+++ b/package/ft8_lib/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_FT8_LIB
+	bool "ft8_lib"
+	help
+	  A C++ implementation of FT8 protocol, mostly intended for
+	  experimental use on microcontrollers.
+
+	  https://github.com/kgoba/ft8_lib
diff --git a/package/ft8_lib/ft8_lib.hash b/package/ft8_lib/ft8_lib.hash
new file mode 100644
index 0000000000..52b0df7aac
--- /dev/null
+++ b/package/ft8_lib/ft8_lib.hash
@@ -0,0 +1,4 @@
+# Locally calculated after checking pgp signature
+sha256  0b9a575eded512eca39e4118697dfbb38f2666e7070504e65f5e05e31fffed4f  ft8_lib-c6d79b961cd5425ede48ba5e5f3c279d0932c806.tar.gz
+# License files, locally calculated
+sha256  4c816505e73feef31f1ffafcf70d51e2aae65a88296e77d6c37715f31ce63230  LICENSE
diff --git a/package/ft8_lib/ft8_lib.mk b/package/ft8_lib/ft8_lib.mk
new file mode 100644
index 0000000000..5c0c2d5d25
--- /dev/null
+++ b/package/ft8_lib/ft8_lib.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# ft8_lib
+#
+################################################################################
+
+FT8_LIB_VERSION = c6d79b961cd5425ede48ba5e5f3c279d0932c806
+FT8_LIB_SITE = $(call github,kgoba,ft8_lib,$(FT8_LIB_VERSION))
+
+FT8_LIB_INSTALL_STAGING = YES
+FT8_LIB_LICENSE = MIT
+FT8_LIB_LICENSE_FILES = LICENSE
+
+define FT8_LIB_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+	$(TARGET_AR) rc $(@D)/libft8.a $(@D)/ft8/constants.o $(@D)/ft8/encode.o $(@D)/ft8/pack.o \
+		$(@D)/ft8/text.o $(@D)/common/wave.o
+endef
+
+define FT8_LIB_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/libft8.a $(STAGING_DIR)/usr/lib/libft8.a
+	mkdir -p $(STAGING_DIR)/usr/include/ft8
+	$(INSTALL) -D -m 0755 $(@D)/ft8/*.h $(STAGING_DIR)/usr/include/ft8/
+	$(INSTALL) -D -m 0755 $(@D)/common/wave.h $(STAGING_DIR)/usr/include/ft8/
+endef
+
+$(eval $(generic-package))
-- 
2.30.0
