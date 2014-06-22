From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 22 Jun 2014 09:51:49 -0300
Subject: [Buildroot] [PATCH] libhid: fix for nommu
Message-ID: <1403441509-27982-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make it accept uclinux in the tuple as linux. Fixes:
http://autobuild.buildroot.net/results/07f/07f2a560d9915ff7bad830be11f95aa856ce0e73/

Upstream seems dead with the last commit in svn being 5+ years ago and
with some recent patches in the mailing list just sitting there.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...libhid-0001-dont-fiddle-with-debug-flags.patch} |  0
 ...tch => libhid-0002-no-newline-in-ldflags.patch} |  0
 package/libhid/libhid-0003-uclinux.patch           | 27 ++++++++++++++++++++++
 3 files changed, 27 insertions(+)
 rename package/libhid/{libhid-dont-fiddle-with-debug-flags.patch => libhid-0001-dont-fiddle-with-debug-flags.patch} (100%)
 rename package/libhid/{libhid-no-newline-in-ldflags.patch => libhid-0002-no-newline-in-ldflags.patch} (100%)
 create mode 100644 package/libhid/libhid-0003-uclinux.patch

diff --git a/package/libhid/libhid-dont-fiddle-with-debug-flags.patch b/package/libhid/libhid-0001-dont-fiddle-with-debug-flags.patch
similarity index 100%
rename from package/libhid/libhid-dont-fiddle-with-debug-flags.patch
rename to package/libhid/libhid-0001-dont-fiddle-with-debug-flags.patch
diff --git a/package/libhid/libhid-no-newline-in-ldflags.patch b/package/libhid/libhid-0002-no-newline-in-ldflags.patch
similarity index 100%
rename from package/libhid/libhid-no-newline-in-ldflags.patch
rename to package/libhid/libhid-0002-no-newline-in-ldflags.patch
diff --git a/package/libhid/libhid-0003-uclinux.patch b/package/libhid/libhid-0003-uclinux.patch
new file mode 100644
index 0000000..cb3c452
--- /dev/null
+++ b/package/libhid/libhid-0003-uclinux.patch
@@ -0,0 +1,27 @@
+Good old 'uclinux is also linux'
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura libhid-0.2.16.orig/configure.ac libhid-0.2.16/configure.ac
+--- libhid-0.2.16.orig/configure.ac	2014-06-22 09:35:50.277261742 -0300
++++ libhid-0.2.16/configure.ac	2014-06-22 09:36:10.688951947 -0300
+@@ -80,6 +80,7 @@
+ 
+ MD_CONF_DEBUGGING
+ MD_CONF_COMPILER
++AM_CONDITIONAL(OS_LINUX, test "$MD_OS" = "uclinux")
+ AM_CONDITIONAL(OS_LINUX, test "$MD_OS" = "linux")
+ AM_CONDITIONAL(OS_BSD, test "$MD_OS" = "bsd")
+ AM_CONDITIONAL(OS_SOLARIS, test "$MD_OS" = "solaris")
+diff -Nura libhid-0.2.16.orig/m4/md_check_os.m4 libhid-0.2.16/m4/md_check_os.m4
+--- libhid-0.2.16.orig/m4/md_check_os.m4	2014-06-22 09:35:50.275261675 -0300
++++ libhid-0.2.16/m4/md_check_os.m4	2014-06-22 09:46:17.651475891 -0300
+@@ -3,7 +3,7 @@
+     AC_CANONICAL_HOST
+     AC_MSG_CHECKING(for target OS)
+     case $host in
+-      *-linux*)
++      *-linux*|*-uclinux*)
+         AC_DEFINE(OS_LINUX, [], [define to 1 if building for Linux])
+         AC_SUBST(OS_LINUX)
+         MD_OS=linux
-- 
1.8.5.5
