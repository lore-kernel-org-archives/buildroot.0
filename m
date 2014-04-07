From: Lucile Quirion <lucile.quirion@savoirfairelinux.com>
Date: Mon,  7 Apr 2014 15:17:24 -0400
Subject: [Buildroot] [PATCH 1/1] cppcms: fix build with uClibc
Message-ID: <1396898244-12852-1-git-send-email-lucile.quirion@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch modifies the cppcms package in order to support uClibc-based
toolchains.

The booster library by default compiles with the posix backend under
Linux, but this needs monetary.h which isn't provided by uClibc, so
work around that with the help of the DISABLE_POSIX_LOCALE configure
option.

Signed-off-by: Lucile Quirion <lucile.quirion@savoirfairelinux.com>
---
 package/cppcms/Config.in | 6 ++----
 package/cppcms/cppcms.mk | 5 +++++
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/cppcms/Config.in b/package/cppcms/Config.in
index c88ae1e..2b99b52 100644
--- a/package/cppcms/Config.in
+++ b/package/cppcms/Config.in
@@ -4,8 +4,6 @@ config BR2_PACKAGE_CPPCMS
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_LIBGCRYPT
 	depends on BR2_INSTALL_LIBSTDCPP
-	# cppcms uses <monetary.h> which doesn't exist in uClibc
-	depends on BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  CppCMS is a Free High Performance Web Development Framework
 	  (not a CMS) aimed for Rapid Web Application Development. It
@@ -33,5 +31,5 @@ config BR2_PACKAGE_CPPCMS_ICU
 
 endif
 
-comment "cppcms needs an (e)glibc toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_GLIBC
+comment "cppcms needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/cppcms/cppcms.mk b/package/cppcms/cppcms.mk
index 4068df7..206b30f 100644
--- a/package/cppcms/cppcms.mk
+++ b/package/cppcms/cppcms.mk
@@ -18,6 +18,11 @@ CPPCMS_CONF_OPT += -DDISABLE_ICONV=ON
 CPPCMS_DEPENDENCIES += icu
 endif
 
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+# posix backend needs monetary.h which isn't available on uClibc
+CPPCMS_CONF_OPT += -DDISABLE_POSIX_LOCALE=on
+endif
+
 # We copy cppcms_tmpl_cc from staging to host because this file can be
 # needed for compiling packages using cppcms. And it is not worth
 # creating a host package just for a python script.
-- 
1.9.0
