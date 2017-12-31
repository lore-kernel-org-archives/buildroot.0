From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Dec 2017 09:14:53 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] rsync: add upstream
 security fix for CVE-2017-16548
Message-ID: <20171231083605.93776838FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=30e58bbff65fa7c3017a8314ea97f26cd2caa803
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

The receive_xattr function in xattrs.c in rsync 3.1.2 and 3.1.3-development
does not check for a trailing '\0' character in an xattr name, which allows
remote attackers to cause a denial of service (heap-based buffer over-read
and application crash) or possibly have unspecified other impact by sending
crafted data to the daemon.

For more details, see:
https://bugzilla.samba.org/show_bug.cgi?id=13112

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7f33f1d848908975b513f852873ae4fdb2702183)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ailing-0-when-receiving-xattr-name-values.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/rsync/0004-Enforce-trailing-0-when-receiving-xattr-name-values.patch b/package/rsync/0004-Enforce-trailing-0-when-receiving-xattr-name-values.patch
new file mode 100644
index 0000000..be90400
--- /dev/null
+++ b/package/rsync/0004-Enforce-trailing-0-when-receiving-xattr-name-values.patch
@@ -0,0 +1,33 @@
+From 47a63d90e71d3e19e0e96052bb8c6b9cb140ecc1 Mon Sep 17 00:00:00 2001
+From: Wayne Davison <wayned@samba.org>
+Date: Sun, 5 Nov 2017 11:33:15 -0800
+Subject: [PATCH] Enforce trailing \0 when receiving xattr name values. Fixes
+ bug 13112.
+
+Fixes CVE-2017-16548
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+Patch status: upstream commit 47a63d90e7
+
+ xattrs.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/xattrs.c b/xattrs.c
+index 68305d75..4867e6f5 100644
+--- a/xattrs.c
++++ b/xattrs.c
+@@ -824,6 +824,10 @@ void receive_xattr(int f, struct file_struct *file)
+ 			out_of_memory("receive_xattr");
+ 		name = ptr + dget_len + extra_len;
+ 		read_buf(f, name, name_len);
++		if (name_len < 1 || name[name_len-1] != '\0') {
++			rprintf(FERROR, "Invalid xattr name received (missing trailing \\0).\n");
++			exit_cleanup(RERR_FILEIO);
++		}
+ 		if (dget_len == datum_len)
+ 			read_buf(f, ptr, dget_len);
+ 		else {
+-- 
+2.11.0
+
