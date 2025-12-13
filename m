Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9C9D5B15E
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 19:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5242E608AE;
	Sat, 13 Dec 2025 19:06:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zfde0I8ZB-Pi; Sat, 13 Dec 2025 19:06:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C12DF6086C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765652783;
	bh=Kg4wSeZiyJJVA76JF6BRwRTBUasndPko9mp4W/jVF4Y=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZCRoiifKr9hO5o0VOdFncK6EhQmelV3O012M9gfqhEgJBFZ/FEuIrMUqxWThdCWrc
	 x6w8jH0ahfp+MNFAIcfGqothaJM8MX/46QxS1aGN2DEhSDR+w/8gqqvnug34kbpIbu
	 qQfSGQOvRW0S+0+JkIAfNxeax2r3SmqhJI7GQxbKHVZUuR8qXjP5PB/3vRZKXJaHmM
	 sUH09LWi/wJwouO++HsMpQ/PwotcloxeqCTzwkuITiTNvALmXCJvnkW00LSpGgG+AO
	 PRPFlOl38FNj7udyiWSFRdQWqAHM+wV+Wjtovo06lAndnva4n/O3I6lNcvsZLFdht2
	 577OmVjg+gumA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C12DF6086C;
	Sat, 13 Dec 2025 19:06:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A218117
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 19:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3E7F60860
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 19:06:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bOSlxoCrtGub for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 19:06:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2DC9E608AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DC9E608AC
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2DC9E608AC
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 19:06:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 7A040780371;
 Sat, 13 Dec 2025 20:06:16 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 13 Dec 2025 20:06:16 +0100
MIME-Version: 1.0
Date: Sat, 13 Dec 2025 20:06:16 +0100
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251213175200.745434-1-raphael.pavlidis@gmail.com>
References: <20251213175200.745434-1-raphael.pavlidis@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <69041f73965c55567df81390ab2d45e8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765652777;
 bh=5t0p9WqCOPBG977gTYMf8+B2noTmE5+LziiLOROqShc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bKP6vIcsGKbjHizZuI1en48MLnpeBNRXGejvFHKB8/s6kfNA3PDtflPEdGCn8McNO
 ZmAIzowYKsfeaUWeM7Ypv0nCMhMz5FkyfOzveohbdWuVw6AVpcUVQGTomf4N/7b39/
 vU5uJv0vDA9fU02lfJsFQzieB6XnwH08mT3t934irddkDAdeC4oulgwiCJji431Jyq
 W0JcvI1XvjzQCWOZcL+G71hx8+HVehxZ02tr8pzk8Dnv0OQpPrJjpQiEZAzB/Wk5qr
 Csajln9LQJyRTGZScAU40/PlvQSI113NYKpclEQybaLkUcbKvboZ85u+pMuGOmDrB7
 xWBPq0MGpJvVQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bKP6vIcs
Subject: Re: [Buildroot] [PATCH v1 1/1] package/xwayland: add nettle and
 libmd as SHA1 providers
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

On 13/12/2025 18:52, Raphael Pavlidis wrote:
> Xwayland can use either nettle or libmd for SHA1 support. When one of
> these libraries is selected, use it as the SHA1 provider.
> 
> Also reorder the preferred SHA1 libraries to match the order used by
> meson [1].
> 
> [1]: 
> https://gitlab.freedesktop.org/xorg/xserver/-/blob/xwayland-24.1.9/meson.build?ref_type=tags#L235-239
> 
> Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
