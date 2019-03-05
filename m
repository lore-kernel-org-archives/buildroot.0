From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 05 Mar 2019 10:00:13 -0000
Subject: [Buildroot] [git commit] package/openjdk-bin: new package
Message-ID: <20190305095735.326AE8E504@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=342e950c24700861b004b39c8f77977d238d0775
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Paradoxically, building OpenJDK requires a pre-existing JDK.  This
pre-existing JDK is called the "boot JDK."

The boot JDK for building JDK major version N should be a JDK of major
version N-1, so for building JDK11, JDK10 would be needed. This
requirement is an issue when building on most distributions, as the
host JDK tends to be JDK8.

The AdoptOpenJDK project provides binaries that can act as the boot
JDK to build the target JDK, which is what this package provides.

Currently, only a x86_64 host is supported, for two reasons:

1) A 32bit x86 binary distribution is not available from AdoptOpenJDK

2) We didn't had access to a host machine using an architecture other
   than x86-64

The provided unpack200 has an invalid RPATH and relies on libzlib.
When host-libzlib runs the install step, the following error is
generated:

*** ERROR: package host-libzlib installs executables without proper RPATH:
***   $(HOST_DIR)/bin/unpack200

Because unpack200 is a deprecated tool, removing it after installation
is safe and fixes the issue.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
[Thomas:
 - fix comments in the code
 - use the more usual "cp -dpfr" command to copy files over]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                           |  1 +
 package/openjdk-bin/openjdk-bin.hash |  6 ++++++
 package/openjdk-bin/openjdk-bin.mk   | 26 ++++++++++++++++++++++++++
 3 files changed, 33 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f2e69cc041..e7ab584be6 100644
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
diff --git a/package/openjdk-bin/openjdk-bin.hash b/package/openjdk-bin/openjdk-bin.hash
new file mode 100644
index 0000000000..d36a582a33
--- /dev/null
+++ b/package/openjdk-bin/openjdk-bin.hash
@@ -0,0 +1,6 @@
+# From https://github.com/AdoptOpenJDK/openjdk11-binaries/releases
+sha256	d02089d834f7702ac1a9776d8d0d13ee174d0656cf036c6b68b9ffb71a6f610e	OpenJDK11U-jdk_x64_linux_hotspot_11.0.2_9.tar.gz
+
+# Locally calculated
+sha256	4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726	legal/java.prefs/LICENSE
+sha256	a44eb7b5caf5534c6ef536b21edb40b4d6babf91bf97d9d45596868618b2c6fb	legal/java.prefs/ASSEMBLY_EXCEPTION
diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
new file mode 100644
index 0000000000..1d4f44804c
--- /dev/null
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# host-openjdk-bin
+#
+################################################################################
+
+HOST_OPENJDK_BIN_VERSION_MAJOR = 11.0.2
+HOST_OPENJDK_BIN_VERSION_MINOR = 9
+HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR)_$(HOST_OPENJDK_BIN_VERSION_MINOR)
+HOST_OPENJDK_BIN_SOURCE = OpenJDK11U-jdk_x64_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
+HOST_OPENJDK_BIN_SITE = https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-$(HOST_OPENJDK_BIN_VERSION_MAJOR)%2B$(HOST_OPENJDK_BIN_VERSION_MINOR)
+HOST_OPENJDK_BIN_LICENSE = GPL-2.0+ with exception
+HOST_OPENJDK_BIN_LICENSE_FILES = legal/java.prefs/LICENSE legal/java.prefs/ASSEMBLY_EXCEPTION
+
+# unpack200 has an invalid RPATH and relies on libzlib. When
+# host-libzlib is installed on the system, the error "ERROR: package
+# host-libzlib installs executables without proper RPATH: will occur.
+# Because unpack200 is a deprecated tool, removing it to fix this
+# issue is safe.
+define HOST_OPENJDK_BIN_INSTALL_CMDS
+	cp -dpfr $(@D)/bin/* $(HOST_DIR)/bin/
+	cp -dpfr $(@D)/lib/* $(HOST_DIR)/lib/
+	$(RM) -f $(HOST_DIR)/bin/unpack200
+endef
+
+$(eval $(host-generic-package))
