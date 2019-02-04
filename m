From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon,  4 Feb 2019 07:43:23 -0500
Subject: [Buildroot] [PATCH] qemu: remove host-python dependency.
Message-ID: <20190204124323.2865-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Now that BuildRoot requires python >= 2.7, qemu no longer needs a host-python,
as it does not use any external Python modules to build.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/qemu/qemu.mk | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 3f51e88e1c..30cd5972ef 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -16,7 +16,7 @@ QEMU_LICENSE_FILES = COPYING COPYING.LIB
 #-------------------------------------------------------------
 # Target-qemu
 
-QEMU_DEPENDENCIES = host-pkgconf host-python libglib2 zlib pixman
+QEMU_DEPENDENCIES = host-pkgconf libglib2 zlib pixman
 
 # Need the LIBS variable because librt and libm are
 # not automatically pulled. :-(
@@ -24,9 +24,7 @@ QEMU_LIBS = -lrt -lm
 
 QEMU_OPTS =
 
-QEMU_VARS = \
-	LIBTOOL=$(HOST_DIR)/bin/libtool \
-	PYTHON=$(HOST_DIR)/bin/python2
+QEMU_VARS = LIBTOOL=$(HOST_DIR)/bin/libtool
 
 # If we want to specify only a subset of targets, we must still enable all
 # of them, so that QEMU properly builds its list of default targets, from
@@ -156,7 +154,7 @@ $(eval $(generic-package))
 #-------------------------------------------------------------
 # Host-qemu
 
-HOST_QEMU_DEPENDENCIES = host-pkgconf host-python host-zlib host-libglib2 host-pixman
+HOST_QEMU_DEPENDENCIES = host-pkgconf host-zlib host-libglib2 host-pixman
 
 #       BR ARCH         qemu
 #       -------         ----
@@ -273,7 +271,6 @@ define HOST_QEMU_CONFIGURE_CMDS
 		--interp-prefix=$(STAGING_DIR) \
 		--cc="$(HOSTCC)" \
 		--host-cc="$(HOSTCC)" \
-		--python=$(HOST_DIR)/bin/python2 \
 		--extra-cflags="$(HOST_CFLAGS)" \
 		--extra-ldflags="$(HOST_LDFLAGS)" \
 		$(HOST_QEMU_OPTS)
-- 
2.20.1
