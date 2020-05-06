From: Norbert Lange <nolange79@gmail.com>
Date: Wed,  6 May 2020 15:11:30 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/fakeroot: fix for
 fchownat/fchmodat
In-Reply-To: <20200506131130.410171-1-nolange79@gmail.com>
References: <20200506131130.410171-1-nolange79@gmail.com>
Message-ID: <20200506131130.410171-3-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fakeroot does mask out necessary flags, instead pass through
the flags that are supported by fstatat

Upstream BR: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=959876

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/fakeroot/0003_fix_fchownat.patch | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 package/fakeroot/0003_fix_fchownat.patch

diff --git a/package/fakeroot/0003_fix_fchownat.patch b/package/fakeroot/0003_fix_fchownat.patch
new file mode 100644
index 0000000000..d200654910
--- /dev/null
+++ b/package/fakeroot/0003_fix_fchownat.patch
@@ -0,0 +1,24 @@
+Description: fix chownat/chmodat when pathname is empty
+ this forwards all supported flags to fstatat,
+ instead of masking them out and causing errors.
+
+--- a/libfakeroot.c
++++ b/libfakeroot.c
+@@ -886,7 +886,7 @@
+   /* If AT_SYMLINK_NOFOLLOW is set in the fchownat call it should
+      be when we stat it. */
+   INT_STRUCT_STAT st;
+-  r=INT_NEXT_FSTATAT(dir_fd, path, &st, (flags & AT_SYMLINK_NOFOLLOW));
++  r=INT_NEXT_FSTATAT(dir_fd, path, &st, (flags & (AT_SYMLINK_NOFOLLOW | AT_EMPTY_PATH | AT_NO_AUTOMOUNT)));
+
+   if(r)
+     return(r);
+@@ -1023,7 +1023,7 @@
+
+   /* If AT_SYMLINK_NOFOLLOW is set in the fchownat call it should
+      be when we stat it. */
+-  r=INT_NEXT_FSTATAT(dir_fd, path, &st, flags & AT_SYMLINK_NOFOLLOW);
++  r=INT_NEXT_FSTATAT(dir_fd, path, &st, flags & (AT_SYMLINK_NOFOLLOW | AT_EMPTY_PATH | AT_NO_AUTOMOUNT));
+
+   if(r)
+     return(r);
-- 
2.26.2
