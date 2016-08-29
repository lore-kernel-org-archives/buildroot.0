From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Aug 2016 12:25:35 +0200
Subject: [Buildroot] [git commit] package/libfreeimage: fix C++11 compliance
	with gcc-6
Message-ID: <20160829102616.1F57E8223A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=70dbe298f42449b8fa19f35ec41c07e360d51c68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Like in cbe01f6, 38249d5, 97fe953, fix C++11 compliance regarding
narrowing types.

Fixes:
    http://autobuild.buildroot.org/results/081/0811531872f69f9febbdc482dfbdd7fb5c35d1c8/
    http://autobuild.buildroot.org/results/90c/90c9cb4ffe705b8c91f4fb602e33e2ba9bcdee77/
    and a few others...

[Peter: use signed char for src[], fix dos/unix new lines]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libfreeimage/0004-fix-gcc-6.patch | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/package/libfreeimage/0004-fix-gcc-6.patch b/package/libfreeimage/0004-fix-gcc-6.patch
new file mode 100644
index 0000000..0f10dec
--- /dev/null
+++ b/package/libfreeimage/0004-fix-gcc-6.patch
@@ -0,0 +1,31 @@
+libraw/dc_raw: fix gcc-6 failures
+
+With gcc-6, it is no longer allowed to narrow the type of constants in
+a constant array declaration.
+
+Fixes:
+    http://autobuild.buildroot.org/results/081/0811531872f69f9febbdc482dfbdd7fb5c35d1c8/build-end.log
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN a/Source/LibRawLite/internal/dcraw_common.cpp b/Source/LibRawLite/internal/dcraw_common.cpp
+--- a/Source/LibRawLite/internal/dcraw_common.cpp
++++ b/Source/LibRawLite/internal/dcraw_common.cpp
+@@ -2479,7 +2479,7 @@
+ 
+ void CLASS kodak_radc_load_raw()
+ {
+-  static const char src[] = {
++  static const signed char src[] = {
+     1,1, 2,3, 3,4, 4,2, 5,7, 6,5, 7,6, 7,8,
+     1,0, 2,1, 3,3, 4,4, 5,2, 6,7, 7,6, 8,5, 8,8,
+     2,1, 2,3, 3,0, 3,2, 3,4, 4,6, 5,5, 6,7, 6,8,
+@@ -4519,7 +4519,7 @@
+  */
+ void CLASS vng_interpolate()
+ {
+-  static const signed char *cp, terms[] = {
++  static const int *cp, terms[] = {
+     -2,-2,+0,-1,0,0x01, -2,-2,+0,+0,1,0x01, -2,-1,-1,+0,0,0x01,
+     -2,-1,+0,-1,0,0x02, -2,-1,+0,+0,0,0x03, -2,-1,+0,+1,1,0x01,
+     -2,+0,+0,-1,0,0x06, -2,+0,+0,+0,1,0x02, -2,+0,+0,+1,0,0x03,
