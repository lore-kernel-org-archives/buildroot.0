From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 27 Apr 2018 11:40:55 -0400
Subject: [Buildroot] [PATCH 2/2] qemu: add support for python 3.6
In-Reply-To: <20180427154055.23272-1-aduskett@gmail.com>
References: <20180427154055.23272-1-aduskett@gmail.com>
Message-ID: <20180427154055.23272-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

qemu 2.12.0 now supports building against python3.
see: https://wiki.qemu.org/ChangeLog/2.12#Build_Dependencies

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/qemu/qemu.mk | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 975dfba490..6a24e2848d 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -16,7 +16,7 @@ QEMU_LICENSE_FILES = COPYING COPYING.LIB
 #-------------------------------------------------------------
 # Host-qemu
 
-HOST_QEMU_DEPENDENCIES = host-pkgconf host-python host-zlib host-libglib2 host-pixman
+HOST_QEMU_DEPENDENCIES = host-pkgconf host-zlib host-libglib2 host-pixman
 
 #       BR ARCH         qemu
 #       -------         ----
@@ -119,6 +119,16 @@ HOST_QEMU_OPTS += --enable-vde
 HOST_QEMU_DEPENDENCIES += host-vde2
 endif
 
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+HOST_QEMU_DEPENDENCIES += host-python3
+QEMU_DEPENDENCIES += host-python3
+QEMU_PYLIBVER = python$(PYTHON3_VERSION_MAJOR)
+else
+HOST_QEMU_DEPENDENCIES += host-python
+QEMU_DEPENDENCIES += host-python
+QEMU_PYLIBVER = python$(PYTHON_VERSION_MAJOR)
+endif
+
 # Override CPP, as it expects to be able to call it like it'd
 # call the compiler.
 define HOST_QEMU_CONFIGURE_CMDS
@@ -129,7 +139,7 @@ define HOST_QEMU_CONFIGURE_CMDS
 		--interp-prefix=$(STAGING_DIR) \
 		--cc="$(HOSTCC)" \
 		--host-cc="$(HOSTCC)" \
-		--python=$(HOST_DIR)/bin/python2 \
+		--python=$(HOST_DIR)/bin/$(QEMU_PYLIBVER) \
 		--extra-cflags="$(HOST_CFLAGS)" \
 		--extra-ldflags="$(HOST_LDFLAGS)" \
 		$(HOST_QEMU_OPTS)
@@ -151,7 +161,7 @@ QEMU_USER = $(HOST_DIR)/bin/qemu-$(HOST_QEMU_ARCH)
 #-------------------------------------------------------------
 # Target-qemu
 
-QEMU_DEPENDENCIES = host-pkgconf host-python libglib2 zlib pixman
+QEMU_DEPENDENCIES = host-pkgconf libglib2 zlib pixman
 
 # Need the LIBS variable because librt and libm are
 # not automatically pulled. :-(
@@ -161,8 +171,8 @@ QEMU_OPTS =
 
 QEMU_VARS = \
 	LIBTOOL=$(HOST_DIR)/bin/libtool \
-	PYTHON=$(HOST_DIR)/bin/python2 \
-	PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
+	PYTHON=$(HOST_DIR)/bin/$(QEMU_PYLIBVER) \
+	PYTHONPATH=$(TARGET_DIR)/usr/lib/$(QEMU_PYLIBVER)/site-packages
 
 # If we want to specify only a subset of targets, we must still enable all
 # of them, so that QEMU properly builds its list of default targets, from
-- 
2.14.3
