From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 27 Dec 2017 07:54:52 +0200
Subject: [Buildroot] [PATCH] libv4l: restore LFS mismatch fix patch
Message-ID: <2a31dda7a229212bd19f9fb8b2b6f50916fe11cc.1514354092.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Restore the patch that commit 9345b85b47 (libv4l: bump to version
1.12.6) has wrongly removed. This is needed for LFS builds for 32bit
targets.

Fixes:
http://autobuild.buildroot.net/results/461/46100c008c894e3f998227b2a9c9a79bfcbbda7c/
http://autobuild.buildroot.net/results/63b/63babd09b8a64fd4da80d99c4c2aed25e5532aec/
http://autobuild.buildroot.net/results/92b/92bd49d881ed11b2540e434af57ae7347ac186d2/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...1-fixup-lfs-mismatch-in-preload-libraries.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 package/libv4l/0001-fixup-lfs-mismatch-in-preload-libraries.patch

diff --git a/package/libv4l/0001-fixup-lfs-mismatch-in-preload-libraries.patch b/package/libv4l/0001-fixup-lfs-mismatch-in-preload-libraries.patch
new file mode 100644
index 000000000000..f23eb7a35066
--- /dev/null
+++ b/package/libv4l/0001-fixup-lfs-mismatch-in-preload-libraries.patch
@@ -0,0 +1,44 @@
+From e5952b043a71fe83fbc392e498e8f77774fca0d8 Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <jacmet@sunsite.dk>
+Date: Sat, 28 Jun 2014 09:32:53 -0300
+Subject: [PATCH] fixup lfs mismatch in preload libraries
+
+Ensure that the lfs variants are not transparently used instead of the !lfs
+ones so both can be wrapped, independently of any custom CFLAGS/CPPFLAGS.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ lib/libv4l1/v4l1compat.c  | 3 +++
+ lib/libv4l2/v4l2convert.c | 3 +++
+ 2 files changed, 6 insertions(+)
+
+diff --git a/lib/libv4l1/v4l1compat.c b/lib/libv4l1/v4l1compat.c
+index e328288..70eb74f 100644
+--- a/lib/libv4l1/v4l1compat.c
++++ b/lib/libv4l1/v4l1compat.c
+@@ -19,6 +19,9 @@
+ # Foundation, Inc., 51 Franklin Street, Suite 500, Boston, MA  02110-1335  USA
+  */
+
++/* ensure we see *64 variants and they aren't transparently used */
++#undef _LARGEFILE_SOURCE
++#undef _FILE_OFFSET_BITS
+ #define _LARGEFILE64_SOURCE 1
+
+ #include <config.h>
+diff --git a/lib/libv4l2/v4l2convert.c b/lib/libv4l2/v4l2convert.c
+index 9b46ab8..bc41056 100644
+--- a/lib/libv4l2/v4l2convert.c
++++ b/lib/libv4l2/v4l2convert.c
+@@ -23,6 +23,9 @@
+ /* prevent GCC 4.7 inlining error */
+ #undef _FORTIFY_SOURCE
+
++/* ensure we see *64 variants and they aren't transparently used */
++#undef _LARGEFILE_SOURCE
++#undef _FILE_OFFSET_BITS
+ #define _LARGEFILE64_SOURCE 1
+
+ #include <config.h>
+--
+1.9.1
-- 
2.15.1
