From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Jan 2010 15:14:18 +0100
Subject: [Buildroot] [git commit master] rpm: fix build with !LFS
Message-ID: <20100118141647.97DD077708@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=59493977cb8c49d4d6bbdba80c79e678f0fab446
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/rpm/rpm-5.2.0-uclibc-no-lfs-fix.patch |   22 ++++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 package/rpm/rpm-5.2.0-uclibc-no-lfs-fix.patch

diff --git a/package/rpm/rpm-5.2.0-uclibc-no-lfs-fix.patch b/package/rpm/rpm-5.2.0-uclibc-no-lfs-fix.patch
new file mode 100644
index 0000000..00d0579
--- /dev/null
+++ b/package/rpm/rpm-5.2.0-uclibc-no-lfs-fix.patch
@@ -0,0 +1,22 @@
+[PATCH] rpm: fix build on uClibc with !LFS
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ rpmio/fts.c |    4 ++++
+ 1 file changed, 4 insertions(+)
+
+Index: rpm-5.2.0/rpmio/fts.c
+===================================================================
+--- rpm-5.2.0.orig/rpmio/fts.c
++++ rpm-5.2.0/rpmio/fts.c
+@@ -47,6 +47,10 @@ static char sccsid[] = "@(#)fts.c	8.6 (B
+ #else
+ #if defined(__UCLIBC__)
+ #   define __fxstat64(_stat_ver, _fd, _sbp)    fstat((_fd), (_sbp))
++#   include <features.h>
++#   ifndef __UCLIBC_HAS_LFS__
++#     define stat64 stat
++#   endif
+ #endif
+ #if defined(hpux) || defined(__hpux)
+ # define        _INCLUDE_POSIX_SOURCE
-- 
1.6.3.3
