Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3E5D2444F
	for <buildroot@archiver.kernel.org>; Fri, 11 Oct 2024 00:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CAE581FC5;
	Fri, 11 Oct 2024 00:13:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DWnWfT4XVVu6; Fri, 11 Oct 2024 00:13:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10A5B81FB8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10A5B81FB8;
	Fri, 11 Oct 2024 00:13:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4E98C1BF861
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 00:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D3B340257
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 00:13:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nL888wBVn7q7 for <buildroot@lists.busybox.net>;
 Fri, 11 Oct 2024 00:13:14 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org; envelope-from=geoff@infradead.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A647D400C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A647D400C5
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A647D400C5
 for <buildroot@buildroot.org>; Fri, 11 Oct 2024 00:13:12 +0000 (UTC)
Received: from fpd2fa7e2a.ap.nuro.jp ([210.250.126.42] helo=[192.168.1.8])
 by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1sz3HE-00000009Ek9-3Gfq; Fri, 11 Oct 2024 00:13:05 +0000
Message-ID: <069f33b1-3f9d-41a4-b664-29b399d78f44@infradead.org>
Date: Fri, 11 Oct 2024 09:12:59 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Geoff Levand <geoff@infradead.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Peter Korsgaard <peter@korsgaard.com>, Arnout Vandecappelle
 <arnout@mind.be>, buildroot@buildroot.org
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=DhnXuanV5ec7gMyAM0ogbj073s4UNeVFd4EKLMu1kYs=; b=pCaSpBdtHL+5qh6I9gmsVaH3Fm
 IdVYpF1/Yj7wQv6eAWzPuxQ1/Y1ZEh8fmv2QtubyCwOrC55JB1RibVJQzvgOtka7Tzp4nY0TTP5Gw
 0eGhEUuq+4EOG1SK50AD8VAG3X3b4ULzdY/DMKMLppEhjmhDlCVfD1AazJzJJ6fLtzKrT9oBK2cri
 Q3+gDHnvlomFCJuCs5Fs7c8cwxLoZhMLku5PiQgPOM5w1O4PWh+syoMlKRYPUx5vMX7Kgf0OlwDnF
 FP1Yju63V/MlGblID85OQfcgHGPi4xDbSjVEpmXWUPPE4I2FekjjLW9u3mwW5DuyQI86vDmd3tOU7
 djLG5CQw==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=infradead.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=casper.20170209 header.b=pCaSpBdt
Subject: [Buildroot] package/flannel: bump to version 0.25.7
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 package/flannel/flannel.hash | 2 +-
 package/flannel/flannel.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flannel/flannel.hash b/package/flannel/flannel.hash
index b57ac3f6d6..f18948e55f 100644
--- a/package/flannel/flannel.hash
+++ b/package/flannel/flannel.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  4eea610dbcf26f3e37faa48c347931ba36411421d3adad2b08aff450531563db  flannel-0.25.6-go2.tar.gz
+sha256  9941bfb958b8583c080d61cf0664207f311f2e2500db2ae5c3413ff2dbdf2195  flannel-0.25.7-go2.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/flannel/flannel.mk b/package/flannel/flannel.mk
index e09319494a..c23c3ae9bd 100644
--- a/package/flannel/flannel.mk
+++ b/package/flannel/flannel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLANNEL_VERSION = 0.25.6
+FLANNEL_VERSION = 0.25.7
 FLANNEL_SITE = $(call github,flannel-io,flannel,v$(FLANNEL_VERSION))
 
 FLANNEL_LICENSE = Apache-2.0
-- 
2.34.1


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
