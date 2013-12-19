From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 20 Dec 2013 00:43:26 +0100
Subject: [Buildroot] [PATCH 3/5] package/opengl/libopenvg: switch to
	package-defined providers
In-Reply-To: <cover.1387495624.git.yann.morin.1998@free.fr>
References: <cover.1387495624.git.yann.morin.1998@free.fr>
Message-ID: <262dfa040e0280bbb2a618f6b1cf7691913fe491.1387495624.git.yann.morin.1998@free.fr>
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
 package/opengl/Config.in              | 4 +---
 package/opengl/libopenvg/Config.in    | 6 ++++++
 package/opengl/libopenvg/libopenvg.mk | 5 +----
 package/rpi-userland/Config.in        | 3 +++
 4 files changed, 11 insertions(+), 7 deletions(-)
 create mode 100644 package/opengl/libopenvg/Config.in

diff --git a/package/opengl/Config.in b/package/opengl/Config.in
index 3960082..109cde8 100644
--- a/package/opengl/Config.in
+++ b/package/opengl/Config.in
@@ -1,8 +1,6 @@
 source "package/opengl/libegl/Config.in"
 source "package/opengl/libgles/Config.in"
-
-config BR2_PACKAGE_HAS_OPENVG
-	bool
+source "package/opengl/libopenvg/Config.in"
 
 config BR2_PACKAGE_HAS_OPENMAX
 	bool
diff --git a/package/opengl/libopenvg/Config.in b/package/opengl/libopenvg/Config.in
new file mode 100644
index 0000000..9d31525
--- /dev/null
+++ b/package/opengl/libopenvg/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HAS_OPENVG
+	bool
+
+config BR2_PACKAGE_PROVIDES_OPENVG
+	depends on BR2_PACKAGE_HAS_OPENVG
+	string
diff --git a/package/opengl/libopenvg/libopenvg.mk b/package/opengl/libopenvg/libopenvg.mk
index 3296f63..e1e00e9 100644
--- a/package/opengl/libopenvg/libopenvg.mk
+++ b/package/opengl/libopenvg/libopenvg.mk
@@ -5,10 +5,7 @@
 ################################################################################
 
 LIBOPENVG_SOURCE =
-
-ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
-LIBOPENVG_DEPENDENCIES += rpi-userland
-endif
+LIBOPENVG_DEPENDENCIES = $(BR2_PACKAGE_PROVIDES_OPENVG)
 
 ifeq ($(LIBOPENVG_DEPENDENCIES),)
 define LIBOPENVG_CONFIGURE_CMDS
diff --git a/package/rpi-userland/Config.in b/package/rpi-userland/Config.in
index b8860d6..271c71d 100644
--- a/package/rpi-userland/Config.in
+++ b/package/rpi-userland/Config.in
@@ -25,6 +25,9 @@ config BR2_PACKAGE_PROVIDES_OPENGL_EGL
 config BR2_PACKAGE_PROVIDES_OPENGL_ES
 	default "rpi-userland"
 
+config BR2_PACKAGE_PROVIDES_OPENVG
+	default "rpi-userland"
+
 endif
 
 comment "rpi-userland needs a toolchain w/ C++, largefile, threads"
-- 
1.8.1.2
