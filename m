From: Brendan Heading <brendanheading@gmail.com>
Date: Wed, 12 Aug 2015 21:52:08 +0100
Subject: [Buildroot] [PATCH RFC 1/1] package/libtirpc: fix atomic issues on
	some arches
Message-ID: <1439412728-11658-1-git-send-email-brendanheading@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes http://autobuild.buildroot.net/results/577/57716a716bd954c275e1d45faa1b3efe8c7adbbe/

Patch to use mutexes on architectures that have trouble generating code
for __sync_[add|sub]_and_fetch.

---

Note - the upstream maintainers have a preference for this approach,
rather than using the libatomic fallback option, as this requires
GCC >= 4.8.

v1 - initial RFC cut. This patch conflicts with other patches in buildroot
so I left it at 0001 (which applies cleanly). Will fix when the patch is
stable.

Signed-off-by: Brendan Heading <brendanheading@gmail.com>
---
 ...architectures-with-limited-atomic-support.patch | 157 +++++++++++++++++++++
 1 file changed, 157 insertions(+)
 create mode 100644 package/libtirpc/0001-Support-architectures-with-limited-atomic-support.patch

diff --git a/package/libtirpc/0001-Support-architectures-with-limited-atomic-support.patch b/package/libtirpc/0001-Support-architectures-with-limited-atomic-support.patch
new file mode 100644
index 0000000..e4c1ea7
--- /dev/null
+++ b/package/libtirpc/0001-Support-architectures-with-limited-atomic-support.patch
@@ -0,0 +1,157 @@
+From 22402b00cd942c539ec2c56f64ac3db35bdfa9e2 Mon Sep 17 00:00:00 2001
+From: Brendan Heading <brendanheading@gmail.com>
+Date: Wed, 12 Aug 2015 21:30:41 +0100
+Subject: [RFC PATCH 1/1] Support architectures with limited atomic support
+
+Due to hardware limitations not all architectures can generate code for
+the __sync_[add|sub]_and_fetch functions.
+
+Newer versions of gcc have newer atomic builtins, and a helper library
+for cases when the compiler cannot generate code for the builtins.
+However using these would break backwards compatibility with older
+versions. Instead it was decided to use a simple mutex for the fallback
+case.
+
+This patch adds logic to detect the required support using autoconf,
+and supplies the alternative implementation using mutexes which is used
+if the atomic functions are not present.
+
+Note that the autoconf check assumes that __sync_add_and_fetch implies
+the presence of __sync_sub_and_fetch.
+
+Upstream-status: pending
+Signed-off-by: Brendan Heading <brendanheading@gmail.com>
+---
+ configure.ac     | 14 ++++++++++++++
+ src/auth_des.c   |  4 ++++
+ src/auth_gss.c   |  4 ++++
+ src/auth_unix.c  |  4 ++++
+ tirpc/rpc/auth.h | 25 +++++++++++++++++++++++++
+ 5 files changed, 51 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 99a0d33..2ab203d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -47,6 +47,20 @@ AC_CHECK_HEADERS([arpa/inet.h fcntl.h libintl.h limits.h locale.h netdb.h netine
+ AC_CHECK_LIB([pthread], [pthread_create])
+ AC_CHECK_FUNCS([getrpcbyname getrpcbynumber setrpcent endrpcent getrpcent])
+ 
++AC_MSG_CHECKING(__sync_add_and_fetch presence)
++AC_LINK_IFELSE([AC_LANG_PROGRAM([], [[
++	int x, y = 0;
++	y = __sync_add_and_fetch(&x, 0);
++	return y;
++	]])], 
++	[sync_add_and_fetch_ok=yes], [sync_add_and_fetch_ok=no])
++
++AC_MSG_RESULT($sync_add_and_fetch_ok)
++
++if test "$sync_add_and_fetch_ok" = "yes"; then
++    AC_DEFINE([HAVE_SYNC_BUILTIN], [1], [Define to 1 if __sync_add_and_fetch is available])
++fi
++
+ AC_CONFIG_FILES([Makefile src/Makefile man/Makefile doc/Makefile])
+ AC_OUTPUT(libtirpc.pc)
+ 
+diff --git a/src/auth_des.c b/src/auth_des.c
+index f8749b0..0d05e46 100644
+--- a/src/auth_des.c
++++ b/src/auth_des.c
+@@ -219,6 +219,10 @@ authdes_pk_seccreate(const char *servername, netobj *pkey, u_int window,
+ 	auth->ah_ops = authdes_ops();
+ 	auth->ah_private = (caddr_t)ad;
+ 
++#ifndef HAVE_SYNC_BUILTIN
++	mutex_init(&auth->ah_lock, NULL);
++#endif
++
+ 	if (!authdes_refresh(auth, NULL)) {
+ 		goto failed;
+ 	}
+diff --git a/src/auth_gss.c b/src/auth_gss.c
+index 722d54c..a582714 100644
+--- a/src/auth_gss.c
++++ b/src/auth_gss.c
+@@ -817,6 +817,10 @@ rpc_gss_seccreate(CLIENT *clnt, char *principal, char *mechanism,
+ 	auth->ah_ops = &authgss_ops;
+ 	auth->ah_private = (caddr_t)gd;
+ 
++#ifndef HAVE_SYNC_BUILTIN
++	mutex_init(&auth->ah_lock, NULL);
++#endif
++
+ 	save_auth = clnt->cl_auth;
+ 	clnt->cl_auth = auth;
+ 
+diff --git a/src/auth_unix.c b/src/auth_unix.c
+index 3009543..843df58 100644
+--- a/src/auth_unix.c
++++ b/src/auth_unix.c
+@@ -124,6 +124,10 @@ authunix_create(machname, uid, gid, len, aup_gids)
+ 	au->au_shfaults = 0;
+ 	au->au_origcred.oa_base = NULL;
+ 
++#ifndef HAVE_SYNC_BUILTIN
++	mutex_init(&auth->ah_lock, NULL);
++#endif
++
+ 	/*
+ 	 * fill in param struct from the given params
+ 	 */
+diff --git a/tirpc/rpc/auth.h b/tirpc/rpc/auth.h
+index 3e44863..376a3a1 100644
+--- a/tirpc/rpc/auth.h
++++ b/tirpc/rpc/auth.h
+@@ -51,6 +51,7 @@
+ #include <sys/socket.h>
+ #include <sys/types.h>
+ 
++#include <reentrant.h>
+ 
+ #define MAX_AUTH_BYTES	400
+ #define MAXNETNAMELEN	255	/* maximum length of network user's name */
+@@ -192,8 +193,12 @@ typedef struct __auth {
+ 	} *ah_ops;
+ 	void *ah_private;
+ 	int ah_refcnt;
++#ifndef HAVE_SYNC_BUILTIN
++	mutex_t ah_lock;
++#endif
+ } AUTH;
+ 
++#ifdef HAVE_SYNC_BUILTIN
+ static __inline int
+ auth_get(AUTH *auth)
+ {
+@@ -205,7 +210,27 @@ auth_put(AUTH *auth)
+ {
+ 	return __sync_sub_and_fetch(&auth->ah_refcnt, 1);
+ }
++#else
++static __inline int
++auth_get(AUTH *auth)
++{
++	int refcnt;
++	mutex_lock(&auth->ah_lock);
++	refcnt = ++auth->ah_refcnt;
++	mutex_unlock(&auth->ah_lock);
++	return refcnt;
++}
+ 
++static __inline int
++auth_put(AUTH *auth)
++{
++	int refcnt;
++	mutex_lock(&auth->ah_lock);
++	refcnt = --auth->ah_refcnt;
++	mutex_unlock(&auth->ah_lock);
++	return refcnt;
++}
++#endif
+ 
+ 
+ /*
+-- 
+2.4.3
+
-- 
2.4.3
