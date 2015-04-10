From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 10 Apr 2015 23:12:09 +0200
Subject: [Buildroot] [PATCH] package/gdb: fix uClibc build whitout MMU
Message-ID: <1428700329-670-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/9e4/9e4df085319e346803c26c65478accb27eb950ae

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 .../0001-gdbserver-fix-uClibc-whithout-MMU.patch   | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/gdb/7.8.2/0001-gdbserver-fix-uClibc-whithout-MMU.patch

diff --git a/package/gdb/7.8.2/0001-gdbserver-fix-uClibc-whithout-MMU.patch b/package/gdb/7.8.2/0001-gdbserver-fix-uClibc-whithout-MMU.patch
new file mode 100644
index 0000000..42168df
--- /dev/null
+++ b/package/gdb/7.8.2/0001-gdbserver-fix-uClibc-whithout-MMU.patch
@@ -0,0 +1,34 @@
+From 59432cbfe267ad89b7cfc73dcd702b8282ef4e9d Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Fri, 10 Apr 2015 22:58:07 +0200
+Subject: [PATCH] gdbserver: fix uClibc whithout MMU.
+
+Since commit d86d4aafd4fa22fa4cccb83253fb187b03f97f48, the pid
+must be retrieved from current_inferior.
+
+The change has not been made in the function linux_read_offsets().
+
+Fixes:
+http://autobuild.buildroot.net/results/9e4/9e4df085319e346803c26c65478accb27eb950ae/build-end.log
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ gdb/gdbserver/linux-low.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gdb/gdbserver/linux-low.c b/gdb/gdbserver/linux-low.c
+index 1a40897..71d078a 100644
+--- a/gdb/gdbserver/linux-low.c
++++ b/gdb/gdbserver/linux-low.c
+@@ -4933,7 +4933,7 @@ static int
+ linux_read_offsets (CORE_ADDR *text_p, CORE_ADDR *data_p)
+ {
+   unsigned long text, text_end, data;
+-  int pid = lwpid_of (get_thread_lwp (current_inferior));
++  int pid = lwpid_of (current_inferior);
+ 
+   errno = 0;
+ 
+-- 
+1.9.3
+
-- 
1.9.3
