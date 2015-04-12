From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Apr 2015 19:31:20 +0200
Subject: [Buildroot] [git commit] package/gdb: gdb 7.9 fix uClibc build
	whitout MMU
Message-ID: <20150412173128.E295780769@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9ccad7a22fedcd156b19072d33a145a6da5178c9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-gdbserver-fix-uClibc-whithout-MMU.patch   |   34 ++++++++++++++++++++
 1 files changed, 34 insertions(+), 0 deletions(-)

diff --git a/package/gdb/7.9/0001-gdbserver-fix-uClibc-whithout-MMU.patch b/package/gdb/7.9/0001-gdbserver-fix-uClibc-whithout-MMU.patch
new file mode 100644
index 0000000..340db67
--- /dev/null
+++ b/package/gdb/7.9/0001-gdbserver-fix-uClibc-whithout-MMU.patch
@@ -0,0 +1,34 @@
+From 570805e96bb8c458795b04f4745700795997ef40 Mon Sep 17 00:00:00 2001
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
+---
+ gdb/gdbserver/linux-low.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gdb/gdbserver/linux-low.c b/gdb/gdbserver/linux-low.c
+index 4d19c87..7585b80 100644
+--- a/gdb/gdbserver/linux-low.c
++++ b/gdb/gdbserver/linux-low.c
+@@ -4933,7 +4933,7 @@ static int
+ linux_read_offsets (CORE_ADDR *text_p, CORE_ADDR *data_p)
+ {
+   unsigned long text, text_end, data;
+-  int pid = lwpid_of (get_thread_lwp (current_thread));
++  int pid = lwpid_of (current_thread);
+ 
+   errno = 0;
+ 
+-- 
+1.9.3
+
