From: Ed Blake <ed.blake@sondrel.com>
Date: Wed, 17 Jan 2018 10:08:58 +0000
Subject: [Buildroot] [PATCH] rpcbind: fix attempt to free non-dynamic memory
Message-ID: <20180117100858.30401-1-ed.blake@sondrel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 954509f added a security fix for CVE-2017-8779, involving
pairing all svc_getargs() calls with svc_freeargs() to avoid a memory
leak.  This included adding a call to svc_freeargs() to
rpcbproc_callit_com().

However, rpcbproc_callit_com() allocates memory for args.rmt_args.args
itself, either dynamically (sendsz > RPC_BUF_MAX) or else on the stack,
rather than having the memory allocated in svc_getargs().

The call to svc_freeargs() results in an attempt to free the memory
allocated by rpcbproc_callit_com(), which if on the stack results in
undefined behaviour.

Fix this by removing the svc_freeargs() call, which is not required as
rpcbproc_callit_com() allocates (and correctly frees) memory itself.

Change-Id: I7fc34efd58408ec5e626da8edd08aa697ed8b936
Signed-off-by: Ed Blake <ed.blake@sondrel.com>
---
 ...pair-all-svc_getargs-calls-with-svc_freeargs.patch | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/package/rpcbind/0004-rpcbind-pair-all-svc_getargs-calls-with-svc_freeargs.patch b/package/rpcbind/0004-rpcbind-pair-all-svc_getargs-calls-with-svc_freeargs.patch
index 130e5d77c..91fe20830 100644
--- a/package/rpcbind/0004-rpcbind-pair-all-svc_getargs-calls-with-svc_freeargs.patch
+++ b/package/rpcbind/0004-rpcbind-pair-all-svc_getargs-calls-with-svc_freeargs.patch
@@ -207,25 +207,6 @@ index b673452..3e37b54 100644
  	}
  
  	if (rqstp->rq_proc == RPCBPROC_SET
-diff --git a/src/rpcb_svc_com.c b/src/rpcb_svc_com.c
-index ff9ce6b..98ede61 100644
---- a/src/rpcb_svc_com.c
-+++ b/src/rpcb_svc_com.c
-@@ -931,6 +931,14 @@ error:
- 	if (call_msg.rm_xid != 0)
- 		(void) free_slot_by_xid(call_msg.rm_xid);
- out:
-+	if (!svc_freeargs(transp, (xdrproc_t) xdr_rmtcall_args, (char *) &a)) {
-+		if (debugging) {
-+			(void) xlog(LOG_DEBUG, "unable to free arguments\n");
-+			if (doabort) {
-+				rpcbind_abort();
-+			}
-+		}
-+	}
- 	if (local_uaddr)
- 		free(local_uaddr);
- 	if (buf_alloc)
 -- 
 2.11.0
 
-- 
2.11.0
