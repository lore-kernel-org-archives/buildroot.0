From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 16:08:57 +0100
Subject: [Buildroot] [git commit] package/apitrace: bump to version 9.0
Message-ID: <20191208150108.448AB80080@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=980476fdae654e79670a44b58d3e79418bd9a6f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to upstream version 9.0, released 2019-11-26.

This may have been the case already in 8.0, but it is possible to
compile without X11 by just specifying ENABLE_X11=OFF, so the package
was updated to remove the X11 dependency.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/apitrace/Config.in     |  4 +---
 package/apitrace/apitrace.hash |  2 +-
 package/apitrace/apitrace.mk   | 11 +++++++++--
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/package/apitrace/Config.in b/package/apitrace/Config.in
index b622823c29..c1be619f1b 100644
--- a/package/apitrace/Config.in
+++ b/package/apitrace/Config.in
@@ -1,5 +1,4 @@
 comment "apitrace needs a glibc toolchain w/ C++, gcc >= 4.9"
-	depends on BR2_PACKAGE_XORG7
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_GLIBC \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
@@ -8,8 +7,7 @@ config BR2_PACKAGE_APITRACE
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_USES_GLIBC # uses glibc specific __libc_dlsym
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-	depends on BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBPNG
 	help
 	  Trace and replay OpenGL and OpenGL ES APIs calls to/from a
diff --git a/package/apitrace/apitrace.hash b/package/apitrace/apitrace.hash
index c6086da5f4..9479f06425 100644
--- a/package/apitrace/apitrace.hash
+++ b/package/apitrace/apitrace.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 45f61fb4859606ee54ebfd7dd8a4dedce18b9fe8a2523bbd23526bd9413b6b6c  apitrace-8.0.tar.gz
+sha256 0eec81ba7d3799622336319785465a2982a0621898842517a07894d7e2aa18eb  apitrace-9.0.tar.gz
 sha256 7066bb1b787519c42f8278b77757c21de522cd97755cb30a22759ac401c62260  LICENSE
diff --git a/package/apitrace/apitrace.mk b/package/apitrace/apitrace.mk
index 3a3d1c9a82..f9886d33c1 100644
--- a/package/apitrace/apitrace.mk
+++ b/package/apitrace/apitrace.mk
@@ -4,12 +4,19 @@
 #
 ################################################################################
 
-APITRACE_VERSION = 8.0
+APITRACE_VERSION = 9.0
 APITRACE_SITE = $(call github,apitrace,apitrace,$(APITRACE_VERSION))
 APITRACE_LICENSE = MIT
 APITRACE_LICENSE_FILES = LICENSE
 
-APITRACE_DEPENDENCIES = xlib_libX11 host-python libpng
+APITRACE_DEPENDENCIES = host-python libpng
+
+ifeq ($(BR2_PACKAGE_XORG7),y)
+APITRACE_DEPENDENCIES += xlib_libX11
+APITRACE_CONF_OPTS += -DENABLE_X11=ON
+else
+APITRACE_CONF_OPTS += -DENABLE_X11=OFF
+endif
 
 # Gui was never tested, so we prefer to explicitly disable it
 APITRACE_CONF_OPTS += -DENABLE_GUI=false
