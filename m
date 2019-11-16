From: Avi Shukron <avraham.shukron@gmail.com>
Date: Sat, 16 Nov 2019 15:49:38 +0200
Subject: [Buildroot] [PATCH v4] package/qemu: add host-python3 as an
 explicit dependency
In-Reply-To: <CAJX3zAu7OnUt9g0xdQg6-KJckYo+iW=b36MxxvXFKyJOwS5t8A@mail.gmail.com>
References: <CAJX3zAu7OnUt9g0xdQg6-KJckYo+iW=b36MxxvXFKyJOwS5t8A@mail.gmail.com>
Message-ID: <20191116134951.25508-1-avraham.shukron@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

qemu requires python in its configre script. Yet host-python was
not listed as one of the package's dependencies. If no other package
requested host-python, then configuring this package will fail since
it won't find any executable named python in the host dir.

In order to reproduce this issue you must not have python2 installed
on your host machine.

Signed-off-by: Avi Shukron <avraham.shukron@gmail.com>
---
Changes v2->v3:
 - Depend directly on host-python3, since it is already a transitive
   dependency of qemu

Changes v3->v4:
 - Pass python3 explicitly to the configure script
---
 package/qemu/qemu.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index a91f9d3eeb..283577d749 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -20,8 +20,7 @@ QEMU_LICENSE_FILES = COPYING COPYING.LIB
 
 #-------------------------------------------------------------
 # Target-qemu
-
-QEMU_DEPENDENCIES = host-pkgconf libglib2 zlib pixman
+QEMU_DEPENDENCIES = host-pkgconf libglib2 zlib pixman host-python3
 
 # Need the LIBS variable because librt and libm are
 # not automatically pulled. :-(
@@ -132,6 +131,7 @@ define QEMU_CONFIGURE_CMDS
 			--prefix=/usr \
 			--cross-prefix=$(TARGET_CROSS) \
 			--audio-drv-list= \
+			--python=$(HOST_DIR)/bin/python3 \
 			--enable-kvm \
 			--enable-attr \
 			--enable-vhost-net \
@@ -182,7 +182,7 @@ $(eval $(generic-package))
 #-------------------------------------------------------------
 # Host-qemu
 
-HOST_QEMU_DEPENDENCIES = host-pkgconf host-zlib host-libglib2 host-pixman
+HOST_QEMU_DEPENDENCIES = host-pkgconf host-zlib host-libglib2 host-pixman host-python3
 
 #       BR ARCH         qemu
 #       -------         ----
@@ -299,6 +299,7 @@ define HOST_QEMU_CONFIGURE_CMDS
 		--host-cc="$(HOSTCC)" \
 		--extra-cflags="$(HOST_CFLAGS)" \
 		--extra-ldflags="$(HOST_LDFLAGS)" \
+		--python=$(HOST_DIR)/bin/python3 \
 		$(HOST_QEMU_OPTS)
 endef
 
-- 
2.17.1
