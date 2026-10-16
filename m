Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A1F2CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56FBE8175F;
	Fri, 16 Oct 2026 15:06:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aZGubY7t7bxY; Fri, 16 Oct 2026 15:06:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4DDEF81757
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792163160;
	b=VYEcsmS9gJNRNxwjOPg7dIvu+KahathOOUedVMTJXR5i0n5x9zZEfbA8AKC0jLiV2SQP
	 FnNKdxxzOffuA6OU50euJ2yV5fIdqcW0t5dDvAPMCv0baYfJVhWzag8y10DmVbgrXpDwl
	 y1G6qZw3oOAD0uJ/1QN1GJtYUgVRq+8Wd+Aszrf0N0EtZo4N8Pr85EcKSmLtDOU7n+dGh
	 yGbtiajClJIrPeqzxvKbywRgRSjBXysyajsKVBQAMO3AVU7eXuZMLBxn1xyccEHgd+eKG
	 M+Hv0akO2Jx51sN2c/gQN6NSbhUoKBhZaRt3V5HeAouE6h2Ey5EEcA1jty1mkNesSmg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792163160;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=695VFbyQYleM0+UPbloeHzhqZ9PSH15FQI7vs02GuVM=;
	b=g1JMVL1nK0/UQPFR9p3qhPBbKu1YX94K7PsWSDdAbCqMl4352EDhgyX4zsAD6a7LczvW
	 EbvtWsZew9Pp8piVA/8KFNTo201m4Nwc4Wss/F9k7sxebyOfWxu2CMLZyhtypG2QnUl32
	 HYlIZTKs9F+BkEui93LQAGPpGX3mugMN9C1k0v2boVRA36VtKFhYKkjkjHFba57W/5s3a
	 tuzgux+NqtxrZtjemiZXoO07NL5RsE58jFaszcQdo21cfVhpQujleIMZR8TeGbDjUqh4r
	 j5L8VeE89NDf+wzd8B3u5fzZCEjOxjKws42+aqyFtE8gsEEUURoR9h2/m0nR+si2nLw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792163160;
	bh=695VFbyQYleM0+UPbloeHzhqZ9PSH15FQI7vs02GuVM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pNnzeikUTOx03RFh6trRCepOJoelIQDrCTtI1+mVh16OzrzwqzhSvZRFl/E+43JNv
	 xSCrFyx59rD/psinkeKIsCd0gv28mNXpTq5lYRFYTrnhll2CXSGDBlyRUtBZMg9aDY
	 L485Vc1z8YcvIyIM7/6UJiACvb+qkpImDXPgP4fIPXypjGA9r7EO+Szf8XfBnME5nX
	 u0zjGeQ4/cw8gLJQ9YN3dcOfHuCItE//R6QyiZEVShFt2d/hrZzjg6nvgDC+zs8tPg
	 W5EHCT+Vk29MIPgPKP/YcFlaiJfZ/PLp9DRalBuswWADSOqhPVl/mW/h4x+po+n1pW
	 YiWX98zwE5Xhw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DDEF81757;
	Fri, 16 Oct 2026 15:06:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C2957AD
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E3384016D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:05:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i_4LhA9b_Y1Y for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:05:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 5F30F40042
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792163156;
 b=Wun/AcVUZOOyZquJHI+AfYI4kjD29pZ0Rl81WMaWd2Os4TSA6hXmnpmvKSeRdMCGjFEp
 4kNs9jKJTn7Sa+m1useiRXU9NVEovYH+cw/Q7O9AWiNSo3NpgJH+Pc/gJqkXjTcgxcn+B
 ya1IQFTL3/JLgaaXlCiRVkggId0XgNzFm37SEsMjJeOZrKvwtB/Ki7mJLh7/zQDSyQA/f
 lgbFL/N3XlJItZrDg3kAYFJXPdwcT5l63M2Uz+A0dT7gtqvpduUVl1L4uYnX2sNTg6Rt0
 q/l9M/o595S/Hd6K9BOsaG7Z6hvhbUhMwvWYuC/ozs3+aOxBBsMo23wqUzqDPHRyH5Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792163156;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=IyoADLukrzSfjdXpBaPXQirK6FcN50f32mppBMAdxOw=;
 b=slM23y40OIo2Xkd767+Y1p1f7zEynopJeWInY/hNZgA5adv0Bqvd3ervvPhCRkCNl5U5
 mHchlehBtp65nxgQwOozz78dnyCswoozxx2dH5cSJa9Y+dEV75lAU3KIx+aZea5RSlP7x
 mFF43VGbB3Kz3NZAHOoxWbRl8XOtPNgwMqpfz2IF/MBqBbSufu8G0hMhWdK2xqSID8SKW
 MCMOHNcjIf5tTOgZBC99YmO/BLM4m/olMQ3U8DQwNtbT6caQGmLWIPiVNG+gYk3dqmAbU
 BPvSr4836lP6C/9az6UdU+23nTC89ppDS+8vjb5lpJLE4wNNAmb5lKQzWI+VVZqv8lQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=FcPEEYe0; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::529"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5F30F40042
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:05:56 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-6acbdbc1725so4675038a12.3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:05:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792163154; x=1792767954;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=IyoADLukrzSfjdXpBaPXQirK6FcN50f32mppBMAdxOw=;
 b=bC/SXyvIvfSGgWimKRg70bjIB2/5WzZAXUaL2cJqBd4v3joPwG/uvALmvAwwwYVteH
 /EgC2TMNALcuVVNunVMTMhMMVSp9MpfdUKpUsxxJiqm60uoENmXJGHORwsnfJ/rEQgnx
 yreGT2Wss8SOUXj96kbn0cBJmzRuHUDW4I4n2vTd9bhDIoNpFEHHkTw0rNG9WKMEge6K
 Y6xoSBs/IM9/RL823GDuphpbu3EbneDuFfUlCi/qXUKPnCs6UAV/xK9usrKPUs1+i21z
 jJaQNoIybx7d+XkeliJPQnSG00zCQj6xS4fIkX4HosU3RxRizqBH6Us3OZHdgKIfYiGl
 Y4XQ==
X-Gm-Message-State: AFq9FYJABlUvm2KQLNKz+TvqA0x3GQMVjlz9tiduqdjCLknTO0PW0CEd
 LqYVYWeB12lUCR3b43wW9L0qmFOyG732IOFMDvwIoncb1E+93WPf8hth3i449tuL6Kra+qU1tbT
 SCTQVhts=
X-Gm-Gg: AYBFou141rIBpgzU0M4lutAiNaJk8eI6rHZbBIq9Rh3vh7V3RwjWGhwtxo69IPl+YLq
 f4VmJA2rPIh74f4XmetVH6cZfs1zOciEGnhhcDmHUwHuTayPlGZw3pdaHjNqCMJgxBGCPjr65Jo
 BwhFo+J1HrrIzDMW4AeEtGLMSqvd7aY+RS7Hmm2wqAqOMf6yuLjmQbMcYg3HzsdgQKwGwiaFt/B
 VXeGqpwzah/t0SyLnFDIZCVIyOZ1gW9wgkCuuo1LpC+TvXmHcCnfzSAnyms5GCVnFVWfocd0a2A
 df7crCCn4aAeDf3Tsspv1CO2cxSpFmH3oS7F5e5Y9yRORFczyETYFeoY/ABTqNb+8bLVLlDSYHZ
 9GyXZi1KmwBLTG1uLyw58bIRFqkDSlBqmzL/8CsaaDyXsQXYyS6cP2/y/MDNV554Es2XnK7Se7z
 9fNLmAcRdXiamOFZmfXWvy1MfsCY3q2jAoJy2uys1V+Z6/0yQkl/gIQdbADxr7xhLX/RMgo+5i7
 7MsJ1IZrQF3On39SNcXeqaa7xRy4pTBQ4542KTkBg==
X-Received: by 2002:a17:907:3fa0:b0:c3f:2b28:713d with SMTP id
 a640c23a62f3a-c419dc367ddmr8283666b.19.1792163154238; 
 Fri, 16 Oct 2026 08:05:54 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd510201sm5488945f8f.55.2026.10.16.08.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:05:53 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:05:51 +0200
Message-ID: <20261016150552.75333-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261008182912.3700979-1-bernd@kuhls.net>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/tor: security bump version to
 0.4.9.14
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
> https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.14/ReleaseNotes?ref_type=tags
> 
> Fixes TROVE-2026-062, TROVE-2026-064 & TROVE-2026-067.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/7d8511992eec71c8218a4a1fde6cc8c0b69a2cff
> 
>  package/tor/tor.hash | 4 ++--
>  package/tor/tor.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/tor/tor.hash b/package/tor/tor.hash
> index 92e5fd4782..37dd1e6000 100644
> --- a/package/tor/tor.hash
> +++ b/package/tor/tor.hash
> @@ -1,4 +1,4 @@
> -# From https://dist.torproject.org/tor-0.4.9.13.tar.gz.sha256sum
> -sha256  5e748d3272cdf44a7d7741173f371c8def3d96eecb77e93c89c50663ce9cc792  tor-0.4.9.13.tar.gz
> +# From https://dist.torproject.org/tor-0.4.9.14.tar.gz.sha256sum
> +sha256  182449ac1c8ff43278da27b69b02040e11d03d0327db6d9126e4190ec6235e4a  tor-0.4.9.14.tar.gz
>  # Locally computed
>  sha256  5dc29ea302cc75db6db4a7c88d7b5d4638b4e0f5f1d2e6d21ce71f707470b766  LICENSE
> diff --git a/package/tor/tor.mk b/package/tor/tor.mk
> index 8de7ba50f9..49b9524c26 100644
> --- a/package/tor/tor.mk
> +++ b/package/tor/tor.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TOR_VERSION = 0.4.9.13
> +TOR_VERSION = 0.4.9.14
>  TOR_SITE = https://dist.torproject.org
>  TOR_LICENSE = BSD-3-Clause
>  TOR_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
