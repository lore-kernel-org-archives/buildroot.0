Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE6EC369A2
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 23:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01D0383F3B;
	Wed,  9 Apr 2025 23:14:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RGCXmKhJmVam; Wed,  9 Apr 2025 23:14:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A778820B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A778820B8;
	Wed,  9 Apr 2025 23:14:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 072B9138
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 23:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ECF7F40C78
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 23:14:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 631R5GjcqThs for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 23:14:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com;
 envelope-from=charlie@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 886A5402CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 886A5402CE
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 886A5402CE
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 23:14:10 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2279915e06eso1764275ad.1
 for <buildroot@buildroot.org>; Wed, 09 Apr 2025 16:14:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744240450; x=1744845250;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CxefMObhyr3sZcItM/WtLt0I6BLnpiZsU8ZqyI8L2pg=;
 b=HGqRN41EJmSAy770ImwuzBUTsURsEKxqAwUO+AU1uY9oLbSC6h/5un8Ia7gbDE36Xf
 cxGFFlv0czg+9sOU9uNpoy8TsPqHdau91evUtnExBXp//rHUANxfA8+k1vCzxup7lekl
 bk3YLAPK56227OTZcGXrlh46rkdUNFh5bePb2HFp2yu5X5SpvtO2dkyR/pqdQh+TWC/y
 IwQrcq7VdNm5X5z7jr9Wc4sCU1r812qgROvpGE5JqZC6z0/NPxOo9H2lqRALtLyi88F7
 iY7xnxpIyfyAOmj3VOoJMytlvA18ENUKc/8GjE/7qWfAF1mcMJhHDAsVWCbeigvo7d3C
 XwdQ==
X-Gm-Message-State: AOJu0YzpT7IAm+vFsi4hliafTeZSyYkSNBiGdjK4otMdZsxTVCFOiY+n
 yPcK11Vo6irwRhc8bUfCZwlmAXLIL9bSH1uBHLCWzJDanfk/L0vUOBe4plRY5/1ZhyXdT9gSOnM
 6
X-Gm-Gg: ASbGncuhsBGO2EPVfZg32Z6ym3EvCyd3oawnLaujA6GF3wvGb3J2xMs2sQ5UbPHRgLw
 jzYiPrRirieMvFvnhbc4yMiJ9yXhEahXztnnBdNUM207+i4NT8jUP7+0Tt6reABbvWuuFBRIxQQ
 EHUTId8+XQci99oVUASvd7Zj+UvFIdLp+vd4W+QK4mkc8kO9NHymkeRZ9o0kwDn0GjvriMfw4MZ
 Jzy6r+2N30ICez8qRdgKTjAhzGkq3iJG9+ju0tUYNOxhgM3lx/iSJpoxXnkwwwoxyonmVX2cVsP
 Ipxa4hn2R6HYyvewwvW/2sOY/CbLwG9rv+nuFEq6U6sBGXlqElGt7i0E
X-Google-Smtp-Source: AGHT+IHNjd0/sPJYCSbB3c8o5Ay0B4Qo7NjEETo4bmKGfjRIA2rkUEo6BET20QZPa2kwCyfywpMZSQ==
X-Received: by 2002:a17:902:d485:b0:227:ac2a:1dcf with SMTP id
 d9443c01a7336-22b2edebfcemr7363045ad.23.1744240449744; 
 Wed, 09 Apr 2025 16:14:09 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-306df401ab2sm2303460a91.48.2025.04.09.16.14.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 16:14:08 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 09 Apr 2025 16:13:47 -0700
MIME-Version: 1.0
Message-Id: <20250409-lmbench_gcc15-v1-1-608717424aa9@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIACr/9mcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEwMT3ZzcpNS85Iz49ORkQ1NdSwtTAzMLU5MkSyMTJaCegqLUtMwKsHn
 RsbW1AEynbd5fAAAA
X-Change-ID: 20250404-lmbench_gcc15-98506854b924
To: buildroot@buildroot.org
Cc: Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7632; i=charlie@rivosinc.com; 
 h=from:subject:message-id;
 bh=RGVEMYFvSrZnSK8fXj/yPChJIwDHyjeH1IRAgTVbHZw=; 
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/q3/8a/bu1znlr5/EeZ5cYVuavCZn0tvTLF44TzmYPzZ
 zFe3vTycEcpC4MYF4OsmCILz7UG5tY7+mVHRcsmwMxhZQIZwsDFKQATubSD4b//qY23Cm+oeAQZ
 81zbbPm/30OIte6DA0fsUsVZGpv4gt0Z/tm/2xJ7ZX7xye9HZm5ndXCZLa+rVFftzOEg+uz2f2u
 Vm9wA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744240450; x=1744845250;
 darn=buildroot.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CxefMObhyr3sZcItM/WtLt0I6BLnpiZsU8ZqyI8L2pg=;
 b=S03d6tTXH/d0riivh+zkvJs4V7bZpAXqJpTGEIDO6dhBJ17Uh4jxcqwFKNkjzZlkXM
 QlVWF/+759laoPyXvjoSUnPKgfesTeZppzFkNhJYcQ8WiQ7bmTXUOFUHINjBtLRqPO3P
 LcUvLbQUuqQgjuM7IIOV0mfWNB9q0R4raKFhPLhyDOCxTFz+D/T9XT0jvs2xS4/ZML2g
 ksLVZUp9+6W0KYvyiiSfSM9nI6wWXLbzvhSLSS9fjHxuhL/OoZMNNhUtaeSRMSMCE3eI
 jRsWnu8d3VpPS/MYbJ1uFejdRkIhlCCe+2+0DBbdfKncEPeZY8+WiTusEXV8+HOh6lzq
 3i3A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rivosinc-com.20230601.gappssmtp.com
 header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=S03d6tTX
Subject: [Buildroot] [PATCH] package/lmbench: Fix function definitions
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

GCC-15 requires function definitions to have proper arguments. Add them
to dhrystone.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
GCC-15 hasn't been released yet but I was starting to look at what needs
to be done to run Buildroot. Here's a patch to fix lmbench.
---
 .../0006-Add-signum-param-to-signal-handlers.patch | 130 +++++++++++++++++++++
 .../lmbench/0007-Fixup-function-declarations.patch | 115 ++++++++++++++++++
 2 files changed, 245 insertions(+)

diff --git a/package/lmbench/0006-Add-signum-param-to-signal-handlers.patch b/package/lmbench/0006-Add-signum-param-to-signal-handlers.patch
new file mode 100644
index 0000000000000000000000000000000000000000..261a2bf8f9f12a67eb9192c6ef0035d9c20b19c3
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
diff --git a/package/lmbench/0007-Fixup-function-declarations.patch b/package/lmbench/0007-Fixup-function-declarations.patch
new file mode 100644
index 0000000000000000000000000000000000000000..03c14a3490836836c5ce2702626c959f2bfc7a9b
--- /dev/null
+++ b/package/lmbench/0007-Fixup-function-declarations.patch
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

---
base-commit: a3b4ae2eaca9791c7c184e49a04a348dd35185c3
change-id: 20250404-lmbench_gcc15-98506854b924
-- 
- Charlie

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
