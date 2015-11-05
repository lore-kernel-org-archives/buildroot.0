From: Peter Rosin <peda@lysator.liu.se>
Date: Thu,  5 Nov 2015 09:30:09 +0100
Subject: [Buildroot] [PATCH 1/2] rpcbind: backport adjustment to changes in
	libtirpc 1.0.1
In-Reply-To: <1446712210-14129-1-git-send-email-peda@lysator.liu.se>
References: <1446712210-14129-1-git-send-email-peda@lysator.liu.se>
Message-ID: <1446712210-14129-2-git-send-email-peda@lysator.liu.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Peter Rosin <peda@axentia.se>

Signed-off-by: Peter Rosin <peda@axentia.se>
---
 ...ly-Don-t-use-the-xp_auth-pointer-directly.patch |   42 ++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100755 package/rpcbind/0002-handle_reply-Don-t-use-the-xp_auth-pointer-directly.patch

diff --git a/package/rpcbind/0002-handle_reply-Don-t-use-the-xp_auth-pointer-directly.patch b/package/rpcbind/0002-handle_reply-Don-t-use-the-xp_auth-pointer-directly.patch
new file mode 100755
index 0000000..6145514
--- /dev/null
+++ b/package/rpcbind/0002-handle_reply-Don-t-use-the-xp_auth-pointer-directly.patch
@@ -0,0 +1,42 @@
+From 9194122389f2a56b1cd1f935e64307e2e963c2da Mon Sep 17 00:00:00 2001
+From: Steve Dickson <steved@redhat.com>
+Date: Mon, 2 Nov 2015 17:05:18 -0500
+Subject: [PATCH] handle_reply: Don't use the xp_auth pointer directly
+
+In the latest libtirpc version to access the xp_auth
+one must use the SVC_XP_AUTH macro. To be backwards
+compatible a couple ifdefs were added to use the
+macro when it exists.
+
+Signed-off-by: Steve Dickson <steved@redhat.com>
+[peda at axentia.se: backport from upstream]
+Signed-off-by: Peter Rosin <peda@axentia.se>
+---
+ src/rpcb_svc_com.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/src/rpcb_svc_com.c b/src/rpcb_svc_com.c
+index 4ae93f1..22d6c84 100644
+--- a/src/rpcb_svc_com.c
++++ b/src/rpcb_svc_com.c
+@@ -1295,10 +1295,17 @@ handle_reply(int fd, SVCXPRT *xprt)
+ 	a.rmt_localvers = fi->versnum;
+ 
+ 	xprt_set_caller(xprt, fi);
++#if defined(SVC_XP_AUTH)
++	SVC_XP_AUTH(xprt) = svc_auth_none;
++#else 
+ 	xprt->xp_auth = &svc_auth_none;
++#endif
+ 	svc_sendreply(xprt, (xdrproc_t) xdr_rmtcall_result, (char *) &a);
++#if !defined(SVC_XP_AUTH)
+ 	SVCAUTH_DESTROY(xprt->xp_auth);
+ 	xprt->xp_auth = NULL;
++#endif
++
+ done:
+ 	if (buffer)
+ 		free(buffer);
+-- 
+2.5.3
+
-- 
1.7.10.4
