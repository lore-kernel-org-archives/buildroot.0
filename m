Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16C8C369D2
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 21:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5389660643;
	Sat, 19 Apr 2025 21:05:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QqVMk4JTVJIe; Sat, 19 Apr 2025 21:05:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2967607EC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2967607EC;
	Sat, 19 Apr 2025 21:05:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 08622232
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3508403FE
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:05:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HdDBrQBpF-vt for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 21:05:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D9824064D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D9824064D
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:05:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D63E285CD1; Sat, 19 Apr 2025 21:05:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Apr 2025 22:50:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fd914e9e4c23237fc7681eff86889916f81d478e
X-Git-Newrev: 6fd3e498af1bf837f3318eb0d47f27ac6901e7dc
X-Patchwork-Hint: ignore
Message-Id: <20250419210519.D63E285CD1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lmbench: prepare for GCC 15.x
 compatibility
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6fd3e498af1bf837f3318eb0d47f27ac6901e7dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GCC-15 requires function definitions to have proper arguments.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0006-Add-signum-param-to-signal-handlers.patch | 130 +++++++++++++++++++++
 ... 0007-scripts-build-int-return-type-main.patch} |   0
 .../lmbench/0008-Fixup-function-declarations.patch | 115 ++++++++++++++++++
 3 files changed, 245 insertions(+)

diff --git a/package/lmbench/0006-Add-signum-param-to-signal-handlers.patch b/package/lmbench/0006-Add-signum-param-to-signal-handlers.patch
new file mode 100644
index 0000000000..261a2bf8f9
--- /dev/null
+++ b/package/lmbench/0006-Add-signum-param-to-signal-handlers.patch
@@ -0,0 +1,130 @@
+From ed4f31bb09bc6355b2b642a89a1f1017de46f26e Mon Sep 17 00:00:00 2001
+From: Charlie Jenkins <charlie@rivosinc.com>
+Date: Fri, 4 Apr 2025 15:35:08 -0700
+Subject: [PATCH] Add signum param to signal handlers
+
+A signal handler is required to have a signum parameter that is an
+integer.
+
+Upstream: dead
+Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
+---
+ src/lat_udp.c |  4 ++--
+ src/lmdd.c    | 14 +++++++-------
+ src/lmhttp.c  |  4 ++--
+ 3 files changed, 11 insertions(+), 11 deletions(-)
+
+diff --git a/src/lat_udp.c b/src/lat_udp.c
+index cdd2e9b..4b4441b 100644
+--- a/src/lat_udp.c
++++ b/src/lat_udp.c
+@@ -19,7 +19,7 @@ char	*id = "$Id$\n";
+ 
+ void	client_main(int ac, char **av);
+ void	server_main();
+-void	timeout();
++void	timeout(int signum);
+ void	init(iter_t iterations, void* cookie);
+ void	cleanup(iter_t iterations, void* cookie);
+ void    doit(iter_t iterations, void* cookie);
+@@ -164,7 +164,7 @@ cleanup(iter_t iterations, void* cookie)
+ }
+ 
+ void
+-timeout()
++timeout(int signum)
+ {
+ 	fprintf(stderr, "Recv timed out\n");
+ 	exit(1);
+diff --git a/src/lmdd.c b/src/lmdd.c
+index dee37b4..529ae21 100644
+--- a/src/lmdd.c
++++ b/src/lmdd.c
+@@ -148,7 +148,7 @@ char   *cmds[] = {
+ 
+ 
+ void error(char *);
+-void    done();
++void    done(int signum);
+ #ifdef	DBG
+ extern int dbg;
+ #endif
+@@ -332,7 +332,7 @@ main(int ac, char **av)
+ 		register int moved;
+ 
+ 		if (gotcnt && count-- <= 0) {
+-			done();
++			done(0);
+ 		}
+ 
+ 		/*
+@@ -445,7 +445,7 @@ main(int ac, char **av)
+ 			perror("read");
+ 		}
+ 		if (moved <= 0) {
+-			done();
++			done(0);
+ 		}
+ 		if (inpat != -1) {
+ 			register int foo, cnt;
+@@ -458,7 +458,7 @@ main(int ac, char **av)
+ 					    (uint)(off + foo*sizeof(int)),
+ 					    buf[foo]);
+ 					if (mismatch != -1 && --misses == 0) {
+-						done();
++						done(0);
+ 					}
+ 				}
+ 			}
+@@ -523,7 +523,7 @@ main(int ac, char **av)
+ 			if (moved2 != moved) {
+ 				fprintf(stderr, "write: wanted=%d got=%d\n",
+ 				    moved, moved2);
+-				done();
++				done(0);
+ 			}
+ 			if ((Wtmax != -1) || (Wtmin != -1)) {
+ 				int mics = stop(&start_tv, &stop_tv);
+@@ -560,7 +560,7 @@ main(int ac, char **av)
+ 				perror("write");
+ 			}
+ 			if (moved2 != moved) {
+-				done();
++				done(0);
+ 			}
+ 
+ 			if (touch) {
+@@ -626,7 +626,7 @@ chkarg(char *arg)
+ }
+ 
+ void 
+-done(void)
++done(int signum)
+ {
+ 	int	i;
+ 	int	step;
+diff --git a/src/lmhttp.c b/src/lmhttp.c
+index 41d9949..9b5d665 100644
+--- a/src/lmhttp.c
++++ b/src/lmhttp.c
+@@ -26,7 +26,7 @@ char	*buf;
+ char	*bufs[3];
+ int	Dflg, dflg, nflg, lflg, fflg, zflg;
+ int	data, logfile;
+-void	die();
++void	die(int signum);
+ void	worker();
+ char	*http_time(void);
+ char	*date(time_t *tt);
+@@ -387,7 +387,7 @@ logit(int sock, char *name, int size)
+ 	nbytes += len;
+ }
+ 
+-void die()
++void die(int signum)
+ {
+ 	if (nbytes) {
+ 		write(logfile, logbuf, nbytes);
+-- 
+2.43.0
+
diff --git a/package/lmbench/0006-scripts-build-int-return-type-main.patch b/package/lmbench/0007-scripts-build-int-return-type-main.patch
similarity index 100%
rename from package/lmbench/0006-scripts-build-int-return-type-main.patch
rename to package/lmbench/0007-scripts-build-int-return-type-main.patch
diff --git a/package/lmbench/0008-Fixup-function-declarations.patch b/package/lmbench/0008-Fixup-function-declarations.patch
new file mode 100644
index 0000000000..03c14a3490
--- /dev/null
+++ b/package/lmbench/0008-Fixup-function-declarations.patch
@@ -0,0 +1,115 @@
+From 6255495abf4ea516aad3b447cc32d1b244229878 Mon Sep 17 00:00:00 2001
+From: Charlie Jenkins <charlie@rivosinc.com>
+Date: Fri, 4 Apr 2025 15:48:07 -0700
+Subject: [PATCH] Fixup function declarations
+
+GCC-15 requires function declarations to be properly typed.
+
+Upstream: dead
+Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
+---
+ src/bench.h   |  4 ++--
+ src/lat_rpc.c | 18 +++++++-----------
+ src/lmdd.c    |  4 ++--
+ 3 files changed, 11 insertions(+), 15 deletions(-)
+
+diff --git a/src/bench.h b/src/bench.h
+index 597d068..b1624c5 100644
+--- a/src/bench.h
++++ b/src/bench.h
+@@ -345,7 +345,7 @@ extern int sched_pin(int cpu);
+ #define XACT_VERS ((u_long)1)
+ #define RPC_XACT ((u_long)1)
+ #define RPC_EXIT ((u_long)2)
+-extern char *rpc_xact_1();
+-extern char *client_rpc_xact_1();
++extern char *rpc_xact_1(char *msg, register SVCXPRT *transp);
++extern char *client_rpc_xact_1(char *argp, CLIENT *clnt);
+ 
+ #endif /* _BENCH_H */
+diff --git a/src/lat_rpc.c b/src/lat_rpc.c
+index ff4380f..dcc24df 100644
+--- a/src/lat_rpc.c
++++ b/src/lat_rpc.c
+@@ -187,16 +187,14 @@ client_rpc_xact_1(char *argp, CLIENT *clnt)
+  */
+ /* ARGSUSED */
+ char	*
+-rpc_xact_1(msg, transp)
+-     	char	*msg;
+-	register SVCXPRT *transp;
++rpc_xact_1(char *msg, register SVCXPRT *transp)
+ {
+ 	static char r = 123;
+ 
+ 	return &r;
+ }
+ 
+-static void xact_prog_1();
++static void xact_prog_1(struct svc_req *rqstp, register SVCXPRT *transp);
+ 
+ void
+ server_main()
+@@ -234,16 +232,14 @@ server_main()
+ }
+ 
+ static void
+-xact_prog_1(rqstp, transp)
+-	struct svc_req *rqstp;
+-	register SVCXPRT *transp;
++xact_prog_1(struct svc_req *rqstp, register SVCXPRT *transp)
+ {
+ 	union {
+ 		char rpc_xact_1_arg;
+ 	} argument;
+ 	char *result;
+-	bool_t (*xdr_argument)(), (*xdr_result)();
+-	char *(*local)();
++	bool_t (*xdr_argument)(XDR *, char *), (*xdr_result)(XDR *, char *);
++	char *(*local)(char *, struct svc_req *);
+ 
+ 	switch (rqstp->rq_proc) {
+ 	case NULLPROC:
+@@ -253,7 +249,7 @@ xact_prog_1(rqstp, transp)
+ 	case RPC_XACT:
+ 		xdr_argument = xdr_char;
+ 		xdr_result = xdr_char;
+-		local = (char *(*)()) rpc_xact_1;
++		local = (char *(*)(char *, struct svc_req *)) rpc_xact_1;
+ 		break;
+ 
+ 	case RPC_EXIT:
+@@ -270,7 +266,7 @@ xact_prog_1(rqstp, transp)
+ 		svcerr_decode(transp);
+ 		return;
+ 	}
+-	result = (*local)(&argument, rqstp);
++	result = (*local)((char *)&argument, rqstp);
+ 	if (result != NULL && !svc_sendreply(transp, (xdrproc_t)xdr_result, result)) {
+ 		svcerr_systemerr(transp);
+ 	}
+diff --git a/src/lmdd.c b/src/lmdd.c
+index 529ae21..197ac46 100644
+--- a/src/lmdd.c
++++ b/src/lmdd.c
+@@ -76,7 +76,7 @@ int	norepeats = -1;
+ 	bds_msg	*m1, *m2;
+ #endif
+ 
+-uint64	getarg();
++uint64	getarg(char *s, int ac, char **av);
+ int	been_there(uint64 off);
+ int	getfile(char *s, int ac, char **av);
+ 
+@@ -162,7 +162,7 @@ main(int ac, char **av)
+ 	int     Fork, misses, mismatch, outpat, inpat, in, timeopen, gotcnt;
+ 	int	slp;
+ 	uint64	skip, size, count;
+-	void	chkarg();
++	void	chkarg(char *arg);
+ 	int     i;
+ 	uint64	off = 0;
+ 	int	touch;
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
