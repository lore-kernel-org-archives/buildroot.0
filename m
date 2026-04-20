Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0440EF5A8C6
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 20:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB02C80A4C;
	Mon, 20 Apr 2026 20:50:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kWG4MSuppKJG; Mon, 20 Apr 2026 20:50:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19E5C807E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776718215;
	bh=mzUwKbKuJBVwlOHJoCAuj16/Q+7AlZF/P1XR3zv7rA4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Kne1Zp1EXjht/OylO1hP7i1TOher9XGG4aAWuwrfwEWfe/ia3+S0xAiR2sGEcDRGt
	 HZ301fP4glLt09T74usVfMcpx3lqF3EUuawx0zzT2dMjEDkfVZmew5axGEh4iWIcPV
	 gcfHrd4u43xT0ctfY3R7NE/iRvVMZr0oUc6751r6kc9LAqhmGnHp/rNf87MxfbbJoh
	 PoZ3f+g/6myLJzEMsMA1PncCNeUynI48zjPuXRY6V3ncBQhVemj1bIh+kVU58CuSBe
	 RKgyNcy51e8ppIf0i5xLlD5l0Ddd4JVVDqCB2DUp9Y5jA266W7bVrMfEbWUgICbLPq
	 izYA7tKATLwQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19E5C807E1;
	Mon, 20 Apr 2026 20:50:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E3F124D
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 20:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 841134084D
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 20:50:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XOWb4Zbf6T0O for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 20:50:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D3CB24071B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3CB24071B
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D3CB24071B
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 20:50:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id C713913F8B9;
 Mon, 20 Apr 2026 22:50:00 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 20 Apr 2026 22:50:00 +0200
MIME-Version: 1.0
Date: Mon, 20 Apr 2026 22:50:00 +0200
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, yann.morin@orange.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
In-Reply-To: <20260420173858.1655069-1-neal.frager@amd.com>
References: <20260420173858.1655069-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <1680095fb1bc4aadf9082cbb51c22151@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776718210;
 bh=NHppSUF6omeTj6gyum22sXQr6ZpD+H7nAbRxfsr/X9Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KnXUN1/qj+P5Owla02DO3WyzCRpYxtI1i7rnPD/fTAcFJDRELLuyiAMzJQgtQFxfN
 H8lCTSBwt60SOfYh3K1otbWjunNEyyNlMLfLEpHaalTWXEBmHtCBRCEX/AuKRFvxVM
 RPLrqmY+XFcITzFYlvpJE1J9JiCWxlYejv+ZawAxA+N/P2L0AodFlQxMs6P80YEfqn
 5XwHQin8KxmyJkGQhfpEewBuLM+d6t5ydIvZrKjbLqvtWVR/FfY3IQK5DSweTaa4FO
 vHWzdaqBRjK/Zsr0nw7fAFxWANwz50CIL2NpO/TmzMPf58nrNsjXDYVfIXEWux1w5O
 IEMEVrB/xue6w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KnXUN1/q
Subject: Re: [Buildroot] [PATCH v1 1/6] board/xilinx: add Linux 6.12.70 hash
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

On 20/04/2026 19:38, Neal Frager via buildroot wrote:
> Add the hash for the Xilinx Linux 6.12.70 release tag.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
