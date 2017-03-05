From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  5 Mar 2017 16:10:03 +0100
Subject: [Buildroot] [PATCH 8/9] package/libgphoto2: new package
In-Reply-To: <20170305151004.2815-1-romain.naour@gmail.com>
References: <20170305151004.2815-1-romain.naour@gmail.com>
Message-ID: <20170305151004.2815-8-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Jeremy Rosen <jeremy.rosen@enst-bretagne.fr>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/libgphoto2/Config.in       | 20 ++++++++++++++++++++
 package/libgphoto2/libgphoto2.hash |  5 +++++
 package/libgphoto2/libgphoto2.mk   | 16 ++++++++++++++++
 5 files changed, 43 insertions(+)
 create mode 100644 package/libgphoto2/Config.in
 create mode 100644 package/libgphoto2/libgphoto2.hash
 create mode 100644 package/libgphoto2/libgphoto2.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 8b64244..b7b203e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1293,6 +1293,7 @@ F:	package/expedite/
 F:	package/iqvlinux/
 F:	package/liblinear/
 F:	package/lensfun/
+F:	package/libgphoto2/
 F:	package/linux-syscall-support/
 F:	package/lugaru/
 F:	package/mcelog/
diff --git a/package/Config.in b/package/Config.in
index 7f11791..fd010ba 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1071,6 +1071,7 @@ menu "Hardware handling"
 	source "package/libfreefare/Config.in"
 	source "package/libftdi/Config.in"
 	source "package/libftdi1/Config.in"
+	source "package/libgphoto2/Config.in"
 	source "package/libgpiod/Config.in"
 	source "package/libgudev/Config.in"
 	source "package/libhid/Config.in"
diff --git a/package/libgphoto2/Config.in b/package/libgphoto2/Config.in
new file mode 100644
index 0000000..eb48f9c
--- /dev/null
+++ b/package/libgphoto2/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_LIBGPHOTO2
+	bool "libgphoto2"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_GD
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBEXIF
+	select BR2_PACKAGE_LIBTOOL
+	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_LOCKDEV
+	help
+	  libgphoto2 is a library that can be used by applications to
+	  access various digital cameras.
+
+	  http://www.gphoto.org
+
+comment "libgphoto2 needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+
+#	depends on BR2_INSTALL_LIBSTDCPP
diff --git a/package/libgphoto2/libgphoto2.hash b/package/libgphoto2/libgphoto2.hash
new file mode 100644
index 0000000..4612fda
--- /dev/null
+++ b/package/libgphoto2/libgphoto2.hash
@@ -0,0 +1,5 @@
+# https://sourceforge.net/projects/gphoto/files/libgphoto/2.5.12/
+md5 a5999acc204c31515a6ec8e517d2cd91 libgphoto2-2.5.12.tar.bz2
+sha1 4ded403b87d46ad49ba88b22b9410789ed3cef10 libgphoto2-2.5.12.tar.bz2
+# Locally computed
+sha256 b9bb28990fde45ac385e4851a07dbad2e1250404b535b0a3a3b898bb431e4e2e libgphoto2-2.5.12.tar.bz2
diff --git a/package/libgphoto2/libgphoto2.mk b/package/libgphoto2/libgphoto2.mk
new file mode 100644
index 0000000..bb57091
--- /dev/null
+++ b/package/libgphoto2/libgphoto2.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# libgphoto2
+#
+################################################################################
+
+LIBGPHOTO2_VERSION = 2.5.12
+LIBGPHOTO2_SITE = https://sourceforge.net/projects/gphoto/files/libgphoto/$(LIBGPHOTO2_VERSION)
+LIBGPHOTO2_SOURCE = libgphoto2-$(LIBGPHOTO2_VERSION).tar.bz2
+LIBGPHOTO2_LICENSE = LGPLv2.1+
+LIBGPHOTO2_LICENSE_FILES = COPYING
+LIBGPHOTO2_INSTALL_STAGING = YES
+
+LIBGPHOTO2_DEPENDENCIES = host-pkgconf gd jpeg libexif libtool libusb libxml2 lockdev
+
+$(eval $(autotools-package))
-- 
2.9.3
