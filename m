From: Vanya Sergeev <vsergeev@gmail.com>
Date: Sun, 22 Apr 2012 07:03:16 -0400
Subject: [Buildroot] [PATCH] python: enabled IPv6 socket support
Message-ID: <1335092596-16077-1-git-send-email-vsergeev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: vsergeev <vsergeev@gmail.com>

Modified python package Makefile to pass the configure option for IPv6 socket
support if BR2_INET_IPV6 is set. Added patch to disable buggy_getaddrinfo test
during configure when cross-compiling.

Signed-off-by: Vanya Sergeev <vsergeev@gmail.com>
---
 .../python-2.7-016-cross-compile-getaddrinfo.patch      |   15 +++++++++++++++
 package/python/python.mk                                |    4 ++++
 2 files changed, 19 insertions(+)
 create mode 100644 package/python/python-2.7-016-cross-compile-getaddrinfo.patch

diff --git a/package/python/python-2.7-016-cross-compile-getaddrinfo.patch b/package/python/python-2.7-016-cross-compile-getaddrinfo.patch
new file mode 100644
index 0000000..dae3005
--- /dev/null
+++ b/package/python/python-2.7-016-cross-compile-getaddrinfo.patch
@@ -0,0 +1,15 @@
+Disable buggy_getaddrinfo configure test when cross-compiling with IPv6 support
+
+Signed-off-by: Vanya Sergeev <vsergeev@gmail.com>
+
+--- python-2.7.2.orig/configure.in	2012-04-22 06:52:09.361809545 -0400
++++ python-2.7.2/configure.in	2012-04-22 06:56:37.900634194 -0400
+@@ -3128,7 +3128,7 @@
+ 
+ AC_MSG_RESULT($ac_cv_buggy_getaddrinfo)
+ 
+-if test $have_getaddrinfo = no -o "$ac_cv_buggy_getaddrinfo" = yes
++if test $have_getaddrinfo = no || test "$cross_compiling" != "yes" -a "$ac_cv_buggy_getaddrinfo" = yes
+ then
+ 	if test $ipv6 = yes
+ 	then
diff --git a/package/python/python.mk b/package/python/python.mk
index 28e215c..705cb80 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -55,6 +55,10 @@ HOST_PYTHON_DEPENDENCIES = host-expat host-zlib
 
 PYTHON_INSTALL_STAGING = YES
 
+ifeq ($(BR2_INET_IPV6),y)
+PYTHON_CONF_OPT += --enable-ipv6
+endif
+
 ifeq ($(BR2_PACKAGE_PYTHON_READLINE),y)
 PYTHON_DEPENDENCIES += readline
 endif
-- 
1.7.10
