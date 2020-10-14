From: Norbert Lange <nolange79@gmail.com>
Date: Wed, 14 Oct 2020 18:02:42 +0200
Subject: [Buildroot] [PATCH v5] package/openrc: add patch to create
 /run/lock/subsys
Message-ID: <20201014160243.616162-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Together with changes to sysv/busybox init, this directory
will already exist before any service scripts are run.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 ...lso-create-run-lock-subsys-directory.patch | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/openrc/0006-Also-create-run-lock-subsys-directory.patch

diff --git a/package/openrc/0006-Also-create-run-lock-subsys-directory.patch b/package/openrc/0006-Also-create-run-lock-subsys-directory.patch
new file mode 100644
index 0000000000..58ea25d920
--- /dev/null
+++ b/package/openrc/0006-Also-create-run-lock-subsys-directory.patch
@@ -0,0 +1,29 @@
+From fd0e837f023c887b60934328f3e99c87b99ce568 Mon Sep 17 00:00:00 2001
+From: Norbert Lange <nolange79@gmail.com>
+Date: Thu, 8 Oct 2020 11:54:40 +0200
+Subject: [PATCH] Also create /run/lock/subsys directory
+
+Buildroot service scripts regularly use this directory, so
+create it in the most appropriate spot.
+
+Signed-off-by: Norbert Lange <nolange79@gmail.com>
+---
+ sh/init.sh.Linux.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sh/init.sh.Linux.in b/sh/init.sh.Linux.in
+index 222bbd3b..e56367c5 100644
+--- a/sh/init.sh.Linux.in
++++ b/sh/init.sh.Linux.in
+@@ -85,7 +85,7 @@ fi
+
+ [ -x /sbin/restorecon ] && /sbin/restorecon -rF /run
+ checkpath -d $RC_SVCDIR
+-checkpath -d -m 0775 -o root:daemon /run/lock
++checkpath -d -m 0775 -o root:daemon /run/lock /run/lock/subsys
+
+ # Try to mount xenfs as early as possible, otherwise rc_sys() will always
+ # return RC_SYS_XENU and will think that we are in a domU while it's not.
+--
+2.28.0
+
-- 
2.28.0
