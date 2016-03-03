From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 3 Mar 2016 15:05:59 +0100
Subject: [Buildroot] [git commit] cpio: add security patch to fix
	CVE-2016-2037
Message-ID: <20160303140922.BE57381983@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=527b7b1153c37ad081d7d31cf5280995b09e0005
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2016-2037 - The cpio_safer_name_suffix function in util.c in cpio
2.11 allows remote attackers to cause a denial of service (out-of-bounds
write) via a crafted cpio file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cpio/0001-fix-CVE-2016-2037.patch | 51 +++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/package/cpio/0001-fix-CVE-2016-2037.patch b/package/cpio/0001-fix-CVE-2016-2037.patch
new file mode 100644
index 0000000..aec2ccb
--- /dev/null
+++ b/package/cpio/0001-fix-CVE-2016-2037.patch
@@ -0,0 +1,51 @@
+From: Pavel Raiskup
+Subject: [Bug-cpio] [PATCH] fix 1-byte out-of-bounds write
+Date: Tue, 26 Jan 2016 23:17:54 +0100
+
+Other calls to cpio_safer_name_suffix seem to be safe.
+
+* src/copyin.c (process_copy_in):  Make sure that file_hdr.c_name
+has at least two bytes allocated.
+* src/util.c (cpio_safer_name_suffix): Document that use of this
+function requires to be careful.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+Patch status: fetched/submitted
+URL: https://lists.gnu.org/archive/html/bug-cpio/2016-01/msg00005.html
+
+ src/copyin.c | 2 ++
+ src/util.c   | 5 ++++-
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/src/copyin.c b/src/copyin.c
+index cde911e..032d35f 100644
+--- a/src/copyin.c
++++ b/src/copyin.c
+@@ -1385,6 +1385,8 @@ process_copy_in ()
+          break;
+        }
+
++      if (file_hdr.c_namesize <= 1)
++        file_hdr.c_name = xrealloc(file_hdr.c_name, 2);
+       cpio_safer_name_suffix (file_hdr.c_name, false, !no_abs_paths_flag,
+                              false);
+
+diff --git a/src/util.c b/src/util.c
+index 6ff6032..2763ac1 100644
+--- a/src/util.c
++++ b/src/util.c
+@@ -1411,7 +1411,10 @@ set_file_times (int fd,
+ }
+ 
+ /* Do we have to ignore absolute paths, and if so, does the filename
+-   have an absolute path?  */
++   have an absolute path?
++   Before calling this function make sure that the allocated NAME buffer has
++   capacity@least 2 bytes to allow us to store the "." string inside.  */
++
+ void
+ cpio_safer_name_suffix (char *name, bool link_target, bool absolute_names,
+                        bool strip_leading_dots)
+--
+2.5.0
