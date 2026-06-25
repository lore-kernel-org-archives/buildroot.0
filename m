Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E28CDB479
	for <buildroot@archiver.kernel.org>; Thu, 25 Jun 2026 15:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E00B6104D;
	Thu, 25 Jun 2026 15:45:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id usNk4294dxys; Thu, 25 Jun 2026 15:45:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82C3861045
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782402321;
	bh=xEePiraUEPWwMk4yOhBNrMftNezb4xeMo/tgAHJFnbs=;
	h=Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=roi1kgxNYFz+qBPuha8Bw6JWlDVWiIBcc2ZbKioR9E4U4ELnL9W0E0Q2Gda+nOg2K
	 9ZYmr9/D0++PhnZrySZkohDsIZTd6VgMvvl7SaH5dNNE5OHUM4aor156X/pAb3fB9o
	 awPx94FX2lSC368dfyIB08PL4Q8yLC1gAM9xlWisKrnPj40AvsQsIiIlKAihwK+Nav
	 GstMrTpQeHXZ/D7bNdRFUR4ZFt3UsZlbIeWDBaPucpxmhXMRIpt6ggFlRaZDFB7D/3
	 5rNW5cfPi3igGqDmcFWe9O1gpcMAwD+ATOJ2BZqRgcCb7lg3z6JlwcI4NMxsH2cPVs
	 aniPQdYn2rKeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82C3861045;
	Thu, 25 Jun 2026 15:45:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FCC82C7
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 15:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65ACA408AB
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 15:45:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VudsxgjiVHTP for <buildroot@buildroot.org>;
 Thu, 25 Jun 2026 15:45:19 +0000 (UTC)
X-Greylist: delayed 435 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 25 Jun 2026 15:45:19 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 504B74025E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 504B74025E
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=45.157.188.12;
 helo=smtp-bc0c.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
Received: from smtp-bc0c.mail.infomaniak.ch (smtp-bc0c.mail.infomaniak.ch
 [45.157.188.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 504B74025E
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 15:45:19 +0000 (UTC)
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch
 [10.7.10.107])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gmNHD11t6z4Jw;
 Thu, 25 Jun 2026 17:38:00 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4gmNHC2V14zV8B; Thu, 25 Jun 2026 17:37:59 +0200 (CEST)
Date: Thu, 25 Jun 2026 17:37:45 +0200
MIME-Version: 1.0
Message-Id: <20260625-tf-cpe-update-v1-2-b315a596d23b@cherry.de>
References: <20260625-tf-cpe-update-v1-0-b315a596d23b@cherry.de>
In-Reply-To: <20260625-tf-cpe-update-v1-0-b315a596d23b@cherry.de>
To: buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>, Sergey Matyukevich <geomatsi@gmail.com>, 
 Etienne Carriere <etienne.carriere@foss.st.com>, 
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=0leil.net; s=20231125; t=1782401879;
 bh=E5M+x5Y6xiu1Lahb2LypMEW/SEKI0ii49yZ64ePPq8w=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=O/f7JtaGNp00u9XLi+tmmIlDdFdaZ+h1SRY2PvgLG/kmhuc2YtDPnWMV4T7NmVf4k
 O3TwK/v0eMgYqXPtU3hlfnWDpWQS9L9TXrix01ijLIIxp9r47sBrqb187ZkSeGOD2x
 uyg/I7hVAanM77fiUDe8hqtogKBcG0dNeGxftNypOKiTH672yjWpjg4OeODdEl/1Hl
 CJWrMD5AekVTBhTl6AIOl0cM+gKzxeMA/LWhzUQ2lfBnzkhkkE5G2mgAILfyELkcbH
 fSxrPS050oTrGqR9rRrCrFzjSKsXoizfJ187G1n5QYLo8/C7aeEQG2kK5jCYeZ2Mq1
 tKTyh1FxZSBoQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=0leil.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=0leil.net header.i=@0leil.net
 header.a=rsa-sha256 header.s=20231125 header.b=O/f7JtaG
Subject: [Buildroot] [PATCH 2/3] boot/optee-os: fix CPE
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
From: Quentin Schulz via buildroot <buildroot@buildroot.org>
Reply-To: Quentin Schulz <foss+buildroot@0leil.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Quentin Schulz <quentin.schulz@cherry.de>

A new (and hopefully definitive) CPE is to be used for OP-TEE OS:

cpe:2.3:o:trustedfirmware:op-tee:

as reported during review for a TF-A CPE fix[1]. NVD correctly
reports[2] the new CPE deprecates the "old" one Buildroot was using.

CVEs for projects under the TrustedFirmware umbrella are now seemingly
handled under the CPE vendor "trustedfirmware".

[1] https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/49486/comment/2fd93ed7_df27998e/ before last comment from Sandrine
[2] https://nvd.nist.gov/products/cpe/detail/EB42962B-24FD-4716-B3E2-69F3258A57CF
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 boot/optee-os/optee-os.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
index 1639597407..38faf8bff7 100644
--- a/boot/optee-os/optee-os.mk
+++ b/boot/optee-os/optee-os.mk
@@ -9,7 +9,7 @@ OPTEE_OS_LICENSE = BSD-2-Clause
 OPTEE_OS_LICENSE_FILES = $(call qstrip,$(BR2_TARGET_OPTEE_OS_LICENSE_FILES))
 
 OPTEE_OS_CPE_ID_PREFIX = cpe:2.3:o
-OPTEE_OS_CPE_ID_VENDOR = linaro
+OPTEE_OS_CPE_ID_VENDOR = trustedfirmware
 OPTEE_OS_CPE_ID_PRODUCT = op-tee
 
 OPTEE_OS_INSTALL_STAGING = YES

-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
