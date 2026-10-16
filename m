Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF5FCCA46C
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:01:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E9DB40A34;
	Fri, 16 Oct 2026 15:01:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EYYzxPRe17xi; Fri, 16 Oct 2026 15:01:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7508C40A44
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792162908;
	b=J1Ub6Llik0jO6pHnNgqCLzh2kG3QcsmIsQ/2jw9ASpvR/jLGY2Ljb0g33eVQQy/9jZb7
	 grYsGCQpUjNJ1RRgbZoOJ47AD0wwRVFxVj7YlMtJMLGE2Q//+xYW76mA9StcROLBcpAiH
	 92oqJODWXxuuaz6ig1EHME0vxyQhAGaWcVyaL0GnJ7X7jS3fWmr1VqN7f9DwMKD11ihn7
	 IcNuZ2JuKPdr5W8FjNn/OZXqEw44EMSrhMfEJIhtBelEFUlMfzhvig0EtR3RTdbmhyOXD
	 Wsw58yfelb7xtk9i49loNW4e9PhMI0ViXv+7LjIxq19EMArE/nFUV7KK2ewBOG+nNeQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792162908;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Z9ecgcaguxB+nAp4mSL5i/ppRJI8AnlC8gx4q8c1b2M=;
	b=YQ8cKLYcRYIGHENg8mlE8bgl4BsFpwcavE7JB6MffiB+Q2kSD+Z+HL+yHeZNp/SfqzgR
	 BOrb8WQBcOp2ejr3eY0NwMGA29c/os0GYr7uyq17oYg3koyMHZQxrIHK7y/IE0dBoJmlE
	 VUja6zC9nksI27RPOIR05tjc3fPIjTM/KqwF8QSBorwL2YNnvdsCYnTu/GnrbqJQ1qfOY
	 A1UsiEDS18/6cbvnCxWp60OX07/VmrApR1UP+qEb5Fry/nQoapLBsSsB+kr3Sbdhxg2/C
	 4biH01hRcyxBZZM8Zrxiw7hKB6oVHzOBJQHSEGUWLhIE42naV7kbDylOIIwjKsJj07A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792162908;
	bh=Z9ecgcaguxB+nAp4mSL5i/ppRJI8AnlC8gx4q8c1b2M=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SUoISGJ5mLi0QLjXw5BU63m79mrHEwMXJIUpw2zX7jRsViD2AODW7Xh6i6F2sXVo+
	 mCmtiKorS166533wyOsbGatXZPQVmDiUkCln7vhkFmVDK+zmiJgWMT4Dal5a7J5ivM
	 c31KdW+c+e3Z3fb1T9hfBTzTIVIgWV0U6oYF6vYAARDRE1zGwDZRFw/URBG3TjXE1f
	 phIduQJFlOy3n+UcJcMNN2S6p8iruef4MIlANlbYJVXakGZ+/EVJ07lxLujmNw4xZo
	 he5pAGw7IKvVOLjvaEc2UApvETpZgor6J1W7N04fA4VC6MJ2vL2Pyx4fV5ZjboiTEL
	 /izwaSeN9p+MQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7508C40A44;
	Fri, 16 Oct 2026 15:01:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E703C255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:01:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CDD4660B27
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:01:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JNLqW8Hq45dX for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:01:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0362E60B21
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792162906;
 b=o0tUFk7WN5RfmB69g86xjdjBpO3maBg2Mac22SI6NM3MM23fzB6thcmVkxGggbADw1xX
 ujngyn91D1hQDiKmJ87C3xUnR//d2hZpFdvL2PqS6Sjgzk8J/Y35XVm8o0BJwHs6IybCy
 ZrUfi1vegH0puk+C443RfbggnPRUXrQP+XOjuSyRNA7ZowHxYur26QwfuRgXYykbJjEFp
 K2FfIZZf3ueZJKvjDKLjSop7+4id8b32C9rV0vluTnQTMQT2AKYqtR2SgGBAxJnOsYMbU
 XH/CVOokGXOr6bb0umDafZdXEshDNyR0p0vRLPPB3n30oxaAuxmo24B93la4pKsggtg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792162906;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=zfVknPsSn+Thh29zWsia+qDr+Sx+R8lXbBWjImJ+9iQ=;
 b=PxORyy+L9Q88RRYpN0Y7XeMvA7zBC0w45QzFqNU0WBIKuYGg0MszKThw9eRyrJtoNa8H
 OL9tp3M/S33Lo6taT+pIZrtjbPoGZY9iz/aMIMYyFWPDqmLuqzaE7JyTY1OgUf6pe87l1
 6HMepYcDDolh51WedL8+ZcobiLEKIek1UO7yTOkF8SNt51a446gqQ8384zD62I+l4d/Ry
 1Og+tYKD46BWdrRw8TZfX6h4Wd/mQfR4G08AARNtADX/jXJKxepr7Lg+bWT5FaTt4sEWE
 jl+mrOn2bAu/EeemhMf4gBOYP+3IQwmhypKpYOvSp2yUyAiZVuZTJrsDDvN8iE1AJvg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Xa7xzV7O; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::430"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0362E60B21
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:01:45 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-48df8fe8513so1515557f8f.0
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:01:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792162903; x=1792767703;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=zfVknPsSn+Thh29zWsia+qDr+Sx+R8lXbBWjImJ+9iQ=;
 b=N+Cmz2qMH0UNvCDGC3agOd4zs1+15xvBSZmv8awNeZKIu4plFBMv1g8ueqmIUDnhUb
 zUS+c7X5NPfL0mxwW8Fzm44Gxj2vbZON07FeUj7CyYHPAcEXxaX6YtKtY+GtSjnDB3hH
 v9i3zOSMxCoXxo+LYqoJLJuYb+VPKd4ShMLLD2i4HHIRDXhkbj7Rkiqug3iK1pI/oXHM
 q1JVl32iBo8TaJk/cGFQQwzHbUVEfx1aKoB/deGAoCHCznMupIHFLwzWehhGG/0WNdwA
 wCReLOp0bJognghioBHzIhNuOUoku9ZRyeRKHO7noyddOAF7k9PxLhJmu1bolpOmqofl
 cxIA==
X-Gm-Message-State: AFq9FYKHvz6i9hC7tdxxnf6r7y4Pbx4FjmpZx9vZFZodXnr5hmHfHqyx
 KgyJ1fGpteaBz+23Y3PsZ8iOhL8VleAEouOt1b5vkZBYLcC4cFe/gJuFTI8xUryzDpLKJP477aU
 JAIKUbx8=
X-Gm-Gg: AYBFou3+LvLl6rcp9IVmikUVze7L1ScoRMLlbvFn5ySXiJchylJSScmkDX9o4VQ4Kiz
 W0MPwWUI7ZuejZ6Jfmz62dy4uxEi7p9sWkCzcHqnaTbo8onFqvAcx1ogN5FCsHPv8BodeYU2L8k
 YfrakAr1o1eiaz/+TS7/1wRxrTjj/kXY29zrmNdU95NRxG2q/iaEabHz9XRPJYBEaynepkWUGUX
 RUgXguUqGOQcvS9nHQ7jNv7ItVuBcrTwNJI6pMoXO8bt3rHQec12qrtgfHy3iiqgqqeRl9Ihpco
 7tcLI6FAvI0H4HB7f0cu7+O5dYzdLPoyw0/XgipY5leEVyAksXx+6RpPRK66kZtW9/ovPMwBo1t
 0m6nWFT6ZqaxqPQVOEDyQfaBaZkX+ai9ro0+81XSue12WcmQTddLbGtJZulqD8yDrlvkCkPM36I
 6U7fXBa9RrtlFCmjt5QQ//wYXoDN3AIzwCfv2LkkmS8yjyE0OEzCfBAO0LdbBDRbHmqX13hL3Yw
 UzP1iim0CKNa7cqVlzvSG/X3yg6YZd/nF/E+UMD8t3eahTzb2f0
X-Received: by 2002:a05:6000:4919:b0:48e:43a:1d84 with SMTP id
 ffacd0b85a97d-48e043a1e56mr1152440f8f.23.1792162903444; 
 Fri, 16 Oct 2026 08:01:43 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd4ee183sm5494799f8f.29.2026.10.16.08.01.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:01:42 -0700 (PDT)
To: buildroot@buildroot.org,
 =?iso-8859-1?q?S=E9bastien_Guillaume?= <sebastien.guillaume@vendeeconcept.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:01:40 +0200
Message-ID: <20261016150142.60172-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260612121516.1634-10-sebastien.guillaume@vendeeconcept.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 09/11] package/qt6/qt6svg: add CPE
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
> Signed-off-by: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/qt6/qt6svg/qt6svg.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/qt6/qt6svg/qt6svg.mk b/package/qt6/qt6svg/qt6svg.mk
> index 08570c7f9c..db0b11735a 100644
> --- a/package/qt6/qt6svg/qt6svg.mk
> +++ b/package/qt6/qt6svg/qt6svg.mk
> @@ -12,6 +12,9 @@ QT6SVG_SUPPORTS_IN_SOURCE_BUILD = NO
>  
>  QT6SVG_CMAKE_BACKEND = ninja
>  
> +QT6SVG_CPE_ID_VENDOR = qt
> +QT6SVG_CPE_ID_PRODUCT = qtsvg
> +
>  QT6SVG_LICENSE = \
>  	GPL-2.0+ or LGPL-3.0, \
>  	GPL-3.0 with exception (tools), \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
