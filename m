Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6800ACD4F50
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 19:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E91B60750;
	Mon, 18 May 2026 19:03:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FDJ4_DzctvVV; Mon, 18 May 2026 19:03:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1865460749
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779130998;
	bh=u2EsgraCSyUU/XBVnrSaamJAGxC+c9UlUYevaT8vd3U=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Wz46xHWoFwxGMJ3eL0gISr+2xzEiDEPH2gBcemAG10v7b97EeTNHxQ7SRX6/BnTAR
	 KFmYhemtzKaey01M2VMC+osLc026zctUHc5SLkYjhDVJyS68WbU2k8/LbxWBdDXS0F
	 NAjj/mVZClnd4eiViKv5HCIt9b6w5K1c4w+/CdJuSce25tNHbyFMTPYUclDtiZl6Jq
	 W4BSqA7RPGwO/uYfN1YUa/7srDoJ8Scx6/K85iOK3Eglw1Lu8FK14wgKVb2Iqe+L9M
	 zmtwf2tt+sw6h3E8snXnl3woNbmUxx5W7RmEINYDIiloomNvUkSWRk5JSnRkJnw5qX
	 sViLKJPn/STNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1865460749;
	Mon, 18 May 2026 19:03:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B47D6282
 for <buildroot@buildroot.org>; Mon, 18 May 2026 19:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9AA5D400E0
 for <buildroot@buildroot.org>; Mon, 18 May 2026 19:03:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id swRIs_xwf1zG for <buildroot@buildroot.org>;
 Mon, 18 May 2026 19:03:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 91980400D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91980400D5
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 91980400D5
 for <buildroot@buildroot.org>; Mon, 18 May 2026 19:03:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 89A7F19F574;
 Mon, 18 May 2026 21:03:12 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 18 May 2026 21:03:12 +0200
MIME-Version: 1.0
Date: Mon, 18 May 2026 21:03:12 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260518180436.101380-1-bernd@kuhls.net>
References: <20260518180436.101380-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <281f295b4a90a20d69cae1dfb26c46ed@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1779130993;
 bh=PZieAMdCuhMNpq03v83yYS9xaM4KP+UR7QfvCmKwhCE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=H1XNtruepNWgGjffI+mx+S66W7+yR7gWqsZUAhHMNiXm/3liw/ovJrmKypVvXbxvX
 UPnwIJUhUEaJ7oA9HaN9J+aXhsPiF+WRQ6l14IvXuktKHID4zKjp7oSgE+JIqbdpsH
 PeEywCRmU0h1EImbZEahETc1BFKlQy2aCB+XowlUzf4frBufNC/Vs8m0Zti9NIGQr7
 pvs7qveFU2fiPrWwXRkZ9Sbycu23e03Rf98V3jR4COXo3r6hXA492yKBKD0xd/V7b8
 Q70C7bz6DATxAtGH4NIl4xjwa+3Izb1kG2KQcbQK4wTeRfcNe/J5xlP/S7hdwm4qvs
 tkB0KiYMtxDDw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=H1XNtrue
Subject: Re: [Buildroot] [PATCH 1/1] package/gnupg2: security bump version
 to 2.5.20
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

On 18/05/2026 20:04, Bernd Kuhls wrote:
> https://lists.gnupg.org/pipermail/gnupg-announce/2026q2/000505.html
> "This release adds two features to gpgsm and fixes a some minor 
> security
>  bugs."
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
