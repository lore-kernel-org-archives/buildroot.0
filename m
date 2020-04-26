From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Apr 2020 11:22:00 +0200
Subject: [Buildroot] [git commit] package/mesa3d-headers: fix install of
 dri.pc
Message-ID: <20200426090723.AC2B990588@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9014c21cac83b3bb6a038ad7dd4b06cde136d3ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mesa3d-headers is a little bit special: it uses the same sources as
the mesa3d package, named just 'mesa' upstream. mesa uses the meson
buildsystem, an that is what we use in the mesa3d package.

However, mesa3d-headers does not install the whole of mesa; it only
installs a select set of headers for those binary blobs that do not
provide them.

mesa does not provide such a feature (only installing headers) with
its meson buildsystem. As a consequence, we've made mesa3d-headers a
generic package, that basically only copies headers over.

Additionally, mesa3d-headers also provides the dri.pc file for when
Xorg is enabled; see 7468b60e7c (package/mesa3d-headers: also install
dri header and .pc file).

We used to manually generate that file from a .in template that was
present in mesa source code at the time it was still using autotools.
But when they switched over to using meson, the template was dropped
[0], and the dri.pc is now entirely generated using meson internals
[1].

So we now have no template present in the source code, so we must
come up with our own. This simplifies the replacement pattern to
just inject the version string.

[0] https://cgit.freedesktop.org/mesa/mesa/commit/?id=158758618264eac113025a86a360dc305ed4498b
[1] https://cgit.freedesktop.org/mesa/mesa/tree/src/mesa/drivers/dri/meson.build?h=19.2#n93

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Tested-by: Vincent Fazio <vfazio@xes-inc.com>
[yann.morin.1998 at free.fr:
  - entirely rework the commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mesa3d-headers/dri.pc            | 10 ++++++++++
 package/mesa3d-headers/mesa3d-headers.mk |  9 ++-------
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/package/mesa3d-headers/dri.pc b/package/mesa3d-headers/dri.pc
new file mode 100644
index 0000000000..bd9a33b6c6
--- /dev/null
+++ b/package/mesa3d-headers/dri.pc
@@ -0,0 +1,10 @@
+prefix=/usr
+libdir=${prefix}/lib
+includedir=${prefix}/include
+
+dridriverdir=/usr/lib/dri
+
+Name: dri
+Description: Direct Rendering Infrastructure
+Version: @VERSION@
+Cflags: -I${includedir}
diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 2801da1156..b12dad7bd0 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -34,13 +34,8 @@ ifeq ($(BR2_PACKAGE_XORG7),y)
 # Not using $(SED) because we do not want to work in-place, and $(SED)
 # contains -i.
 define MESA3D_HEADERS_BUILD_DRI_PC
-	sed -e 's:@\(exec_\)\?prefix@:/usr:' \
-	    -e 's:@libdir@:$${exec_prefix}/lib:' \
-	    -e 's:@includedir@:$${prefix}/include:' \
-	    -e 's:@DRI_DRIVER_INSTALL_DIR@:$${libdir}/dri:' \
-	    -e 's:@VERSION@:$(MESA3D_HEADERS_VERSION):' \
-	    -e 's:@DRI_PC_REQ_PRIV@::' \
-	    $(@D)/src/mesa/drivers/dri/dri.pc.in \
+	sed -e 's:@VERSION@:$(MESA3D_HEADERS_VERSION):' \
+	    package/mesa3d-headers/dri.pc \
 	    >$(@D)/src/mesa/drivers/dri/dri.pc
 endef
 
