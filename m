Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E24FCE094
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 14:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E888841D2;
	Thu, 26 Feb 2026 14:27:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wzgce2pxBbDQ; Thu, 26 Feb 2026 14:27:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D64AD83EE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772116045;
	bh=lSSaJ7LWmOPrN4LGgVv81TQ9/jMTc3KX9VIMOTccRiA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WEtjHTMI/pJKHzzNgavWAFrNu+hgULoERSWXxK1HVvRL1AwLVedKaaLilK6+nwuw2
	 FCnsFDtghZuSD5svzl7IVY0xn0z41qc84pk2mJnHW0tg5HWpqVU/b6jbmdm7DDa2FN
	 LxzyaTTKHhEVTuLjoU61zdlamXN/bNzurtrOA3x0rtv/l7Rhc7kQdbcFRKSdvzwu0j
	 zdHC5XkPP5t/ND2CAtjC5WGqqn5V/aJ5ayXwNFCJvwdtqYUxjffHNiF9i3Pk6xi6jI
	 H0hTinSJ9tFTikLh/OY7+rFmzc/GeTX4hHYqREG+oq3buiK1iFcldAbBJpayH7hyNT
	 7ICOfjJM0WzOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D64AD83EE3;
	Thu, 26 Feb 2026 14:27:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1775524E
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0F996122A
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:27:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uESzVPCZUlmm for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 14:27:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=109.202.192.35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D92DA6120C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D92DA6120C
Received: from mail.codelabs.ch (mail.codelabs.ch [109.202.192.35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D92DA6120C
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id 2F60A5A0003;
 Thu, 26 Feb 2026 15:27:17 +0100 (CET)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id leoJxQB4B9PV; Thu, 26 Feb 2026 15:27:16 +0100 (CET)
Received: from zbook.wlp.is (unknown [185.12.128.225])
 by mail.codelabs.ch (Postfix) with ESMTPSA id 5B6885A0008;
 Thu, 26 Feb 2026 15:27:13 +0100 (CET)
From: Martin Willi <martin@strongswan.org>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu, 26 Feb 2026 15:26:57 +0100
Message-ID: <20260226142700.1064999-7-martin@strongswan.org>
In-Reply-To: <20260226142700.1064999-1-martin@strongswan.org>
References: <20260226142700.1064999-1-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1772116033;
 bh=OdyXHgm4T0kOnBr3PDILPFrQjnxTQ2czC70fSf0gVao=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uJLoHKuxgMtsJUHSIFPewep2JuFZd1vVQFxy2PezgiGX3Ozgh+E5aw28G5/9xoIXI
 UriaUir2k7FsKJxU3zHlp81EoLC00JaOs8/vNu8RXTFF/XVvczv+zK7ISl02lsXzkB
 z1I8NNuO2ylOE7f/OwwWlZi3trYeAoLopm/nYAsWf85VK+BHKqatjJbKuTLvxyl/nF
 rNkuba0eRFP91/S+NO9XsYiI1hAxroz09Ui+roQWtd8PwDv8CYp9Pw4GHgMMrxeiws
 h2SogZnIiCPlP7f+eZPqeVgvWIdDgxD9AwB5/p9FCi861TN/FyW9zf6eIhBorBwJWf
 OS+krMbsXQyoA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=uJLoHKux
Subject: [Buildroot] [PATCH 6/9] utils/generate-cyclonedx: find manufacturer
 URL under *_TARGET symbols
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

Some host-focused packages installed to the target have a BR2_PACKAGE_*_TARGET
symbol containing the manufacturer URL, so fall back to such a symbol in the
package's Config.in. This fixes manufacturer URL lookup for binutils.

Signed-off-by: Martin Willi <martin@strongswan.org>
---
 utils/generate-cyclonedx | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index e811e63685e2..f551e3ffbd6a 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -348,6 +348,9 @@ def cyclonedx_manufacturer(pkgname, pkgdir):
         if non_lib_pkgdir != pkgdir:
             return cyclonedx_manufacturer(pkgname, non_lib_pkgdir)
 
+    if not pkgname.endswith("-target"):
+        return cyclonedx_manufacturer(f"{pkgname}-target", pkgdir)
+
     return {}
 
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
