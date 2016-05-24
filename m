From: Charles Hardin <ckhardin@exablox.com>
Date: Tue, 24 May 2016 06:31:16 -0700
Subject: [Buildroot] [PATCH 1/1] package/xfsprogs: install in the same
	location as e2fsprogs
Message-ID: <1464096676-41655-1-git-send-email-ckhardin@exablox.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The configure script hard codes "/sbin" for installation which
installs the XFS tools in a different location then the e2fsprogs.

This is just a cosmetic patch so all the tools end up in "/usr/sbin"
for consistency.

Signed-off-by: Charles Hardin <ckhardin@exablox.com>
---
 .../0004-xfsprogs-configure-exec-prefix.patch      | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/xfsprogs/0004-xfsprogs-configure-exec-prefix.patch

diff --git a/package/xfsprogs/0004-xfsprogs-configure-exec-prefix.patch b/package/xfsprogs/0004-xfsprogs-configure-exec-prefix.patch
new file mode 100644
index 0000000..f8c1aeb
--- /dev/null
+++ b/package/xfsprogs/0004-xfsprogs-configure-exec-prefix.patch
@@ -0,0 +1,28 @@
+diff -Naur xfsprogs-3.1.11.orig/configure xfsprogs-3.1.11/configure
+--- xfsprogs-3.1.11.orig/configure	2016-01-03 19:27:44.603418507 +0000
++++ xfsprogs-3.1.11/configure	2016-01-03 19:26:16.029757743 +0000
+@@ -10036,8 +10036,8 @@
+ # case.  If the user choses a different prefix assume he just wants
+ # a local install for testing and not a system install.
+ #
+-case $exec_prefix:$prefix in
+-NONE:NONE | NONE:/usr | /usr:*)
++case $cross_compiling:$exec_prefix:$prefix in
++no:NONE:NONE | no:NONE:/usr | no:/usr:*)
+   root_sbindir='/sbin'
+   root_libdir="/${base_libdir}"
+   ;;
+diff -Naur xfsprogs-3.1.11.orig/configure.ac xfsprogs-3.1.11/configure.ac
+--- xfsprogs-3.1.11.orig/configure.ac	2016-01-03 19:28:02.258949863 +0000
++++ xfsprogs-3.1.11/configure.ac	2016-01-03 19:25:45.918554215 +0000
+@@ -64,8 +64,8 @@
+ # case.  If the user choses a different prefix assume he just wants
+ # a local install for testing and not a system install.
+ #
+-case $exec_prefix:$prefix in
+-NONE:NONE | NONE:/usr | /usr:*)
++case $cross_compiling:$exec_prefix:$prefix in
++no:NONE:NONE | no:NONE:/usr | no:/usr:*)
+   root_sbindir='/sbin'
+   root_libdir="/${base_libdir}"
+   ;;
-- 
2.7.4 (Apple Git-66)
