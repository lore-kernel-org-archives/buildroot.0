Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A809CA5FD4
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 10:33:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EF4B60629;
	Fri,  2 Oct 2026 10:33:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cIn6sEfvdK1K; Fri,  2 Oct 2026 10:33:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4CE04607FF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790937186;
	b=k3ybmswnl8dTT8GjCLKipnWKBu3yg8mw30BOQUnXT047GQXDJsSwBRmUPGkAzt7+ROch
	 EbUB3dmWsjQPiTKKXcJunEf1+VABfSqPnB4jA11PRQ9d5N5H00gEz9AMhbtPDQTABYZE5
	 f2Cqi6OYPkV20LWZRecQvh/LfUcuHs5jl09oUUelPQzwJwjNRWOWJNe8puxM4rj1m/aKw
	 MQeiWfG+b584oDlYc7GgcfCDWOTJM0zNlLxQDMXxnt+0a4LcylRQMIN6J9nd2oWHNRb9V
	 7Dn4/rEafZefZmamN29GPMoXjJP8tnF+Ctd8rZ1daaMnh6kFVZdZwNQEHpvfHMPeDeA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790937186;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=hKP126oc3smDYEd06TKCagqSU2dCuEfiGEnBiBcfyps=;
	b=p5fKw79JBWm5RZnVwP5UjFKPjYHBQfJ6GX5vost/3jC38KdTbQIpu7wV0+3WxFL/DQ8c
	 h4uQYO0JYxTqFeM1fh0qmQWpCc1WCga6f52cgn395kV96oTkxTM7HvJwTrfLNeeHIiTIx
	 G758r47UroD2SVKBtavzfnEw9+wSsWb/MiRl2wMuEymCb6elOkpJO5lz6a4kQGKp9v/kf
	 Db76B+ZIe3bG8JPmOKuEssg25TxlzbqWHEbUNn3JRWhP6obIAJwQlNQ3C29uZcdkkIzo8
	 cDXkrOYdXjW9aeGJYrufm2Y+zTLU6g87KEax5P6rbuMiMrco5Phs5Vj1fUU5bEh3ITg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790937186;
	bh=hKP126oc3smDYEd06TKCagqSU2dCuEfiGEnBiBcfyps=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=flCST9YNqwyKY+9beczmPghCE6SG1lwEaKmUQXSnt2L8b2nJkuD/qrSOWgspNfF2W
	 80UJnu1ph+UIc7fj2KmieUF4D0hTE3AGOc1hzQ5fB1hdiF/NYahU7jlZTRjZPxIK//
	 F4T7Yt6a17/321LrAZ214OyleOkS5XVSpRvvDx1XFCcPHmxS9OvB8HLbZvPIIsKtZs
	 3t8XP5KY58hrHcVii+m9cZEOQEDKOTzUpMGDZcNsmZrv2oNAUFJn6+ETYnLbEaRSk/
	 86pOTw/hlyEpDPHqBv4MHWVxeVKGBMITKyme5HPWG+RwMTP7TjnBale39rhk+GfTzR
	 pXeNWvg0pRFPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CE04607FF;
	Fri,  2 Oct 2026 10:33:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A70A3AC
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C73340B53
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:33:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jv4UfDsPG7bi for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 10:33:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org EA34C407E9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790937184;
 b=bE3BRVFTzb14SnEn4qVsTY3yZqF7L+22wFmv9XfZrO1+AwnsAstd+iCT9X7uebnRtp4Y
 Vf0V3JcPvpfCaQY8VE8z5HVOLK8F3SUrSoxGAxPVV5cbx3bvAanKPTuUPgahD6SOd6uvL
 DhpVHpSeBrp7wlI6wsb/79scX9L81mHnQKEG3bH4aiHPy1J1lZwCaGljDY+blNCeozTRl
 lMhNm6qrFVGRlYOpsWDJP46EHFNzwil2LvXqxzV0CMifeXbC+TwvQDTY3E6VpmbOWWHvE
 VtHNC8kMesaFxIrGMIxLhWDzPvP35RAHvqpjI4R5d2lbkUYq+WG5uTYkw2vKvQwsp3w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790937184;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=Px1ta1PPOluX78TugPj5afMcEhiIL2GQpYtDg1pwoys=;
 b=sel+PBtOxuapHkk4upFWsVMhrB4PT8e9g8Qb2dn7e7p07q0rr/gMk/1UoUQImngGV2Yd
 BLfhci0vTfVruNEeg/UkP5URZk1AJlquzq+M1NDnk0mFY5pXkbVXPnFYTSzfvpbd/f6qy
 569zsGs+HJsVGRTO2nOiIDPHqiWfCnLVH/DAi/mMSnA7RMKfVt3blRivHdjDxEVS47czY
 UEWNyegzRi/fXHJzxN1dLhfrXZFlZBbM2Ai0SozeFgqz6ZjOzGoEQj8LXGXSsqpPNS6O1
 ex2gOJgWw08lHewWETTfRAylz5poG4EI0BUEO04+tviAJ7LafURmgI2ILZlTiBofeOA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=WnVzp7Q+; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EA34C407E9
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:33:02 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49e66390995so44038535e9.2
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 03:33:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790937180; x=1791541980;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Px1ta1PPOluX78TugPj5afMcEhiIL2GQpYtDg1pwoys=;
 b=B2PjT3htjHXmTc1p6p6tHtQZi6kLMcHFY30ImA0SW3+RoA6doZoZprF6FtKUpbZe1T
 Hr0kdQzjj6JsA488j2G2PxKUArEAT93QTXMPqETXLEHwAvLCjAnqu3oTAZ4pK95Kw/H/
 fKoXawflVqUmRrq7H64khayl8o3BOQfKrnsuKhx+3O2s162q7bzVUiItKXWX2k+LP9qQ
 9GR+IerTS7pUepQ2Zm2chf9mmX8tN0JflaYtuSZdc7aFtuITOvV/mp4tCt4FrJgH1V9N
 tpCzcC6rcD777ERasPw/g0J8KOAaRVRD4TtJnM/OUTRpq/utLZaq8A9Rhg08x8Q1/WJ3
 kTeQ==
X-Gm-Message-State: AFuF++kcqCkhJGK4EflJYZ8XBF1R5afp0jk8t/ZlfVjnG2t+cllK31xS
 Hr0S0eKryOBXla8BLfcnr9j1W0mbZ53Ae3R6GJCTjvKOXN/k8ed0mccBFsFee1i96Op8o5TJxDD
 NAjpOR18=
X-Gm-Gg: AYBFou3ASt15XFE+zsP21zCPeywJ0wyDo2jEWqDvLZDz5YBpoKcf4DF4q6ek2YVH8TW
 l8nPXmx/UC5mqaYRwQOSIKRytEbp3YbbQCJ7OtPvfdL8qMe6z5+iz/G1xWK/2xpZTPDPu42PKRn
 I5UqNVY1tFKf8vTCB4FklwszD6VynF6BTchSHJ8F3EaFuSOHZyToqnICmgM1dK9n+w30zjHGSPa
 QKKvzvS7BjkcMXYAdXsHpaNFNvof1L0Wc1TXHErJe9U5i0YOysc5TaAxehMM0FJESQ12Q+lj0v/
 pTNsiEvsEjE1g1+Xo57XTSu2Ea8uPHLFpVasv5nNR7woVt65XGrMA1kpyj4xO5ZSZ5TSM1Vco1j
 uZW1+4JzgfR5gT82YTnrDZvmB6cq7g/ntJTl973wlX4warA5jXnoUk1/EX6vHya0Z6GTmrHnomW
 DPp1ovobt/Xebs27674822dRIo05KgjyLDawgV2I/bpizdQfahIK6Wyp0liT5JMvFTC9cA6zrS6
 E3efOEzfi4OgPnLltpN++M57/YAyys+vDG4tz3APg==
X-Received: by 2002:a05:600c:4703:b0:4a0:25fe:a4b with SMTP id
 5b1f17b1804b1-4a02759442bmr44447265e9.15.1790937180292; 
 Fri, 02 Oct 2026 03:33:00 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b82253e7esm4192328f8f.0.2026.10.02.03.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 03:32:59 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  2 Oct 2026 12:32:57 +0200
Message-ID: <20261002103259.77209-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260923174140.904490-1-bernd@kuhls.net>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/tor: security bump version to
 0.4.9.13
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.13/ReleaseNotes
> 
> TROVE-2026-012, TROVE-2026-030, TROVE-2026-038, TROVE-2026-041,
> TROVE-2026-050, TROVE-2026-051, TROVE-2026-052, TROVE-2026-053,
> TROVE-2026-056 & TROVE-2026-058.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/dd3ebe041cb1ea402288f3a858cd1359889373e1
> 
>  package/tor/tor.hash | 4 ++--
>  package/tor/tor.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/tor/tor.hash b/package/tor/tor.hash
> index f0ebf5d909..92e5fd4782 100644
> --- a/package/tor/tor.hash
> +++ b/package/tor/tor.hash
> @@ -1,4 +1,4 @@
> -# From https://dist.torproject.org/tor-0.4.9.12.tar.gz.sha256sum
> -sha256  c0d307c9dcdaee4848a8ca53e9d6c4ec92823e4f30be12790b0fbddfc6515f5b  tor-0.4.9.12.tar.gz
> +# From https://dist.torproject.org/tor-0.4.9.13.tar.gz.sha256sum
> +sha256  5e748d3272cdf44a7d7741173f371c8def3d96eecb77e93c89c50663ce9cc792  tor-0.4.9.13.tar.gz
>  # Locally computed
>  sha256  5dc29ea302cc75db6db4a7c88d7b5d4638b4e0f5f1d2e6d21ce71f707470b766  LICENSE
> diff --git a/package/tor/tor.mk b/package/tor/tor.mk
> index 3fb4f52973..8de7ba50f9 100644
> --- a/package/tor/tor.mk
> +++ b/package/tor/tor.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TOR_VERSION = 0.4.9.12
> +TOR_VERSION = 0.4.9.13
>  TOR_SITE = https://dist.torproject.org
>  TOR_LICENSE = BSD-3-Clause
>  TOR_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
