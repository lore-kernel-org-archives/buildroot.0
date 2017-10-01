From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  1 Oct 2017 22:53:18 +0200
Subject: [Buildroot] [PATCH 1/2] package/openjdk-bootstrap: new package
Message-ID: <20171001205319.11803-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package provides a binary installation of the JDK created by
the BLFS (Beyond Linux From Scratch) editors.

It is meant to be used by Kodi which currently depends on a JDK
installation provided by the host machine.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 DEVELOPERS                                       |  1 +
 package/Config.in.host                           |  1 +
 package/openjdk-bootstrap/Config.in.host         | 11 +++++++++++
 package/openjdk-bootstrap/openjdk-bootstrap.hash |  4 ++++
 package/openjdk-bootstrap/openjdk-bootstrap.mk   | 25 ++++++++++++++++++++++++
 5 files changed, 42 insertions(+)
 create mode 100644 package/openjdk-bootstrap/Config.in.host
 create mode 100644 package/openjdk-bootstrap/openjdk-bootstrap.hash
 create mode 100644 package/openjdk-bootstrap/openjdk-bootstrap.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index cedf5a6f84..f6da759c90 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -266,6 +266,7 @@ F:	package/mesa3d/
 F:	package/minidlna/
 F:	package/mjpg-streamer/
 F:	package/mplayer/
+F:	package/openjdk-bootstrap/
 F:	package/perl-crypt-openssl-random/
 F:	package/perl-crypt-openssl-rsa/
 F:	package/perl-digest-sha1/
diff --git a/package/Config.in.host b/package/Config.in.host
index 679fe22a52..90fa5af5fa 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -30,6 +30,7 @@ menu "Host utilities"
 	source "package/mtools/Config.in.host"
 	source "package/mxsldr/Config.in.host"
 	source "package/omap-u-boot-utils/Config.in.host"
+	source "package/openjdk-bootstrap/Config.in.host"
 	source "package/openocd/Config.in.host"
 	source "package/opkg-utils/Config.in.host"
 	source "package/parted/Config.in.host"
diff --git a/package/openjdk-bootstrap/Config.in.host b/package/openjdk-bootstrap/Config.in.host
new file mode 100644
index 0000000000..e769699dd4
--- /dev/null
+++ b/package/openjdk-bootstrap/Config.in.host
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_HOST_OPENJDK_BOOTSTRAP
+	bool "host openjdk bootstrap"
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	help
+	  OpenJDK (Open Java Development Kit) is a free and open source
+	  implementation of the Java Platform, Standard Edition
+	  This package provides a binary installation of the JDK created
+	  by the BLFS editors.
+
+	  http://openjdk.java.net
+	  http://www.linuxfromscratch.org/blfs/view/svn/general/java.html
diff --git a/package/openjdk-bootstrap/openjdk-bootstrap.hash b/package/openjdk-bootstrap/openjdk-bootstrap.hash
new file mode 100644
index 0000000000..7fa65592d6
--- /dev/null
+++ b/package/openjdk-bootstrap/openjdk-bootstrap.hash
@@ -0,0 +1,4 @@
+# Locally computed
+sha256 0321057130cad789ed14d7e923e69c4def6ad7470d167116f104008a079b0215  OpenJDK-1.8.0.141-i686-bin.tar.xz
+sha256 40051afdb57ed798a910ff5b1a5bbef555481bcf76f0423686861da983871e7d  OpenJDK-1.8.0.141-x86_64-bin.tar.xz
+sha256 4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
diff --git a/package/openjdk-bootstrap/openjdk-bootstrap.mk b/package/openjdk-bootstrap/openjdk-bootstrap.mk
new file mode 100644
index 0000000000..a8a6447712
--- /dev/null
+++ b/package/openjdk-bootstrap/openjdk-bootstrap.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# openjdk-bootstrap
+#
+################################################################################
+
+OPENJDK_BOOTSTRAP_VERSION = 1.8.0.141
+OPENJDK_BOOTSTRAP_SITE = http://anduin.linuxfromscratch.org/BLFS/OpenJDK/OpenJDK-$(OPENJDK_BOOTSTRAP_VERSION)
+ifeq ($(BR2_HOSTARCH),x86)
+OPENJDK_BOOTSTRAP_SOURCE = OpenJDK-$(OPENJDK_BOOTSTRAP_VERSION)-i686-bin.tar.xz
+else
+OPENJDK_BOOTSTRAP_SOURCE = OpenJDK-$(OPENJDK_BOOTSTRAP_VERSION)-x86_64-bin.tar.xz
+endif
+OPENJDK_BOOTSTRAP_LICENSE = GPL-2.0+ with exception
+OPENJDK_BOOTSTRAP_LICENSE_FILES = LICENSE
+
+# Also provided to other packages
+OPENJDK_BOOTSTRAP_BOOTSTRAP_DIR = $(HOST_DIR)/opt/jdk-bootstrap/
+
+define HOST_OPENJDK_BOOTSTRAP_INSTALL_CMDS
+	mkdir -p $(OPENJDK_BOOTSTRAP_BOOTSTRAP_DIR)
+	cp -r $(@D)/* $(OPENJDK_BOOTSTRAP_BOOTSTRAP_DIR)
+endef
+
+$(eval $(host-generic-package))
-- 
2.11.0
