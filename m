From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 Feb 2020 19:34:48 +0100
Subject: [Buildroot] [git commit] package/mesa3d: select gbm if no glx,
 no egl and no osmesa-classic
Message-ID: <20200222182305.538D28E612@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=59dfa879fbea77225263dc316334f82a77be21a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This issue has been trigged since [1]:
"package/mesa3d: add option to configure gbm support"

Before the patch, the gbm support was autodetected by meson and enabled
only when at least one dri driver was enabled [2].

On the Buildroot side, the gbm support was explicitely enabled only when
BR2_PACKAGE_MESA3D_OPENGL_EGL was set.

Now, the gbm support is explicitely disabled but the meson build system
check if at least one option OpenGL GLX or OpenGL EGL or GBM or
OSMesa (classic) library is enabled [3].

The previous behavious was to enable GBM when GLX, EGL and OSMesa are
disabled. So select GBM symbol for this case.

Fixes:
http://autobuild.buildroot.net/results/a14f329560f8022f7ba8ec43ad8eed84e005d226

[1] b6c051acf787c804e732bc58ba8d7e440701a168
[2] https://gitlab.freedesktop.org/mesa/mesa/blob/19.3/meson.build#L348
[3] https://gitlab.freedesktop.org/mesa/mesa/blob/19.3/meson.build#L449

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mesa3d/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index dbfc59bad5..a7d516e103 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -61,6 +61,10 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 config BR2_PACKAGE_MESA3D_DRI_DRIVER
 	bool
 	select BR2_PACKAGE_MESA3D_DRIVER
+	select BR2_PACKAGE_MESA3D_GBM if \
+		!BR2_PACKAGE_MESA3D_OPENGL_GLX && \
+		!BR2_PACKAGE_MESA3D_OPENGL_EGL && \
+		!BR2_PACKAGE_MESA3D_OSMESA_CLASSIC
 	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if \
 		(BR2_PACKAGE_XORG7 && BR2_TOOLCHAIN_HAS_SYNC_4)
 
