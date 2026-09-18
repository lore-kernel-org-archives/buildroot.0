Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11BBCC982DC
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD3C640D51;
	Fri, 18 Sep 2026 13:08:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mJbu0hURvQCH; Fri, 18 Sep 2026 13:08:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0A8CD40D37
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736925;
	b=e5u4FCDV4ta07HNJQU0EmzuJ9t+C2P5rIYbQrJTF2gPeh/sCRLf+r3zt3bPzH8fHuEez
	 THYhxXrytbXanZlc7soxZW/m9Ws/tpY9db+h7rCDGYo/ggpiGEKDFLoxuEgeLqw6s5Mkr
	 XKRFNf4nxfATRKAsiWcuS4y3m94/hM7gh1oBwmOyr93LJ79JuEZr72U2hSMH3DguMRj9g
	 +c/xDAf+6lqVm2BxFMvcmXcDTEovHY3kV3xi2qKz8Q+LrwywO8UqT+EvC5LsVg4Mb7b7m
	 vP5z1cmySN8rwrxeHEItpAPDu1dnMf5hDb6gDOhFQGinlvvR+1Yg3VhiBhRJPA3qBUw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736925;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=adl/DbQ7FCuvjE355OLaNmaehvFc/S4k83joR6ZbxBg=;
	b=s0LTrAaUquW42M/6eJ/Heu/svKm5VULCyIfaZHib3sU4VdPgrvr7zLEbN1sdEbGC5E3h
	 1lNT0Mhd9MCqC8zEiH4bBJhStx1/YhOGOZPxVx9MofyltBXuvUV4Tzl4KGafmca4+JQwS
	 2FDqHQB/8dPTu4ScGUHvNZGNzAsQWLUzTqgDO6Tg0Yj5yIKBvIm/zZ0LU2cHmIsUHiM2O
	 p72MQDeiVa6N8fjUk5WtZNNxJY2HtfFQ9eyFgtovRpyGuNxwIZqD23PYLADfct/l6BBDM
	 Sub4FpMOopJIo506h/n6fEqJYjfMF2AxIVxNaStBf6SppxnQjpo6xIlvt6LBXsVV1lw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736925;
	bh=adl/DbQ7FCuvjE355OLaNmaehvFc/S4k83joR6ZbxBg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=aaN3mVuVr5nPiJGmnudSGVF7OQF8K2A9/M6d15KP2oiVEV7gku8IeNfSWZQ5aW3/C
	 OmXkiagpq1Jow3vtskajLbENl50gAA8CyZsy9FRxNGLVKfp+TLozBlqzLNEmaCz2Ca
	 7OTC3gHbwt3QZvW/yS7T8tu4JzvRtlL49B6XpMiHs4htTLIY56vErvunXQZAr5HKeK
	 riESyhD2LyFlmeX17ut/f7W6e2PVZicHZqY3hczu3PUrU68UI6Cub0OzlpCR6BPofT
	 UxiLVV0gxM5oVgsYWnyTdgIqOLEqtItuobNQn6aeDcBdK9MtNSzXiXARUwTfOcj4jd
	 Q+ekMR0lJ2A/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A8CD40D37;
	Fri, 18 Sep 2026 13:08:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 34479224
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E5D660F33
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:08:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H67AKz1F8LqE for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:08:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0D68260F2C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736913;
 b=Ln1a5djS2WtwFKOCnHr9g3W1ri2tWYxpfdElxXMQuRloEjvEHzb/p5elJsQM9GzzhSuW
 S1lBn6SV+x6HKm34T3lnieYo19ROYXRV89cGk5iqyjkzJi3mUYaIJE/l1Jn3X4ZTdrAdZ
 +lL6u/6/wOzqZMGCEmBCSNaTggwsxsX08L8H1t+3Cnlnjla4ezJumDzWnAVEnIBTyk70p
 yDWG7/lhuzFfa4OCH5YA7DT+R0dBOZdpFzbcqZjGy7qXkCfrctB2b8jVH6WXlHORjL3HG
 0GpAytGeelI15LPwD7YlQy1TwasGqv3k2LaqjkYKtqtO58NlQIz5m4ZoNgsIHp4TYgw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736913;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=D9yN3hqKvgAoqEa7PdiZyrx59/eWlF2g4/4s69V78vc=;
 b=IA2IXuHifVhWgUA7XJqXrQFniOp8Q1XA32YrDhLKtyBgeSJLaImWiVEeUUIu1LxIOPe4
 vwC1//2Oi2vESAflbCJrb6q4QEkvsOWi5sJ152Xkfa4gd1o3pRmTqxhrsH4kNIVd9oNBe
 +r4yYZmFBddXrPAzZlpPUhafhuAqP4NHF1ktvcrqhTxRaoJcMM+ku/JjGu/EfroBYekPx
 R0cYLVBozVkix66KSjlVGGg0vTxDeMtZnMLPhmMjqXEOJr/wX+6m57ZB24+zrM8jAW7Ix
 XaAGIod/RQXY5fUJQBf2KTv8pkBRXbFv9zuNKzqH6K1XWSnqFOVEdZiBOVEre8nveWw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Q95I+tuz; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D68260F2C
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:08:32 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49cd4ba9f68so9959155e9.1
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 06:08:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789736911; x=1790341711;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=D9yN3hqKvgAoqEa7PdiZyrx59/eWlF2g4/4s69V78vc=;
 b=2prBrDYgpy09r6YeyDPDVncRFJz7/C1JC5sYv8hXqC6CmpV8Lm6SV+CNItWyizuZzC
 MNXzz7SylC9AX05zNRt5sNK6P/U16zIQy+NgXs481XXInJ89UOsnlZxHV5xR7vn6OVCz
 VaH2jnz83zLo+CImBf7HIyYNac/nqAmMH1ckw/GOSyTyYvTQM4XG/HP6vCyxD116Td6v
 JiAtaCaTMyalmTu5mQ8V/fBToG49sphrGds12dmPGGSaJLrQLfWNq2f21yi6t78qjbxK
 EFZSadYAc9waFXOXceqimbWorjkqrUJ+Ql7joOci5kBsOpQupgdBYFotiKr/BEWkTvDp
 LTOQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxFhhkii5Kj7PnAIwQziULhBgiM57Wa/k4Q1aHRaSRghYCRA59E4srVf9fhH/qv1QNrcVDh0d4eAPU=@buildroot.org
X-Gm-Message-State: AFuF++mVJPGafWR2qPc5woTrfasapoe69Hgo1ZMB0u04r77FEYi6LyvV
 qNuRhHrLLGbEJVEHux1iELneZEYPRwPZ0MSzrMH71z8OMDMbXVmBJrX93YiX7BEmYps=
X-Gm-Gg: AYBFou0lZnZVAkID71XoYrMmrShVhhHKdgla9t/KgYyZQ/SfpYabGGsu7dSNbImGR79
 O6LZdFxH1H4DEC32QKg4vZQu/MKhG7m0KEB9zOwSsJn7g1uiGgJDf7l6WjW8mpsMUDJGxSm5gnc
 S8NnQNN47HcUK30j+lZR/29GLn8ZAin6KgmrDRkiD50HQJmNrWDYFJ5Lai8gvmYIGyZt103HWue
 klGz5NuvS6MbQp5De/CUpjWyGsnBbsr/tavfrV+0m6PdZtTC039TGxPhe45iXbHC0xGSzT8ildF
 UQPnncGIR/i9sR85EkFw0v1XC3Qi4j/Gsy9ltBd5kz/2ORhmMktePkpB4/8MQYVL0uZBkxeST+x
 vfWLmX/KVj4GVXYs7eFzq9DC7AJt36xtuJAOWcP33i4pD95rZYtVXJI2t/eoL2G3eEBnvsdCWpX
 VsEBEa6y4wWUWkKxGcOeNPjSqwDEVdP0EmHOjKiRfMW3in60JWSfMc+GFeTTVQa5zo
X-Received: by 2002:a05:600c:198b:b0:49c:fc6e:8cbd with SMTP id
 5b1f17b1804b1-49fc574f05dmr33822105e9.33.1789736910740; 
 Fri, 18 Sep 2026 06:08:30 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4871ff3a8easm4113061f8f.9.2026.09.18.06.08.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 06:08:30 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 18 Sep 2026 15:08:29 +0200
Message-ID: <20260918130829.162248-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912210910.1553765-2-thomas.petazzoni@bootlin.com>
References: <20260912210910.1553765-2-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/python-grpcio-reflection: add
 missing BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS dependency
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> BR2_PACKAGE_PYTHON_GRPCIO_REFLECTION selects
> BR2_PACKAGE_PYTHON_PROTOBUF, but forgot to replicate "depends on
> BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS".
> 
> Fixes: 3217fedcb8c8006809c1a3d214c97597677a07fd ("package/python-grpcio-reflection: new package")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x & 2026.08.x. Thanks

> ---
>  package/python-grpcio-reflection/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/python-grpcio-reflection/Config.in b/package/python-grpcio-reflection/Config.in
> index a0ca35c286..1e35c82a9d 100644
> --- a/package/python-grpcio-reflection/Config.in
> +++ b/package/python-grpcio-reflection/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_PYTHON_GRPCIO_REFLECTION
>  	bool "python-grpcio-reflection"
>  	depends on BR2_PACKAGE_PYTHON_GRPCIO_ARCH_SUPPORTS # python-grpcio
> +	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # python-protobuf
>  	depends on BR2_INSTALL_LIBSTDCPP # python-grpcio
>  	select BR2_PACKAGE_PYTHON_GRPCIO # runtime
>  	select BR2_PACKAGE_PYTHON_PROTOBUF # runtime
> -- 
> 2.55.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
