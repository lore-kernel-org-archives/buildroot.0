Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B44CC47073
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 22:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C82334090D;
	Mon,  1 Jan 2024 22:08:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C82334090D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V4LUthMSEQPC; Mon,  1 Jan 2024 22:08:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D4F340A50;
	Mon,  1 Jan 2024 22:08:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D4F340A50
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 99FFA1BF3BE
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 22:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72E324095C
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 22:08:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72E324095C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2-ORPcxyOiBW for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 22:08:24 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 890F240953
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 22:08:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 890F240953
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40d899205c7so7125315e9.2
 for <buildroot@buildroot.org>; Mon, 01 Jan 2024 14:08:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704146902; x=1704751702;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JQvH+gHUAyVNvF87aC3NnQfT/gTwppDg7CnrWb+M+j8=;
 b=YLEnXmxhUeBxQYSaxRrGg5aA5CPwglydstvMRb80+HvzewWKwdOlEYoO2xAOMV0Yp6
 EG/gEe/ZA3uJR2dK68+/xQkPZinpwiGRI7FONT3kVjO5qJyYWg/r02TD7d0WIHpwGYRG
 V2pBB/pskVEb+6rd6zgNAl/raNnSSXIjYd9iLdlPxsDckY/YXYePAOc3g804WSqhBO5t
 Jun/+1lJanZcn+SCsRg9J3WWkExIlepx9kAkh2D8Q1DP/OpIlVGJ1YttfT0UK7uVAy1g
 0EbgVP08Jz4Uyx5FxenknDIUjRNkBGvFj8exGwt3rBLWaj/AKp1Psz1TgoC5/hdS8VQG
 Ot3g==
X-Gm-Message-State: AOJu0Yymn0rhMaDc/4jPaaFUGl7NyXcabmtJtMoKkcG+IZkNzHw0D0Zn
 ApcU+ZSbg0sqy7/LkI3XWAt66TXLfzU=
X-Google-Smtp-Source: AGHT+IFAOPkZ4LhHjsdSg4qhZh9h7KtLpDONxcpO7R40zT6HsKapXJonLeSpGha+HnOPVRaAe6x/ZA==
X-Received: by 2002:a7b:ca4c:0:b0:40d:5c56:a63 with SMTP id
 m12-20020a7bca4c000000b0040d5c560a63mr4631546wml.79.1704146901597; 
 Mon, 01 Jan 2024 14:08:21 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 n33-20020a05600c502100b004030e8ff964sm50377449wmr.34.2024.01.01.14.08.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jan 2024 14:08:21 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Jan 2024 23:08:18 +0100
Message-ID: <20240101220818.14806-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704146902; x=1704751702; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JQvH+gHUAyVNvF87aC3NnQfT/gTwppDg7CnrWb+M+j8=;
 b=KOKVzJqAhZ3qHwW4xf/ZZ6tKxrqg4c1vCpuEhrflHYKbm7+zW8mvHGYmQvM0ZLJ9YR
 +60Ji+qC3qUxwjDcez1tyLX1HdYgoOlgyyWPQ8YQQeswlOzSuqwb8y/27FcMNBP/dRyf
 B8Ccz1TP8gfjAun0P8X/DQRnIlOHIkPaZvewwlbJpD6+Ds53/0wMGYsFv5LD4tPr+FrJ
 NaC759BF6AoQ+iSeTv2dhyEUcF0yCM7zZkkoiEEOL3GRf5QTtdHHt3aVIdcxh/01Y4RX
 CyGJNVmbYYQ+GpnQiduWjGwY4QJygMuQbAnu9kf35Ro5HDWLgAEi28dFZVFLuO89+oRk
 8wbw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KOKVzJqA
Subject: [Buildroot] [PATCH 1/1] package/dropbear: fix CVE-2023-48795
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/advisories/GHSA-45x7-px36-x8w8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-Implement-Strict-KEX-mode.patch      | 232 ++++++++++++++++++
 package/dropbear/dropbear.mk                  |   3 +
 2 files changed, 235 insertions(+)
 create mode 100644 package/dropbear/0001-Implement-Strict-KEX-mode.patch

diff --git a/package/dropbear/0001-Implement-Strict-KEX-mode.patch b/package/dropbear/0001-Implement-Strict-KEX-mode.patch
new file mode 100644
index 0000000000..ce7b84861c
--- /dev/null
+++ b/package/dropbear/0001-Implement-Strict-KEX-mode.patch
@@ -0,0 +1,232 @@
+From 6e43be5c7b99dbee49dc72b6f989f29fdd7e9356 Mon Sep 17 00:00:00 2001
+From: Matt Johnston <matt@ucc.asn.au>
+Date: Mon, 20 Nov 2023 14:02:47 +0800
+Subject: [PATCH] Implement Strict KEX mode
+
+As specified by OpenSSH with kex-strict-c-v00@openssh.com and
+kex-strict-s-v00@openssh.com.
+
+Upstream: https://github.com/mkj/dropbear/commit/6e43be5c7b99dbee49dc72b6f989f29fdd7e9356
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/cli-session.c    | 11 +++++++++++
+ src/common-algo.c    |  6 ++++++
+ src/common-kex.c     | 26 +++++++++++++++++++++++++-
+ src/kex.h            |  3 +++
+ src/process-packet.c | 34 +++++++++++++++++++---------------
+ src/ssh.h            |  4 ++++
+ src/svr-session.c    |  3 +++
+ 7 files changed, 71 insertions(+), 16 deletions(-)
+
+diff --git a/cli-session.c b/cli-session.c
+index 5981b2470..d261c8f82 100644
+--- a/cli-session.c
++++ b/cli-session.c
+@@ -46,6 +46,7 @@ static void cli_finished(void) ATTRIB_NORETURN;
+ static void recv_msg_service_accept(void);
+ static void cli_session_cleanup(void);
+ static void recv_msg_global_request_cli(void);
++static void cli_algos_initialise(void);
+ 
+ struct clientsession cli_ses; /* GLOBAL */
+ 
+@@ -117,6 +118,7 @@ void cli_session(int sock_in, int sock_out, struct dropbear_progress_connection
+ 	}
+ 
+ 	chaninitialise(cli_chantypes);
++	cli_algos_initialise();
+ 
+ 	/* Set up cli_ses vars */
+ 	cli_session_init(proxy_cmd_pid);
+@@ -487,3 +489,12 @@ void cli_dropbear_log(int priority, const char* format, va_list param) {
+ 	fflush(stderr);
+ }
+ 
++static void cli_algos_initialise(void) {
++	algo_type *algo;
++	for (algo = sshkex; algo->name; algo++) {
++		if (strcmp(algo->name, SSH_STRICT_KEX_S) == 0) {
++			algo->usable = 0;
++		}
++	}
++}
++
+diff --git a/common-algo.c b/common-algo.c
+index 378f0ca8e..f9d46ebb6 100644
+--- a/common-algo.c
++++ b/common-algo.c
+@@ -307,6 +307,12 @@ algo_type sshkex[] = {
+ 	/* Set unusable by svr_algos_initialise() */
+ 	{SSH_EXT_INFO_C, 0, NULL, 1, NULL},
+ #endif
++#endif
++#if DROPBEAR_CLIENT
++	{SSH_STRICT_KEX_C, 0, NULL, 1, NULL},
++#endif
++#if DROPBEAR_SERVER
++	{SSH_STRICT_KEX_S, 0, NULL, 1, NULL},
+ #endif
+ 	{NULL, 0, NULL, 0, NULL}
+ };
+diff --git a/common-kex.c b/common-kex.c
+index ac8844246..8e33b12a6 100644
+--- a/common-kex.c
++++ b/common-kex.c
+@@ -183,6 +183,10 @@ void send_msg_newkeys() {
+ 	gen_new_keys();
+ 	switch_keys();
+ 
++	if (ses.kexstate.strict_kex) {
++		ses.transseq = 0;
++	}
++
+ 	TRACE(("leave send_msg_newkeys"))
+ }
+ 
+@@ -193,7 +197,11 @@ void recv_msg_newkeys() {
+ 
+ 	ses.kexstate.recvnewkeys = 1;
+ 	switch_keys();
+-	
++
++	if (ses.kexstate.strict_kex) {
++		ses.recvseq = 0;
++	}
++
+ 	TRACE(("leave recv_msg_newkeys"))
+ }
+ 
+@@ -550,6 +558,10 @@ void recv_msg_kexinit() {
+ 
+ 	ses.kexstate.recvkexinit = 1;
+ 
++	if (ses.kexstate.strict_kex && !ses.kexstate.donefirstkex && ses.recvseq != 1) {
++		dropbear_exit("First packet wasn't kexinit");
++	}
++
+ 	TRACE(("leave recv_msg_kexinit"))
+ }
+ 
+@@ -859,6 +871,18 @@ static void read_kex_algos() {
+ 	}
+ #endif
+ 
++	if (!ses.kexstate.donefirstkex) {
++		const char* strict_name;
++		if (IS_DROPBEAR_CLIENT) {
++			strict_name = SSH_STRICT_KEX_S;
++		} else {
++			strict_name = SSH_STRICT_KEX_C;
++		}
++		if (buf_has_algo(ses.payload, strict_name) == DROPBEAR_SUCCESS) {
++			ses.kexstate.strict_kex = 1;
++		}
++	}
++
+ 	algo = buf_match_algo(ses.payload, sshkex, kexguess2, &goodguess);
+ 	allgood &= goodguess;
+ 	if (algo == NULL || algo->data == NULL) {
+diff --git a/kex.h b/kex.h
+index 77cf21a37..7fcc3c252 100644
+--- a/kex.h
++++ b/kex.h
+@@ -83,6 +83,9 @@ struct KEXState {
+ 
+ 	unsigned our_first_follows_matches : 1;
+ 
++	/* Boolean indicating that strict kex mode is in use */
++	unsigned int strict_kex;
++
+ 	time_t lastkextime; /* time of the last kex */
+ 	unsigned int datatrans; /* data transmitted since last kex */
+ 	unsigned int datarecv; /* data received since last kex */
+diff --git a/process-packet.c b/process-packet.c
+index 945416023..133a152d0 100644
+--- a/process-packet.c
++++ b/process-packet.c
+@@ -44,6 +44,7 @@ void process_packet() {
+ 
+ 	unsigned char type;
+ 	unsigned int i;
++	unsigned int first_strict_kex = ses.kexstate.strict_kex && !ses.kexstate.donefirstkex;
+ 	time_t now;
+ 
+ 	TRACE2(("enter process_packet"))
+@@ -54,22 +55,24 @@ void process_packet() {
+ 	now = monotonic_now();
+ 	ses.last_packet_time_keepalive_recv = now;
+ 
+-	/* These packets we can receive at any time */
+-	switch(type) {
+ 
+-		case SSH_MSG_IGNORE:
+-			goto out;
+-		case SSH_MSG_DEBUG:
+-			goto out;
++	if (type == SSH_MSG_DISCONNECT) {
++		/* Allowed at any time */
++		dropbear_close("Disconnect received");
++	}
+ 
+-		case SSH_MSG_UNIMPLEMENTED:
+-			/* debugging XXX */
+-			TRACE(("SSH_MSG_UNIMPLEMENTED"))
+-			goto out;
+-			
+-		case SSH_MSG_DISCONNECT:
+-			/* TODO cleanup? */
+-			dropbear_close("Disconnect received");
++	/* These packets may be received at any time,
++	   except during first kex with strict kex */
++	if (!first_strict_kex) {
++		switch(type) {
++			case SSH_MSG_IGNORE:
++				goto out;
++			case SSH_MSG_DEBUG:
++				goto out;
++			case SSH_MSG_UNIMPLEMENTED:
++				TRACE(("SSH_MSG_UNIMPLEMENTED"))
++				goto out;
++		}
+ 	}
+ 
+ 	/* Ignore these packet types so that keepalives don't interfere with
+@@ -98,7 +101,8 @@ void process_packet() {
+ 			if (type >= 1 && type <= 49
+ 				&& type != SSH_MSG_SERVICE_REQUEST
+ 				&& type != SSH_MSG_SERVICE_ACCEPT
+-				&& type != SSH_MSG_KEXINIT)
++				&& type != SSH_MSG_KEXINIT
++				&& !first_strict_kex)
+ 			{
+ 				TRACE(("unknown allowed packet during kexinit"))
+ 				recv_unimplemented();
+diff --git a/ssh.h b/ssh.h
+index 1b4fec65f..ef3efdca0 100644
+--- a/ssh.h
++++ b/ssh.h
+@@ -100,6 +100,10 @@
+ #define SSH_EXT_INFO_C "ext-info-c"
+ #define SSH_SERVER_SIG_ALGS "server-sig-algs"
+ 
++/* OpenSSH strict KEX feature */
++#define SSH_STRICT_KEX_S "kex-strict-s-v00@openssh.com"
++#define SSH_STRICT_KEX_C "kex-strict-c-v00@openssh.com"
++
+ /* service types */
+ #define SSH_SERVICE_USERAUTH "ssh-userauth"
+ #define SSH_SERVICE_USERAUTH_LEN 12
+diff --git a/svr-session.c b/svr-session.c
+index 769f0731d..a538e2c5c 100644
+--- a/svr-session.c
++++ b/svr-session.c
+@@ -370,6 +370,9 @@ static void svr_algos_initialise(void) {
+ 			algo->usable = 0;
+ 		}
+ #endif
++		if (strcmp(algo->name, SSH_STRICT_KEX_C) == 0) {
++			algo->usable = 0;
++		}
+ 	}
+ }
+ 
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 36eb7898ba..7ac8a38559 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -14,6 +14,9 @@ DROPBEAR_PROGRAMS = dropbear $(DROPBEAR_TARGET_BINS)
 DROPBEAR_CPE_ID_VENDOR = dropbear_ssh_project
 DROPBEAR_CPE_ID_PRODUCT = dropbear_ssh
 
+# 0001-Implement-Strict-KEX-mode.patch
+DROPBEAR_IGNORE_CVES += CVE-2023-48795
+
 # Disable hardening flags added by dropbear configure.ac, and let
 # Buildroot add them when the relevant options are enabled. This
 # prevents dropbear from using SSP support when not available.
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
