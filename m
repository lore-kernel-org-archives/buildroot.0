Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E885DCD98CF
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 18:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1EEA614B1;
	Mon, 15 Jun 2026 18:26:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YnRPDnVjw0Bm; Mon, 15 Jun 2026 18:26:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E32F9614AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781547985;
	bh=YrvZ1fJtNdRITVqlLM4rkD9m2bIUOBJZSNDm0swCeaE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ou3z5q6TJxtY5ofANZdeM81lgZJWL6Bitczgmsk5ea3V/eayBLBPnHa0uOZwmmK/h
	 X+7AxUJkWiM/lUWXv4CTSOw8gjQMCS44fnwfAkXL6sodBY1dKG1fAcANdicJ2qxonv
	 EKwIkhXUpbmLY88VUmD6wEOQ/bLaK/KNT5LgkhrWzYigt3S/4k/hNqyrMd9J6T3tgq
	 fz8gEsrq/JJKWLFdiKb+sF0ezxnk/az8sbOty4LfiJjZPlTsevXvaIgtaItcQzBb2N
	 yR39VRQKctM1vhnuzTBTF0q0PV6BNZ4wZ35s2UadIlw4BXmdB5dzvJQ6bsWiwIvvGQ
	 8C+Ugt1uoJ6JQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E32F9614AE;
	Mon, 15 Jun 2026 18:26:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A93ED2B8
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 18:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B62A4031A
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 18:26:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KRf2Quma7Y2j for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 18:26:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C3F574040A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3F574040A
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C3F574040A
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 18:26:22 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id A3C6D2C891D3;
 Mon, 15 Jun 2026 20:26:20 +0200 (CEST)
Message-ID: <157852b6-7396-404b-8153-5df134e899e3@bubu1.eu>
Date: Mon, 15 Jun 2026 20:26:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Cc: Johan Oudinet <johan.oudinet@gmail.com>
References: <20260615161815.1945181-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US
In-Reply-To: <20260615161815.1945181-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1781547980; bh=Dxa7AFH/kRnyQkD+krEr9+YUWUBI9c+AIayL93hZ8lA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=NbE37XWotPQ36hiGzD9GSMBEjboJa3Duu5JpRo72ZLOmyAEwPjtk5zESfAic2TXCx
 G8V0PBYo0ZlXpoAEzGdz2ROnor0JNha4aMdLTSrC+WJrYweiBEvjBZCUEPJjOZw14q
 izweoacApUCI+ANPr9pmMPC+CEEsBI4V0cittFPl3m3fk5x/c7EBsPfv7f0U+slWgq
 MMobNSaKBOpvYrM8klzvgmsoGCqHPMWWgISLuF+3I/3LyyRfAtMuuPCOLOhjgq85+m
 kvVItbnXkFWgcc0TXG0gC5SGLmvZBRFabk3cCLdk4a0rMHaygdxIb4kida7KBmM8mk
 pkhrpeHB1oqDg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=NbE37XWo
Subject: Re: [Buildroot] [PATCH] package/erlang-jiffy: bump to version 2.0.1
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

On 6/15/26 18:18, Giulio Benetti wrote:
> Release Notes:
> https://github.com/davisp/jiffy/releases/tag/2.0.1
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
We usually want new patches to not depend on already pending patches in 
patchwork, so the "proper" way would have been to send this bump 
squashed together with the previous 2.0.0 one and mark the other on as 
superseded in patchwork.

Anyway, I applied both this and the 2.0.0 bump to master, thanks!
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
