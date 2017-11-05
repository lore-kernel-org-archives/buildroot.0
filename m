From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 5 Nov 2017 17:57:10 +0100
Subject: [Buildroot] [git commit] package/mesa3d: remove old patch for uClibc
Message-ID: <20171105165659.510B181116@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3253c6fa4573307ec1631f3b34856b1daec9d1e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch is no longer necessary since Buildroot is using uClibc-ng
and the patch [1] as been merged upstream.
It's 2017 and uClibc toolchains have been rebuild with uClibc-ng.

Drop upstream patch and rename remaining one.

[1] https://cgit.openadk.org/cgi/cgit/uclibc-ng.git/commit/?id=6c4538905e65ceb203f59aaa9a61728e81c6bc0a

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-Fix-runtime-error-with-uClibc.patch       | 48 ----------------------
 .../mesa3d/{0002-musl.patch => 0001-musl.patch}    |  0
 ...ess-detection-with-musl-based-toolchains.patch} |  0
 ...c-invert-order-for-wayland-scanner-check.patch} |  0
 4 files changed, 48 deletions(-)

diff --git a/package/mesa3d/0001-Fix-runtime-error-with-uClibc.patch b/package/mesa3d/0001-Fix-runtime-error-with-uClibc.patch
deleted file mode 100644
index 59627be..0000000
--- a/package/mesa3d/0001-Fix-runtime-error-with-uClibc.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-Fix runtime error with uClibc
-
-Patch inspired by
-https://www.winehq.org/pipermail/wine-bugs/2011-September/288987.html
-http://git.alpinelinux.org/cgit/aports/tree/main/wine/uclibc-fmaxf-fminf.patch?id=c9b491b6099eec02a835ffd05539b5c783c6c43a
-
-Starting an app using mesa3d 10.5.x, Kodi for example, fails:
-
-/usr/lib/kodi/kodi.bin: symbol 'fminf': can't resolve symbol in lib '/usr/lib/dri/i965_dri.so'.
-libGL error: unable to load driver: i965_dri.so
-libGL error: driver pointer missing
-libGL error: failed to load driver: i965
-libGL error: unable to load driver: swrast_dri.so
-libGL error: failed to load driver: swrast
-
-This patch was rejected by upstream mesa3d:
-http://lists.freedesktop.org/archives/mesa-dev/2015-March/079436.html
-
-The real fix was committed to uClibc:
-http://git.uclibc.org/uClibc/commit/?id=6c4538905e65ceb203f59aaa9a61728e81c6bc0a
-
-Until the external toolchains do not contain this uClibc patch we keep this
-patch: http://lists.busybox.net/pipermail/buildroot/2015-March/123410.html
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
-diff -uNr mesa-10.5.3.org/src/glsl/nir/nir_constant_expressions.c mesa-10.5.3/src/glsl/nir/nir_constant_expressions.c
---- mesa-10.5.3.org/src/compiler/nir/nir_constant_expressions.c	2015-04-12 23:31:29.000000000 +0200
-+++ mesa-10.5.3/src/compiler/nir/nir_constant_expressions.c	2015-04-13 19:59:37.819786541 +0200
-@@ -48,6 +48,18 @@
- }
- #endif
- 
-+#ifdef __UCLIBC__
-+float fmaxf(float a, float b)
-+{
-+	return (a > b) ? a : b;
-+}
-+
-+float fminf(float a, float b)
-+{
-+	return (a < b) ? a : b;
-+}
-+#endif
-+
- /**
-  * Evaluate one component of packSnorm4x8.
-  */
diff --git a/package/mesa3d/0002-musl.patch b/package/mesa3d/0001-musl.patch
similarity index 100%
rename from package/mesa3d/0002-musl.patch
rename to package/mesa3d/0001-musl.patch
diff --git a/package/mesa3d/0003-Fix-endianess-detection-with-musl-based-toolchains.patch b/package/mesa3d/0002-Fix-endianess-detection-with-musl-based-toolchains.patch
similarity index 100%
rename from package/mesa3d/0003-Fix-endianess-detection-with-musl-based-toolchains.patch
rename to package/mesa3d/0002-Fix-endianess-detection-with-musl-based-toolchains.patch
diff --git a/package/mesa3d/0004-configure.ac-invert-order-for-wayland-scanner-check.patch b/package/mesa3d/0003-configure.ac-invert-order-for-wayland-scanner-check.patch
similarity index 100%
rename from package/mesa3d/0004-configure.ac-invert-order-for-wayland-scanner-check.patch
rename to package/mesa3d/0003-configure.ac-invert-order-for-wayland-scanner-check.patch
