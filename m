Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A261CCD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 16:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79F3E83A5B;
	Fri, 12 Jun 2026 16:53:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id isC5rx6iSyVC; Fri, 12 Jun 2026 16:53:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D896483A6B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781283230;
	bh=QBrxXXOIQe+/OX8rR+MxLw+0P2ivILon6Ct86qXEYvM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=X1p09UDTZt+5JE+g+Pb+2VIZHyNaXnZC7Q7CNaIpDfoS8SVw3WrQ0b9W47I6tsUlz
	 ECDY7h+WiBmnS7nyuvirUy7An/Qb1FO9VYPapa80PukcjENePl4SEHnwzV/LX/MFIq
	 6LtY4sC5hSMnrHQfP22XtvDTI6TM5CaO8edV3m0pNiFkG/q/qsNu3zoBbq47WHLJN7
	 0H7wwzYb+FsGI5hJCV/D4QZN6PbjMb1dQN0SawuhVUXnWiIAZjOYGCdq3Zu2D4KmN3
	 j9oF4JHPxl3Q2xcoQzkqoNgPw/8e9gJIq2DRgU7DolTc2MKeGH1H2o6hCfcYEbyUjy
	 tIEvHwLheLs6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D896483A6B;
	Fri, 12 Jun 2026 16:53:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BC017F4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DF574121B
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:53:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ZR8708Tlo8q for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 16:53:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A04FD41160
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A04FD41160
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A04FD41160
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:53:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id BD9D42003DD;
 Fri, 12 Jun 2026 18:53:43 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 12 Jun 2026 18:53:43 +0200
MIME-Version: 1.0
Date: Fri, 12 Jun 2026 18:53:43 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20260602202322.52208-1-thomas.perale@mind.be>
References: <20260602202322.52208-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.16
Message-ID: <9a71f5e71cb95e20f6e2be1f53c942b1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1781283226;
 bh=UfG7ewPxpIxNUQ+Nmk5vV6+oCgTw/c1Yp1e0RwJF2LU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oqUmjQOdkx7qtHDDYr1evltcw70tsyUmwGuyyFVocwsSqx58E5zTMg1tXxBWe7AeP
 JcskCy4i+GQTc0rrOEizHuNZWVJ6t/yN4yLQOLhuXC8J0shtcxszOhZ+kZXf+WB00O
 ZqrfDX78xeBcoaCdgcOS148aeav4thTpuelJuD/oRywg6qbt6+WYatJpCuqO9cCYRQ
 vbrah8mBgbmFQPZaYi3f+rKCdA4MSmq+6m3HnpuDxV2KeBa2tabc9RTqo4qnsHWPrA
 FLcfNSTtg3PBDSaKsrkGHUsjRZTQ0N71Bldtc1kTLOEX2rhkHUoHNqCIEzkb266WAf
 MZnqPl2xe4XKQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oqUmjQOd
Subject: Re: [Buildroot] [PATCH] package/ntp: ignore CVE-2015-7977
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

On 02/06/2026 22:23, Thomas Perale via buildroot wrote:
> The NVD database schema has the following entry
> 
> ```
> {
>   "vulnerable": true,
>   "criteria": "cpe:2.3:a:ntp:ntp:*:*:*:*:*:*:*:*",
>   "versionEndIncluding": "4.2.8",
> },
> ```
> 
> Which make every patch revision of the package ntp match to the
> CVE-2015-7977.
> 
> This commit ignore this entry.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
