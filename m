From: Romain Naour <romain.naour@openwide.fr>
Date: Tue,  8 Sep 2015 23:20:01 +0200
Subject: [Buildroot] [PACH v2 27/38] package/expedite: bump to efl-1.15
	branch
In-Reply-To: <1441747212-27421-1-git-send-email-romain.naour@openwide.fr>
References: <1441747212-27421-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1441747212-27421-28-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since expedite hasn't been released since 1.7.10 release,
use efl-1.15 branch in the git tree.

Autoreconf the package since there is no configure script
in the git tree.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v2: bump to 1.15 branch
---
 package/expedite/Config.in   | 14 +++++++-------
 package/expedite/expedite.mk | 11 ++++++++---
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/package/expedite/Config.in b/package/expedite/Config.in
index 5d48af3..755309f 100644
--- a/package/expedite/Config.in
+++ b/package/expedite/Config.in
@@ -1,11 +1,10 @@
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
 	depends on BR2_USE_MMU # efl
+	depends on !BR2_STATIC_LIBS # efl
 	depends on BR2_USE_WCHAR # efl
 	help
 	  Expedite is the official Evas benchmark tool. It can test different
@@ -13,5 +12,6 @@ config BR2_PACKAGE_EXPEDITE
 	  DirectFB and so on. Its tests are quite extensive, trying to
 	  reproduce real world usage cases.
 
-comment "expedite needs a toolchain w/ C++, threads, wchar"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+comment "expedite needs udev /dev management and a toolchain w/ C++, dynamic library, wchar"
+	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_USE_WCHAR
+	depends on BR2_USE_MMU
diff --git a/package/expedite/expedite.mk b/package/expedite/expedite.mk
index 9b232f8..7cab3ad 100644
--- a/package/expedite/expedite.mk
+++ b/package/expedite/expedite.mk
@@ -4,12 +4,17 @@
 #
 ################################################################################
 
-EXPEDITE_VERSION = 1.7.10
-EXPEDITE_SITE = http://download.enlightenment.org/releases
+# efl-1.15 branch
+EXPEDITE_VERSION = 3ce8b3f1451700f9a2da60c2e717c644220e2449
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
