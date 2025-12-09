Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18180D3B98E
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 18:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEFEB83843;
	Tue,  9 Dec 2025 18:35:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DKjsJtkOGuUd; Tue,  9 Dec 2025 18:35:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E7A383B95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765305358;
	bh=qNyPby4IQQevfZmNieUw04Uybvvm8xQN+kFNNm3nnV8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PO02iOizSDNUvQegOv/NdMthAh4/KfxguHooms6OTtuk7uoWFxQzk6NA/3NQBjg25
	 toDrlrs+VIZCNcJmd+sDpcRwUlKn6jfaqjaS60Hcv6YKp3aCxWxo/dKP1gkb/KEhQ8
	 Jez1pJm4FfjW8wwuQZCip17crqEE+pD+8a/1Z1xGyCvxoKidqQ+9oPCz8OemQWCv30
	 anzr6KvE7MxJ+Bf3NJKKL+rNSG4RofLzznrNI5wc7NveBiriEPeFtUrKsE/r7fxijc
	 zedH7Br8bYTyf7cLHWHMbOJLm8J5/QxjdQQuS8LQ9DVkUqGp9bwneceAdLs5QKqSE2
	 t5OyKK89gl69Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E7A383B95;
	Tue,  9 Dec 2025 18:35:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 042F32C0
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 18:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DEAA1401A0
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 18:35:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bP3rd3OK0dnh for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 18:35:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C85C940169
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C85C940169
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C85C940169
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 18:35:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 7AAA860128;
 Tue,  9 Dec 2025 19:35:43 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 09 Dec 2025 19:35:43 +0100
MIME-Version: 1.0
Date: Tue, 09 Dec 2025 19:35:43 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>, RJ
 Ascani <rj.ascani@gmail.com>, Daniel Nicoletti <dantti12@gmail.com>, Sergio
 Prado <sergio.prado@e-labworks.com>, Gwenhael Goavec-Merou
 <gwenhael.goavec-merou@trabucayre.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?=
 <rafal@milecki.pl>, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20251203215723.2323032-1-bernd@kuhls.net>
References: <20251203215723.2323032-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <09c90f9b114f5d69103a46749ce5f7c0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765305353;
 bh=DVSAWGVy0g+WJ7uyRevsMYeiyYuRgaK+utNzhLiIAeE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sTILNVlZM0Jdmi5HFBcMyLha1ZQyAiRT2BEvafxvirzs7iA/JEeMfgKc4lKpZ1+fz
 ye68e4DLZYIwT2u959/wPsg8XB7EKypgC0gDkmzm+REcveRFBwcYf1d3I5y0+5I/h7
 N8IRgElOM+N6fgWuSlmIFBVPpIpTdm4VFwJtRf1Kf8+WshzUg4wBug0QVuW7IT9V4I
 mS/ecmCHSkxJk9vWIsHX4Eqc3TeJL82szENOIHlA6jgJyIfW8a66aBIDJIasgPly5P
 VUyFdm5oNXwtzzzLXZNbZ0+Ql0+SnaWdk6Hh74C6XcUSjAAOKmdhRQOAzZkc+QZ/Sd
 vPnR/iuqM7XOg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sTILNVlZ
Subject: Re: [Buildroot] [PATCH/next 01/16] package/azmq: bump version
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

Hi Bernd, All,

On 03/12/2025 22:57, Bernd Kuhls wrote:
> Last release dates back to 2021 with > 50 commits since then, including
> fixes for cmake 4 compatibility.
> 
> Instead of backporting several patches we bump the package to the 
> latest
> commit.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

I applied most patches of this series on branch next. I made few
minor changes, mostly changing _VERSION commit id to use the
"git describe --abbrev=40" format, when possible.

For the patches I skipped (gcr, libubox), please see
my separate answers.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
