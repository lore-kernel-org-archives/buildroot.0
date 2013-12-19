From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 20 Dec 2013 00:43:27 +0100
Subject: [Buildroot] [PATCH 4/5] package/opengl/libopenmax: switch to
	package-defined providers
In-Reply-To: <cover.1387495624.git.yann.morin.1998@free.fr>
References: <cover.1387495624.git.yann.morin.1998@free.fr>
Message-ID: <7adc3cdfacb6010f9ce645085720f165ac0f559f.1387495624.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

For the underlying reasons, see previous patch, titled:
    package/opengl/libegl: switch to package-defined providers

Reported-by: David Corvoysier <david.corvoysier@orange.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: David Corvoysier <david.corvoysier@orange.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
---
 package/bellagio/Config.in              | 7 +++++++
 package/opengl/Config.in                | 4 +---
 package/opengl/libopenmax/Config.in     | 6 ++++++
 package/opengl/libopenmax/libopenmax.mk | 9 +--------
 package/rpi-userland/Config.in          | 3 +++
 5 files changed, 18 insertions(+), 11 deletions(-)
 create mode 100644 package/opengl/libopenmax/Config.in

diff --git a/package/bellagio/Config.in b/package/bellagio/Config.in
index e3da432..2beb658 100644
--- a/package/bellagio/Config.in
+++ b/package/bellagio/Config.in
@@ -17,5 +17,12 @@ config BR2_PACKAGE_BELLAGIO
 
 	  http://omxil.sourceforge.net/
 
+if BR2_PACKAGE_BELLAGIO
+
+config BR2_PACKAGE_PROVIDES_OPENMAX
+	default "bellagio"
+
+endif
+
 comment "bellagio needs a toolchain w/ C++, threads, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
diff --git a/package/opengl/Config.in b/package/opengl/Config.in
index 109cde8..ed81835 100644
--- a/package/opengl/Config.in
+++ b/package/opengl/Config.in
@@ -1,6 +1,4 @@
 source "package/opengl/libegl/Config.in"
 source "package/opengl/libgles/Config.in"
 source "package/opengl/libopenvg/Config.in"
-
-config BR2_PACKAGE_HAS_OPENMAX
-	bool
+source "package/opengl/libopenmax/Config.in"
diff --git a/package/opengl/libopenmax/Config.in b/package/opengl/libopenmax/Config.in
new file mode 100644
index 0000000..105c53e
--- /dev/null
+++ b/package/opengl/libopenmax/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HAS_OPENMAX
+	bool
+
+config BR2_PACKAGE_PROVIDES_OPENMAX
+	depends on BR2_PACKAGE_HAS_OPENMAX
+	string
diff --git a/package/opengl/libopenmax/libopenmax.mk b/package/opengl/libopenmax/libopenmax.mk
index 9e6f89a..8f46ca1 100644
--- a/package/opengl/libopenmax/libopenmax.mk
+++ b/package/opengl/libopenmax/libopenmax.mk
@@ -5,14 +5,7 @@
 ################################################################################
 
 LIBOPENMAX_SOURCE =
-
-ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
-LIBOPENMAX_DEPENDENCIES += rpi-userland
-endif
-
-ifeq ($(BR2_PACKAGE_BELLAGIO),y)
-LIBOPENMAX_DEPENDENCIES += bellagio
-endif
+LIBOPENMAX_DEPENDENCIES = $(BR2_PACKAGE_PROVIDES_OPENMAX)
 
 ifeq ($(LIBOPENMAX_DEPENDENCIES),)
 define LIBOPENMAX_CONFIGURE_CMDS
diff --git a/package/rpi-userland/Config.in b/package/rpi-userland/Config.in
index 271c71d..2303942 100644
--- a/package/rpi-userland/Config.in
+++ b/package/rpi-userland/Config.in
@@ -28,6 +28,9 @@ config BR2_PACKAGE_PROVIDES_OPENGL_ES
 config BR2_PACKAGE_PROVIDES_OPENVG
 	default "rpi-userland"
 
+config BR2_PACKAGE_PROVIDES_OPENMAX
+	default "rpi-userland"
+
 endif
 
 comment "rpi-userland needs a toolchain w/ C++, largefile, threads"
-- 
1.8.1.2
