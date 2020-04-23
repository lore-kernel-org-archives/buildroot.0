From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 23 Apr 2020 21:54:46 +0200
Subject: [Buildroot] [git commit] package/{openjdk,
 openjdk-bin}: add support for building either lts or latest
Message-ID: <20200423194024.D6E718FC50@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=555aff43a5a101b6780594ada6a4406065dbf5e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As Java is used quite a bit in the enterprise world, having the option to
build the LTS version of OpenJDK is quite convenient and also a requirement
for many companies wanting to use Java.

As such, there are three options:
  1) Continue only to support the latest version of OpenJDK.
  2) Downgrade our existing OpenJDK package from 14 to 11.
  3) Add an option to support either OpenJDK 11 or 14.

OpenJDK 11 and 14 currently have:
  - The same configure options.
  - The same license files and hashes for those license files.
  - The same dependencies.
  - The same method to build and install.

As such, supporting both 11 and 14 is not only an easy option to add to
Buildroot, but also a nice feature for users who wish to use Java in an
embedded environment with a company that mandates the use of the LTS version.

To make it explicit that this choice really is about LTS vs. latest, and
not about 11 vs. 14, the options are really named with LTS and LATEST,
so that future defconfigs will not have to migrate when the versions
changes (e.g. we update from 14->15, or from 11 to the next LTS).

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
[yann.morin.1998 at free.fr:
  - keep latest as the default, for existing defconfigs
  - rename options: drop numbers, use LTS and LATEST
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/openjdk-bin/openjdk-bin.hash |  3 +++
 package/openjdk-bin/openjdk-bin.mk   |  8 ++++++++
 package/openjdk/Config.in            | 14 ++++++++++++++
 package/openjdk/openjdk.hash         |  1 +
 package/openjdk/openjdk.mk           |  9 +++++++++
 5 files changed, 35 insertions(+)

diff --git a/package/openjdk-bin/openjdk-bin.hash b/package/openjdk-bin/openjdk-bin.hash
index 52380f55ae..065eda0603 100644
--- a/package/openjdk-bin/openjdk-bin.hash
+++ b/package/openjdk-bin/openjdk-bin.hash
@@ -1,6 +1,9 @@
 # From https://github.com/AdoptOpenJDK/openjdk14-binaries/releases
 sha256  9ddf9b35996fbd784a53fff3e0d59920a7d5acf1a82d4c8d70906957ac146cd1  OpenJDK14U-jdk_x64_linux_hotspot_14.0.1_7.tar.gz
 
+# From https://github.com/AdoptOpenJDK/openjdk11-binaries/releases
+sha256  ee60304d782c9d5654bf1a6b3f38c683921c1711045e1db94525a51b7024a2ca  OpenJDK11U-jdk_x64_linux_hotspot_11.0.7_10.tar.gz
+
 # Locally calculated
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
 sha256  a44eb7b5caf5534c6ef536b21edb40b4d6babf91bf97d9d45596868618b2c6fb  legal/java.prefs/ASSEMBLY_EXCEPTION
diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index ca8e11fe13..f4a8979e0b 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -4,11 +4,19 @@
 #
 ################################################################################
 
+ifeq ($(BR2_OPENJDK_VERSION_LATEST),y)
 HOST_OPENJDK_BIN_VERSION_MAJOR = 14.0.1
 HOST_OPENJDK_BIN_VERSION_MINOR = 7
 HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR)_$(HOST_OPENJDK_BIN_VERSION_MINOR)
 HOST_OPENJDK_BIN_SOURCE = OpenJDK14U-jdk_x64_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
 HOST_OPENJDK_BIN_SITE = https://github.com/AdoptOpenJDK/openjdk14-binaries/releases/download/jdk-$(HOST_OPENJDK_BIN_VERSION_MAJOR)%2B$(HOST_OPENJDK_BIN_VERSION_MINOR)
+else
+HOST_OPENJDK_BIN_VERSION_MAJOR = 11.0.7
+HOST_OPENJDK_BIN_VERSION_MINOR = 10
+HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR)_$(HOST_OPENJDK_BIN_VERSION_MINOR)
+HOST_OPENJDK_BIN_SOURCE = OpenJDK11U-jdk_x64_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
+HOST_OPENJDK_BIN_SITE = https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-$(HOST_OPENJDK_BIN_VERSION_MAJOR)%2B$(HOST_OPENJDK_BIN_VERSION_MINOR)
+endif
 HOST_OPENJDK_BIN_LICENSE = GPL-2.0+ with exception
 HOST_OPENJDK_BIN_LICENSE_FILES = legal/java.prefs/LICENSE legal/java.prefs/ASSEMBLY_EXCEPTION
 
diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
index 47585c87ea..3b35c725ee 100644
--- a/package/openjdk/Config.in
+++ b/package/openjdk/Config.in
@@ -48,6 +48,20 @@ config BR2_PACKAGE_OPENJDK
 
 if BR2_PACKAGE_OPENJDK
 
+choice
+	prompt "openjdk version"
+	default BR2_OPENJDK_VERSION_LATEST
+	help
+	  Select the version of OpenJDK you wish to use.
+
+config BR2_OPENJDK_VERSION_LTS
+	bool "LTS (OpenJDK 11)"
+
+config BR2_OPENJDK_VERSION_LATEST
+	bool "latest (OpenJDK 14)"
+
+endchoice
+
 config BR2_PACKAGE_OPENJDK_FULL_JDK
 	bool "Build the full JDK"
 	help
diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
index e453d12d1a..2279c8b971 100644
--- a/package/openjdk/openjdk.hash
+++ b/package/openjdk/openjdk.hash
@@ -1,3 +1,4 @@
 # Locally computed
 sha256  301203cbda9c40a5fc496b3299806995ac4833b39c6d2e8470fd85a35461afd4  jdk-14.0.1+7.tar.gz
+sha256  d105471d06568e4659c21518d1bf42b8ebab5c70539e9777d570549a98ed2a8a  jdk-11.0.7+10.tar.gz
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index a045e74844..f3a4a616eb 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -4,11 +4,20 @@
 #
 ################################################################################
 
+ifeq ($(BR2_OPENJDK_VERSION_LATEST),y)
 OPENJDK_VERSION_MAJOR = 14.0.1
 OPENJDK_VERSION_MINOR = 7
 OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR)+$(OPENJDK_VERSION_MINOR)
 OPENJDK_SOURCE = jdk-$(OPENJDK_VERSION).tar.gz
 OPENJDK_SITE = https://hg.openjdk.java.net/jdk-updates/jdk14u/archive
+else
+OPENJDK_VERSION_MAJOR = 11.0.7
+OPENJDK_VERSION_MINOR = 10
+OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR)+$(OPENJDK_VERSION_MINOR)
+OPENJDK_SOURCE = jdk-$(OPENJDK_VERSION).tar.gz
+OPENJDK_SITE = https://hg.openjdk.java.net/jdk-updates/jdk11u/archive
+endif
+
 OPENJDK_LICENSE = GPL-2.0+ with exception
 OPENJDK_LICENSE_FILES = LICENSE
 
