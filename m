Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8B7CD4F24
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 16:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D871B6072F;
	Tue, 12 May 2026 16:28:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c4Il-XOYVXeI; Tue, 12 May 2026 16:28:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B4D9608D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778603327;
	bh=lVYCUJkf7176LeZYdpRuLcr3yHefSi5tMoeeUUCLQJA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aUqxYoZZyZLpjqGb8ESFFxJHEwwKSommjtvAvEcaGAClzrBBVqlvEl+yMwjuru7+b
	 ygt1ZETo2SghryZLsHpjWAwa+FQU2XADGanibWV/ZMyIHDFsL1TRpawpYubL/fyFog
	 kjoBhWh4XZ7dZd/RLB6sLH9Na5lKHmM6iWd97rT3x1djskEF8Q7zWTrHXDQa9dJMjv
	 qaFLk8tT2blpZbFxOeYlezsVX51wJIoDOBTM4667/1RoG8H4xBI1Nky89UlujNNnAK
	 5EYV3cmCVzlbXU7Vwqh/GoMFrrM3wTnbw5eYDmIuhCb83PxojUjt8TYPEJpADH+A/0
	 2JKG0Tfx/ztng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B4D9608D4;
	Tue, 12 May 2026 16:28:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6165E223
 for <buildroot@buildroot.org>; Tue, 12 May 2026 16:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 473EC608D4
 for <buildroot@buildroot.org>; Tue, 12 May 2026 16:28:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YBt09U_jSUSD for <buildroot@buildroot.org>;
 Tue, 12 May 2026 16:28:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 285FC6072F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 285FC6072F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 285FC6072F
 for <buildroot@buildroot.org>; Tue, 12 May 2026 16:28:44 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b10b.dip0.t-ipconnect.de [84.161.177.11])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4ADF7A4C0A3B
 for <buildroot@buildroot.org>; Tue, 12 May 2026 18:28:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36410)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wMpyL-000000004NS-45Y9
 for buildroot@buildroot.org; Tue, 12 May 2026 16:28:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 12 May 2026 18:28:41 +0200
Message-ID: <20260512162841.3460988-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778603322;
 bh=5i+FW/cRi2uL/eqDz6FVuoFpVD3kxfS+Q5tjYx5Cugw=;
 h=From:To:Subject:Date:From;
 b=antDlDWL1FnbYm202+AXWCCqUwOLhXoafQKBiHEGdyqcjTPs1BKYoo3W8Orb5fdJJ
 KaUi/8c141DLPi8SITSH13UhKTLPLtWcdhtKUyqrx6PqrVUY1JtOm09bK2S3Fhr+uh
 9iysVl4oj5C3OvNxtqj9maPnVCum8hjRo3pTM0q2ZJWzzUuVmm6900FKkCdG3YwoJK
 Mmfh6LKYztPWB6+EoUZPYQAL95KxK0hi37t0jVKCur1E/Gh1ExEtgUqpNTrsVo3jHN
 oJMdQkXa4b6n1SGVLttxCU43GU52dQwg9Xn5yvxQSApBXcEA9Hjdq753JfQ/Ygtva/
 ZBPbIIk+dhERg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=antDlDWL
Subject: [Buildroot] [PATCH/next 1/1] package/libatomic_ops: bump version to
 7.10.0
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

https://github.com/bdwgc/libatomic_ops/blob/v7.10.0/ChangeLog

Switch to tarball provided by upstream which also contains autoconf'ed
files so we can remove autoreconf.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libatomic_ops/libatomic_ops.hash | 2 +-
 package/libatomic_ops/libatomic_ops.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/libatomic_ops/libatomic_ops.hash b/package/libatomic_ops/libatomic_ops.hash
index 64de98954d..8089a9b04d 100644
--- a/package/libatomic_ops/libatomic_ops.hash
+++ b/package/libatomic_ops/libatomic_ops.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  ea8295ac627646e37fd194d31535bbc02da60b908c8166c5e04d2461a53cb059  libatomic_ops-7.8.4.tar.gz
+sha256  0db3ebff755db170f65e74a64ec4511812e9ee3185c232eeffeacd274190dfb0  libatomic_ops-7.10.0.tar.gz
 sha256  969294c9324b2d360ae2a08edd5ca6f9cd754cb71b71e56bee15d2f10bb10496  LICENSE
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/libatomic_ops/libatomic_ops.mk b/package/libatomic_ops/libatomic_ops.mk
index bbd7f36db8..c68a4b782b 100644
--- a/package/libatomic_ops/libatomic_ops.mk
+++ b/package/libatomic_ops/libatomic_ops.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-LIBATOMIC_OPS_VERSION = 7.8.4
-LIBATOMIC_OPS_SITE = $(call github,bdwgc,libatomic_ops,v$(LIBATOMIC_OPS_VERSION))
-LIBATOMIC_OPS_AUTORECONF = YES
+LIBATOMIC_OPS_VERSION = 7.10.0
+LIBATOMIC_OPS_SITE = https://github.com/bdwgc/libatomic_ops/releases/download/v$(LIBATOMIC_OPS_VERSION)
 
 # From doc/LICENSING.txt: "Our intent is to make it easy to use
 # libatomic_ops, in both free and proprietary software.  Hence most
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
