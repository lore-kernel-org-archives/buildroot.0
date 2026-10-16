Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BD8CCF2C2
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8744C40AB5;
	Fri, 16 Oct 2026 15:04:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uk--yqFsDw_L; Fri, 16 Oct 2026 15:04:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BA37740AC1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792163078;
	b=JazYC5OtzzC+QUTjaEpK+NXrK/CrqGHAyJhH8eBpKoz2UJG/YeTgHCh/7G5ES9BdX1Ug
	 phw7JxVkw3tl8RL5vCnWx0io3hWnhlX+8os1nWrZTaNJDMfdsdBywaic3TBo3OfbAL/WP
	 OFhbLsFVJJAE9f3dIaBF6Jc/e7B0fccM6rR5SE+DDUxkpKhf4YUrWwjMHN+8Om2eW92HM
	 H4VVS1aOpa9JFthaKFcyzDyp6JxOdj+JkbGFVbAyvC4lmZoc9K9mH9HSQg2y/mJRHE6r9
	 TGbvKDRAMxSaQr+DeMMm1wromUDzdV2mII8B9KuCywavYUxg+CIt1fTY/hT/vMoIpyw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792163078;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=1SiFj+iiXu52SW/oF1C2Zrj/jME7SM7TuLVWo5G28Sc=;
	b=mzzmV+zcvIvXCT2rp4iJzfMRhR8bFXQ5VAvTUC3Oi1pYFbWH3tMfctp5SoK1N5PU5M7C
	 qR4qwsmOtdaAjMv7qtWN4VfPRdFvnrbJwsrm35QrNNz7CDGaZ8hZ1ytiJQRsn7ekgGlT4
	 SjvmHg0uff2hNq3DBWo/cbB7/zL9qHV8qkbmhkWa1RP5p+CzOVzN2ckgKj/kD/kNpjdth
	 jNBGpOXjGQo9I83DZl3+2OF73VQGeed9rXIx1vgrqaUluxNHb73zm0ZKZrJ+9HyPUG2vR
	 PsFMX28dihlRRicX4fvmZkwjXeZeExUvyNelo9ti8vqxZ0tChz7Min30Ok51NJAIBcg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792163078;
	bh=1SiFj+iiXu52SW/oF1C2Zrj/jME7SM7TuLVWo5G28Sc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UN0kXKdRJ9tPhfL/2wMtxqyDvKXlXLpxtxiU7AGC2VkzBpbw1z2yobLtF31C5LAo1
	 o1/bvNL8K+yeIzB5SZRNz3vV5Iy7tRklkPxvAg9iBGP1loCv3IUk3ugCJm6iTqpbuA
	 uOwI/c6ywOBMRRyIPqP9Nb9Gjs1wQkv/i+sMozL2AFHTAv5xP7SfkkJ63K8cuhlaL7
	 w6fluoAkSbygkNVWypZLy9fFy4jOcCXCUEnQQnmCveP7uVZyrfq9zhjmqlQ5QqbVeB
	 qf9GTV/wBz+Ua0CGeG2fC+esqqCK8LyNSRP6ABS49Ri5t09Ub72jmbSOWxZ9XtaKHX
	 aegd1+GAld6Qw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA37740AC1;
	Fri, 16 Oct 2026 15:04:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 65FB87AD
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57A72606CB
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:04:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cJvqonDuuaMo for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:04:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6FE2B60671
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792163075;
 b=PK809cFQ1nksYw+WhaI7pIkqmyVWvN8F/yIB5zyveCGzYr+xO9beWemCHOhbpgXB1vio
 grkO4sIk5ntNwyRMORmmA+4WTu6N+dCJhFfuB+91l+IY2YO6tE06v6jblS9Qq7y5c3K5Q
 IQ0GrW+tMJwvRRFPPJWronuZUDjTag6krUKV53OHj8N2DbGhEY7RLVfmgKFJdUsJzWJni
 ND4TKNw5BmaQZZY5In4vOpqbu4SogAjrKDYOA/jDgvgc6jv+3JC4VQrOCJ+fCwTsrzXtb
 tS+Ts1aVMLxTAUFiBv9Hfbr1tb8JUMZT06VWrfhGHQ0XTrGII7hsyV4clgLp+q2R2/w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792163075;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=vG8ucaRH852d4eYKi+zT5pV256N4Xt/qdmad/8YEdbc=;
 b=TxOXI50snXxhndcXotUhOnjKAukDJYEhbwMAuoE0UXv17s2SYEK1azqSj54v+u2IBTTV
 ZnoLjBenms8AH7RevR3uDvfb8prk1cNRvMnB1aO36rdrBraANRSitvwHsdYULIHmehEVT
 Q67vW2rn8ItO4QG+wRaz1nXlsKPXaXjgb3FmNA9ZyfKdQV4FuRw4KOmMQkdKk06XFCzFs
 Q8trOcYk1yi2cLVUX95XgXaBt1kzz4MqY31/G9c2ZH371seDsVrI3Q674u7SyBTfl30bA
 cBJokXjH7N1ho38rgNQHnZh2NTeUzNMXZGMVyRgqJxHevv4QUlKs+LbDxfnyi0leQ4Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=b+LRtfN4; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::62f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6FE2B60671
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:04:35 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-c37b612635bso464320666b.3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:04:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792163073; x=1792767873;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=vG8ucaRH852d4eYKi+zT5pV256N4Xt/qdmad/8YEdbc=;
 b=OEGojjLGkHXVygiNNLBCHAQ1jecPG9/0HFCBnFO9pQLmr00Z4oVaN5nuzfi7hZNwjI
 3ZGqco0semkzNsfbIaLqaW25i6esLQBmrRlFwe9fTw2kfKJrVLliqssPKmcoTv1/VvUz
 JvcTk0K+JXnXXO6EZt3EosSplcbqLVbXlsImyC6px60Anb48JS406cbNfgo2n3VNgkUv
 NunUkpR0gl6i0dDmoBtn1d4ubiTN8OPFW1b1RoWq3sI72dKQjQ+x6ddcee9DzL77CG2p
 6Lplwh1Vpge/pxPQBas678hGr/+mvfTnHawxaPdaYVKOk/1Fxd0Talg78m6oko+5OUcO
 5kjg==
X-Gm-Message-State: AFq9FYKOSz3EtCYD7k2/3ge5FlhcSAsfcd0QSV0mrZM57pyi+4p1GeqJ
 KKWx3cJPPFMdDdUrApdRNHYaWCD1a9yjnbb2KPiOWgMVBkEvj9buoTxw2JW21HLto6GC3JEgX0h
 I/H4hwt8=
X-Gm-Gg: AYBFou00tYWG2nX+gLFYAcPxRzuwvY5va9ZRrt7ZjCRGmQ+C/Avy2E4nYk2rdn3sRn3
 nPIa2oU8mR+y+LhhfpkVN/4nFYbVfWkHYXld+X+aFH+y3NlSlpJJVwBgrO/n1vRNcSoURmMYPmP
 g0+EyzAjSB6ouE8T/caDZbYj1XbxlroMEWXOo91yE6UgzgyR6rdti/vj7OkwAdM/dp8rXAUwK57
 d1j9izbUnHnrsSOjV38WNOxt4z75pK/ZN7eojQfxXhBekBQpwy/wflM/5kNNsIQ7FWtSd7qtAzk
 svOORlMtOHbg/oyZWOD3sW/ad021VzSHNr3XuwHAt5ygSb2+9urgpdmYQxHeI71cokkITPBy8xy
 Kqq2hbyGwnmrgdjZDNde/hXcCRUZSTW0z+jMpxskPrPUop/glUVYIclNbwHIWPht9xXioZurrHW
 pt6sXz0aEkq+tc04hPm1M4/QiMP1M/k0Kl7OhYLri0eAb6LToMIiAUdL2pM63GQZGQtfsfQ7zWV
 oMcopICUrvv8ITyN/LPiswIs9pwkAFhjyRHeXKwLQ==
X-Received: by 2002:a17:907:86ac:b0:c3e:f05:3dfa with SMTP id
 a640c23a62f3a-c41a02fb855mr5611266b.34.1792163072905; 
 Fri, 16 Oct 2026 08:04:32 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd4feb6bsm6030789f8f.41.2026.10.16.08.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:04:31 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:04:29 +0200
Message-ID: <20261016150431.68711-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261003162913.1025194-1-thomas.petazzoni@bootlin.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/libarchive: drop dependency on
 host-pkgconf
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
> Commit 95db5707dff571c7f3485b3aa63bf5977c7bf08d bumped libarchive to
> version 3.8.1, and as part of this, dropped AUTORECONF = YES. This
> allowed to drop the host-pkgconf dependency, which was only needed due
> to AUTORECONF = YES. However, the host-pkgconf dependency removal was
> only done for the target variant of libarchive, and not for the host
> variant.
> 
> This commit aligns the host variant with the target variant from that
> perspective.
> 
> This is not tagged as a fix, as nothing was broken.
> 
> Cc: Titouan Christophe <titouan.christophe@mind.be>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/libarchive/libarchive.mk | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
> index 5b6aea3407..88dbf2a48e 100644
> --- a/package/libarchive/libarchive.mk
> +++ b/package/libarchive/libarchive.mk
> @@ -146,8 +146,6 @@ endif
>  
>  # The only user of host-libarchive needs zlib support
>  HOST_LIBARCHIVE_DEPENDENCIES = host-zlib
> -# needed for autoreconf
> -HOST_LIBARCHIVE_DEPENDENCIES += host-pkgconf
>  HOST_LIBARCHIVE_CONF_OPTS = \
>  	--disable-bsdtar \
>  	--disable-bsdcpio \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
