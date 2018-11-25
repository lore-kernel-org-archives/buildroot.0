From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Nov 2018 23:18:34 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] qemu: disable opengl
Message-ID: <20181125221525.99AF6838AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=843c1bb0bd0dfe94c219ae9320574e6d7abb0c31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Since version 0.15.0, qemu has an optional dependency to opengl:
https://github.com/qemu/qemu/commit/20ff075bb3340c5278a0da38ad1f4d602565aa06

Since version 2.4, libepoxy is also needed to enable opengl:
https://github.com/qemu/qemu/commit/dcf30025c3e3d43140a687240433de1920adf8b0

As a result if libepoxy is built before qemu, opengl support will be
detected (see config.log):
OpenGL support    yes
OpenGL dmabufs    yes

This will raise the failures in milkymist-tmu2:
hw/display/milkymist-tmu2.c:35:22: fatal error: X11/Xlib.h: No such file or directory

or in sdl2:
  CC      /home/peko/autobuild/instance-0/output/targetui/sdl2-2d.o
In file included from /home/peko/autobuild/instance-0/output/build/qemu-2.12.1/include/ui/egl-context.h:5:0,
                 from ui/egl-context.c:3:
/home/peko/autobuild/instance-0/output/build/qemu-2.12.1/include/ui/egl-helpers.h:45:55: error: unknown type name 'Window'; did you mean 'minor'?

or in translate-a64:
/accts/mlweber1/scripts/instance-3/output/build/qemu-2.12.1/target/arm/translate-a64.c: In function 'handle_shri_with_rndacc':
/accts/mlweber1/scripts/instance-3/output/build/qemu-2.12.1/target/arm/translate-a64.c:7000:28: warning: 'tcg_src_hi' may be used uninitialized in this function [-Wmaybe-uninitialized]
             tcg_gen_mov_i64(tcg_src, tcg_src_hi);
                            ^
../ui/gtk-egl.o: In function `gd_egl_init':
/accts/mlweber1/scripts/instance-3/output/build/qemu-2.12.1/ui/gtk-egl.c:52: undefined reference to `gdk_x11_window_get_xid'

So, for the time being, disable opengl as done in xen since commit
13c6754f3c1d2a14516f641490e9dd6f4c183d7c.

Fixes:
 - http://autobuild.buildroot.org/results/656e45721c72197834462eb2bd8c762e520725a4
 - http://autobuild.buildroot.org/results/d4736a930144fc5e25b377bc1c0baf44fbf8718d
 - http://autobuild.buildroot.org/results/50e0d7d1b4f5c2b827b50bb82d8fbc066bf31118

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ce735b0c59c636b454056debacddcf77f9fb30fd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qemu/qemu.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 0b53d130af..cc5493fb2e 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -129,6 +129,7 @@ define QEMU_CONFIGURE_CMDS
 			--disable-libxml2 \
 			--disable-capstone \
 			--disable-git-update \
+			--disable-opengl \
 			$(QEMU_OPTS) \
 	)
 endef
