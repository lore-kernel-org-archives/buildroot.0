From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Nov 2020 11:57:57 +0100
Subject: [Buildroot] [git commit branch/next] package/mesa3d: Add xcb-fixes
 to loader when using x11 and dri3
Message-ID: <20201117203828.13B527FB0D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=091e2aec683f2a28b3ef5f9014455b56167dc42b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

"loader_dr3_helper.c uses xcb_xfixes_create_region() that requires dep_xcb_xfixes to link.
This is dependent on with_platform_x11 and with_dri3.
But the source meson file does not set this up dependent on with_dri3."

i686-buildroot-linux-gnu/bin/ld: src/loader/libloader_dri3_helper.a(loader_dri3_helper.c.o): in function `loader_dri3_swap_buffers_msc':
loader_dri3_helper.c:(.text.loader_dri3_swap_buffers_msc+0x33e): undefined reference to `xcb_xfixes_create_region'

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/830981830

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...cb-fixes-to-loader-when-using-x11-and-dri.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/mesa3d/0005-meson-Add-xcb-fixes-to-loader-when-using-x11-and-dri.patch b/package/mesa3d/0005-meson-Add-xcb-fixes-to-loader-when-using-x11-and-dri.patch
new file mode 100644
index 0000000000..5746bc221e
--- /dev/null
+++ b/package/mesa3d/0005-meson-Add-xcb-fixes-to-loader-when-using-x11-and-dri.patch
@@ -0,0 +1,35 @@
+From da691ec75cc8a7b2d0ac0c5894521afda4bc601d Mon Sep 17 00:00:00 2001
+From: Duncan Hopkins <duncan@duncanhopkins.me.uk>
+Date: Thu, 15 Oct 2020 12:14:57 +0100
+Subject: [PATCH] meson: Add xcb-fixes to loader when using x11 and dri3. Fixes
+ undefined symbol for xcb_xfixes_create_region in loader_dri3_helper.c
+
+loader_dr3_helper.c uses xcb_xfixes_create_region() that requires dep_xcb_xfixes to link. This is dependent on with_platform_x11 and with_dri3.
+But the source meson file does not set this up dependent on with_dri3.
+The build was initialsed using platforms=x11 and gallium-drivers=zink,swrast.
+
+Reviewed-by: Eric Anholt <eric@anholt.net>
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/7164>
+(cherry picked from commit cf17d6251653f4a98e7c4f904ea2f0bc0ecedd5c)
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ meson.build | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index fbd3c4b8e8d..670cb521a2b 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1742,7 +1742,8 @@ if with_platform_x11
+       dep_xxf86vm = dependency('xxf86vm')
+     endif
+   endif
+-  if (with_egl or (
++  if (with_egl or 
++      with_dri3 or (
+       with_gallium_vdpau or with_gallium_xvmc or with_gallium_xa or
+       with_gallium_omx != 'disabled'))
+     dep_xcb_xfixes = dependency('xcb-xfixes')
+-- 
+2.25.4
+
