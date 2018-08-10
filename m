From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Aug 2018 23:46:32 +0200
Subject: [Buildroot] [PATCH] mesa3d-headers: fix logic to generate the
 dri.pc file
Message-ID: <20180810214632.21735-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As noted by Arnout in [1], the logic in mesa3d-headers.mk generates a
bogus dri.pc file, which looks like this:

prefix=/usr
exec_prefix=/usr
libdir=/lib
includedir=/include
dridriverdir=/dri

Indeed, the ${...} are expanded as shell variables when the sed
command is executed, while the intention is that those ${...} should
go in the .pc file. By escaping those using $${...}, we get the
expected .pc file:

prefix=/usr
exec_prefix=/usr
libdir=${exec_prefix}/lib
includedir=${prefix}/include
dridriverdir=${libdir}/dri

This was detected by the not yet committed check-package improvement
from Ricardo that detects bogus ${...} usage to reference make
variables.

[1] http://lists.busybox.net/pipermail/buildroot/2018-July/225402.html

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d-headers/mesa3d-headers.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index de8a9dc7cf..fc88f0ed60 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -35,9 +35,9 @@ ifeq ($(BR2_PACKAGE_XORG7),y)
 # contains -i.
 define MESA3D_HEADERS_BUILD_DRI_PC
 	sed -e 's:@\(exec_\)\?prefix@:/usr:' \
-	    -e 's:@libdir@:${exec_prefix}/lib:' \
-	    -e 's:@includedir@:${prefix}/include:' \
-	    -e 's:@DRI_DRIVER_INSTALL_DIR@:${libdir}/dri:' \
+	    -e 's:@libdir@:$${exec_prefix}/lib:' \
+	    -e 's:@includedir@:$${prefix}/include:' \
+	    -e 's:@DRI_DRIVER_INSTALL_DIR@:$${libdir}/dri:' \
 	    -e 's:@VERSION@:$(MESA3D_HEADERS_VERSION):' \
 	    -e 's:@DRI_PC_REQ_PRIV@::' \
 	    $(@D)/src/mesa/drivers/dri/dri.pc.in \
-- 
2.14.4
