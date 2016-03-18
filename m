From: =?UTF-8?q?Beno=C3=AEt=20Allard?= <benoit.allard@greenbone.net>
Date: Fri, 18 Mar 2016 12:00:43 +0100
Subject: [Buildroot] [PATCH 2/2] cdebootstrap: new package
In-Reply-To: <1458298843-21326-1-git-send-email-benoit.allard@greenbone.net>
References: <1458298843-21326-1-git-send-email-benoit.allard@greenbone.net>
Message-ID: <1458298843-21326-2-git-send-email-benoit.allard@greenbone.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cdebootstrap is used to create a Debian base system from scratch.

Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>
---
Changes v1 -> v2
  - Reorder select in Config.in
  - Use snapshot.debian.org
  - Remove unecessary lines in .mk (default values)
---
 package/Config.in                      |  3 +++
 package/cdebootstrap/Config.in         | 12 ++++++++++++
 package/cdebootstrap/cdebootstrap.hash |  2 ++
 package/cdebootstrap/cdebootstrap.mk   | 15 +++++++++++++++
 4 files changed, 32 insertions(+)
 create mode 100644 package/cdebootstrap/Config.in
 create mode 100644 package/cdebootstrap/cdebootstrap.hash
 create mode 100644 package/cdebootstrap/cdebootstrap.mk

diff --git a/package/Config.in b/package/Config.in
index db4ceab..3d19bda 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1598,6 +1598,9 @@ menu "System tools"
 	source "package/audit/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/bootutils/Config.in"
+endif
+	source "package/cdebootstrap/Config.in"
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/coreutils/Config.in"
 endif
 	source "package/cpuload/Config.in"
diff --git a/package/cdebootstrap/Config.in b/package/cdebootstrap/Config.in
new file mode 100644
index 0000000..eccafb0
--- /dev/null
+++ b/package/cdebootstrap/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_CDEBOOTSTRAP
+	bool "cdebootstrap"
+	select BR2_PACKAGE_BZIP2
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBDEBIAN_INSTALLER
+	select BR2_PACKAGE_XZ
+	select BR2_PACKAGE_ZLIB
+	help
+	  cdebootstrap generates systems from scratch for Debian and
+	  derivates.
+
+	  https://packages.debian.org/cdebootstrap
diff --git a/package/cdebootstrap/cdebootstrap.hash b/package/cdebootstrap/cdebootstrap.hash
new file mode 100644
index 0000000..493e3c6
--- /dev/null
+++ b/package/cdebootstrap/cdebootstrap.hash
@@ -0,0 +1,2 @@
+# From http://snapshot.debian.org/archive/debian/20141116T035859Z/pool/main/c/cdebootstrap/cdebootstrap_0.6.4.dsc
+sha256 e33fe2c245894ab40dc4db764f31a0bf59cc80c34d9ebf2e71b715e49631bb34 cdebootstrap_0.6.4.tar.gz
diff --git a/package/cdebootstrap/cdebootstrap.mk b/package/cdebootstrap/cdebootstrap.mk
new file mode 100644
index 0000000..ca140da
--- /dev/null
+++ b/package/cdebootstrap/cdebootstrap.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# cdebootstrap
+#
+################################################################################
+
+# Not the latest version, rather from debian-stable
+CDEBOOTSTRAP_VERSION = 0.6.4
+CDEBOOTSTRAP_SOURCE = cdebootstrap_$(CDEBOOTSTRAP_VERSION).tar.gz
+CDEBOOTSTRAP_SITE = http://snapshot.debian.org/archive/debian/20141116T035859Z/pool/main/c/cdebootstrap/
+CDEBOOTSTRAP_LICENSE = GPLv2
+CDEBOOTSTRAP_LICENSE_FILES = debian/copyright
+CDEBOOTSTRAP_DEPENDENCIES = libcurl libdebian-installer zlib bzip2 host-pkgconf xz
+
+$(eval $(autotools-package))
-- 
2.1.4
