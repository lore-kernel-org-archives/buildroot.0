From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 13 May 2020 22:12:02 +0200
Subject: [Buildroot] [git commit] package/fakeroot: fix for fchownat/fchmodat
Message-ID: <20200513200749.CAB819189D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e642e179821728a90b1dce6efdc3bdb6718eb200
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fakeroot does mask out necessary flags, instead pass through
the flags that are supported by fstatat

Upstream BR: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=959876

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...0004-Fix-forwarding-fchownat-fchmod-flags.patch | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/fakeroot/0004-Fix-forwarding-fchownat-fchmod-flags.patch b/package/fakeroot/0004-Fix-forwarding-fchownat-fchmod-flags.patch
new file mode 100644
index 0000000000..fc74543378
--- /dev/null
+++ b/package/fakeroot/0004-Fix-forwarding-fchownat-fchmod-flags.patch
@@ -0,0 +1,28 @@
+Forward supported flags to fstatat, this fixes issues like
+using an empty path
+
+Upstream BR: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=959876
+
+Signed-off-by: Norbert Lange <nolange79@gmail.com>
+
+diff -burN fakeroot-1.20.2.org/libfakeroot.c fakeroot-1.20.2/libfakeroot.c
+--- fakeroot-1.20.2.org/libfakeroot.c	2014-10-05 17:16:00.000000000 +0200
++++ fakeroot-1.20.2/libfakeroot.c	2020-05-10 22:24:18.896625085 +0200
+@@ -880,7 +880,7 @@
+   /* If AT_SYMLINK_NOFOLLOW is set in the fchownat call it should
+      be when we stat it. */
+   INT_STRUCT_STAT st;
+-  r=INT_NEXT_FSTATAT(dir_fd, path, &st, (flags & AT_SYMLINK_NOFOLLOW));
++  r=INT_NEXT_FSTATAT(dir_fd, path, &st, (flags & (AT_SYMLINK_NOFOLLOW | AT_EMPTY_PATH | AT_NO_AUTOMOUNT)));
+
+   if(r)
+     return(r);
+@@ -1017,7 +1017,7 @@
+
+   /* If AT_SYMLINK_NOFOLLOW is set in the fchownat call it should
+      be when we stat it. */
+-  r=INT_NEXT_FSTATAT(dir_fd, path, &st, flags & AT_SYMLINK_NOFOLLOW);
++  r=INT_NEXT_FSTATAT(dir_fd, path, &st, flags & (AT_SYMLINK_NOFOLLOW | AT_EMPTY_PATH | AT_NO_AUTOMOUNT));
+
+   if(r)
+     return(r);
