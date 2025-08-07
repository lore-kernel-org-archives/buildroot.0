Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB737C87FDA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9F3680D20;
	Thu,  7 Aug 2025 18:23:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ne3hwUAmd1xW; Thu,  7 Aug 2025 18:23:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE93C80D2D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE93C80D2D;
	Thu,  7 Aug 2025 18:23:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6633410A
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8B1B605F1
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:23:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1WwAJRBwJs6o for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:23:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E266260604
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E266260604
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E266260604
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:23:49 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-459e72abdd2so8075615e9.2
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:23:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591028; x=1755195828;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q3Lyr98N5aNXzad6dPRSC31zYT+6aXJhNMjNufqE/rI=;
 b=Trev33ZmsGe9YAPcQmgSlHf0Ax6W21PDVHpaxE6uI8QLfrXGyezsl0CqoKIdHvKvH5
 48fmb0KbmgSMMSZHtHmG5cGftlRu54M0bsiWruGEBR5zA9l0kexin3+mr/tPkMHYLb6C
 hDTIG0cORX7kmJEObvP6nnnpREBICeDCNAHzGnq6YfQcWvzBBpJb+DZzBO8ZUnxmk+un
 sbMMFECuAW72vVnJ5xMZN/B4hqNcNn2vEC7F5kbdp3DJaw02YS2niu2huejXPXp9YFoh
 es3cwGUIiEafMO1A4gfQ52UgJhibhqLDpWoM00gXqWtkKhohfb3kZ5mWZN3d20yhOF/I
 26Tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCR44T7agRPJLweep1UE4MicaKhQ4JaUjZnDlqqtAxTXa5fj7umf5vjQ9vTCb24ovDnTkuH0p2gb8=@buildroot.org
X-Gm-Message-State: AOJu0YzqhqTUhm7e6J/T5nEhzwhh8fAT+l7wO1Kji0Do8+fLhuSmVZWN
 Sy7fct2eaLb4QU29WsVttvIP6vUbfGX+YPSmhXv/thwekGLM3Gumt7e5Kls8lQg6oAY=
X-Gm-Gg: ASbGncvOIbrBqG2WXTtcotEZmKEAfUthlqwAic4QFIom49dXy3mD04y7Hbrjjz/Ot7T
 +hHv+5VJ39dkuXO20Tf/yRYKYsrwaLyy5jvqUhlaMBrhWr7yKJjcduL5ggH6M9Phokx4VspfLek
 W+VYVnoHBlK3dJJcQmQmNq8RiNCfpNkYEFTAEC7yXXdd/PNrgNYsrQkdllvVNSNywUxrSSIcjOt
 FkPq9DIuNn71STNc7n8T/gijHtJiDr06XoZqGcvrrB39cronId3OprTNTJSYBnR+rg0gJXf2Bhx
 mviMJofbqeeNFs1IMCAReb+sx7MFeYbqPrf1uXWNawUcdb2J9Ppl1sclub329GwumtmeTZynEIG
 tFjz/V71BSOBS8Q==
X-Google-Smtp-Source: AGHT+IFwKkR0+X56QSJ8pISVQjfF1O/prl5gH8GizIlWFjX40Mt61ttEqf2L3s+epNrNEdg2onMZZA==
X-Received: by 2002:a05:600c:1d22:b0:456:24aa:9586 with SMTP id
 5b1f17b1804b1-459f43a7a7dmr5442205e9.21.1754591027866; 
 Thu, 07 Aug 2025 11:23:47 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c485444sm27886442f8f.66.2025.08.07.11.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:23:47 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:23:47 +0200
Message-ID: <20250807182347.723412-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250518173557.2147691-1-bernd@kuhls.net>
References: <20250518173557.2147691-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591028; x=1755195828; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q3Lyr98N5aNXzad6dPRSC31zYT+6aXJhNMjNufqE/rI=;
 b=AINZtzyKUSJBj+tj/vTfC4GgDmJZbIIiNfDyQFhzl6+9EkcVPRqmG5bBHSCi05iPOZ
 EUOPygOva0wwwAPfI6JF2KMqqcLFGSm2agHhb0qdL3fkO9JYJFmirCDUP1SX8TxLzzu8
 w1kCZ437pRNskohl55N+o5A8sKlR5Jbjd2yb7HagGu3yvJMYo98eFaqB26yRo4rihNB1
 F7OcxBpGMSZOBMBGdOTZSVkAnY7AThVFqG8fPs7z2ni6cUgfVtdKyplmHL+86uRW+ii7
 gNvIabKZq1Zx/nJ/W3pfbXmsctKtbiVXnlwLI68FgGh6gg4a7TTXn2eqxa252ZZE1B7o
 NsLw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=AINZtzyK
Subject: Re: [Buildroot] [PATCH 1/1] package/oniguruma: bump version to
 6.9.10
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
> Release notes:
> https://github.com/kkos/oniguruma/releases/tag/v6.9.10
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/oniguruma/oniguruma.hash | 4 ++--
>  package/oniguruma/oniguruma.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/oniguruma/oniguruma.hash b/package/oniguruma/oniguruma.hash
> index ac1d375b7a..be49a4d4e7 100644
> --- a/package/oniguruma/oniguruma.hash
> +++ b/package/oniguruma/oniguruma.hash
> @@ -1,4 +1,4 @@
> -# From https://github.com/kkos/oniguruma/releases/download/v6.9.9/onig-6.9.9.tar.gz.sha256
> -sha256  60162bd3b9fc6f4886d4c7a07925ffd374167732f55dce8c491bfd9cd818a6cf  onig-6.9.9.tar.gz
> +# From https://github.com/kkos/oniguruma/releases/download/v6.9.10/onig-6.9.10.tar.gz.sha256
> +sha256  2a5cfc5ae259e4e97f86b68dfffc152cdaffe94e2060b770cb827238d769fc05  onig-6.9.10.tar.gz
>  # Hash for license file
>  sha256  70ba5469ea0bab6e18a32d7009068f996503168d27be57747e08da34337ff26f  COPYING
> diff --git a/package/oniguruma/oniguruma.mk b/package/oniguruma/oniguruma.mk
> index e056048cb5..32eff4cc75 100644
> --- a/package/oniguruma/oniguruma.mk
> +++ b/package/oniguruma/oniguruma.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -ONIGURUMA_VERSION = 6.9.9
> +ONIGURUMA_VERSION = 6.9.10
>  ONIGURUMA_SITE = \
>  	https://github.com/kkos/oniguruma/releases/download/v$(ONIGURUMA_VERSION)
>  ONIGURUMA_SOURCE = onig-$(ONIGURUMA_VERSION).tar.gz
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
