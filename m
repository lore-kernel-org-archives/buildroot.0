Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80AE4CEFCF5
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 19:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC95460BED;
	Tue,  6 Jan 2026 19:20:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5KT2lnE04hn2; Tue,  6 Jan 2026 19:20:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEDA66064B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767727210;
	bh=6vVZqK/rW292UqEfcMzvcn5oD3Ef+bxBoitZqSZlbOA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=M6Lhm3Zv/uNHMcFDFVYhphP4c+lYhyu2au6aLPNzxUm0y1egDX7gtbioU7Yn+oYqX
	 +AFosVJ2h5hQV+GTaE92Vdpgq1Ri1NVmXhdc2YO7teOt2RdhpBg0rkxLbDilq/vA2R
	 YKGDdM1QL/UgwEzLagvlYswoABZG03XCUE28V/c8D5pXMsHjEvQmBgFgPx/x2IxJXK
	 kXTV75Ojje3Q6p/M5+KkK2r0FMBR9fe4BCipWkZv2TVNNrz2Zd6hfl//UK31OTfUYT
	 Y4A9ZPnBH5u4j0CXyTcINkink4LXosohOZrMcnVEhFnDclxTanQ969LCwxRc8D8nt5
	 vp1/LeC8YqvQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEDA66064B;
	Tue,  6 Jan 2026 19:20:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F1DEE70B
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 19:20:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D899081CA7
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 19:20:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ijDhziUmLezw for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 19:20:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A583A81BCF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A583A81BCF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A583A81BCF
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 19:20:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C955AA4C3734;
 Tue,  6 Jan 2026 20:20:06 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33720)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vdCb8-000000003ez-1yfr;
 Tue, 06 Jan 2026 19:20:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Trammell Hudson <hudson@trmm.net>
Date: Tue,  6 Jan 2026 20:20:06 +0100
Message-ID: <20260106192006.1629907-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767727206;
 bh=xIvunWNp2Go+IP/JH5bBkLdJ+vO5cTSgw1C4KrBaI0A=;
 h=From:To:Cc:Subject:Date:From;
 b=JXAiRM/vV0daG3BluxWCbwBNkY62mhfirOvYoS8rLMmXh7/YlhVtT1ldeCWFuKBJu
 0ZFsvPm14/Qr0ZbULZFHClOoydu7uwaKTyHl/lLzm2Gk2wuKeAmhm90ECOF1RUZ7dL
 AdocyRHkmuBBF5rSaJ7gOzjTPDr+VIML/hLEtvSeheWBBvdBI5oyY+3Q1W9mEU/c2f
 HwXlqA1w+KQVnztGQuvIHWxZk3DQ/C7hlOh3Ofdu20o+Ajqz032A/ThH9IRBXfRyNS
 CCgpe3xAwqiLQYrU/ORX31ipCjpk0kK9zgnkzrmnYm0RfGR89XExaXzJrKwjdEqK2u
 xRhUl0HF0VCOA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=JXAiRM/v
Subject: [Buildroot] [PATCH 1/1] package/nqptp: needs threads
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

Fixes:
https://autobuild.buildroot.net/results/5b5/5b5eac85ca0221596ee12ea5e23acde46c6b7edb/

checking for pthread_create in -lpthread... no
configure: error: pthread library needed

NPTL support is not needed, this defconfig builds:

BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
BR2_PTHREADS=y
BR2_GCC_VERSION_15_X=y
BR2_PACKAGE_NQPTP=y

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/nqptp/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/nqptp/Config.in b/package/nqptp/Config.in
index ec5d2ece2e..62742e81fb 100644
--- a/package/nqptp/Config.in
+++ b/package/nqptp/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_NQPTP
 	bool "nqptp"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBCONFIG
 	help
 	  nqptp is a daemon that monitors timing data from PTP clocks
@@ -11,3 +12,7 @@ config BR2_PACKAGE_NQPTP
 	  timing information for AirPlay 2 operation.
 
 	  https://github.com/mikebrady/nqptp
+
+comment "nqptp needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
