From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Jan 2019 22:29:13 +0100
Subject: [Buildroot] [git commit] package/mesa3d: override dri path
Message-ID: <20190114213124.848338D4D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bd0bb8b8f6c975de3c926359990da9308d08a9e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the bump to 1.5.3, the behavior of pkg-config has slightly
changed. Like it used to behave before this bump, a few paths (libdir,
includedir, etc.) are prefixed by the sysroot, and other paths are
not. However, the behavior changes when a path, such as dridriverdir,
is defined in terms of ${libdir}.

With the older pkg-config, dridriverdir was not sysroot-prefixed.

With the new pkg-config, it will be sysroot-prefixed, because
pkg-config really resolved the value of libdir, which is
sysroot-prefixed. dridriverdir is used on the target and not at build
time, so we don't want it to be sysroot-prefixed.

As reported by #11591, the xerver fail to load dri modules (r600_dri.so):

From Xorg.0.log:
(EE) AIGLX error: dlopen of /full/path/to/sysroot/usr/lib/dri/r600_dri.so failed (/full/path/to/sysroot/usr/lib/dri/r600_dri.so: cannot open shared object file: No such file or directory)
(II) GLX: no usable GL providers found for screen 0

That's because the xserver hardcode the dri divers directory path in
DRI_DRIVER_PATH which come from
dridriverdir=`$PKG_CONFIG --variable=dridriverdir dri`

We can see in dri.pc that dridriverdir use libdir which is now prefixed
by the sysroot by pkgconf 1.5.3:

prefix=/usr
exec_prefix=/usr
libdir=${exec_prefix}/lib
includedir=${prefix}/include
dridriverdir=${libdir}/dri

Since we can't rely on pkgconf anymore, use
--with-dri-driverdir="/usr/lib/dri" to use explicitly "/usr/lib/dri"
instead of relying on dri.pc.

Tested using TestGlxinfo test from:
http://patchwork.ozlabs.org/patch/1021669/

Fixes:
https://bugs.buildroot.org/show_bug.cgi?id=11591

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
[Thomas: drop double quotes in path, rework commit log]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d/mesa3d.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 2fe46bdd8b..e1c54fbee4 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -136,6 +136,7 @@ endif
 MESA3D_CONF_OPTS += \
 	--enable-shared-glapi \
 	--enable-driglx-direct \
+	--with-dri-driverdir=/usr/lib/dri \
 	--with-dri-drivers=$(subst $(space),$(comma),$(MESA3D_DRI_DRIVERS-y))
 endif
 
