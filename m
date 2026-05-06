Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA05CD3439
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 16:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46D4840F7A;
	Wed,  6 May 2026 16:35:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BJbPqrC4vMzo; Wed,  6 May 2026 16:35:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68BC440F7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778085351;
	bh=HTh7AyqOzXcNRTnAZU9F6hAoRrkX/cCcqA5EFkfcMpU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=De5HLJPmOTCx0MSDMB8zXnh+Z6NJDqkfhtdW6SvboMW4MMeBGbirJVYEg7cyS2+Y+
	 dkacybpViUdBEegz29AfjejbLsMRliCPKTvdS6INhQgbHkPHSrK3UiZS13rjiKXTvr
	 vAAP1SWi1uzwNVNCEvtDX6+F+/YmdyeCfyPj2uL+BxqQYJWVqMbtrcj61371BZuSI/
	 3lcq8R0mxq1a+kUfn9gUaF7S3ovnXuTWv6iRlMWws+GZeXv59zbUviO1bej7JhNHj4
	 IRgEZJkUt+2ByiI9jzk02/LIuOqrSSQORASBLXDvDsQcgemkO+zLtBkzcnTVBQ77gM
	 12BwE0vtnrBow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68BC440F7C;
	Wed,  6 May 2026 16:35:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C7661317
 for <buildroot@buildroot.org>; Wed,  6 May 2026 16:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD8F74062A
 for <buildroot@buildroot.org>; Wed,  6 May 2026 16:35:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oQU-IbEESBTE for <buildroot@buildroot.org>;
 Wed,  6 May 2026 16:35:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A4732403E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4732403E9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A4732403E9
 for <buildroot@buildroot.org>; Wed,  6 May 2026 16:35:48 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc94.dip0.t-ipconnect.de [79.214.204.148])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4A88CA4C20F4;
 Wed,  6 May 2026 18:31:57 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51906)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wKf9z-000000002XI-07Vi;
 Wed, 06 May 2026 16:31:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 18:31:33 +0200
Message-ID: <20260506163136.1330722-21-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260506163136.1330722-1-bernd@kuhls.net>
References: <20260506163136.1330722-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778085117;
 bh=4twEeZDmt786fSG77MfE3Zp+TLRdEimw/c8/YQYP5Fc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=duV1FWhK8kLXmRxh6mXyzdHXWB0Hl10Y1wQH17YbsXKgT4onnF3xEH5TTGIfBtrBr
 09rhS4r0T9ibPqvTVVlNsORskPLNCr4JRZExybs36pljYHWHgncyiH27sp3AWVtK6z
 UYrYAR16rj+AGb5vCQFa5jwkYsN7VNM9u+qvqn5WUzhHJbmuGjTCSyHZH3+MK/kW/+
 tK8eMzfLjaMoori8yMRxKv7op/tMk/7AUs9VLdMjjxMCsI+ABXe1Wd90vwzyGiAYFm
 Ip/JzxkPolG9t90bIsI05qeYDmDZbS104/x/IFDkDgU9Su8Wzr+/WI/kjqTVyveXsJ
 twwONqdYs9wMg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=duV1FWhK
Subject: [Buildroot] [PATCH v5 20/22] package/gcc: switch to GCC 15.x as the
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
 Tudor Holton <buildroot@tudorholton.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
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
