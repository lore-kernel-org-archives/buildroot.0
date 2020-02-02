From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  2 Feb 2020 22:37:34 +0100
Subject: [Buildroot] [PATCH 1/1] package/libmodsecurity: needs threads
Message-ID: <20200202213734.1787224-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/78391abbf87ac9c04b13d7aab7acf7d1aaade75d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmodsecurity/Config.in    | 6 ++++--
 package/nginx-modsecurity/Config.in | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/libmodsecurity/Config.in b/package/libmodsecurity/Config.in
index 129881b0de..ea58c6d0e2 100644
--- a/package/libmodsecurity/Config.in
+++ b/package/libmodsecurity/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBMODSECURITY
 	bool "libmodsecurity"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_PCRE
 	help
 	  Libmodsecurity is one component of the ModSecurity
@@ -15,5 +16,6 @@ config BR2_PACKAGE_LIBMODSECURITY
 
 	  https://github.com/SpiderLabs/ModSecurity
 
-comment "libmodsecurity needs a toolchain w/ C++, dynamic library"
-	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
+comment "libmodsecurity needs a toolchain w/ C++, dynamic library, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/nginx-modsecurity/Config.in b/package/nginx-modsecurity/Config.in
index aa9d53a3fe..2af11eeee2 100644
--- a/package/nginx-modsecurity/Config.in
+++ b/package/nginx-modsecurity/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_NGINX_MODSECURITY
 	depends on BR2_PACKAGE_NGINX_HTTP
 	depends on BR2_INSTALL_LIBSTDCPP # libmodsecurity
 	depends on !BR2_STATIC_LIBS # libmodsecurity
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libmodsecurity
 	select BR2_PACKAGE_PCRE # libmodsecurity
 	select BR2_PACKAGE_LIBMODSECURITY
 	help
@@ -12,6 +13,7 @@ config BR2_PACKAGE_NGINX_MODSECURITY
 
 	  https://github.com/SpiderLabs/ModSecurity-nginx
 
-comment "nginx-modsecurity needs a toolchain w/ C++, dynamic library"
+comment "nginx-modsecurity needs a toolchain w/ C++, dynamic library, threads"
 	depends on BR2_PACKAGE_NGINX_HTTP
-	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HAS_THREADS
-- 
2.24.1
