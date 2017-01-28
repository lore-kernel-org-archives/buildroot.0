From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jan 2017 21:39:35 +1300
Subject: [Buildroot] [git commit] janus-gateway: remove unnecessary
	dependencies
Message-ID: <20170128084141.782AC81E3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e942b7e731a697f1f77793a7adeb17c72bc411c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

janus-gateway currently depends on several dependencies that are not
mandatory. This commit removes all non-mandatory dependencies. The
build has been tested to work fine with this reduced set of
dependencies.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
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
