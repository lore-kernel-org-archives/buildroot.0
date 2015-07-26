From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 26 Jul 2015 20:55:36 +0200
Subject: [Buildroot] [RFC 26/37] package/expedite: bump to efl-1.14 branch
In-Reply-To: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
References: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1437936947-17632-27-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since expedite hasn't been released since 1.7.10 release,
use efl-1.14 branch in the git tree.

Autoreconf the package since there is no configure script
in the git tree.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/expedite/Config.in   | 15 +++++++--------
 package/expedite/expedite.mk | 11 ++++++++---
 2 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/package/expedite/Config.in b/package/expedite/Config.in
index 5d48af3..815ee2b 100644
--- a/package/expedite/Config.in
+++ b/package/expedite/Config.in
@@ -1,17 +1,16 @@
 config BR2_PACKAGE_EXPEDITE
 	bool "expedite"
-	select BR2_PACKAGE_LIBEINA
-	select BR2_PACKAGE_LIBEVAS
-	select BR2_PACKAGE_LIBEET
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libevas
+	select BR2_PACKAGE_EFL
+	depends on BR2_INSTALL_LIBSTDCPP # efl
+	depends on BR2_PACKAGE_HAS_UDEV # efl -> libudev
+	depends on BR2_TOOLCHAIN_USES_GLIBC # efl
 	depends on BR2_USE_MMU # efl
-	depends on BR2_USE_WCHAR # efl
 	help
 	  Expedite is the official Evas benchmark tool. It can test different
 	  engines, such as X11, XRender, OpenGL (also ES variant), SDL,
 	  DirectFB and so on. Its tests are quite extensive, trying to
 	  reproduce real world usage cases.
 
-comment "expedite needs a toolchain w/ C++, threads, wchar"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+comment "expedite needs udev /dev management and a (e)glibc toolchain w/ C++"
+	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_USE_MMU
diff --git a/package/expedite/expedite.mk b/package/expedite/expedite.mk
index 9b232f8..b9135e9 100644
--- a/package/expedite/expedite.mk
+++ b/package/expedite/expedite.mk
@@ -4,12 +4,17 @@
 #
 ################################################################################
 
-EXPEDITE_VERSION = 1.7.10
-EXPEDITE_SITE = http://download.enlightenment.org/releases
+# efl-1.14 branch
+EXPEDITE_VERSION = 9b7d97d5034de22cf8090f5f598eeceab5aa1165
+EXPEDITE_SITE = http://git.enlightenment.org/tools/expedite.git
+EXPEDITE_SITE_METHOD = git
 EXPEDITE_LICENSE = BSD-2c
 EXPEDITE_LICENSE_FILES = COPYING
 
-EXPEDITE_DEPENDENCIES = libevas libeina libeet
+EXPEDITE_DEPENDENCIES = host-efl efl
+
+# There is no configure script in the git tree.
+EXPEDITE_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_LIBEVAS_X11),y)
 EXPEDITE_CONF_OPTS += --with-x=$(STAGING_DIR) \
-- 
2.4.3
