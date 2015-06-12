From: Pieter De Gendt <pieter.degendt@gmail.com>
Date: Fri, 12 Jun 2015 12:05:51 +0200
Subject: [Buildroot] [PATCH v2 1/1] libmusicbrainz: new package
Message-ID: <1434103551-11465-1-git-send-email-pieter.degendt@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This library is built for both host and target platform as
required by cmake. This implies that dependencies are also
built for the host platform (neon).

Signed-off-by: Pieter De Gendt <pieter.degendt@gmail.com>
---
Changes v1 -> v2: (suggested by Thomas Petazzoni)
  - Added license info
  - Added comment for clarification

 package/Config.in                        |  1 +
 package/libmusicbrainz/Config.in         | 18 ++++++++++++++++++
 package/libmusicbrainz/libmusicbrainz.mk | 21 +++++++++++++++++++++
 package/neon/neon.mk                     |  1 +
 4 files changed, 41 insertions(+)
 create mode 100644 package/libmusicbrainz/Config.in
 create mode 100644 package/libmusicbrainz/libmusicbrainz.mk

diff --git a/package/Config.in b/package/Config.in
index a17901f..3339669 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -681,6 +681,7 @@ menu "Audio/Sound"
 	source "package/libmodplug/Config.in"
 	source "package/libmpd/Config.in"
 	source "package/libmpdclient/Config.in"
+	source "package/libmusicbrainz/Config.in"
 	source "package/libreplaygain/Config.in"
 	source "package/libsamplerate/Config.in"
 	source "package/libsidplay2/Config.in"
diff --git a/package/libmusicbrainz/Config.in b/package/libmusicbrainz/Config.in
new file mode 100644
index 0000000..51417fe
--- /dev/null
+++ b/package/libmusicbrainz/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_LIBMUSICBRAINZ
+	bool "libmusicbrainz"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_NEON
+	select BR2_PACKAGE_NEON_LIBXML2
+	help
+	  The MusicBrainz Client Library (libmusicbrainz), 
+	  also known as mb_client, is a development library 
+	  geared towards developers who wish to add MusicBrainz 
+	  lookup capabilities to their applications. The library 
+	  supports Windows, Linux and Mac OS X, with packages 
+	  released for the RedHat and Debian distributions.
+
+	  http://musicbrainz.org/doc/libmusicbrainz
+
+comment "libmusicbrainz needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/libmusicbrainz/libmusicbrainz.mk b/package/libmusicbrainz/libmusicbrainz.mk
new file mode 100644
index 0000000..7422259
--- /dev/null
+++ b/package/libmusicbrainz/libmusicbrainz.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# libmusicbrainz
+#
+################################################################################
+
+LIBMUSICBRAINZ_VERSION = release-5.1.0
+LIBMUSICBRAINZ_SITE = $(call github,metabrainz,libmusicbrainz,$(LIBMUSICBRAINZ_VERSION))
+LIBMUSICBRAINZ_LICENSE = LGPLv2.1
+LIBMUSICBRAINZ_LICENSE_FILES = COPYING.txt
+LIBMUSICBRAINZ_INSTALL_STAGING = YES
+
+# Cross compilation requires host compilation due to the
+# automatic generation of the C interface source files (see INSTALL.txt)
+LIBMUSICBRAINZ_DEPENDENCIES = libxml2 neon host-pkgconf host-libmusicbrainz
+
+# Cross compilation variable for cmake to find the host generated files
+LIBMUSICBRAINZ_CONF_OPTS = -DIMPORT_EXECUTABLES=$(HOST_LIBMUSICBRAINZ_DIR)/ImportExecutables.cmake
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index 0cff1a2..284a98c 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -48,3 +48,4 @@ NEON_CONF_OPTS += --disable-webdav
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.4.3
