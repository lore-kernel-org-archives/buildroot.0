Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67BA0C54FDF
	for <buildroot@archiver.kernel.org>; Thu, 30 Jul 2026 10:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DF4980F33;
	Thu, 30 Jul 2026 10:01:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gfM3R5j7w6Lu; Thu, 30 Jul 2026 10:01:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3C0980F2F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785405675;
	bh=+nJi92I7rcRi29VvVZofhF1UsHBXPNtnzqmy22RsxvY=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cJ1O8Iy+v+mejqja6ZovhcAcN7Pkrz92P5G7ISiDErKjhTzB2gW4SBQNRXQ5YzeOp
	 BgS+hyqApNHudJn7mz9UDZFa8Mc9ebWxr7+swbQaT1YGLhpNFN5dPDISB6Ygy+Q3jN
	 1Mjxym8juNtPkKz2aKHx/pmgicKlJLfoSziSNYX9KO/lNoOmz0KoFPkVZV2pHJdQ7V
	 lJMCNmx8cHIA5A17/rNcFrgQiyIgZgeEP6x+bUb0ruOyDt7ZQytgnMAkse44fvwNUB
	 opWkKu5ggu5J0X5TLDN2o2r5+tgsiG9xrZojV1Ix466JsT5RssvJJjNgxJLlVt0e6O
	 9xHbDCBZnliOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3C0980F2F;
	Thu, 30 Jul 2026 10:01:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EDFFF26C
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 10:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3F4480F2F
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 10:01:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g_Sb4DVetSZc for <buildroot@buildroot.org>;
 Thu, 30 Jul 2026 10:01:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=199.212.143.9;
 helo=cpanel10.indieserve.net; envelope-from=rpjday@crashcourse.ca;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 05AF780F2C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05AF780F2C
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net
 [199.212.143.9])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 05AF780F2C
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 10:01:11 +0000 (UTC)
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com
 ([174.114.114.5]:38164 helo=sheena)
 by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.99.5) (envelope-from <rpjday@crashcourse.ca>)
 id 1wpNZY-000000012Wv-1wrU for buildroot@buildroot.org;
 Thu, 30 Jul 2026 06:01:09 -0400
Date: Thu, 30 Jul 2026 05:59:54 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: buildroot@buildroot.org
Message-ID: <fbf843c0-ab97-efe3-d462-97cffeef3a86@crashcourse.ca>
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id:
 rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
 To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o6Uke7K2/G4g4kTreesL2EBzcnRGsPlwyHbMtxyLWfA=; b=NlffhGkNXGkcCZtKcsHYemSlNd
 VLeB8ZsCKrkmtCz2AMMknZmOYUqzF90JZ0hvev6PfZQaQM4kTndlsRqeum6Vkr7oZ4AlF8WPrT6xZ
 CUIiY9TyofrEUO98F1BbWNyLsmJ5islgIOUlVnxvdpH98zNT7o+Gxh0fJ7BMJh9Lu7W8pLNl8GDhW
 Qcfy3iV87jBFKgOjesPSssWEr622AG3MECfwJl+e4cRvJx0EtKygZ8Gj5sxYj94MfPisGJBAHh6Pa
 vo93m3P5/2QHj/zbBgLpYqpN/Ic1aMZ7FX7AzS0NceAKRshPSDRh9pwMVhkiHut+CZZhY/V0ohGH4
 bRKYZE2g==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=crashcourse.ca
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=crashcourse.ca header.i=@crashcourse.ca
 header.a=rsa-sha256 header.s=default header.b=NlffhGkN
Subject: [Buildroot] any reason "imx-mkimage" is still on lf-6.6.23?
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


  Just built from master branch a new image for my i.MX 93 FRDM, and
noticed that the "host-imx-mkimage" package is still on lf-6.6:

  host-imx-mkimage-lf-6.6.23-2.0.0

even though the version of Linux used is 6.18, and here:

  https://github.com/nxp-imx/imx-mkimage

the default branch is lf-6.18.20_2.0.0. Is there any reason this
package lags behind (even though it obviously still works fine)?

rday
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
