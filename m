Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF32C9830D
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E63E281359;
	Fri, 25 Sep 2026 14:45:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dK1JPITHYY9e; Fri, 25 Sep 2026 14:45:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2A7EC811AE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347529;
	b=fVDZhXgL96UR3tNZqDI+2SvhVN78EPfGC086WmJd54MRguWvJLzZEDwz7OoNUWeLElxG
	 bfCUSPF7F4p7bzKrIHb8bSWMccWYLaTozpUsCPqgAX/t9XR2efo5xJQojdy9cXiJo0V3M
	 cbCQRBunxH01TnlacTqwC/MdTKhXaRa3tGt43AZkqeeshJeE2W9gOBEtIeK+ba1Ml04h+
	 rXBe0L3EgzS3sp7NtuTxwghGkFExCpxj3gZDdBsD1NNq/K9r+gYz+kdXeUMM8hDrCNBOF
	 wVT/um/3lL1uZkvvw0XXgXyKIbZzY4M31J3ZxDZ1Txinwri4mvN4YS0cp28Qy0zbd1A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347529;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=gYcO7aHydHaxwsXkMXfDR5F6GLu8XkTNu84QQAHBZKk=;
	b=Wm872sv+beMzj73R8JDgPPb3OFnGGz2ZnATafCw5fkrymN/eB8DDi7S1wGQlDb5TIzXN
	 aR4EglbhieYCLHqtmrraL8mFo+BiOLN/dEyykehiPlml4t3Xb5xjMG6HP/mjGYHDiqA7t
	 cmT6AvaL/Qy0Wg3sLMihf7XhbjioiiLSJjQ4U1GaMBQa6/VIM0oAQUvLf8yUzxDeqLFZE
	 4QFAMBz2EjRTPe01naGb4fvjQ5DWofrhOqpeiSJDmE3dEIZKBwXc4//7USwF6ynVhIIDx
	 HP5bQtVnWIFQS+5ChOXduG00PJtyTEjnOrrCkW1tPW8hjhVtqE6ZgKC3DO+nj+fjQ6A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347529;
	bh=gYcO7aHydHaxwsXkMXfDR5F6GLu8XkTNu84QQAHBZKk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=J5W/KN9l8+Trs2n6UUer9ED4cx9fOroLmuMYsV3ZrbWCiWsvrBQF031yp8BF6Oq1f
	 FjfTGPDJytk+N3w88w/cAjSSmm0BAnaaWM4vYTfpwKAvQZ+mpVhcvoUrnmrkorQeej
	 8xDNdrD87AwbqvYSTNa/qh7EdHtrcOC6jI9Rgi1Xb/H2I8RXwHQ96XAN6x/vrGQsr2
	 SQ70k5MQswC+c6UJyi5fMPLaR0XgDeI1ggMW3ZAnlZJNlrbyawk76V31Gg1Ab5x3Yb
	 +4e376mdb0JUn/rqXDNg0gEVLS5YaJW2JkMloZgKN58M7/mCUPrInP74KO3teHIlCt
	 cUcTZ94OLDDeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A7EC811AE;
	Fri, 25 Sep 2026 14:45:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 74757334
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5AABD60E1C
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2xDgSfP5X9fV for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:45:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 45FE260E19
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347525;
 b=ijbdG9qEfAUqcIBRsdVuTwqN+I1vQw/8s7xBIr9cPWvjncvEi4rSckmWvTDOc/OFyD8W
 yjDf9Gb6lgb0eUlcx2yJxl50VMb4qUxLovsoxJF7ptZE7/jWcfZWXkhgda3GNCB3flO4O
 niZUDvA0rVevUjtvIOa79cKOzL/bJ2fSBkPFQDoa6vWV7GzuFa2N7OqsGrwDrrSwKevG6
 K1MEz2MiPlUfINIAhNouWYL7zUw4JFEbTw9pY3FQSTU3hYOptkEGUWLueBmYxQ7nFeSXM
 84LzO8/qqNiTrlrRDkQ7HXnxPYiGRk8C4xmaerUjfyX9Lq89aBqhAbZEjksqTnyVR8A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347525;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=3uirn0MjIi1YJxpzuEtrKGMzXG8lcQmvfiIdHz3NKkY=;
 b=IpG14XIHA3Wa6++qQkbJl3BDS/6qg3Ek33+xdxoN2DperU8wFQridygWL/s/aBE337i1
 yDSdfLewSOarqCW02ECT0X/5Jq0xE3mek2IuIkSHkN2HrCyPDd9/6gVGZiHjjP/Xg399m
 6XG6+gzoFjFPZZaIAVDkVRIxWrr6vrzjIbOu9aYuFCK6F/+6cbIGZVDx1ZXuGS+pg7zfe
 NQ4YYRh/IfqYWsr6X4NyyaWemfIqlbn50ejPrWE+bvTYlgJDKBfffzFFEToyWz1IlV+q9
 xZDyNCRHhWkKw1OsRTE2/ubWne1Ew0+H1TBLh30zK+hv+SewL+qCMCEW7+/eAuq6xYQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=HdBvb2az; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::c"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:30::c;
 helo=mail-wr2-x0c.google.com; envelope-from=raphael.melotte@essensium.com;
 receiver=<UNKNOWN> 
Received: from mail-wr2-x0c.google.com (mail-wr2-x0c.google.com
 [IPv6:2a00:1450:4864:30::c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 45FE260E19
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:24 +0000 (UTC)
Received: by mail-wr2-x0c.google.com with SMTP id
 ffacd0b85a97d-482f6350f91so588395f8f.1
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:45:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347523; x=1790952323;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=3uirn0MjIi1YJxpzuEtrKGMzXG8lcQmvfiIdHz3NKkY=;
 b=VRVuEh88dOjU8zT9AePpS1G8m9i4oXpp4WgCEJnZ2rdBh5JlwvaLPK+kUGnfzuM6rs
 QgYpChCnJZ3NGey4uV3cAbWx/8Q4/3JR16u1wfC/Kt3zJwRYoXRAopEp5n1BKgcaPbNA
 KcUuJstKOiIzQNCnff5FwW/kOfRGwsNpF071JGXDIV0z/jYeapLycw8VjTct+PAZ0fAA
 08kbjqL0h0TEAJwFMHSN1SQZrQozGuVUYU9e2G2AMPl1H7TmBwe0f3Of+d9okxZNBqnz
 BVfwp1X33fYLtgG1bSKevrctejWXNpVcB2EUL7jvHuNDi/diLfc/7VF8JticaeyJtXo8
 2tEQ==
X-Gm-Message-State: AFuF++naBAMf2HLEcW4ln5D956vh799MKX1ASSAWLaeCM9TPLB879hPN
 onoKNI4mzj62jXVLllxaVYBt4GxQhHX3YnjvE4N9/w3vJ/G8sSGT/BkzBTQ4jNM8JHSUcLyK2lm
 4BmDigeeeFQ==
X-Gm-Gg: AYBFou1xAqpoMlQpvyDILPK9saC1pBJ6rstOCuOWHabmP3msrga6Lv8BaOesCYkzGfx
 0PRQciHqnEjOLb/DQ5Yv7VRJ2re/zDn455in+/wsIqln9lbD0YSlajET1JknpYKUuytV+Tshtwx
 XzMb1LpSLI8aoY4KjZocAeA7MMRq2U6hSCkJlyg6LEW5MHpmjStog6koq955A65ZAKA9hdLI1xF
 2XD7CgHI+/u82Es4ud3A+sF6zr1YvYLjNpMrkERTRNBWPX+yD2FizIGFv2IKZ6XBAbN/CsS+Yig
 QLu/mOvsAjP0e2YIbeyPSchP5LXpzdV02pF4T96/aEuyF+0JlG/Baplthu4pP5C3poG3IJwocKO
 vfqUrTxgNqwydVdDxnrW83tH4CcXMPfLo4g+/AQwcu5eYZ3L4SkqCWsUwnL6b6oFQFG9X1HzLZJ
 6/Mr9+JASdq0FsfqLPafOAxDOhlRJ1vxwf+pTY9O5ve744auXff4QoDRwlDLqmHt3Pr/m1H6LJS
 +wRFCUafRQbYABI2GkdHJ7rySwWpbWoNId/BFsF3A==
X-Received: by 2002:a05:600c:3b0f:b0:49e:7cc2:e6c2 with SMTP id
 5b1f17b1804b1-49ff06ed8a4mr42074925e9.27.1790347522850; 
 Fri, 25 Sep 2026 07:45:22 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a74538asm7680412f8f.34.2026.09.25.07.45.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:45:22 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:45:20 +0200
Message-ID: <20260925144521.4097648-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260915122946.1953137-1-thomas.petazzoni@bootlin.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/ndctl: fix Config.in comment
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
> The Config.in comment has the correct dependency on
> !BR2_TOOLCHAIN_HAS_THREADS, but that was not reflected in the comment
> text itself.
> 
> Fixes: 039c1ae13ec12f7cebddf86f37080d0a1fee28e6 ("package/ndctl: new package")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2026.08.x. Thanks

> ---
>  package/ndctl/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/ndctl/Config.in b/package/ndctl/Config.in
> index 9d3972bd2f..708871d693 100644
> --- a/package/ndctl/Config.in
> +++ b/package/ndctl/Config.in
> @@ -19,7 +19,7 @@ config BR2_PACKAGE_NDCTL
>  
>  	  https://github.com/pmem/ndctl
>  
> -comment "ndctl needs udev /dev management, a toolchain headers >= 5.10"
> +comment "ndctl needs udev /dev management, a toolchain w/ threads, headers >= 5.10"
>  	depends on BR2_USE_MMU
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on !BR2_PACKAGE_HAS_UDEV \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
