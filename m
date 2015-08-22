From: Brendan Heading <brendanheading@gmail.com>
Date: Sat, 22 Aug 2015 22:55:41 +0100
Subject: [Buildroot] [PATCH 1/1] package/libtirpc: fix atomic compilation
	issues on some arches
Message-ID: <1440280541-28020-1-git-send-email-brendanheading@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes : http://autobuild.buildroot.net/results/fe0/fe0a36890c5de7cca1f35212c4434d53463c4641/

The build is failing because SPARCv8/Leon do not support some the atomic
builtin being used. It's likely that some other architectures will see
the same issues.

As the patch comments note, one of the upstream maintainers feels that
the API which uses the atomic builtin should not be there to start with,
and has suggested it be removed. We are now waiting to see if there is
consensus on this with another principal maintainer.

In the meantime, we can apply the patch speculatively to fix the
autobuild errors. Since several packages depend on libtirpc it is simpler
to do this rather than disable all the dependent packages for each
of the architectures which have this limitation.

Signed-off-by: Brendan Heading <brendanheading@gmail.com>
---
 .../0008-Revert-Reference-count-AUTHs.patch        | 120 +++++++++++++++++++++
 1 file changed, 120 insertions(+)
 create mode 100644 package/libtirpc/0008-Revert-Reference-count-AUTHs.patch

diff --git a/package/libtirpc/0008-Revert-Reference-count-AUTHs.patch b/package/libtirpc/0008-Revert-Reference-count-AUTHs.patch
new file mode 100644
index 0000000..b7080ac
--- /dev/null
+++ b/package/libtirpc/0008-Revert-Reference-count-AUTHs.patch
@@ -0,0 +1,120 @@
+From e49380b0dbf4241070f0af3cb5d1237ff90a7207 Mon Sep 17 00:00:00 2001
+From: Brendan Heading <brendanheading@gmail.com>
+Date: Sat, 22 Aug 2015 13:50:33 +0100
+Subject: [PATCH 1/2] Revert "Reference count AUTHs"
+
+This reverts commit 8271dfe7ec97a993fe3e369c9e02165f54f32322.
+
+The change introduced by this patch is under discussion with the
+libtirpc maintainers. The jist is that the auth_get/auth_set functions
+which were added by the commit being reverted here amount to
+inappropriate extensions to the API, which do not form part of the
+TI-RPC spec.
+
+The libtirpc maintainers are still discussing the final solution, but
+reverting the change (as per this patch) is the most likely outcome.
+
+See discussion here :
+https://sourceforge.net/p/libtirpc/mailman/message/34372096/
+
+Upstream-status: pending
+
+Signed-off-by: Brendan Heading <brendanheading@gmail.com>
+---
+ src/auth_des.c   |  1 -
+ src/auth_gss.c   |  2 --
+ src/auth_unix.c  |  1 -
+ tirpc/rpc/auth.h | 31 ++++---------------------------
+ 4 files changed, 4 insertions(+), 31 deletions(-)
+
+diff --git a/src/auth_des.c b/src/auth_des.c
+index f8749b0..4d3639e 100644
+--- a/src/auth_des.c
++++ b/src/auth_des.c
+@@ -223,7 +223,6 @@ authdes_pk_seccreate(const char *servername, netobj *pkey, u_int window,
+ 		goto failed;
+ 	}
+ 	ad->ad_nis_srvr = NULL; /* not needed any longer */
+-	auth_get(auth);		/* Reference for caller */
+ 	return (auth);
+ 
+ failed:
+diff --git a/src/auth_gss.c b/src/auth_gss.c
+index 722d54c..7712a7f 100644
+--- a/src/auth_gss.c
++++ b/src/auth_gss.c
+@@ -204,8 +204,6 @@ authgss_create(CLIENT *clnt, gss_name_t name, struct rpc_gss_sec *sec)
+ 
+ 	if (!authgss_refresh(auth, NULL))
+ 		auth = NULL;
+-	else
+-		auth_get(auth); /* Reference for caller */
+ 
+ 	clnt->cl_auth = save_auth;
+ 
+diff --git a/src/auth_unix.c b/src/auth_unix.c
+index 3009543..fc2be02 100644
+--- a/src/auth_unix.c
++++ b/src/auth_unix.c
+@@ -161,7 +161,6 @@ authunix_create(machname, uid, gid, len, aup_gids)
+ 	 */
+ 	auth->ah_cred = au->au_origcred;
+ 	marshal_new_auth(auth);
+-	auth_get(auth);		/* Reference for caller */
+ 	return (auth);
+ #ifndef _KERNEL
+  cleanup_authunix_create:
+diff --git a/tirpc/rpc/auth.h b/tirpc/rpc/auth.h
+index 3e44863..667f541 100644
+--- a/tirpc/rpc/auth.h
++++ b/tirpc/rpc/auth.h
+@@ -191,22 +191,8 @@ typedef struct __auth {
+ 
+ 	} *ah_ops;
+ 	void *ah_private;
+-	int ah_refcnt;
+ } AUTH;
+ 
+-static __inline int
+-auth_get(AUTH *auth)
+-{
+-	return __sync_add_and_fetch(&auth->ah_refcnt, 1);
+-}
+-
+-static __inline int
+-auth_put(AUTH *auth)
+-{
+-	return __sync_sub_and_fetch(&auth->ah_refcnt, 1);
+-}
+-
+-
+ 
+ /*
+  * Authentication ops.
+@@ -236,19 +222,10 @@ auth_put(AUTH *auth)
+ #define auth_refresh(auth, msg)		\
+ 		((*((auth)->ah_ops->ah_refresh))(auth, msg))
+ 
+-#define AUTH_DESTROY(auth)						\
+-		do {							\
+-			int refs;					\
+-			if ((refs = auth_put((auth))) == 0)		\
+-				((*((auth)->ah_ops->ah_destroy))(auth));\
+-		} while (0)
+-
+-#define auth_destroy(auth)						\
+-		do {							\
+-			int refs;					\
+-			if ((refs = auth_put((auth))) == 0)		\
+-				((*((auth)->ah_ops->ah_destroy))(auth));\
+-		} while (0)
++#define AUTH_DESTROY(auth)		\
++		((*((auth)->ah_ops->ah_destroy))(auth))
++#define auth_destroy(auth)		\
++		((*((auth)->ah_ops->ah_destroy))(auth))
+ 
+ #define AUTH_WRAP(auth, xdrs, xfunc, xwhere)            \
+ 		((*((auth)->ah_ops->ah_wrap))(auth, xdrs, \
+-- 
+2.4.3
+
-- 
2.4.3
