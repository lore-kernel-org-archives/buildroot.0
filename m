Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0874FF8860
	for <buildroot@archiver.kernel.org>; Mon, 27 Apr 2026 15:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E006081065;
	Mon, 27 Apr 2026 15:37:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CxNJhP_17mFH; Mon, 27 Apr 2026 15:37:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8DF681046
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777304261;
	bh=FR8plrzKp9bs541dPSn7LiOId9bVbZ/HMHccA1ukK0o=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=svA5MlUnjs4IB9t0zR3VnTXNpcxtREbyDHQadX9ZuZI6lDAGf9b9XLArpZk4NINMF
	 xaAD/r3KDpAE07mWIRRXlB2Orrhldk2L32reBSS1CDcUHP5LW0iZJEV6K7PZpIsouF
	 gJ/xLz/kk3hUkwqtbh6ijTLpSUt4f6rNabZMg2ND1pYEt6AZEFKc/KshRAUUpoG24V
	 QHGgXp33mu4iBwofCX7d8KHihETNtj3YcchibT9oUN5QTzdVr6PoAEv20SuZX7XfJ7
	 7UIsKTWEssUisp9gWK53ukXVvgf19c9+OWM6rhIDzvUWLdHls6IfuXKZBS4LvEGHs3
	 qQuBtyoVTb2ZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8DF681046;
	Mon, 27 Apr 2026 15:37:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D81411B8
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 15:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD3C16062A
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 15:37:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id beXD6mr90YZv for <buildroot@buildroot.org>;
 Mon, 27 Apr 2026 15:37:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1296060629
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1296060629
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1296060629
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 15:37:38 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1697742395; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 27 Apr 2026 15:37:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1wHO1d-0000000FugS-1pft;
 Mon, 27 Apr 2026 17:37:33 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 27 Apr 2026 17:37:30 +0200
Message-ID: <20260427153731.3792798-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=k0laftofhcnIxK6NcVx04k+GELs2KcCy3feis4xbVpLqY9VCDfI8vene+27Qto51WB7mjL7V0R/DTKz+8ki3tOkal1JzhOI5tQi7oy74NBnv5csr0UCvVqjhlRTy7TUvrFWAek9qPxOWQw7yzoAgg2HfghmX44bvo4poSSemFWLX5yiBS4bsudzrYsizwoDSi2YI6N2BQmQJ73fgDjt5kSjxWAkmPvLg+I2wpHS6JPYIfG2o6rGLyNMXspO8ejB20k5daqBa6Te18hR2HpUddAqWs5uUkp6ElS3afHufeYEyDnpYVseeYwdBT/6A2Byc2gqKQ/NQ1bIHqpDVwuZpTw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=8FDYUvXnd94sIdBOiOieaBqel/iR+y46n6IvM36FvYA=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=k0laftof
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/liburiparser: security bump to version
 1.0.1
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
Cc: Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following vulnerability:

CVE-2026-42371: integer overflow in text range comparison
https://github.com/uriparser/uriparser/pull/298

For details, see the announcement:
https://www.openwall.com/lists/oss-security/2026/04/27/2

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/liburiparser/liburiparser.hash | 4 ++--
 package/liburiparser/liburiparser.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/liburiparser/liburiparser.hash b/package/liburiparser/liburiparser.hash
index f8d7124b7f..c18df8eb98 100644
--- a/package/liburiparser/liburiparser.hash
+++ b/package/liburiparser/liburiparser.hash
@@ -1,4 +1,4 @@
-# From https://github.com/uriparser/uriparser/releases/tag/uriparser-1.0.0
-sha256  154a3f649d80a78d5095fc461ec032ffb45f5ed3619edec923ac68cff29a088d  uriparser-1.0.0.tar.xz
+# From https://github.com/uriparser/uriparser/releases/tag/uriparser-1.0.1
+sha256  acd18cfb14d1851705f863f7a625be693fb3971fb85d4996faa21147f0315fcb  uriparser-1.0.1.tar.xz
 # Locally calculated
 sha256  287f09e6546a9610f949f89e8fb937cacfeabd7bfaa8c8a0c18312193bf04ad3  COPYING.BSD-3-Clause
diff --git a/package/liburiparser/liburiparser.mk b/package/liburiparser/liburiparser.mk
index 731739e582..d8dcc22063 100644
--- a/package/liburiparser/liburiparser.mk
+++ b/package/liburiparser/liburiparser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBURIPARSER_VERSION = 1.0.0
+LIBURIPARSER_VERSION = 1.0.1
 LIBURIPARSER_SOURCE = uriparser-$(LIBURIPARSER_VERSION).tar.xz
 LIBURIPARSER_SITE = https://github.com/uriparser/uriparser/releases/download/uriparser-$(LIBURIPARSER_VERSION)
 LIBURIPARSER_LICENSE = BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
