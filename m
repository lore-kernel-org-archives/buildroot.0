Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F147FCA5FA1
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 21:31:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6A9640528;
	Mon, 28 Sep 2026 21:31:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dB2P_PA36iTj; Mon, 28 Sep 2026 21:31:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 72BA440523
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790631075;
	b=bQc1COVEScIE0f0dnlsMKmEu8XnHTVMZMnUWsNvmVoNYmS+6Rxire0QYLFhxUHbm9iDs
	 0SS2BVKBt52ViX72yp7gS16fecMdQC71KHgKBOaRvXOLQYxLhyt3dWBfRvkTIHJrAwgki
	 0MLEzbT+1vvx7Xz/HHlf3lST2MXwnC8dTu/I9FdHOl6q66s1yHhhbsLy8kZoapVdv+lYW
	 poBSX5GWb2y/pOAQnGzbSkPA3JZQIrhIq7mWbQWpQdodpbRFvBoM17wN3ZQFSkusQ4HJ7
	 34cxnd1xWjxPh15RqL3JAgmmtNrFbZvn9wTjdfJK7F5E6zYKCeFsXkXxPqFnecFKnfQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790631075;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Pl6ZaQcELR8sVolGQG7K2HXIeT3DOJ75vYOOtU4yLeA=;
	b=VEH/R1h9HEsj2d8uqnL1GDzCYiV5Z4JcpZnPKrXfDpmkw0JYJJUijfNyRPQQt6xPLCCS
	 o0/WtwRGIqjc8H+kTdgYX7JonTfRdMm4hRPeukpn7fVOwIBR5Wz2WgTPb5WGaUil2dPlc
	 pTXL6fs1jqJ7wjAa6E/apSmab1BjI7X/rmd6mZvy+w/3sP0PtHFFgZfNDZ09NL+jqjbyX
	 ppIhCmsu6kkZRjmIO1jeKNNTXiqIOYznb0bqFswtGBilIfojPim23mG5s+U/+MSH6xIrM
	 jcS3ML9mo3hUztR2JK7DJn/2cA1K/aaJYIze+DTm3CsQg0v8ONyfNvzRtPdQdhZnMbw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790631075;
	bh=Pl6ZaQcELR8sVolGQG7K2HXIeT3DOJ75vYOOtU4yLeA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JvmKOEyeJuDcASvGKZrke+B1uZdl/vlPtcBQGxKKIw47PouWmT53tmVlCcbfMn3cX
	 EkSQbQelrahzUNFqwqJUfpGAH+Jvrsy+hmdEq/3uwdw9LnF2SEGKEje0APTND7chwg
	 UwTSzVx31Vsfxsra8DJuCR+6aRdJ6Pi2op0YZkv1/ra0Iuc+OKHaFqAMVGeHfN0bNZ
	 DYVPbqRhQtujWgga4HQ4tLAOPtoB/6JGjfO6NdI6a7YuP+OqNX32D5ql7icbaJq7cM
	 wqBG45ROhQ+bJkUg66j/xV4VxFI/Ssp0I+fiucW00XUeRkiKHOQmAZM6uh+KT2fQVM
	 48JwPku6J5pzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72BA440523;
	Mon, 28 Sep 2026 21:31:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C946772
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AED6180BB7
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:31:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id boveRW3rsWdZ for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 21:31:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1EDC580A53
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790631073;
 b=CbuZJ/+yGwwdW650rLA0Un2NRTpsvg88GmvfYqSOw0qZsu87NC2anBtwo+1uXcHcVdZm
 r1zj5lR/aPMlMggodcff+bKwZNgVJhhNPKYEUGmtIyDnaf6IEKCd5k5NWEatYgXyrS1pi
 RiiEFHCNSPpLPTCEpLOotDwXrRUH+Mfntiedj9KHAOS2O1wCpuB5sxQYvGzTL0MWUzSBS
 KzUPNce8ynokD6Sp/eer0JCNA16TPIq5mK+wrudJb214u+SSejoH2xYwey+OLWXMNnAoK
 KWkvKXA3LA6dNpMDL1iUIiijoNTpmoSaebBD3yXljMl27xJXaVCzu6Jij991mxn3EuQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790631073;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=8/eFYVBc636pdDRLJ0GoMQYdedfOOmgtRl1V7eFWcwU=;
 b=QGj3b1MK4v4guzTB1JVNA3Vq6G38tfxPDg6cbbPwzzNJQMgWu5NqCwC6LPpjXlP6aRGB
 k1Rz02i9RfkM9gPf5MwEmCXNjmcNpY4BwdLcnT7gZeoxX78Ex5kMi9GOk2e1Rx2KlxfF8
 vO6macXJ+rSnKvybP3EcCuRs+xs45xZ//oh+eKR/SCEK9t+KpkTrZGveQ7shWtxnThoL4
 nBzi2SPwu4gwrOW4x4fRTqGqRXICzqT+kToQVUyEjnQs8v44VE3Hie0C25HIx7NUHSweK
 qdbc0OphUk8NNgq0C4npuPo/Kme4TBirRdBZ9hMVG7kMc2520VFGJaNB5AvdXYCWEhQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1EDC580A53
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:31:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B5DB48D4CA; Mon, 28 Sep 2026 21:30:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Sep 2026 23:30:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6276402ea1913a720edc6ce83c58f01bcd5be3f5
X-Git-Newrev: 451d9950d14f177186fa9a3466e550d14c9ada89
X-Patchwork-Hint: ignore
Message-Id: <20260928213000.B5DB48D4CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/snort3: bump version to 3.12.2.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/451d9950d14f177186fa9a3466e550d14c9ada89
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/snort3/snort3/blob/3.12.2.0/ChangeLog.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/snort3/snort3.hash | 2 +-
 package/snort3/snort3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/snort3/snort3.hash b/package/snort3/snort3.hash
index 599818ee24..02ebcf85c9 100644
--- a/package/snort3/snort3.hash
+++ b/package/snort3/snort3.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  9465d19b0925088266504e8962e97e55359bafd6a19f66b4169dcd21ef1d8ec5  snort3-3.11.1.0.tar.gz
+sha256  43000d6b0e0307bc1a735874d00deb61e8b6a96d074f8cc9b2fe2cde0058720b  snort3-3.12.2.0.tar.gz
 
 # Hash for license files:
 sha256  3f1cbfb20bb2c608e1a474421880d08b8cba6abb00ab7736d22c481d71656a6d  COPYING
diff --git a/package/snort3/snort3.mk b/package/snort3/snort3.mk
index 273aa56709..a6f296a062 100644
--- a/package/snort3/snort3.mk
+++ b/package/snort3/snort3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNORT3_VERSION = 3.11.1.0
+SNORT3_VERSION = 3.12.2.0
 SNORT3_SITE = $(call github,snort3,snort3,$(SNORT3_VERSION))
 SNORT3_LICENSE = GPL-2.0
 SNORT3_LICENSE_FILES = COPYING LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
