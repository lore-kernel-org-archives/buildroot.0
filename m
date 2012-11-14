From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Nov 2012 23:00:18 +0100
Subject: [Buildroot] [git commit] nfs-utils: add patches to allow
	compilation against libtirpc
Message-ID: <20121114220321.88A9599FD6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aca0d2a1af44acb610d4f23ceafda482590a3011
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libtirpc does not implement the reentrant function getrpcbynumber_r(),
so allow nfs-utils to use the non-reentrant version
getrpcbynumber(). This should not be a problem as nfs-utils tools are
not multi-threaded.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...-of-getrpcbynumber-when-getrpcbynumber_r-.patch |   70 ++++++++++++++++++++
 ...figure-script-find-getrpcbynumber-in-libt.patch |   38 +++++++++++
 2 files changed, 108 insertions(+), 0 deletions(-)

diff --git a/package/nfs-utils/nfs-utils-0005-Allow-usage-of-getrpcbynumber-when-getrpcbynumber_r-.patch b/package/nfs-utils/nfs-utils-0005-Allow-usage-of-getrpcbynumber-when-getrpcbynumber_r-.patch
new file mode 100644
index 0000000..7c9f3c3
--- /dev/null
+++ b/package/nfs-utils/nfs-utils-0005-Allow-usage-of-getrpcbynumber-when-getrpcbynumber_r-.patch
@@ -0,0 +1,70 @@
+From a4c15a4f9f49fd2ae5eee7eef54c67f4842952b2 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 10 Nov 2012 18:42:28 +0100
+Subject: [PATCH] Allow usage of getrpcbynumber() when getrpcbynumber_r() is
+ not available
+
+getrpcbynumber_r() is not implemented by libtirpc at the moment, only
+the non-reentrant getrpcbynumber() is available. Since nfs-utils seems
+to only be using getrpcbynumber_r() is a non multithreaded context,
+using getrpcbynumber() should work just as well.
+
+We also take this opportunity to adjust the autoconf checks to verify
+whether any of getrpcbynumber() or getrpcbynumber_r() is available,
+and error out if none of them is available.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.ac             |    8 ++++----
+ support/nfs/svc_socket.c |    6 ++++++
+ 2 files changed, 10 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index b408f1b..41216c9 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -246,9 +246,6 @@ AC_CHECK_FUNC([connect], ,
+ AC_CHECK_FUNC([getaddrinfo], ,
+               [AC_MSG_ERROR([Function 'getaddrinfo' not found.])])
+ 
+-AC_CHECK_FUNC([getrpcbynumber], ,
+-              [AC_MSG_ERROR([Function 'getrpcbynumber' not found.])])
+-
+ AC_CHECK_FUNC([getservbyname], ,
+               [AC_MSG_ERROR([Function 'getservbyname' not found.])])
+ 
+@@ -393,8 +390,11 @@ AC_CHECK_FUNCS([alarm atexit dup2 fdatasync ftruncate getcwd \
+                getnameinfo getrpcbyname getifaddrs \
+                gettimeofday hasmntopt inet_ntoa innetgr memset mkdir pathconf \
+                realpath rmdir select socket strcasecmp strchr strdup \
+-               strerror strrchr strtol strtoul sigprocmask])
++               strerror strrchr strtol strtoul sigprocmask getrpcbynumber getrpcbynumber_r])
+ 
++if test "$ac_cv_func_getrpcbynumber_r" != "yes" -a "$ac_cv_func_getrpcbynumber" != "yes"; then
++   AC_MSG_ERROR([Neither getrpcbynumber_r nor getrpcbynumber are available])
++fi
+ 
+ dnl *************************************************************
+ dnl Check for data sizes
+diff --git a/support/nfs/svc_socket.c b/support/nfs/svc_socket.c
+index f56f310..61ccf5b 100644
+--- a/support/nfs/svc_socket.c
++++ b/support/nfs/svc_socket.c
+@@ -42,8 +42,14 @@ int getservport(u_long number, const char *proto)
+ 	struct servent servbuf, *servp = NULL;
+ 	int ret;
+ 
++#if HAVE_GETRPCBYNUMBER_R
+ 	ret = getrpcbynumber_r(number, &rpcbuf, rpcdata, sizeof rpcdata,
+ 				&rpcp);
++#else
++	rpcp = getrpcbynumber(number);
++	ret = 0;
++#endif
++
+ 	if (ret == 0 && rpcp != NULL) {
+ 		/* First try name.  */
+ 		ret = getservbyname_r(rpcp->r_name, proto, &servbuf, servdata,
+-- 
+1.7.9.5
+
diff --git a/package/nfs-utils/nfs-utils-0006-Let-the-configure-script-find-getrpcbynumber-in-libt.patch b/package/nfs-utils/nfs-utils-0006-Let-the-configure-script-find-getrpcbynumber-in-libt.patch
new file mode 100644
index 0000000..1ca17b7
--- /dev/null
+++ b/package/nfs-utils/nfs-utils-0006-Let-the-configure-script-find-getrpcbynumber-in-libt.patch
@@ -0,0 +1,38 @@
+From 7ea7814a8b87a0faa50fb9f4a486bfd7a376f3fc Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 10 Nov 2012 18:53:03 +0100
+Subject: [PATCH] Let the configure script find getrpcbynumber in libtirpc
+
+The getrpcbynumber() function may not be available in the C library,
+but only in the libtirpc library. Take this into account when checking
+for the existence of getrpcbynumber() and getrpcbynumber_r().
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.ac |   10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 41216c9..1bbecfa 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -390,7 +390,15 @@ AC_CHECK_FUNCS([alarm atexit dup2 fdatasync ftruncate getcwd \
+                getnameinfo getrpcbyname getifaddrs \
+                gettimeofday hasmntopt inet_ntoa innetgr memset mkdir pathconf \
+                realpath rmdir select socket strcasecmp strchr strdup \
+-               strerror strrchr strtol strtoul sigprocmask getrpcbynumber getrpcbynumber_r])
++               strerror strrchr strtol strtoul sigprocmask])
++
++save_CFLAGS=$CFLAGS
++save_LIBS=$LIBS
++CFLAGS="$CFLAGS $AM_CPPFLAGS"
++LIBS="$LIBS $LIBTIRPC"
++AC_CHECK_FUNCS([getrpcbynumber getrpcbynumber_r])
++CFLAGS=$save_CFLAGS
++LIBS=$save_LIBS
+ 
+ if test "$ac_cv_func_getrpcbynumber_r" != "yes" -a "$ac_cv_func_getrpcbynumber" != "yes"; then
+    AC_MSG_ERROR([Neither getrpcbynumber_r nor getrpcbynumber are available])
+-- 
+1.7.9.5
+
