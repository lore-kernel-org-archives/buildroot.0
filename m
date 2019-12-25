From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Dec 2019 22:26:06 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/sdl2: add patch
 to fix busy-loop in C library
Message-ID: <20191225211720.7635F8E44C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=feedccd012dff0e4124fb14168cbb66e2f7cbd02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

For some obscure reason, the order in which the libdrm/libgbm libraries
are loaded matters.

Without this fix, the first call to check_modesetting() will work and
load then unload all symbols properly, but the second call to this
function will lock up as soon as dlopen() is called on libdrm.

Swapping the order in which the libdrm and libgbm libraries are loaded
is enough to fix (or work around?) this issue.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
[yann.morin.1998 at free.fr: add upstream commit URL]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c84d36db7bc5d3bdd69ba90964a31f8f304b21de)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sdl2/0002-fix-busy-loop-in-dlopen.patch | 41 +++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/sdl2/0002-fix-busy-loop-in-dlopen.patch b/package/sdl2/0002-fix-busy-loop-in-dlopen.patch
new file mode 100644
index 0000000000..e335f95b7e
--- /dev/null
+++ b/package/sdl2/0002-fix-busy-loop-in-dlopen.patch
@@ -0,0 +1,41 @@
+
+# HG changeset patch
+# User Paul Cercueil <paul@crapouillou.net>
+# Date 1576820863 28800
+# Node ID 4f5bef55183c677d12a7da8f3392879ed50670a3
+# Parent  01f16d7f36cb9f4fa02016e57fbe915fdea71cc8
+kmsdrm: Fix busy-loop within libc's dlopen()
+For some obscure reason, the order in which the libdrm/libgbm libraries
+are loaded matters.
+
+Without this fix, the first call to check_modesetting() will work and
+load then unload all symbols properly, but the second call to this
+function will lock up as soon as dlopen() is called on libdrm.
+
+Swapping the order in which the libdrm and libgbm libraries are loaded
+is enough to fix (or work around?) this issue.
+
+Fixes #4891:
+https://bugzilla.libsdl.org/show_bug.cgi?id=4891
+
+Upstream: https://hg.libsdl.org/SDL/rev/4f5bef55183c
+
+Signed-off-by: Paul Cercueil <paul@crapouillou.net>
+[yann.morin.1998 at free.fr: add upstream commit URL]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+
+diff -r 01f16d7f36cb -r 4f5bef55183c src/video/kmsdrm/SDL_kmsdrmdyn.c
+--- a/src/video/kmsdrm/SDL_kmsdrmdyn.c	Thu Dec 19 21:45:44 2019 -0800
++++ b/src/video/kmsdrm/SDL_kmsdrmdyn.c	Thu Dec 19 21:47:43 2019 -0800
+@@ -50,8 +50,8 @@
+ #endif
+ 
+ static kmsdrmdynlib kmsdrmlibs[] = {
+-    {NULL, SDL_VIDEO_DRIVER_KMSDRM_DYNAMIC},
+-    {NULL, SDL_VIDEO_DRIVER_KMSDRM_DYNAMIC_GBM}
++    {NULL, SDL_VIDEO_DRIVER_KMSDRM_DYNAMIC_GBM},
++    {NULL, SDL_VIDEO_DRIVER_KMSDRM_DYNAMIC}
+ };
+ 
+ static void *
+
