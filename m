From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 19 Jan 2014 22:03:58 +0100
Subject: [Buildroot] [PATCH v3 02/12] libcdio: new package
In-Reply-To: <1390165448-9130-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1390165448-9130-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1390165448-9130-3-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The GNU Compact Disc Input and Control library.
This package was originally found at : https://github.com/huceke/buildroot-rbp
By gimli <ebsi4711@gmail.com>

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: gimli <ebsi4711@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
Changes v2 -> v3:
  - None
Changes v1 -> v2
  - Bump version to 0.90 (Bernd Kuhls)
  - Fix comment for requiring C++ (Peter Korsgaard)
---
 package/Config.in          |  1 +
 package/libcdio/Config.in  | 11 +++++++++++
 package/libcdio/libcdio.mk | 18 ++++++++++++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 package/libcdio/Config.in
 create mode 100644 package/libcdio/libcdio.mk

diff --git a/package/Config.in b/package/Config.in
index 3f78651..749ffea 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -451,6 +451,7 @@ source "package/celt051/Config.in"
 source "package/fdk-aac/Config.in"
 source "package/libao/Config.in"
 source "package/libcdaudio/Config.in"
+source "package/libcdio/Config.in"
 source "package/libcue/Config.in"
 source "package/libcuefile/Config.in"
 source "package/libid3tag/Config.in"
diff --git a/package/libcdio/Config.in b/package/libcdio/Config.in
new file mode 100644
index 0000000..d2d61e7
--- /dev/null
+++ b/package/libcdio/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBCDIO
+	bool "libcdio"
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  The GNU Compact Disc Input and Control library.
+
+	  http://www.gnu.org/software/libcdio/
+
+comment "libcdio needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/libcdio/libcdio.mk b/package/libcdio/libcdio.mk
new file mode 100644
index 0000000..a55c7b4
--- /dev/null
+++ b/package/libcdio/libcdio.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# libcdio
+#
+################################################################################
+
+LIBCDIO_VERSION = 0.90
+LIBCDIO_SITE = $(BR2_GNU_MIRROR)/libcdio
+LIBCDIO_INSTALL_STAGING = YES
+LIBCDIO_LICENSE = GPLv3+
+LIBCDIO_LICENSE_FILES = COPYING
+LIBCDIO_CONF_OPT = --disable-example-progs
+
+ifeq ($(BR2_ENABLE_LOCALE),)
+LIBCDIO_DEPENDENCIES = libiconv
+endif
+
+$(eval $(autotools-package))
-- 
1.8.5.2
