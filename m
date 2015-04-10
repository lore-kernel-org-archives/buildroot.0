From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 10 Apr 2015 23:45:05 +0200
Subject: [Buildroot] [PATCH] package/gdb: gdb 7.9 fix uClibc build whitout
	MMU
Message-ID: <1428702305-28208-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../0001-gdbserver-fix-uClibc-whithout-MMU.patch   | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/gdb/7.9/0001-gdbserver-fix-uClibc-whithout-MMU.patch

diff --git a/package/gdb/7.9/0001-gdbserver-fix-uClibc-whithout-MMU.patch b/package/gdb/7.9/0001-gdbserver-fix-uClibc-whithout-MMU.patch
new file mode 100644
index 0000000..23486a3
--- /dev/null
+++ b/package/gdb/7.9/0001-gdbserver-fix-uClibc-whithout-MMU.patch
@@ -0,0 +1,38 @@
+From d3988abfa6bb97dbcad3a0ff0961e920ce84b00c Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Fri, 10 Apr 2015 22:58:07 +0200
+Subject: [PATCH] gdbserver: fix uClibc whithout MMU.
+
+Since commit d86d4aafd4fa22fa4cccb83253fb187b03f97f48, the pid
+must be retrieved from current_thread.
+
+The change has not been made in the function linux_read_offsets().
+
+Fixes:
+http://autobuild.buildroot.net/results/9e4/9e4df085319e346803c26c65478accb27eb950ae/build-end.log
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+
+Conflicts:
+	gdb/gdbserver/linux-low.c
+---
+ gdb/gdbserver/linux-low.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/gdb/gdbserver/linux-low.c b/gdb/gdbserver/linux-low.c
+index 4d19c87..23f012d 100644
+--- a/gdb/gdbserver/linux-low.c
++++ b/gdb/gdbserver/linux-low.c
+@@ -4933,7 +4933,8 @@ static int
+ linux_read_offsets (CORE_ADDR *text_p, CORE_ADDR *data_p)
+ {
+   unsigned long text, text_end, data;
+-  int pid = lwpid_of (get_thread_lwp (current_thread));
++
++  int pid = lwpid_of (current_thread);
+ 
+   errno = 0;
+ 
+-- 
+1.9.3
+
-- 
1.9.3
