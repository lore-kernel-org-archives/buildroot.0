Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E123D2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 14:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73B9E60BB2;
	Sun,  7 Dec 2025 14:49:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IbVAnyzSU7_r; Sun,  7 Dec 2025 14:49:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E683605EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765118966;
	bh=PYMP0zE+NIwMBS14v7LpnGRGIKzD5wL/sUBlp+5eT+4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VS4OI2IMdnL8PfSqajn3JsQGgE/KVG5+CloLkLAC27c3d45U915Qm9yRpc3QMLGUK
	 a6hx14r/5SZzeP8n+Cr/0Tgvi7qk1nPUdyNETKT21jFQkCuu2y9/dnxuLBy++Z00QD
	 lVZMPbxePm/0BJXjoW0faFdb98lbMQOfkecoEVcy6/XJovoar+VgUetaFD2VdsPme6
	 EQKA19TM+EQBy2vbGRTpS2b2Rk5CWD0sfkEwfk8fwQ6bnE8qzyIVR5jFtojDdQfMYM
	 9w2ORSDKHjW/ulEkZqba9GllmIvDDdQLqgNQKuOcfjWJFadHPTENfoZHH+kWaubWgp
	 Kkp84qN5u67bQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E683605EB;
	Sun,  7 Dec 2025 14:49:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BD452CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:49:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F23BB80B5F
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:49:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VDlIq8ipks_R for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 14:49:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EAF1380AC3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAF1380AC3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EAF1380AC3
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:49:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 68D95A4C097A
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 15:48:16 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53290)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSG3b-0000000054F-3CUQ
 for buildroot@buildroot.org; Sun, 07 Dec 2025 14:48:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Dec 2025 15:48:16 +0100
Message-ID: <20251207144816.3699081-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765118896;
 bh=viKMm4tvLM3IsjSIfZy38v1GQxRSV3RZvAtyZYJXS4U=;
 h=From:To:Subject:Date:From;
 b=TKh9McH4yqQBxmSjg+CNsbAl8xivgpQyQxIyz9LSHv904ugSpRhDtKXk8GAQlhMKx
 9QVV+NRGkftBtpTExfW1AK5WlPHL/Ml9ws5blpb8YQr1JA+fjpjGLxsZ+tLPYzUWAL
 AYwQeBcEg+by3HwjuX3hvkHJ8i3oJCXZZGg5lrPRcVnsD22Fu1ukr9kXX8JFATmo12
 OwpEz3EtCv3UII8Fcqz8OELi7/ArnzvMVEceeUfr0A1GOWYJeHkUCzh57v58E+gpFi
 TUXa9Vtq7/VUWyNDNkJbAYdX1eik1sYhi1CCCU1/LXRIqPtFNiPEdPila3ooveJUEW
 oq4ulfDxIY51A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=TKh9McH4
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: remove Prabhu Sannachi,
 boucing e-mail
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

Prabhu's e-mail address at Collins is bouncing, so let's drop this stale
entry:

<prabhu.sannachi@collins.com>: host
    mxb-00105402.gslb.gpphosted.com[67.231.147.145] said: 550 5.1.1 User
    Unknown (in reply to RCPT TO command)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 DEVELOPERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5e1fa6401f..5c9eb94f56 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2769,9 +2769,6 @@ F:	package/libdvbpsi/
 F:	package/mraa/
 F:	package/synergy/
 
-N:	Prabhu Sannachi <prabhu.sannachi@collins.com>
-F:	package/redis-plus-plus/
-
 N:	Qais Yousef <qais.yousef@arm.com>
 F:	package/bpftrace/
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
