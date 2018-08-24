From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Aug 2018 10:21:01 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] mesa3d-headers: fix logic
 to generate the dri.pc file
Message-ID: <20180824081318.3C0B28E594@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e0fc3b90f79306709589ab666f61aaae5007d0fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

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
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 98e3c1eee505b6c92c75daa1772ba543936b099f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d-headers/mesa3d-headers.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 5a8e3f9b84..e851635f54 100644
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
