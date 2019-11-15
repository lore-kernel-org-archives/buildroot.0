From: Avi Shukron <avraham.shukron@gmail.com>
Date: Fri, 15 Nov 2019 22:19:00 +0200
Subject: [Buildroot] [PATCH v3] package/qemu: add host-python as an explicit
 dependency
In-Reply-To: <20191112220534.531a470f@windsurf>
References: <20191112220534.531a470f@windsurf>
Message-ID: <20191115201908.8216-1-avraham.shukron@gmail.com>
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
---
 package/qemu/qemu.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index a91f9d3eeb..c46e41919f 100644
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
@@ -182,7 +181,7 @@ $(eval $(generic-package))
 #-------------------------------------------------------------
 # Host-qemu
 
-HOST_QEMU_DEPENDENCIES = host-pkgconf host-zlib host-libglib2 host-pixman
+HOST_QEMU_DEPENDENCIES = host-pkgconf host-zlib host-libglib2 host-pixman host-python3
 
 #       BR ARCH         qemu
 #       -------         ----
-- 
2.17.1
