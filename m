From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 24 Apr 2012 22:57:05 +0200
Subject: [Buildroot] [git commit] python: enable IPv6 socket support
Message-ID: <20120424210411.A7DBF96BB2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=94c297c4488ced4f580dd036a42f6718f072e57a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added patch to disable buggy_getaddrinfo test during configure when
cross-compiling.

[Peter: Remove --enable-ipv6 which is now handled globally]
Signed-off-by: Vanya Sergeev <vsergeev@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../python-2.7-016-cross-compile-getaddrinfo.patch |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

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
