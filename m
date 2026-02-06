Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F5B9EB28D6
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 08:12:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 551FD6120B;
	Fri,  6 Feb 2026 08:12:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YeW1pK6Q3Z-8; Fri,  6 Feb 2026 08:12:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFF9C61186
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770365523;
	bh=zgXYLPlnY5ULjSVy5+T4vJxW2AGLoDw58oXYlA9Lr90=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MSlt50dxKeKdZj2227JbV5Is1SKREIzr5OSSgKLkUSmgjRZQE+eCU63LiFuR71xYE
	 LwDbUn9aaAqZ9WzfX3mXnrQnfehmofIH0aJV6kHwzQ+vFBKxn+hnMMhK9eEykStNgo
	 gY6Ram2HdsWaQeGrhQVP4mTaNWF3FbyoK3mr2e3NSfusHGGFmkTmN664TgW1LTziqi
	 6XeJUbVC8EoZpgYBm7aUkzjpGK7fQaPgZ9hBsqLUVk0EWLGMYRHs5LDP14oYpW3IH2
	 fZO7PCwwlo3JSMRwW7rtNXfAZGNcNPTbMeAlGuREcFh4o+pM3+JrO33889oScQt1Xh
	 EGVcwXrLIosow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFF9C61186;
	Fri,  6 Feb 2026 08:12:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F5E5173
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8CD4B408C6
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B69qIaL3-cYU for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 08:11:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AEC73408AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEC73408AF
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AEC73408AF
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:55 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-48039fdc8aeso11405155e9.3
 for <buildroot@buildroot.org>; Fri, 06 Feb 2026 00:11:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770365514; x=1770970314;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Io4nxi98evmc6OaDxKCKoyJJxjNEbEAFiHQhwASJk0M=;
 b=f9pdgm0mh6YjqY8Q9qqTeiOQTupiAT7a7+yhkXYA8mOXdy7w6SoL8zbhjeLC/aU5Y/
 cpihy12kvC0wO0DoB1ZM8PvLOzoPRGWMY7HeDgwArcC5LbhItW5BRYOwprXffyqv+xlP
 NrAm1Dqp3cm5jQDQiT0DisWXoz2gqv03mWd7sCU2JQDrVHRl60pYC0o26Lnt5xZvvwoy
 b7tBo02MTXvPmu5O4Il8bxjUlp2L5vxlDC0Q3cbgJGR1Xz3QeuoUzRlk2B96gosXtQn/
 Wp+ypIsyCPf72AcD87xTLTW9PvwJPlRJa4+Jgi0eZWhI/zIBhrm8ANTeeiR5Vuawj7sB
 C7Dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGKQYNbuFKmoVGoOIkTPvR+urIlq2yox0L9NxsvIa0FfKgMXqGg9WWCoGxqWtYqc2wKppJgKBViOo=@buildroot.org
X-Gm-Message-State: AOJu0YzrAyLs3E0Zud11MaeGrrQAJnKlk8NPjYcuoHXxq0gFFGlbD/Va
 hy7+RK7PGja2MqmGpz3UohNnVXap/5QaRg5WcmSyxvjJcYWdXzIe7zb9stJ4s8bTPgY=
X-Gm-Gg: AZuq6aKi1EZHYV6WHPu9bO8kDJ3jIhx/yPrysG3NDkE45UYC5xOJLbIKGnaoxkxX6lc
 +nm8imLbBnTt1rD/+iwCO0det7rP6UFWOxodaz9U8tNdMunNhKPgS7xVGyc9tW7wihcU34FQfHv
 i8gcguMhDrk03s3HoGt2ZjQEwjMqByAtjL+bsOc9kl7r+rSWNNxB80HRnThhvjiBZU41XxImM7n
 b9mrNs4+RNk678Pou/2t4OpQPBEOf5JwCRdbKqgN3HLrRKARqIFQhzLcbgn5EHJoiWCg+iD6UhU
 bBsWNyh0K3zZ49nNQair8KdaTE6f0MJJVZKCpx0dB6vNOWQ8mTgYFe0FZ4YuD6T5DLlpDor3jKI
 1UABsXzaMg1oRpFoVr9H1u3+90Mtugb5dlI5BZpTE8Afu6tqjkP/u+5LAoSPn0f5ktPC31bd3oP
 o2lnM=
X-Received: by 2002:a05:600c:19c7:b0:477:7ab8:aba with SMTP id
 5b1f17b1804b1-483201db067mr26503105e9.1.1770365513641; 
 Fri, 06 Feb 2026 00:11:53 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4832097dbfbsm12211225e9.9.2026.02.06.00.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 00:11:53 -0800 (PST)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Feb 2026 09:11:52 +0100
Message-ID: <20260206081152.32297-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260121110208.3355429-4-peter@korsgaard.com>
References: <20260121110208.3355429-4-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770365514; x=1770970314; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Io4nxi98evmc6OaDxKCKoyJJxjNEbEAFiHQhwASJk0M=;
 b=LwOBPMZ37xLrBKIWT53kxccWRRirZad9sij0jznFLog07Mf1yPAznzk9YCMeQC0KJm
 scJ/GkEpgQPHSTDu94eCabPFfqTrDtJw8uZB4RyXYbLUOB008hESBJQAFfVDT5ejBWyl
 Axm+kqE5UTEmx/PaiYqDlBcCQAviT9TU7w3kd/DxodstpJj8VhdbsFcqE889mriTEeq+
 cAJc4bI/hLFSQu2eshP08ChYG1mAxxsjpX5LONjYPnW8M0nEX0zVK9aBKLwzjhyJYRU5
 wAesqOMOCoVsGS7GdLA25CZUo2kZSo6C4ovSczEKcs3u0DLzKk46J2WenpD4/TP4OCjm
 MCuw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LwOBPMZ3
Subject: Re: [Buildroot] [PATCH 4/4] arch/Config.in.arc: fix 'operations'
 typo
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
> Found by codespell.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  arch/Config.in.arc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/Config.in.arc b/arch/Config.in.arc
> index 7dd564d7f7..f250ae5eeb 100644
> --- a/arch/Config.in.arc
> +++ b/arch/Config.in.arc
> @@ -31,7 +31,7 @@ config BR2_archs38_full
>  	bool "ARC HS38 with Quad MAC & FPU"
>  	help
>  	  Fully featured ARC HS with additional support for
> -	   - Dual- and quad multiply and MC oprations
> +	   - Dual- and quad multiply and MC operations
>  	   - Double-precision FPU
>  
>  	  It corresponds to "hs38_slc_full" ARC HS template in
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
