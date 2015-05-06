From: Christian Artin <christian@gridshowsystems.com>
Date: Wed,  6 May 2015 13:26:58 -0400
Subject: [Buildroot] [PATCH] Backport valgrind patch to fix build on 4.0
	host kernels
Message-ID: <1430933218-10933-1-git-send-email-christian@gridshowsystems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Valgrind fails to build when the host kernel is >=4.0. This patch
backports the commit from upstream that fixes the kernel version
verification. This verification is pointless for buildroot anyway, but
it fixes the building process.

Signed-off-by: Christian Artin <christian@gridshowsystems.com>
---
 ...01-Fix-configure-for-Linux-kernel-4.0-rc1.patch | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/valgrind/0001-Fix-configure-for-Linux-kernel-4.0-rc1.patch

diff --git a/package/valgrind/0001-Fix-configure-for-Linux-kernel-4.0-rc1.patch b/package/valgrind/0001-Fix-configure-for-Linux-kernel-4.0-rc1.patch
new file mode 100644
index 0000000..4b33d63
--- /dev/null
+++ b/package/valgrind/0001-Fix-configure-for-Linux-kernel-4.0-rc1.patch
@@ -0,0 +1,46 @@
+From 8e958577f01e2e877fb1dbdca09718ef6ea0c748 Mon Sep 17 00:00:00 2001
+From: cborntra <cborntra@a5019735-40e9-0310-863c-91ae7b9d1cf9>
+Date: Mon, 23 Feb 2015 20:19:03 +0000
+Subject: [PATCH] Fix configure for Linux kernel >= 4.0-rc1 In addition raise
+ the minimal Linux version to 2.6 as there is almost no test coverage for 2.4
+ and 2.6 was released in 2003.
+
+git-svn-id: svn://svn.valgrind.org/valgrind/trunk at 14955 a5019735-40e9-0310-863c-91ae7b9d1cf9
+---
+ configure.ac | 18 ++++++------------
+ 1 file changed, 6 insertions(+), 12 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index bdf5f22..136f49a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -325,20 +325,14 @@ case "${host_os}" in
+         kernel=`uname -r`
+ 
+         case "${kernel}" in
+-             2.6.*|3.*) 
+-        	    AC_MSG_RESULT([2.6.x/3.x family (${kernel})])
+-        	    AC_DEFINE([KERNEL_2_6], 1, [Define to 1 if you're using Linux 2.6.x or Linux 3.x])
+-        	    ;;
+-
+-             2.4.*) 
+-        	    AC_MSG_RESULT([2.4 family (${kernel})])
+-        	    AC_DEFINE([KERNEL_2_4], 1, [Define to 1 if you're using Linux 2.4.x])
+-        	    ;;
+-
+-             *) 
++             0.*|1.*|2.0.*|2.1.*|2.2.*|2.3.*|2.4.*|2.5.*) 
+         	    AC_MSG_RESULT([unsupported (${kernel})])
+-        	    AC_MSG_ERROR([Valgrind works on kernels 2.4, 2.6])
++        	    AC_MSG_ERROR([Valgrind needs a Linux kernel >= 2.6])
+         	    ;;
++
++             *)
++        	    AC_MSG_RESULT([2.6 or later (${kernel})])
++                    ;;
+         esac
+ 
+         ;;
+-- 
+2.3.7
+
-- 
2.3.7
