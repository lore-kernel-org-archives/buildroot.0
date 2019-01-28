From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon, 28 Jan 2019 18:22:07 -0500
Subject: [Buildroot] [PATCH v3 3/5] openjdk-bin: new package
In-Reply-To: <20190128232209.17485-1-aduskett@gmail.com>
References: <20190128232209.17485-1-aduskett@gmail.com>
Message-ID: <20190128232209.17485-4-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Paradoxically, building OpenJDK requires a pre-existing JDK.
This pre-existing JDK is called the "boot JDK."

The boot JDK for building JDK major version N should be a JDK of major
version N-1, so for building JDK11, JDK10 would be needed. This requirement is
an issue when building on most distributions, as the host JDK tends to be JDK8.

The AdoptOpenJDK project provides binaries that can act as the boot JDK to
build the target JDK, which is what this package provides.

Currently, only a x86_64 host is supported, for two reasons:
1) A 32bit x86 binary distribution is not available from AdoptOpenJDK
2) I do not have access to a machine that is not x86_64 that can build
   Buildroot.

OpenJDK-bin installs to $(HOST_DIR)/openjdk/ because the RPATH of the
provided java binaries do not have a proper RPATH, which causes a build
failure.


Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes v1 -> v2:
  - No change

Changes v2 -> v3:
  - Changed the location of the installed binaries to just $(HOST_DIR)/openjdk

  - Added a more in-depth commit message explaining some of the my reasoning
    for some of the quirks in the package files.

 DEVELOPERS                           |  1 +
 package/Config.in.host               |  1 +
 package/openjdk-bin/Config.in.host   | 12 ++++++++++++
 package/openjdk-bin/openjdk-bin.hash |  6 ++++++
 package/openjdk-bin/openjdk-bin.mk   | 23 +++++++++++++++++++++++
 5 files changed, 43 insertions(+)
 create mode 100644 package/openjdk-bin/Config.in.host
 create mode 100644 package/openjdk-bin/openjdk-bin.hash
 create mode 100644 package/openjdk-bin/openjdk-bin.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c1950bb0f4..28ba480d85 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -50,6 +50,7 @@ F:	package/libselinux/
 F:	package/libsemanage/
 F:	package/libsepol/
 F:	package/nginx-naxsi/
+F:	package/openjdk-bin/
 F:	package/policycoreutils/
 F:	package/python-flask-sqlalchemy/
 F:	package/python-mutagen/
diff --git a/package/Config.in.host b/package/Config.in.host
index 16b474fc9d..0499589c4f 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -39,6 +39,7 @@ menu "Host utilities"
 	source "package/mtools/Config.in.host"
 	source "package/mxsldr/Config.in.host"
 	source "package/omap-u-boot-utils/Config.in.host"
+	source "package/openjdk-bin/Config.in.host"
 	source "package/openocd/Config.in.host"
 	source "package/opkg-utils/Config.in.host"
 	source "package/parted/Config.in.host"
diff --git a/package/openjdk-bin/Config.in.host b/package/openjdk-bin/Config.in.host
new file mode 100644
index 0000000000..e3dd438a0f
--- /dev/null
+++ b/package/openjdk-bin/Config.in.host
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS
+	bool
+	default y if BR2_HOSTARCH = "x86_64"
+
+config BR2_PACKAGE_HOST_OPENJDK_BIN
+	bool "host openjdk-bin"
+	depends on BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS
+	help
+	  Pre-packaged OpenJDK binaries used to compile the target
+	  OpenJDK.
+
+	  https://adoptopenjdk.net/
diff --git a/package/openjdk-bin/openjdk-bin.hash b/package/openjdk-bin/openjdk-bin.hash
new file mode 100644
index 0000000000..35d0b5c44b
--- /dev/null
+++ b/package/openjdk-bin/openjdk-bin.hash
@@ -0,0 +1,6 @@
+# From https://github.com/AdoptOpenJDK/openjdk11-binaries/releases
+sha256	d89304a971e5186e80b6a48a9415e49583b7a5a9315ba5552d373be7782fc528	OpenJDK11U-jdk_x64_linux_hotspot_11.0.2_7.tar.gz
+
+# Locally calculated
+sha256	4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726	legal/java.prefs/LICENSE
+sha256	a44eb7b5caf5534c6ef536b21edb40b4d6babf91bf97d9d45596868618b2c6fb	legal/java.prefs/ASSEMBLY_EXCEPTION
diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
new file mode 100644
index 0000000000..197ccd8eec
--- /dev/null
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# host-openjdk-bin
+#
+################################################################################
+
+HOST_OPENJDK_BIN_VERSION_MAJOR = 11.0.2
+HOST_OPENJDK_BIN_VERSION_MINOR = 7
+HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR)_$(HOST_OPENJDK_BIN_VERSION_MINOR)
+HOST_OPENJDK_BIN_SOURCE = OpenJDK11U-jdk_x64_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
+HOST_OPENJDK_BIN_SITE = https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-$(HOST_OPENJDK_BIN_VERSION_MAJOR)%2B$(HOST_OPENJDK_BIN_VERSION_MINOR)
+HOST_OPENJDK_BIN_LICENSE = GPLv2+ with exception
+HOST_OPENJDK_BIN_LICENSE_FILES = legal/java.prefs/LICENSE legal/java.prefs/ASSEMBLY_EXCEPTION
+
+# If the files are installed to $(HOST_DIR)/bin and $(HOST_DIR)/lib
+# the build will fail because the RPATH of java binaries do not have a proper
+# RPATH
+define HOST_OPENJDK_BIN_INSTALL_CMDS
+	mkdir -p $(HOST_DIR)/openjdk
+	cp -aLrf $(@D)/* $(HOST_DIR)/openjdk/
+endef
+
+$(eval $(host-generic-package))
-- 
2.20.1
