From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  5 Mar 2017 16:09:56 +0100
Subject: [Buildroot] [PATCH 1/9] package/lensfun: new package
Message-ID: <20170305151004.2815-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Jeremy Rosen <jeremy.rosen@enst-bretagne.fr>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/lensfun/Config.in    | 28 ++++++++++++++++++++++++++++
 package/lensfun/lensfun.hash |  5 +++++
 package/lensfun/lensfun.mk   | 41 +++++++++++++++++++++++++++++++++++++++++
 5 files changed, 76 insertions(+)
 create mode 100644 package/lensfun/Config.in
 create mode 100644 package/lensfun/lensfun.hash
 create mode 100644 package/lensfun/lensfun.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 28ec0b8..c9c9255 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1291,6 +1291,7 @@ F:	package/enlightenment/
 F:	package/expedite/
 F:	package/iqvlinux/
 F:	package/liblinear/
+F:	package/lensfun/
 F:	package/linux-syscall-support/
 F:	package/lugaru/
 F:	package/mcelog/
diff --git a/package/Config.in b/package/Config.in
index 0b7aedd..8b5ba05 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1003,6 +1003,7 @@ menu "Graphics"
 	source "package/jpeg/Config.in"
 	source "package/kmsxx/Config.in"
 	source "package/lcms2/Config.in"
+	source "package/lensfun/Config.in"
 	source "package/lesstif/Config.in"
 	source "package/libart/Config.in"
 	source "package/libdmtx/Config.in"
diff --git a/package/lensfun/Config.in b/package/lensfun/Config.in
new file mode 100644
index 0000000..3095238
--- /dev/null
+++ b/package/lensfun/Config.in
@@ -0,0 +1,28 @@
+config BR2_PACKAGE_LENSFUN
+	bool "lensfun"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
+	help
+	  Lensfun itself is only a library for correcting several
+	  artefacts and a database for storing lens profiles. To
+	  actually use Lensfun to process your images you need an image
+	  editing application with Lensfun support.
+
+	  http://lensfun.sourceforge.net
+
+if BR2_PACKAGE_LENSFUN
+
+config BR2_PACKAGE_LENSFUN_TOOLS
+	bool "lensfun tools"
+	select BR2_PACKAGE_LIBPNG
+	help
+	  Build the lenstool
+
+endif
+
+comment "lensfun needs a toolchain w/ C++, threads, wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_USE_WCHAR
diff --git a/package/lensfun/lensfun.hash b/package/lensfun/lensfun.hash
new file mode 100644
index 0000000..a60f8f4
--- /dev/null
+++ b/package/lensfun/lensfun.hash
@@ -0,0 +1,5 @@
+# From https://sourceforge.net/projects/lensfun/files/0.3.2
+sha1 1d978b15aa7304d66a4931fa37ca9f8f89396c16 lensfun-0.3.2.tar.gz
+md5 247e59a0812ec451f6cd0d20b3379cb5 lensfun-0.3.2.tar.gz
+# Locally calculated
+sha256 ae8bcad46614ca47f5bda65b00af4a257a9564a61725df9c74cb260da544d331 lensfun-0.3.2.tar.gz
diff --git a/package/lensfun/lensfun.mk b/package/lensfun/lensfun.mk
new file mode 100644
index 0000000..8e92e59
--- /dev/null
+++ b/package/lensfun/lensfun.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# lensfun
+#
+################################################################################
+
+LENSFUN_VERSION = 0.3.2
+LENSFUN_SITE = https://sourceforge.net/projects/lensfun/files/$(LENSFUN_VERSION)
+LENSFUN_LICENSE = LGPLv3+ (libraries), GPLv3+ (programs)
+LENSFUN_LICENSE_FILES = docs/gpl-3.0.txt docs/lgpl-3.0.txt
+LENSFUN_INSTALL_STAGING = YES
+LENSFUN_DEPENDENCIES = libglib2
+
+# lensfun doesn't support in source build, it fail to build lensfun tools.
+LENSFUN_SUPPORTS_IN_SOURCE_BUILD = NO
+
+ifeq ($(BR2_X86_CPU_HAS_SSE),y)
+LENSFUN_CONF_OPTS += -DBUILD_FOR_SSE=ON
+else
+LENSFUN_CONF_OPTS += -DBUILD_FOR_SSE=OFF
+endif
+
+ifeq ($(BR2_X86_CPU_HAS_SSE2),y)
+LENSFUN_CONF_OPTS += -DBUILD_FOR_SSE2=ON
+else
+LENSFUN_CONF_OPTS += -DBUILD_FOR_SSE2=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LENSFUN_TOOLS),y)
+LENSFUN_DEPENDENCIES += libpng
+LENSFUN_CONF_OPTS += -DBUILD_LENSTOOL=ON
+# broken
+else
+LENSFUN_CONF_OPTS += -DBUILD_LENSTOOL=OFF
+endif
+
+# Don't install helper scripts (which require python3 and gksudo).
+# Don't run setup.py on the host.
+LENSFUN_CONF_OPTS += -DINSTALL_HELPER_SCRIPTS=OFF -DPYTHON=OFF
+
+$(eval $(cmake-package))
-- 
2.9.3
