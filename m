From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Oct 2012 10:29:06 +0200
Subject: [Buildroot] [git commit] libv4l: fixup after CPPFLAGS addition
Message-ID: <20121011084008.ED9E599835@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d059b1cc61dcafde47723c45b834409026a39dbe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/4602f7cf4407a2969a04267bbc5d276b076a7c91

The preload libraries needs to wrap both the lfs and !lfs variants, so
ensure the lfs versions are not transparently used (as they are when
_LARGEFILE_SOURCE / _FILE_OFFSET_BITS=64 are defined).

This used to work by accident before, as our custom CFLAGS (containing those
defines) wasn't used.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libv4l/libv4l-largefile.patch |   39 +++++++++++++++++++++++++++++++++
 1 files changed, 39 insertions(+), 0 deletions(-)

diff --git a/package/libv4l/libv4l-largefile.patch b/package/libv4l/libv4l-largefile.patch
new file mode 100644
index 0000000..9df8652
--- /dev/null
+++ b/package/libv4l/libv4l-largefile.patch
@@ -0,0 +1,39 @@
+[PATCH] fixup lfs mismatch in preload libraries
+
+Ensure that the lfs variants are not transparently used instead of the !lfs
+ones so both can be wrapped, independently of any custom CFLAGS/CPPFLAGS.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ lib/libv4l1/v4l1compat.c  |    3 +++
+ lib/libv4l2/v4l2convert.c |    3 +++
+ 2 files changed, 6 insertions(+)
+
+Index: v4l-utils-0.8.5/lib/libv4l1/v4l1compat.c
+===================================================================
+--- v4l-utils-0.8.5.orig/lib/libv4l1/v4l1compat.c
++++ v4l-utils-0.8.5/lib/libv4l1/v4l1compat.c
+@@ -19,6 +19,9 @@
+ # Foundation, Inc., 51 Franklin Street, Suite 500, Boston, MA  02110-1335  USA
+  */
+ 
++/* ensure we see *64 variants and they aren't transparently used */
++#undef _LARGEFILE_SOURCE
++#undef _FILE_OFFSET_BITS
+ #define _LARGEFILE64_SOURCE 1
+ 
+ #include <stdlib.h>
+Index: v4l-utils-0.8.5/lib/libv4l2/v4l2convert.c
+===================================================================
+--- v4l-utils-0.8.5.orig/lib/libv4l2/v4l2convert.c
++++ v4l-utils-0.8.5/lib/libv4l2/v4l2convert.c
+@@ -20,6 +20,9 @@
+ # Foundation, Inc., 51 Franklin Street, Suite 500, Boston, MA  02110-1335  USA
+ */
+ 
++/* ensure we see *64 variants and they aren't transparently used */
++#undef _LARGEFILE_SOURCE
++#undef _FILE_OFFSET_BITS
+ #define _LARGEFILE64_SOURCE 1
+ 
+ #include <stdarg.h>
