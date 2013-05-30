From: Will Wagner <will_wagner@carallon.com>
Date: Thu, 30 May 2013 14:08:05 +0100
Subject: [Buildroot] [PATCH] opengl: correct detection of virtual packages
	having no dependencies
Message-ID: <51A74F35.2050403@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I believe the original intent was to make it that the configure step
for the opengl virtual packages fails if there is not at least one
dependency. This patch fixes the logic so that it actually fails if
dependency list is empty

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
  package/opengl/libegl/libegl.mk       |    2 +-
  package/opengl/libgles/libgles.mk     |    2 +-
  package/opengl/libopenvg/libopenvg.mk |    2 +-
  3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/opengl/libegl/libegl.mk 
b/package/opengl/libegl/libegl.mk
index c495496..8ff24e8 100644
--- a/package/opengl/libegl/libegl.mk
+++ b/package/opengl/libegl/libegl.mk
@@ -10,7 +10,7 @@ ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
  LIBEGL_DEPENDENCIES += rpi-userland
  endif

-ifeq ($(LIBEGL_DEPENDENCIES),y)
+ifeq ($(LIBEGL_DEPENDENCIES),)
  define LIBEGL_CONFIGURE_CMDS
  	echo "No libEGL implementation selected. Configuration error."
  	exit 1
diff --git a/package/opengl/libgles/libgles.mk 
b/package/opengl/libgles/libgles.mk
index f0d0eec..675d11f 100644
--- a/package/opengl/libgles/libgles.mk
+++ b/package/opengl/libgles/libgles.mk
@@ -10,7 +10,7 @@ ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
  LIBGLES_DEPENDENCIES += rpi-userland
  endif

-ifeq ($(LIBGLES_DEPENDENCIES),y)
+ifeq ($(LIBGLES_DEPENDENCIES),)
  define LIBGLES_CONFIGURE_CMDS
  	echo "No libGLES implementation selected. Configuration error."
  	exit 1
diff --git a/package/opengl/libopenvg/libopenvg.mk 
b/package/opengl/libopenvg/libopenvg.mk
index 573fa78..746b52c 100644
--- a/package/opengl/libopenvg/libopenvg.mk
+++ b/package/opengl/libopenvg/libopenvg.mk
@@ -10,7 +10,7 @@ ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
  LIBOPENVG_DEPENDENCIES += rpi-userland
  endif

-ifeq ($(LIBOPENVG_DEPENDENCIES),y)
+ifeq ($(LIBOPENVG_DEPENDENCIES),)
  define LIBOPENVG_CONFIGURE_CMDS
  	echo "No libOpenVG implementation selected. Configuration error."
  	exit 1
--
1.7.2.5
