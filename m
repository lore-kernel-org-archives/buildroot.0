From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Nov 2016 15:37:21 +0100
Subject: [Buildroot] [git commit] czmq: fix build with glibc 2.24
Message-ID: <20161105143740.BE6A5817D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=69182cb65a8be21b2133ee76b1e9c42bf9627d5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

czmq uses readdir_r(), which has been marked as deprecated in glibc
2.24, and czmq uses -Werror which causes the warning to be turned into
an error that aborts the build.

This commit fixes that by removing -Werror. Long-term, we might want
to upgrade czmq to a newer version, since they've removed the use of
readdir_r() in commit 2594d406d8ec6f54e54d7570d7febba10a6906b2. But
getting rid of -Werror is anyway always a good idea in Buildroot.

Fixes:

  http://autobuild.buildroot.net/results/f6e4b8ed8571fdcf30eecae121dd11dfdef50799

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/czmq/0001-configure.ac-remove-Werror.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/czmq/0001-configure.ac-remove-Werror.patch b/package/czmq/0001-configure.ac-remove-Werror.patch
new file mode 100644
index 0000000..7f2dae2
--- /dev/null
+++ b/package/czmq/0001-configure.ac-remove-Werror.patch
@@ -0,0 +1,30 @@
+From 9a195dc573f4eed130773e6ef67efd5f71693e97 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 5 Nov 2016 15:33:57 +0100
+Subject: [PATCH] configure.ac: remove -Werror
+
+-Werror shouldn't be used in releases, as it can break the build with
+newer versions of the compiler or the C library, when new warnings
+are introduced.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index e92970a..2fd551a 100755
+--- a/configure.ac
++++ b/configure.ac
+@@ -344,7 +344,7 @@ AC_C_BIGENDIAN
+ 
+ # These options are GNU compiler specific.
+ if test "x$GCC" = "xyes"; then
+-    CPPFLAGS="-pedantic -Werror -Wall -Wc++-compat ${CPPFLAGS}"
++    CPPFLAGS="-pedantic -Wall -Wc++-compat ${CPPFLAGS}"
+ fi
+ 
+ AM_CONDITIONAL(ENABLE_SHARED, test "x$enable_shared" = "xyes")
+-- 
+2.7.4
+
