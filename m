Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EFDBCDE000
	for <buildroot@archiver.kernel.org>; Thu, 25 Jun 2026 17:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C91A82FA2;
	Thu, 25 Jun 2026 17:11:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4P5qBS2JdeCy; Thu, 25 Jun 2026 17:11:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37F9982B53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782407486;
	bh=1tFmMOuDLWfZEIDjE7QafsR3R2JP8+55uuiedWOHWZc=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=JiAdnPpKCFE1rCsZplLT7zE64P7RV6vRAUOO5AjNoLJo2GMUX52y38Gw56OSm3Yyb
	 tyLE85oCXu1vGe5sP/RcvTpTT6ht2hwWL5tl7GVsGGgGjHqcUOoq/B/uqRLfWBmaOa
	 4VO940ToAbGKBujyX85m8bK0IwrIQtjJN9EKWk5NqN/gw2m8oU4j3okHCTx/T52rVq
	 wz67OUv8nJYWdRzTzN73jSbcbWZpLyTiXbL8ZOtRT8mAR+dD7WGqENG0zFSNZbvmYa
	 j2igoUevlhv5t157qsB8mxqzlY5ax8a8Qx2ZhM+ZdPleluA5ByBRree8iUG4zr5yQk
	 tEs1VVro0+FFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37F9982B53;
	Thu, 25 Jun 2026 17:11:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D2EE4254
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 17:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C497E40B77
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 17:11:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kV-0geIe7P9P for <buildroot@buildroot.org>;
 Thu, 25 Jun 2026 17:11:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 43C5E40BA8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43C5E40BA8
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 43C5E40BA8
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 17:11:22 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mnpru-1wxHN41L1m-00mWXL; Thu, 25
 Jun 2026 19:11:20 +0200
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fiona Klute <fiona.klute@gmx.de>
Date: Thu, 25 Jun 2026 19:11:06 +0200
Message-ID: <20260625171106.827713-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:INXsNwvwEPKKFB+aEPlNfQ5V8+K7MQ2vbFka4b39+cYOLcJEWsP
 Ad7JcsH78c+nHThicmLy8CGRGk8yVKJ8ck+revTQOXT8+WT+7DGNxu6OD4iOVPP97I0PJys
 V59TxcqAPlogk6iDhteXlLfzUuVyj4wcJx/uu4/RxqoLgpPfplZACk3Tb+Ne7M+rzXCdAhJ
 NbXT6Q9ZUbEMf9ojLk5nQ==
UI-OutboundReport: notjunk:1;M01:P0:64bl9ggo9XQ=;E73DdcUCDEKcmodeYRhMMZFtvr9
 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
 4NazSqbtA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1782407480; x=1783012280; i=fiona.klute@gmx.de;
 bh=hhPdstlSjmEIo5RUbi1896fgV+YVreeiexG6Lio14wc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=rBDf2nBA9lPZRc4Tj/7pVChnU3X0sDPuVi4S3IEp4zzMT8Z9Tp73+3f3/v3Ottkf
 OGtdaEQstPLCuqXO3b/93wZDslfsZ9R+p2HK4hPh5yDvoGKrk4qXyTHcH3xXlOrJi
 KEohensWPLF1H4+fbB/PSjhEyBycULPJsO0NFf9ZzkWUmqqQMh/HodinYtGQMa5zQ
 WrUzy+km+Ds0M2I7+s2UtCy8URtk0H1XBuufNIdXlyZ1b7XNO+WpCZdW4cG6hMNK2
 vIq0BsvIurjeD7fK3NUJMVYmhxqBHcrYbHUvk2qKJXHI8iAmmuf2hvIl0dDeWTOof
 6fEcjbbBhJk/sf1Nag==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=rBDf2nBA
Subject: [Buildroot] [PATCH 1/1] package/util-linux: add missing
 UTIL_LINUX_IGNORE_CVES entry for CVE-2026-27456
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Patch was added in 9998130badb6101cdf6f6da0bbd1228d79825b63, but no
ignore entry.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/util-linux/util-linux.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 20bdcc5c3f..cfcd738bb5 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -37,6 +37,9 @@ UTIL_LINUX_LICENSE_FILES = README.licensing \
 
 UTIL_LINUX_CPE_ID_VENDOR = kernel
 
+# package/util-linux/0003-loopdev-use-openat2-RESOLVE_NO_SYMLINKS-for-backing-.patch
+UTIL_LINUX_IGNORE_CVES += CVE-2026-27456
+
 # 0002-autotools-optionally-add-libpthread-to-uuid.pc.patch
 UTIL_LINUX_AUTORECONF = YES
 
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
