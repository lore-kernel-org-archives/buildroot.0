From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Dec 2015 17:03:50 +0100
Subject: [Buildroot] [git commit] hiawatha: bump to version 10.0
Message-ID: <20151229164030.CADE1826E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9e025b20a925f52c26be907a2463a2252ac1bc10
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now uses the new mbedtls package, and requires zlib.
Rename the SSL option description to TLS, but keep the same symbol
name to avoid pointless legacy.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/hiawatha/Config.in     | 10 ++++++----
 package/hiawatha/hiawatha.hash |  2 +-
 package/hiawatha/hiawatha.mk   |  9 +++++----
 3 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/package/hiawatha/Config.in b/package/hiawatha/Config.in
index 5333697..68e47fd 100644
--- a/package/hiawatha/Config.in
+++ b/package/hiawatha/Config.in
@@ -1,12 +1,14 @@
-comment "hiawatha needs a toolchain w/ threads"
+comment "hiawatha needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_HIAWATHA
 	bool "hiawatha"
 	# needs fork()
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_ZLIB
 	help
 	  Hiawatha is a webserver for Unix and has been built with
 	  security in mind. This resulted in a highly secure
@@ -27,7 +29,7 @@ config BR2_PACKAGE_HIAWATHA
 if BR2_PACKAGE_HIAWATHA
 
 config BR2_PACKAGE_HIAWATHA_SSL
-	bool "hiawatha SSL support"
-	select BR2_PACKAGE_POLARSSL
+	bool "hiawatha TLS support"
+	select BR2_PACKAGE_MBEDTLS
 
 endif
diff --git a/package/hiawatha/hiawatha.hash b/package/hiawatha/hiawatha.hash
index a9ac716..af59e9f 100644
--- a/package/hiawatha/hiawatha.hash
+++ b/package/hiawatha/hiawatha.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	5d9cdec51c618bb3efab747030e593d9bd49dfaf3236254c8e0cb60715716dbf	hiawatha-9.2.tar.gz
+sha256	a39d1f771d818025538bd1231f42001bf29a1ebf55ce3d82afb7305cc251dd0e	hiawatha-10.0.tar.gz
diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
index 91c972d..411853b 100644
--- a/package/hiawatha/hiawatha.mk
+++ b/package/hiawatha/hiawatha.mk
@@ -4,16 +4,17 @@
 #
 ################################################################################
 
-HIAWATHA_VERSION = 9.2
+HIAWATHA_VERSION = 10.0
 HIAWATHA_SITE = http://www.hiawatha-webserver.org/files
+HIAWATHA_DEPENDENCIES = zlib
 HIAWATHA_LICENSE = GPLv2
 HIAWATHA_LICENSE_FILES = LICENSE
 
 ifeq ($(BR2_PACKAGE_HIAWATHA_SSL),y)
-HIAWATHA_CONF_OPTS += -DUSE_SYSTEM_POLARSSL=ON
-HIAWATHA_DEPENDENCIES += polarssl
+HIAWATHA_CONF_OPTS += -DUSE_SYSTEM_MBEDTLS=ON
+HIAWATHA_DEPENDENCIES += mbedtls
 else
-HIAWATHA_CONF_OPTS += -DENABLE_SSL=OFF
+HIAWATHA_CONF_OPTS += -DENABLE_TLS=OFF
 endif
 
 HIAWATHA_CONF_OPTS += \
