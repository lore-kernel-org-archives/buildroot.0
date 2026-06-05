Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 549E9CD6E7D
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32E0941F79;
	Fri,  5 Jun 2026 12:50:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jF5Rl4w-8rgO; Fri,  5 Jun 2026 12:50:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4906B41FE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663853;
	bh=pN9dJcDIId9ZyvQE7JxIsfIT1ocDCUjUoznUw9+yjOY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EUmGHjISXSYBEFk7H8c7rNdZ9VAVRk5KWgrwbQAL149jjUcTEAXYz4LlMNpOWq5My
	 iqEFcwiavZAZJ395QEj+LxsxtuSXlKaJX+IvJqRMJ/+WgQawM1H80qIAJ4Q2at6D+c
	 OVu5gww5mp3YOqzwrdT5puyHEwZLJls1eFJEsvskXCJnj3hnDqzi+ww69YG8ZC6Ixz
	 lhv4Ku+FsQjQ1CHgJOGxR5C6l/vo3upG4ivxyW7qOkJFwGYF7o9y+4Krz++O2SGBdG
	 zMRuf0PhhVPGgKj401jcEu/vBA+xGfCIBBFig8B9GkaOGK4HxFF+vQKijN/Q4Y123w
	 tSak3eLyhXBhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4906B41FE4;
	Fri,  5 Jun 2026 12:50:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E1F1D388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3B1A4037F
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FJSUPnR273Gy for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:50:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BBC644037E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBC644037E
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BBC644037E
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:47 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-45eea68dd6fso1000886f8f.2
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:50:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663846; x=1781268646;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=A0Dyo/wHVsY7SXFqsHZkf4q15U7ZHQ81OFwP9+qdBIA=;
 b=d9r1tWzSn33tXGKzb4S1Ue1csQXQ+12PK50Lk3yulj316Y1xfZkZw1dTGicG6oWogA
 aXKOyhRSAasAd6E9ZsqziVxp58kWk8Hyao/YqBHAmpXCi5pvR//DBqgm5nA3C+fDIkaq
 UqZ80MU6c084sGQzgGEIc0wJWIRSUC8bteuD1hdtUE81RubLjS2xx8o4HeBV9CGsDbQV
 R7VX7eIxmjJBKZ5OZEfXit5mcWrwaf6QKm614WLabcSyxa0IIdGcjAG9cHO2wWC9hH1u
 T2UD0jl3+1Y21EAt+18peCMiLzDf+CFsCp/vL4ly8sJQQ3hmdbAwQu973iH34zM6Pps9
 jv4g==
X-Forwarded-Encrypted: i=1;
 AFNElJ8ny7t1mPBdKRspria+qiqYajKqTeDuKJIFTMZWxwf7dGdy1zuTIs/S76d0eXdtmvDD82QMVVDfHyc=@buildroot.org
X-Gm-Message-State: AOJu0YyRFU0LWUDnZiMQpfzfY6ueLEU6IgWxUaXCTeXXaHkvVIEAFUYZ
 Y7/+afnuHPqbDw7SUSf6W5zQxd1H+2yr5h3HT0ZGwvSN7Y9WHq2DaZY0eSZTu3fYmTw=
X-Gm-Gg: Acq92OGwKiSATsOwCnDN8wjsHD+AsBzihMivTnFQgdqqwu6kDgcWjBj3m6qBI5fZ7WO
 +njTOkC4bLryfCdtmlA9o2zuRmOMbEuUYjQIen1u3sbAV3pO/EumzeqPam2+B2t5uMqopehwB0+
 K2zgGxR5QeaBzYt+cQsKASt03ZAVL4WUDiIzm1eZ2FpXx42oFNf0uCG/+KFXoJLI+x6AyE3vGhd
 FN5gJd7UbHkV0bCZNqW6kyHD0rMVl7eMufm5P9khHepecyjMRr0jEQvmeKEicIyYNwIoOsU1V7f
 b3PgxE4bVM5DWDvUGnMSa0XT4dXwFrn1WJ/BgIvdcY/eAA5QSvo9q3f5IYuvMs642pnbSjB1U3+
 UXaifapLKUlkykOrhiM8oxI4VXfW6BRSMd4bUBBpQkEQy62ykiM9H6emJw+FKlUDgkwHLm0S1Gp
 VIA8D3+pyYzg2gL5GIFFPy4CxYSQ==
X-Received: by 2002:adf:ee49:0:b0:45e:a0ab:8bd1 with SMTP id
 ffacd0b85a97d-460302dcd4emr4103784f8f.7.1780663845750; 
 Fri, 05 Jun 2026 05:50:45 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f368e9fsm24962448f8f.37.2026.06.05.05.50.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:50:45 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:50:45 +0200
Message-ID: <20260605125045.274323-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260527203940.3560528-1-bernd@kuhls.net>
References: <20260527203940.3560528-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663846; x=1781268646; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A0Dyo/wHVsY7SXFqsHZkf4q15U7ZHQ81OFwP9+qdBIA=;
 b=f1Ul6zl3g+w9w6sGcBM/0nUFCXYYPDKdKKxrQW/2qIOiJtS0mqcTwQ/bPDxvhgHQ3T
 bWpzKL6J4doldVtYqB/54Jw9LfToeio0puGtAQiavQUPZnXm+fhcuGgufsImLc59apJ1
 MR5Esq8lRhVU7t/4FODwHPRTrtQ+GnjQS86Su3J/jmWpiXu9Uwsieem1LjN+xkTz1spE
 sqaFqihhG63KzbV9rXV80fROEQfbSi/LTG7yyKBewS2IKrjK8DU6bahr2KAiB62NU8l5
 4CVOc4cNWVz6ngDNvo/o/2cVMAo8vTtkhAc13oBp+Cv77DuyOC6B8DMbMWh32xW0Ndsq
 QBkA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=f1Ul6zl3
Subject: Re: [Buildroot] [PATCH v3 1/1] package/graphene: needs a toolchain
 with threads
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
> Building without threads support fails:
> /home/autobuild/autobuild/instance-9/output-1/host/aarch64-buildroot-linux-uclibc/sysroot/usr/include/features.h:220:5: warning: #warning requested reentrant code, but thread support was disabled [-Wcpp]
> 
> Added dependency to threads as suggested by upstream:
> https://github.com/ebassi/graphene/pull/268#issuecomment-2283737538
> 
> Fixes:
> http://autobuild.buildroot.org/results/9b3/9b357b1ef2eccd3110d0ecaaff1ae4883dff9280
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> [Bernd:
>  - added comment to libgtk4
>  - added upstream response to our bug report]
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
> v3: added result of Gitlab pipeline
>     https://gitlab.com/bkuhls/buildroot/-/pipelines/2557142010
> v2: updated patch description in response to a review by Thomas
>     https://lists.buildroot.org/pipermail/buildroot/2024-August/760305.html
> 
>  package/graphene/Config.in | 4 ++++
>  package/libgtk4/Config.in  | 2 +-
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/package/graphene/Config.in b/package/graphene/Config.in
> index 60f6073a10..085efb301f 100644
> --- a/package/graphene/Config.in
> +++ b/package/graphene/Config.in
> @@ -1,6 +1,10 @@
>  config BR2_PACKAGE_GRAPHENE
>  	bool "graphene"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	help
>  	  A thin layer of types for graphic libraries.
>  
>  	  https://ebassi.github.io/graphene/
> +
> +comment "graphene needs a toolchain w/ threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/libgtk4/Config.in b/package/libgtk4/Config.in
> index 6d871b8517..3daa676169 100644
> --- a/package/libgtk4/Config.in
> +++ b/package/libgtk4/Config.in
> @@ -15,7 +15,7 @@ config BR2_PACKAGE_LIBGTK4
>  	bool "libgtk4"
>  	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # librsvg
>  	depends on BR2_USE_WCHAR # glib2
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2, graphene
>  	depends on BR2_USE_MMU # glib2
>  	depends on BR2_INSTALL_LIBSTDCPP # pango
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
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
