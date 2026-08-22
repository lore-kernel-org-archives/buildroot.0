Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89DDCC5DF97
	for <buildroot@archiver.kernel.org>; Sat, 22 Aug 2026 12:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5ABD680F03;
	Sat, 22 Aug 2026 12:38:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ma1w3BqV8KhG; Sat, 22 Aug 2026 12:38:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787402312;
	bh=S37xEOeFFhSFvJ7UyvaDCZM4Hkw08xMQzsMJaHbvx0Y=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VJ3CyEhjlSzzxcpnTrbeGjOoGzl9Gi2cYydyYVMWDBvvDaiHblcLr5k6TdjLYwbdA
	 0wFERa+SrBf6UMjQVVF4cybfbcv4VziwdAaG6WYa8x1QEAs/xFx8jSvnz7jDDpsXrS
	 rCY+v0oE5wT4PvIAYNRvCOSA+eH/PxQlDWVX1o7inJPvtOdRLtrA4+iLhR+MGOsFIY
	 sGUEiCwliCoAmQQAjVQSOE9yRPpTexTZPKysGLCgvgJhj0Nj+S1nv/IIkz+UCKp520
	 K/1k++Hwz2nirc9aOjDcW1a3npxuWVgwZ5dfQFLwwGgPwbpYt7laaf0rqTYL1aYR69
	 f9bmOl7Tb2wIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B84D80EF7;
	Sat, 22 Aug 2026 12:38:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E8663118
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CEF3780EF7
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:38:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J2sm8bFh9e67 for <buildroot@buildroot.org>;
 Sat, 22 Aug 2026 12:38:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DB9CF80EF6
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:38:29 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-6a386a34603so4579695a12.1
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 05:38:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787402307; x=1788007107;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=JsVHXpShPNHjFXPVfIYp9mIrYqvUbSShyJOLJhTGAms=;
 b=LCHEm7CMi4woVaPLNJTedMaCU/zpg/P6cKBtLjO7YgoT8XrulGgWsbpwSXz9PWvuO3
 hy0ASZNph1+Zd32MfY69UP4hiLSgJ+2tPpmMTsMFjrDKzczDKumKz6zNEAv13B3para9
 1NwFmY/FSKnXrhTau5KJhn1+GXXZ3XN0PK/cbai+yy/RtLukzSMqvLSAfPFZYWcGzQZa
 +IRnizDPjDcqLI7Y4zL6JlxJWLylx6jdvueTjpURls6mjqQXWHXhhEipDw24HHGWw7tq
 pf9MnbX0uMqMVJXf2AynqaSQ5lL9kwdfvCHa+Zhsw+2eutXf5a+SONO7WqkOmKEx5KDL
 CHKQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrE4bPSq3oVKEOymFpzbirYuCPEKuk6ZtSerYzpN5F78K+62E66DJwmtX10RHMIHGGoSMzOJ/F0hhc=@buildroot.org
X-Gm-Message-State: AFuF++nqT2iObi5lZzBmCqpRnsWxHpo2Cm4gqL4YeZ0MbEYc2jVAHAJb
 6XOHHSVbYOtXrGw0Zg2dnVMGUKEGJBk+KnBXSKpkO7as7ucpjfi0ONtuZ+3tcb1Y8eo=
X-Gm-Gg: AR+sD10YRLcUzmimiSe0iHO/SKEFfAPXwELkiiLD5NWX7/sFyKa8JeD5vFvkYRbgElS
 u2m6ERUV1lcwGswKazPlGXSMVAqlyUrBlttkHSBf2AO/6vdu3znfUJSj5Q4AvFGpFGWFeL9KoEM
 3SjxbcKb9kNMRxU5W65FrOc8UOemRIC+/exZMgpOADalHP0dra1zhv3VOd+L4gxaOEUzfNmTNXt
 AFcyodVfOENaPH2dVyKheMMqo5O9nGonNYQGCamrjbAj9tBWIVlR6tiadg4EsxzucG4k4omOBND
 i6lNM+9pQPn7XOE+VxDG908mRwFz0i3nbDbCotDXO68/sqddDZL+Qyl6tApue4TbtgEiutnPIk/
 2A+H10R0xk51S31R48m8ki9R36aJG0ETwI5yA/v0QLrgrRltf2xcczGHFdoWgYKdlTzM6Hz9V4o
 vTQA4+RrorHX2FOtpYBftR3yJ9BbAMcwuzaGAELOUb9VE1Gv/qpxz/bX3SuMHHsYFXgBIYKFGwz
 H064KOP2Zx/sESJ2gLYSZXJVPB1gpU9u8qdT2cA3GCz6+1e
X-Received: by 2002:a05:6402:321b:b0:69f:c929:b88 with SMTP id
 4fb4d7f45d1cf-6a430debb60mr12736950a12.5.1787402307345; 
 Sat, 22 Aug 2026 05:38:27 -0700 (PDT)
Received: from [192.168.129.33] (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a3feec9d46sm12577133a12.1.2026.08.22.05.38.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Aug 2026 05:38:27 -0700 (PDT)
Message-ID: <256695d1-61e3-40f7-9484-c60034c74831@mind.be>
Date: Sat, 22 Aug 2026 14:38:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20260816075242.1844454-1-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20260816075242.1844454-1-bernd@kuhls.net>
Subject: Re: [Buildroot] [PATCH 1/1] package/expat: security bump version to
 2.8.3
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

On 16/08/26 09:52, Bernd Kuhls wrote:
> https://github.com/libexpat/libexpat/blob/R_2_8_3/expat/Changes
> https://blog.hartwork.org/posts/expat-2-8-3-released/
>
> Fixes CVE-2026-72522.
>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2026.05.x, thanks !
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
