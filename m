From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Dec 2016 17:58:37 +0100
Subject: [Buildroot] [git commit] package/sdl2: fix build error on
	powerpc/powerpc64
Message-ID: <20161227165913.84B7F81D65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ef8733ac7d6a75ef2c42e6fa7a0360880fac0b70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/ffd/ffd689f1ba34ad43f52c38fe37da393a9d8b9d5e/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Tested-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sdl2/0001-ppc.patch | 47 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/package/sdl2/0001-ppc.patch b/package/sdl2/0001-ppc.patch
new file mode 100644
index 0000000..0161103
--- /dev/null
+++ b/package/sdl2/0001-ppc.patch
@@ -0,0 +1,47 @@
+Fixed bug 3466 - Can't build 2.0.5 on ppc64
+
+/home/fedora/SDL2-2.0.5/src/video/SDL_blit_N.c: In function 'calc_swizzle32':
+/home/fedora/SDL2-2.0.5/src/video/SDL_blit_N.c:127:5: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
+const vector unsigned char plus = VECUINT8_LITERAL(0x00, 0x00, 0x00, 0x00,
+^ 
+
+Downloaded from upstream repo
+https://hg.libsdl.org/SDL/rev/5184186d4366
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -r 71d4148e32de -r 5184186d4366 src/video/SDL_blit_N.c
+--- a/src/video/SDL_blit_N.c	Wed Oct 19 21:22:42 2016 -0700
++++ b/src/video/SDL_blit_N.c	Sat Oct 22 11:01:55 2016 -0700
+@@ -118,12 +118,6 @@
+         16, 8, 0, 24,
+         0, NULL
+     };
+-    if (!srcfmt) {
+-        srcfmt = &default_pixel_format;
+-    }
+-    if (!dstfmt) {
+-        dstfmt = &default_pixel_format;
+-    }
+     const vector unsigned char plus = VECUINT8_LITERAL(0x00, 0x00, 0x00, 0x00,
+                                                        0x04, 0x04, 0x04, 0x04,
+                                                        0x08, 0x08, 0x08, 0x08,
+@@ -136,6 +130,14 @@
+     Uint32 gmask = RESHIFT(srcfmt->Gshift) << (dstfmt->Gshift);
+     Uint32 bmask = RESHIFT(srcfmt->Bshift) << (dstfmt->Bshift);
+     Uint32 amask;
++
++    if (!srcfmt) {
++        srcfmt = &default_pixel_format;
++    }
++    if (!dstfmt) {
++        dstfmt = &default_pixel_format;
++    }
++
+     /* Use zero for alpha if either surface doesn't have alpha */
+     if (dstfmt->Amask) {
+         amask =
+
+
+
+
