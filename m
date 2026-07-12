Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29812C43458
	for <buildroot@archiver.kernel.org>; Sun, 12 Jul 2026 14:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F18B4812B4;
	Sun, 12 Jul 2026 14:20:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OaiV2TrMdAFL; Sun, 12 Jul 2026 14:20:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47E5F811DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783866004;
	bh=XMovYZ4ktItA8RUqcM7FusI9JuPw2WMlT7clOW9bycA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YfToqsDv8RrpcjaHBzYJBiVbHMvfvM55orFEGS2wIt4/FqbHvvdjMGgi9Z/uvF2mg
	 YWffnxmqZ4m/rQjkSPoPpVfzy7DtLYM6BXKPwuEfvycCt0Qxon5dUvVkon2bYwVfkT
	 3UpJW/mcUJ/sukQ02DBjPWDZPOUBx4JfS+PdCEGg2VU4lfqXYsncIjMkSy/Mdj+sAK
	 mt72iGVGrBMoX9GwFynTha8PXGEW9lm+C/2GLxXEmOoID/CCs85wlMbJcC2NoKa939
	 FLWP2BhSchLi5AP1ADx+L5pETZnbhfdbAnERcDH25aZx1dUlHRnPnIVzu03EikkCSJ
	 1Z2dliu/JWlbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47E5F811DD;
	Sun, 12 Jul 2026 14:20:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EFA32EE
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 14:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14C88811E9
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 14:20:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A5hCRAfrtgHW for <buildroot@buildroot.org>;
 Sun, 12 Jul 2026 14:20:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 64CD6811CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64CD6811CA
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 64CD6811CA
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 14:20:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id B78BD13F89C;
 Sun, 12 Jul 2026 16:19:51 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Jul 2026 16:19:51 +0200
MIME-Version: 1.0
Date: Sun, 12 Jul 2026 16:19:51 +0200
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
In-Reply-To: <20260617050535.2670810-1-neal.frager@amd.com>
References: <20260617050535.2670810-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <5035d5db3ad2e9354fd7733b6b489bc8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783866000;
 bh=LJLhvM6Op+zy1YAh4j8kGRHxBMnGXXBUvwnOrmHrBTI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qwnpfo89m5bFvAgHljWG5CqhR0FaLEhMC5aTnUj4d8plwLmpfvTvAAz+Bu8mbRLU9
 hDfnyp+9QqFFcvlyAf0DudE+pMVSNdwS9pWLMWZVqSASksBB6Mc78jwmYbWvXioj7G
 1eidlfKtSLMgKrcY3PlkuUwHNtBkVUED/gTI0K00gjrlelwMKzYwCp3CBpFuUA+/1P
 pbdcecaaFJy6u+U4+WyGliwF+BfP8mjWXghncQjwElJK1BUZwShqAL44l567Ww/VCF
 z4+hl48+APvFPfnzf0/DCc0UA/RvBYD1NMs6BdM0Ggxk6XsMPoT0snRTjhP3aOwmrG
 ZCdjbJAUU7MXQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qwnpfo89
Subject: Re: [Buildroot] [PATCH v1 01/10] boot/xilinx-embeddedsw: add
 xilinx_v2026.1 hash
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 17/06/2026 07:05, Neal Frager via buildroot wrote:
> Add hash to xilinx-embeddedsw for xilinx_v2026.1 release tag.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
