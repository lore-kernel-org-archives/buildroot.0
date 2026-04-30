Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C61CD13D3
	for <buildroot@archiver.kernel.org>; Thu, 30 Apr 2026 16:23:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35B2842B42;
	Thu, 30 Apr 2026 16:23:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ba8Lx1IgWRa9; Thu, 30 Apr 2026 16:23:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3760142B35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777566228;
	bh=HTh7AyqOzXcNRTnAZU9F6hAoRrkX/cCcqA5EFkfcMpU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=axh5MoBGmeNUGXHRcx5LBp1XNliBfeUE/tWVnwiijyUbbzYzfEL4Agg6LMWoieGsP
	 rbkObOwbbGxBr1R2jGBXTRExBeWq8OXtofLnuQs08v3Epl5SwyVmjwODHCykuqOKWd
	 Kl5O91dNOCWnU93N7CJbmWTCCkSWwKrh99nd6j+07LPlX6qq68EBISeEgOkDqaSRHe
	 nheanDeitM1gFHn3gaeARN0x+1ugxS9LOKvE/cNH/+GuBArZ0GiaV8x+DER4Qf246J
	 MFbe/+weeUh155DDP2viQmmtPSa8iM2+wn12Zkvr8x3v13vFu3gdOy7U+oeva/58QF
	 XBs3lAz1iZ9UA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3760142B35;
	Thu, 30 Apr 2026 16:23:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C046118F
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 16:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A678942B35
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 16:23:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vQP_ldsH_rue for <buildroot@buildroot.org>;
 Thu, 30 Apr 2026 16:23:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9AE2A42B27
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AE2A42B27
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9AE2A42B27
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 16:23:45 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9DF32A4C2D08;
 Thu, 30 Apr 2026 18:22:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45580)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIU9G-000000004jw-0EuL;
 Thu, 30 Apr 2026 16:21:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 18:21:54 +0200
Message-ID: <20260430162156.3456640-12-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260430162156.3456640-1-bernd@kuhls.net>
References: <20260430162156.3456640-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777566124;
 bh=4twEeZDmt786fSG77MfE3Zp+TLRdEimw/c8/YQYP5Fc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Wxp31SbUa9j/hJBI+KmBtE9mDXhGFSSovVxQhmhG0ZovMCDoXN6vn3+z2InDUgYf1
 mFEQDMYjO9ckQFCXxVHVT2GgOHgX8/+FzodzeSgSVLoDZEEwe5JeHMEEcUTUBvahxW
 AWUwY0n24mQlUfAxTeZRD7ESpytdhaUiKVSuonWnbBlsqPD7gGrni26gM0+8RVeEgk
 GweqLFr0c9RNSuYJD2y/wvHJ0D/aEFQT7UbrJ9kLV6TzTDOy+MJkSpAthFQv88BME7
 MRbHYr2NzABCiLA3DpYGSYXvqfTfgUVNgyM/vxKkrWo0rD6bNQ2e58UTfndydQhTlg
 U5PTryLoI/V7Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Wxp31SbU
Subject: [Buildroot] [PATCH 12/14] package/gcc: switch to GCC 15.x as the
 default
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that GCC 16.x support has been added, follow our usual strategy of
making GCC 15.x the default GCC version.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/gcc/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index b9dd37471f..e218b13bd2 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -5,7 +5,7 @@ choice
 	default BR2_GCC_VERSION_ARC if BR2_GCC_VERSION_4_8_ARC # legacy
 	default BR2_GCC_VERSION_ARC if BR2_arc
 	default BR2_GCC_VERSION_POWERPC_SPE if BR2_POWERPC_CPU_HAS_SPE
-	default BR2_GCC_VERSION_14_X
+	default BR2_GCC_VERSION_15_X
 	help
 	  Select the version of gcc you wish to use.
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
