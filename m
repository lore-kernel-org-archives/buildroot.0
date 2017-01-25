From: Adam Duskett <aduskett@gmail.com>
Date: Wed, 25 Jan 2017 08:42:36 -0500
Subject: [Buildroot] [V3 01/10] janus-gateway: remove unessasary
	dependencies.
Message-ID: <20170125134245.12920-1-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Janus gateway currently depends on several dependencies that are not
necessary.  I removed every select and depend from the config file and
re-enabled each dependency until I had a list of the bare minimum needed
to compile the package.  I also removed sofia-sip from the dependency
list for the following patch.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
v2 - v3:
 - No changes

v1 - v2:
 - No changes

 package/janus-gateway/Config.in        | 7 ++-----
 package/janus-gateway/janus-gateway.mk | 4 ++--
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index 20491b7..b9a2c66 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -1,14 +1,11 @@
 config BR2_PACKAGE_JANUS_GATEWAY
 	bool "janus-gateway"
-	select BR2_PACKAGE_LIBMICROHTTPD
 	select BR2_PACKAGE_JANSSON
+	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBNICE
-	select BR2_PACKAGE_SOFIA_SIP
 	select BR2_PACKAGE_LIBSRTP
 	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_DING_LIBS
-	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt, libmicrohttpd
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, libmicrohttpd
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_WCHAR # libnice -> libglib2
 	depends on BR2_USE_MMU # libnice
 	depends on !BR2_STATIC_LIBS # dlopen
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index 4b87b33..1b83768 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -10,8 +10,8 @@ JANUS_GATEWAY_LICENSE = GPLv3
 JANUS_GATEWAY_LICENSE_FILES = COPYING
 
 # ding-libs provides the ini_config library
-JANUS_GATEWAY_DEPENDENCIES = host-pkgconf libmicrohttpd jansson \
-	libnice sofia-sip libsrtp host-gengetopt openssl ding-libs
+JANUS_GATEWAY_DEPENDENCIES = host-pkgconf jansson libnice \
+	libsrtp host-gengetopt libglib2 openssl 
 
 # Straight out of the repository, no ./configure, and we also patch
 # configure.ac.
-- 
2.9.3
