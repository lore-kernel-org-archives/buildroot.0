From: Nathaniel Roach <nroach44@gmail.com>
Date: Sun,  1 Mar 2015 17:10:58 +0800
Subject: [Buildroot] [PATCH 1/1] package/systemd: journald should use
	volatile storage
Message-ID: <1425201058-3946-1-git-send-email-nroach44@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

(By default)

This fixes https://bugs.busybox.net/show_bug.cgi?id=7892

Journald was attempting to write the logs to file before the
underlying file system was up. A proposed solution was to bring
/tmp up beforehand, but that did not always solve the issue.

In addition, since the logging directory was a tmpfs to begin with
(/var/log -> /tmp) this should save some cycles.

Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
---
 package/systemd/0004-fix-journald-on-tmpfs.patch | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 package/systemd/0004-fix-journald-on-tmpfs.patch

diff --git a/package/systemd/0004-fix-journald-on-tmpfs.patch b/package/systemd/0004-fix-journald-on-tmpfs.patch
new file mode 100644
index 0000000..c143e47
--- /dev/null
+++ b/package/systemd/0004-fix-journald-on-tmpfs.patch
@@ -0,0 +1,12 @@
+--- systemd-218.orig/src/journal/journald.conf
++++ systemd-218/src/journal/journald.conf
+@@ -11,7 +11,7 @@
+ # See journald.conf(5) for details
+ 
+ [Journal]
+-#Storage=auto
++Storage=volatile
+ #Compress=yes
+ #Seal=yes
+ #SplitMode=uid
+
-- 
2.1.4
