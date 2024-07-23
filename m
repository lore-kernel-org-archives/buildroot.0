Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A80EC3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 09:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C1D940A21;
	Tue, 23 Jul 2024 09:28:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i280B0LYADuy; Tue, 23 Jul 2024 09:28:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A35A40A25
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A35A40A25;
	Tue, 23 Jul 2024 09:28:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1E7211BF3AA
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 09:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0AE0540A21
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 09:28:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a_0R_Xpa3oLe for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 09:28:11 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org;
 envelope-from=geoff@infradead.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C905540A25
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C905540A25
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C905540A25
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 09:28:10 +0000 (UTC)
Received: from fpd2fa7e2a.ap.nuro.jp ([210.250.126.42] helo=[192.168.1.8])
 by desiato.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1sWBoS-00000003er8-0jFK; Tue, 23 Jul 2024 09:28:04 +0000
Message-ID: <1301e4f4-8667-48a9-82b1-7042aad06168@infradead.org>
Date: Tue, 23 Jul 2024 18:27:58 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Geoff Levand <geoff@infradead.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Peter Korsgaard <peter@korsgaard.com>, Arnout Vandecappelle
 <arnout@mind.be>, buildroot@buildroot.org
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=jL7kMN2oK/bBLXawJaXMfoZV1285RtQKaIPcb7Kd4+0=; b=kl54nltY9dt3L5eULUx9ZBFJG7
 FoGL5w0MVlB7dxQu7w5mxPFeIzjGaNa9d7FtUkjP+7N18s5OH8dBdInn+LB4/3ImzEWOCl398fN38
 JzZJJuuTj9gMXN6oe47TeKv5KdOTdgTpCAJUSxamxB2R5vqHN1IScHxpGQ642S0fx7DD08j9seDAl
 +Q3CnbjEPGbSJAkSzID6PSiS43Dx65h17RitLFodY4c8u74gPAVZ5MBSxrll/ZbW2m5TAKIrIWZ6F
 YvKzAEruD3008pJ8rvckMCj9fCgzs2mWwPztKyWBu9LA2Enfrtu9xOhMW9Eknrigs03m4gTL9ME6T
 weun+nLQ==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=infradead.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=desiato.20200630 header.b=kl54nltY
Subject: [Buildroot] package/flannel: Bump to version 0.25.5
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

diff --git a/package/flannel/flannel.hash b/package/flannel/flannel.hash
index 85bc184368..d1f03a9d38 100644
--- a/package/flannel/flannel.hash
+++ b/package/flannel/flannel.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  e4946abe7212d0a3f89f64ff9d4310dd21fafa782d7e5c1c7d44ea264ab25d5c  flannel-0.25.4-go2.tar.gz
+sha256  e6f312d8a7e635ef707f3811313f045f0f80312d96dfcc722de973ffa2910204  flannel-0.25.5-go2.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/flannel/flannel.mk b/package/flannel/flannel.mk
index 5231d41de8..7705bdbefe 100644
--- a/package/flannel/flannel.mk
+++ b/package/flannel/flannel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLANNEL_VERSION = 0.25.4
+FLANNEL_VERSION = 0.25.5
 FLANNEL_SITE = $(call github,flannel-io,flannel,v$(FLANNEL_VERSION))
 
 FLANNEL_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
