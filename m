From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 12:15:36 +0100
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 18.3.1
Message-ID: <20181216111230.7CA248D5B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=875efa45b05a148ae8a0516d3b8eabd5cac08c97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport patch needed to fix error: ???NULL??? undeclared
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d-headers/mesa3d-headers.mk           |  2 +-
 ...d-missing-include-stddef.h-in-egldevice.h.patch | 47 ++++++++++++++++++++++
 package/mesa3d/mesa3d.hash                         | 10 ++---
 package/mesa3d/mesa3d.mk                           |  2 +-
 4 files changed, 54 insertions(+), 7 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index eba9ee6df9..710cebe070 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 18.3.0
+MESA3D_HEADERS_VERSION = 18.3.1
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/0004-egl-add-missing-include-stddef.h-in-egldevice.h.patch b/package/mesa3d/0004-egl-add-missing-include-stddef.h-in-egldevice.h.patch
new file mode 100644
index 0000000000..04621eeabd
--- /dev/null
+++ b/package/mesa3d/0004-egl-add-missing-include-stddef.h-in-egldevice.h.patch
@@ -0,0 +1,47 @@
+From eb44c36cf1729e7e200b77cf8ea755dff72d1639 Mon Sep 17 00:00:00 2001
+From: Gurchetan Singh <gurchetansingh@chromium.org>
+Date: Wed, 28 Nov 2018 08:39:34 -0800
+Subject: [PATCH] egl: add missing #include <stddef.h> in egldevice.h
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Otherwise, I get this error:
+
+main/egldevice.h:54:13: error: ???NULL??? undeclared (first use in this function)
+       dev = NULL;
+             ^~~~
+with this config:
+
+./autogen.sh --enable-gles1 --enable-gles2 --with-platforms='surfaceless' --disable-glx
+             --with-dri-drivers="i965" --with-gallium-drivers="" --enable-gbm
+
+v3: Use stddef.h (Matt)
+v4: Modify commit message (Eric)
+
+Reviewed-by: Matt Turner <mattst88@gmail.com>
+Reviewed-by: Eric Engestrom <eric.engestrom@intel.com>
+Backported from upstream commit eb44c36cf1729e7e200b77cf8ea755dff72d1639
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+---
+ src/egl/main/egldevice.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/egl/main/egldevice.h b/src/egl/main/egldevice.h
+index ddcdcd1..83a47d5 100644
+--- a/src/egl/main/egldevice.h
++++ b/src/egl/main/egldevice.h
+@@ -31,9 +31,9 @@
+ 
+ 
+ #include <stdbool.h>
++#include <stddef.h>
+ #include "egltypedefs.h"
+ 
+-
+ #ifdef __cplusplus
+ extern "C" {
+ #endif
+-- 
+2.7.4
+
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 563ac62501..68ec1ec5b8 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,7 +1,7 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2018-December/000482.html
-md5 2d69eff8fe0c6e89bb793d4fd69b750d  mesa-18.3.0.tar.xz
-sha1 d4ddc4e7aa8e11a41d35b5d51476f867e81056ca  mesa-18.3.0.tar.xz
-sha256 b63f947e735d6ef3dfaa30c789a9adfbae18aea671191eaacde95a18c17fc38a  mesa-18.3.0.tar.xz
-sha512 6643d8a100c50efee7178fe950e7cccad24c3a98538d3a13c7c6570add30a56776b4e5f279e2b0a20c4038e682e9461ca5a4fd4ac23a7f60d2f4a0c972525c42  mesa-18.3.0.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2018-December/000484.html
+md5 d60828056d77bfdbae0970f9b15fb1be  mesa-18.3.1.tar.xz
+sha1 50ba2d37647fea77ea19416e8a6ffed34c313330  mesa-18.3.1.tar.xz
+sha256 5b1f827d28684a25f6657289f8b7d47ac56395988c7ac23e0ec9a62b644bdc63  mesa-18.3.1.tar.xz
+sha512 a68d39158cf1e868d70730d0641a0cfe4c6e5b3cd1bc0c47f54022402aca03503933084f6ddc722bf88c9b6d1281ba5c847ec4fed8092a9b33f90527d08e12db  mesa-18.3.1.tar.xz
 # License
 sha256 630e75b4fdeb75ee2bf9e55db54dd1e3ff7353d52d9314ca8512bfd460f8e24c  docs/license.html
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index f3ee69b85f..2fe46bdd8b 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 18.3.0
+MESA3D_VERSION = 18.3.1
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
