Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F1CD3B7E2
	for <buildroot@archiver.kernel.org>; Mon,  8 Dec 2025 22:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F59F83CA2;
	Mon,  8 Dec 2025 22:43:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g7qBOYOSKTwP; Mon,  8 Dec 2025 22:43:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 181D983CA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765233782;
	bh=gYVLmBDw8UbLhA+65jpOAEzoVc7cWNYnop3MdSR6ZyQ=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=S0+eypQbO5DAMFxNpLm3S8FuODWJJTwAMIR0t+Gmjpu/WvvTl1vi28QP8K1mbk4ZD
	 oNd8nLuJXYZLCZfOtwjLm+sAt0d/8wlivS+QdbKDnRB2gGVXNHthdnF1byh1ouZBFV
	 344q4Lzb5t6t1v9LhRNDZa7EB2U5F/QARG9+DTNaq1I373PpgUiDY7CXSiyeuOdqKq
	 uyo6pOiTtCgF2bD5jc9BecikuFYokk5lHmlUMCr+CgiggmuvTa2E1lIUzVNuFdAabR
	 Pr/p+06aq550604cq+uQxyuDxpsqhjhR57NBDb1WJwf2rwgfYsL3eyCcLrAYk0m56A
	 Nv2yJ5AYtHYlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 181D983CA4;
	Mon,  8 Dec 2025 22:43:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id ACB76E7
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 22:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92C4040058
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 22:43:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4cz5sN3lpIgG for <buildroot@buildroot.org>;
 Mon,  8 Dec 2025 22:42:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7243840028
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7243840028
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7243840028
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 22:42:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 38BE64E41AF9
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 22:42:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id F3AFE606DD;
 Mon,  8 Dec 2025 22:42:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DF18C103C8D5C; Mon,  8 Dec 2025 23:42:55 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Petr Vorel <petr.vorel@gmail.com>
Date: Mon,  8 Dec 2025 23:42:49 +0100
Message-ID: <20251208224251.250119-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765233776; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=YM65ELeXmIjiPDefDH8jNXl15cHakmh1G8/dVHCfMmE=;
 b=R7wF4C+j1q6xC8+DWuIQ1cFZSrHBdJxmBa07zA1RfkPBFSx5QlTXi9bkDZIfFsX/BpGj1M
 ub2ahCzLuVJZX1dxBaAMaQ7xZVb6SSY764wkowtY74+u/i1xrxQqXbjGYL5fUa+RyMVWQM
 4W1IB1Xo+0jppOjFRzeF8AMKp1eyJxFjfTkPNiuRuNIscIZnxqqy+azLAQqoFnHMKvLAgu
 +7MGcVrKW6vcoDkTfYLxtE5kuo4tGKA2UW69FTQY0DKSGAyKt2gaH3gkHn8txvGJkacMrd
 VYwl4v421DfMMOFyO7+tmDITAPgmtwoBMzfgJ7g29DfMLKI9iZ3/RKSAFmvPiw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=R7wF4C+j
Subject: [Buildroot] [PATCH] package/libtirpc: bump to version 1.3.7
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changes 1.3.6..1.3.7:

f138e68e7ffefa3f4d71857ddb137fff877fd1d0 getnetconfig.c: free linep to avoid memory leakage
eea92ef0bf2f3f0e337cfd074ebc34d91945f19b Revert "getnetconfig.c: free linep to avoid memory leakage"
d473f1e1f6ba80bfaee4daa058da159305167323 Update declarations to allow compile with gcc-15
240ee6c774729c9c24812aa8912f1fcf8996b162 update signal and key_call declarations to allow compile with gcc-15
07e45147b877c63a1d3dd1f5ae6070543b1d93cf Convert old-style function definitions into modern-style definitions
2cfe608550dbe44ac8fc6c26216f529565713fc4 Convert old-style function definitions into modern-style definitions
581152976f093f31957c48567278535ef54f6b3c Convert old-style function definitions into modern-style definitions
2832da026b0812a23e65773b313b048c68147b09 Convert old-style function definitions into modern-style definitions
d3ff4c39bbcf22e3ff736261b66a9f6c6a6bf4ca Convert old-style function definitions into modern-style definitions
791063e55d9739fa8c7c1a0d4ac1c4f8023a2843 Convert old-style function definitions into modern-style definitions
23b0aa66a34fc6de16d285fbeb60b0fd68fa40d5 Convert old-style function definitions into modern-style definitions
2c9ed28d9c364c6e7c29d9b5b740893a8baea014 Convert old-style function definitions into modern-style definitions
41cb38e2dfdc7053ebcbd777cf868f8fcbcfcf23 Convert old-style function definitions into modern-style definitions
b73283a6982f83974b48d1858735649d6acf6398 Convert old-style function definitions into modern-style definitions
c717a52ed169701b2907ac8eb8678ca41b1533ba Convert old-style function definitions into modern-style definitions
4eeb59a8dbcc6b4d3db1b81a00615f6e7832a97c Convert old-style function definitions into modern-style definitions
7cea8ad66aecc21e6caae330b5d31075af399193 Add conditional version script support
5bd87617e4b3129e76e79847c95bdea4b1290d9f Release 1.3.7

Our two patches are upstream as of
d473f1e1f6ba80bfaee4daa058da159305167323 and
240ee6c774729c9c24812aa8912f1fcf8996b162 respectively.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...rations-to-allow-compile-with-gcc-15.patch | 67 -------------------
 ...d-key_call-declarations-to-allow-com.patch | 63 -----------------
 package/libtirpc/libtirpc.hash                |  4 +-
 package/libtirpc/libtirpc.mk                  |  2 +-
 4 files changed, 3 insertions(+), 133 deletions(-)
 delete mode 100644 package/libtirpc/0001-Update-declarations-to-allow-compile-with-gcc-15.patch
 delete mode 100644 package/libtirpc/0002-update-signal-and-key_call-declarations-to-allow-com.patch

diff --git a/package/libtirpc/0001-Update-declarations-to-allow-compile-with-gcc-15.patch b/package/libtirpc/0001-Update-declarations-to-allow-compile-with-gcc-15.patch
deleted file mode 100644
index f94be6f39a..0000000000
--- a/package/libtirpc/0001-Update-declarations-to-allow-compile-with-gcc-15.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From 45c1eade8fa7ca62c53e80450b315ccae6db55ea Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Thu, 12 Dec 2024 04:16:02 -0500
-Subject: [PATCH] Update declarations to allow compile with gcc-15
-
-This patch fixes some of the compile errors with gcc 15-20241117.
-
-In addition the follow declarations need to be fixed:
-  sed -n 75,77p libtirpc-1.3.6/src/key_call.c
-  cryptkeyres *(*__key_encryptsession_pk_LOCAL)() = 0;
-  cryptkeyres *(*__key_decryptsession_pk_LOCAL)() = 0;
-  des_block *(*__key_gendes_LOCAL)() = 0;
-
-Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
-Signed-off-by: Steve Dickson <steved@redhat.com>
-Upstream: d473f1e1f6ba80bfaee4daa058da159305167323
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- src/auth_none.c     | 2 +-
- src/getpublickey.c  | 2 +-
- src/svc_auth_none.c | 4 ++--
- 3 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/auth_none.c b/src/auth_none.c
-index 0b0bbd1..aca6e71 100644
---- a/src/auth_none.c
-+++ b/src/auth_none.c
-@@ -62,7 +62,7 @@ static bool_t authnone_validate (AUTH *, struct opaque_auth *);
- static bool_t authnone_refresh (AUTH *, void *);
- static void authnone_destroy (AUTH *);
- 
--extern bool_t xdr_opaque_auth();
-+extern bool_t xdr_opaque_auth(XDR *, struct opaque_auth *);
- 
- static struct auth_ops *authnone_ops();
- 
-diff --git a/src/getpublickey.c b/src/getpublickey.c
-index be37a24..4e96c7c 100644
---- a/src/getpublickey.c
-+++ b/src/getpublickey.c
-@@ -52,7 +52,7 @@
- /*
-  * Hack to let ypserv/rpc.nisd use AUTH_DES.
-  */
--int (*__getpublickey_LOCAL)() = 0;
-+int (*__getpublickey_LOCAL)(const char *, char *) = 0;
- 
- /*
-  * Get somebody's public key
-diff --git a/src/svc_auth_none.c b/src/svc_auth_none.c
-index 887e809..5ca98e9 100644
---- a/src/svc_auth_none.c
-+++ b/src/svc_auth_none.c
-@@ -37,8 +37,8 @@
- 
- #include <rpc/rpc.h>
- 
--static bool_t	svcauth_none_destroy();
--static bool_t   svcauth_none_wrap();
-+static bool_t	svcauth_none_destroy(SVCAUTH *);
-+static bool_t   svcauth_none_wrap(SVCAUTH *, XDR *, bool_t (*)(XDR *, ...), char *);
- 
- struct svc_auth_ops svc_auth_none_ops = {
- 	svcauth_none_wrap,
--- 
-2.49.0
-
diff --git a/package/libtirpc/0002-update-signal-and-key_call-declarations-to-allow-com.patch b/package/libtirpc/0002-update-signal-and-key_call-declarations-to-allow-com.patch
deleted file mode 100644
index 7bd8098bbd..0000000000
--- a/package/libtirpc/0002-update-signal-and-key_call-declarations-to-allow-com.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 09d506d24abb9ce506d7a4a4201deff017018779 Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Thu, 2 Jan 2025 08:46:24 -0500
-Subject: [PATCH] update signal and key_call declarations to allow compile with
- gcc-15
-
-Follow up patch addressing the following declarations:
-  sed -n 75,77p libtirpc-1.3.6/src/key_call.c
-  cryptkeyres *(*__key_encryptsession_pk_LOCAL)() = 0;
-  cryptkeyres *(*__key_decryptsession_pk_LOCAL)() = 0;
-  des_block *(*__key_gendes_LOCAL)() = 0;
-
-Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
-Signed-off-by: Steve Dickson <steved@redhat.com>
-Upstream: 240ee6c774729c9c24812aa8912f1fcf8996b162
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- src/auth_time.c | 4 ++--
- src/key_call.c  | 6 +++---
- 2 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/src/auth_time.c b/src/auth_time.c
-index 936dd76..c21b1df 100644
---- a/src/auth_time.c
-+++ b/src/auth_time.c
-@@ -248,7 +248,7 @@ __rpc_get_time_offset(td, srv, thost, uaddr, netid)
- 	char			ut[64], ipuaddr[64];
- 	endpoint		teps[32];
- 	nis_server		tsrv;
--	void			(*oldsig)() = NULL; /* old alarm handler */
-+	void			(*oldsig)(int) = NULL; /* old alarm handler */
- 	struct sockaddr_in	sin;
- 	int			s = RPC_ANYSOCK;
- 	socklen_t len;
-@@ -417,7 +417,7 @@ __rpc_get_time_offset(td, srv, thost, uaddr, netid)
- 		} else {
- 			int res;
- 
--			oldsig = (void (*)())signal(SIGALRM, alarm_hndler);
-+			oldsig = (void (*)(int))signal(SIGALRM, alarm_hndler);
- 			saw_alarm = 0; /* global tracking the alarm */
- 			alarm(20); /* only wait 20 seconds */
- 			res = connect(s, (struct sockaddr *)&sin, sizeof(sin));
-diff --git a/src/key_call.c b/src/key_call.c
-index 9f4b1d2..43f990e 100644
---- a/src/key_call.c
-+++ b/src/key_call.c
-@@ -72,9 +72,9 @@
-  * implementations of these functions, and to call those in key_call().
-  */
- 
--cryptkeyres *(*__key_encryptsession_pk_LOCAL)() = 0;
--cryptkeyres *(*__key_decryptsession_pk_LOCAL)() = 0;
--des_block *(*__key_gendes_LOCAL)() = 0;
-+cryptkeyres *(*__key_encryptsession_pk_LOCAL)(uid_t, char *) = 0;
-+cryptkeyres *(*__key_decryptsession_pk_LOCAL)(uid_t, char *) = 0;
-+des_block *(*__key_gendes_LOCAL)(uid_t, char *) = 0;
- 
- static int key_call( u_long, xdrproc_t, void *, xdrproc_t, void *);
- 
--- 
-2.49.0
-
diff --git a/package/libtirpc/libtirpc.hash b/package/libtirpc/libtirpc.hash
index 946e30b807..0c94fd80c0 100644
--- a/package/libtirpc/libtirpc.hash
+++ b/package/libtirpc/libtirpc.hash
@@ -1,5 +1,5 @@
 # From sourceforge's info on download page:
-sha1  03352908461ad2122e5be4a678893aaa2ad2ac45  libtirpc-1.3.6.tar.bz2
+sha1  885aaa0b9c348d06dd8a9e2ae0a1a7343711eb1b  libtirpc-1.3.7.tar.bz2
 # Locally computed
-sha256  bbd26a8f0df5690a62a47f6aa30f797f3ef8d02560d1bc449a83066b5a1d3508  libtirpc-1.3.6.tar.bz2
+sha256  b47d3ac19d3549e54a05d0019a6c400674da716123858cfdb6d3bdd70a66c702  libtirpc-1.3.7.tar.bz2
 sha256  17cf6098f95bdbb269f0bbc68e76c88fe20487ca7ec53f454923ab4256ecd2e7  COPYING
diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
index 2d2675895c..ab15954561 100644
--- a/package/libtirpc/libtirpc.mk
+++ b/package/libtirpc/libtirpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTIRPC_VERSION = 1.3.6
+LIBTIRPC_VERSION = 1.3.7
 LIBTIRPC_SOURCE = libtirpc-$(LIBTIRPC_VERSION).tar.bz2
 LIBTIRPC_SITE = http://downloads.sourceforge.net/project/libtirpc/libtirpc/$(LIBTIRPC_VERSION)
 LIBTIRPC_LICENSE = BSD-3-Clause
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
