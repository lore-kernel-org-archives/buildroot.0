Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D0DCC5AC7A
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 11:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EECA560A56;
	Fri,  7 Aug 2026 11:48:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lEA1N6JRzYbc; Fri,  7 Aug 2026 11:48:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F09F460909
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786103310;
	bh=4PmQD8kb3TZIZ0NkiGpOuggvrAfTRXc/EZJXnkPCq/k=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jz5jSW4MoCtJkJ2KaTD67Ut4gywGbJ/ArTiLYlKTOhlzYO8Gjkn0bVi3ElTQhwF9E
	 J/+NLeTeiK8Qh9b63oGjJZOliCfQE+vFmgN3zN5lpOqlDwv9FDuOB2zu4Jw+jtpGuL
	 hytv17oD44CB7MgRFGqU4W0qgFtv9ybKXzsoSPM/cCFBi/rkVPeoQiGWrj0r72EAmr
	 W9vY7wHV6JOdTsOZmEpSqpRZEBzJki4FlujWSOk5mR+t3hPljzW06L7MCQqI2Hpb9N
	 kbG8Y2vwJrntU0r9f2S8/Kv37e8kIPUVevqe9VwPhhYN0YwVJ8sOhz/wq+PTUYR84Y
	 qpSh26flL0Sng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F09F460909;
	Fri,  7 Aug 2026 11:48:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 893C9D3
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F31D40A6F
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:48:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jpMnUOPQ9Y-y for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 11:48:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B6DE940A6E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6DE940A6E
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B6DE940A6E
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:48:27 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-47f633e6058so2769328f8f.0
 for <buildroot@buildroot.org>; Fri, 07 Aug 2026 04:48:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786103306; x=1786708106;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/W+J4fuQLR+nsnq1PLD3BbmUczawDjCaz5i03AMzM94=;
 b=YOikINB895zxjOF0CwH1wHSe4SvzV2eWNQmiOO1m/Q/0nOUy7IQq59eLQ1hsXP5ZUT
 yDfyR94oFotrRcEMzug4S/x9h/II/XDzOCnxXGa1UIIKTdQTzWdTWb/q5O2uxaHbyuet
 ySBTbqUsVOzxNQulMJ7xjQfoGtntUlNpRnN5PhVprMfqOuFf454HC0amAxiOWcCyTCew
 e2OPccK46yEmxRwvV+yabOOhqBwJMsAe+KyrmD/Nc8vH4QSADSR73e/sJdiS7+e5yf7t
 rmrGLdPlaNCC0BUy0N8kE8+1Hx3oubMDEAX6P1AeVhdKg1JP63boc96B5jFZ2c8MeoJE
 CxEA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoIcSyyVKCS8PC4ulTfHKv8d3/WxwXOsvqvbVtcyIV5hPYTNsefgX69dkcmwNuKj93ujjo6gPfBExY=@buildroot.org
X-Gm-Message-State: AOJu0YxvvaGYKMZDjRpuqM2LwjNw5N+/KWoAW21kYCRp7A6YRYcbUlwY
 XJuicV0XtGIkNGMr5eJxz9VZ/3GsKCaVIBltywD834fZaLlGAJNWe5WNQBxxzpGVkv4=
X-Gm-Gg: AR+sD13hwfW22xbfwwLV3LxdSKTsSLWQ+W0TgxaYtvrEMNgW4IG+vPRmxyaifGoXcH4
 ZlNdLXtdhtSYkiIlrlVPDOS1SwSCXofSK2yzVpmK6zb2+XT8XIUiZCUaRskgIXYTl6YdDujcN88
 jNhvYH9kcrzmgy31pvie/z/PmghoFo7gJl80YX3FfFmMGvPpS1EW31yXIEENpeQyEvU9aVdN3hA
 1PYFS++tozW78yRQKCskspBpovVc0piYyR1gjXEQGLGyuPKsnpHSA70X9BsK08Upxmik/nKX8c5
 aqBSD2fGiQk/q42jwE2txM4E9ESdN3JsrZamTzRfeU7crjPhlINFS2HKa6ZPPzqO/XlBHqLziGF
 XiN5qhimF0Rfy/Kvol3QO8wzMuKYfPfngNEqk52Jvmjq+CFM9BOkwhO7Sif7uUnJzLc19P263Hh
 l4B2jjrZ7jAFPcvPONUL/nC5iskqJRIqrl3EzMFgTRiQhUeE/Kgo+/4hxIaUI98PEB0ChZpSg0l
 o0J1PQ24XSD7PWQ6sS+LyyKe/uhyf2QbDg8rmFbxR1z4u2s
X-Received: by 2002:a5d:64e9:0:b0:47f:7964:9887 with SMTP id
 ffacd0b85a97d-47fec639e6cmr35034171f8f.25.1786103305738; 
 Fri, 07 Aug 2026 04:48:25 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-480021f90f8sm4779121f8f.26.2026.08.07.04.48.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Aug 2026 04:48:25 -0700 (PDT)
Message-ID: <4259c99a-3fae-49fb-87a5-5a9713542d3e@mind.be>
Date: Fri, 7 Aug 2026 13:48:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, linux-amarula@amarulasolutions.com
References: <20260730200118.3547779-1-dario.binacchi@amarulasolutions.com>
 <20260730200118.3547779-2-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
In-Reply-To: <20260730200118.3547779-2-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1786103306; x=1786708106; darn=buildroot.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=/W+J4fuQLR+nsnq1PLD3BbmUczawDjCaz5i03AMzM94=;
 b=VJXInl8a+0a2EmbDnIshH4/LqFWDYkd5VyCjPungsXakm8zZrzeuODMXyIf3Mq5IpF
 bZrvTVBz+qbzzBJWm+VgPY5FLpYLxHK1U2ND5ncNhNswocu9Z1wqM/2ipeuG64T9If+m
 ZR1fjTMKx46rgE8AGyHFZ55LEi0rFO0vtQ9BebhBf8TXllM+kBAkDoz7wl00ZSS2vjfT
 hS73xUOaMGUQkY+uqTgu657zzdREIvBVYcbrSuj7sSJ/dwfmIgd3XhO/qU7Op0zi6dq9
 UAPgtfn+MMi8DnhieeR1Hps3fmynAZA3HlQNCMwtb5BNoPGTf7Cp2bsyXGlT7QVoQmfi
 ELCA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VJXInl8a
Subject: Re: [Buildroot] [PATCH 1/3] package/openblas: fix build on mips64
 n32
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 30/07/26 22:01, Dario Binacchi wrote:
> BR2_ARCH_IS_64 is set for mips64/mips64el even when the n32 ABI is
> used, so openblas was built with BINARY=64. Its build system then
> passes -mabi=64, which conflicts with the n32 sysroot:
>
>    gnu/stubs.h:35:11: fatal error: gnu/stubs-n64_hard.h: No such file
>    or directory
>
> For openblas, BINARY refers to the pointer size rather than to the
> architecture, and n32 uses 32-bit pointers, so BINARY=32 is correct
> there.
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Applied to 2025.02.x and 2026.05.x, thanks

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
