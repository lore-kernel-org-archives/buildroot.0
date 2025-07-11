Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB570C83F1D
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BEBD61407;
	Fri, 11 Jul 2025 10:45:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UVhc2Gll9LI0; Fri, 11 Jul 2025 10:45:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9548C6143D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9548C6143D;
	Fri, 11 Jul 2025 10:45:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 39A4B199
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:45:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8294940251
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:45:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J2SsBHpzsGBD for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:45:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8298140510
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8298140510
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8298140510
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:45:06 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-454e2463e3aso4752625e9.0
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 03:45:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752230704; x=1752835504;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ICJyxE0RhkPCaNowB4NBivPsuUQiOsO7bj8GyRQMAfU=;
 b=GPwQ9Ol1CTwqePtw66jjHgx4ot//d98qh9DA1t5RFxJ9G7GY6ppxQmg7GEuHCub+RP
 bEbsWaf5DQ9CnKDtLUR2lvahyv20ywRAefYhl2ICb6g/bwWFHmX3nHWUG4EIQTyUkvhV
 Cc8SLS6mb9ZVDLXG517y15NZ4fdpfc0Lxk6w3Uk7VWMrZFpqSe3732iP0BB7MH1qfCWn
 iY0HAJ5fBjACKKa9I/xLQRhXCwOcKYfIdhU6mvsejKG5vm3foGBqFLTlo3/x9l/HFwL1
 gHooMAZfwtxf+CG9MkPjNoiB7Mvbfieb15+9rA8waQYmnlAJMoO4Tl1Gi235U0LojcnW
 2kTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6xNy7LSOkSXQGy5bWbR/89gx8W2iM/rPUyNYgRTnUbv/B6cKy/HyDa3misRcDEO3WuzS5zJ7sclg=@buildroot.org
X-Gm-Message-State: AOJu0YyxLjrzVjufe5QnzDYRQwKLo3di0aToUurcdtPE6j2OIWbRYEaF
 Rl9TmIW30SkHLOS+1GQX8SknX9qad/RU+i6w/0bCdQOJ4GVDbfY2gFC4QGgGhEvkATDLQM36zYf
 dAhIi
X-Gm-Gg: ASbGnctba7plGBbuWgAie2utiT0SrOi/4WsKPrwsJ7JLPob6Mal2s7qTmS1HXswNH/8
 KsquMLf0uT2mKwaRnO7gfeLJEJ/tirFbC1ne/gYw4blyZa23oWTACZnDmrl4LkeEOUSAmmb+c7t
 3Q3eq5CgIRlG4wrJNlgICudwMYezokrMmz4WM+wxd9r/6PwIEQTdcfzqgHk34oObC6TuxcATbto
 kSU0BDkKjmp8FKrcdZxw/5z1Jd8QFhq9jLFCj3nobgFvlYrbnjlOvwmt6GNe1fE2ljTGyvYKl5i
 sq4ws7MHqLUk/quHO5XSK8+C/e4LLMqGF6LqiATdKrxMsh7GzKWbbaPpN83cOGNuqSGAQNpFfNd
 8Vyp6HQd5qdopog==
X-Google-Smtp-Source: AGHT+IEhdy9gstwL0U8Tr+uA6P2CNLrLx5KH6CEJvH2DMZFPirVCRZP4N+kmUfgmAa2GbgYV/7Hrfg==
X-Received: by 2002:a05:600c:a08:b0:43c:f8fe:dd82 with SMTP id
 5b1f17b1804b1-454f4255c7amr22496115e9.18.1752230704532; 
 Fri, 11 Jul 2025 03:45:04 -0700 (PDT)
Received: from arch ([79.132.233.65]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454d512c2bfsm81226765e9.39.2025.07.11.03.45.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 03:45:04 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 11 Jul 2025 12:45:03 +0200
Message-ID: <20250711104503.824513-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250703080704.1704843-1-titouan.christophe@mind.be>
References: <20250703080704.1704843-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752230704; x=1752835504; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ICJyxE0RhkPCaNowB4NBivPsuUQiOsO7bj8GyRQMAfU=;
 b=dLggeKcnIxy70QKCsSmIUVRKhw5MDLKMfi9BIxUrQ/WJGYWL8Z0+dBqrPoyw8OZvCn
 PqaqHqREx3G6eXxUutefS0tRKBjyOXoqGxh17QvSmmlazCqN3k8Vb/c+F2cmONiL+j/v
 baxLqbxF7Ad3ytjKrHSpoIX8fzXC7QhN++mGR8y8deX+oIsKjVx24UkWj8UAGf5CadRz
 5GMJ+03dOLPmmNXgLZV7FtqZb09ytuCk1dUovyyvir0LJ9UmljajR9d/+OB6ojiygxEi
 svL09AqEKoKONeuryxN4d8PeujHOXtKCHKjFDn0QcLf7WNlFeL5rzlAS04QbsG+cZbak
 8EuQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dLggeKcn
Subject: Re: [Buildroot] [PATCH] package/tcpreplay: security bump to v4.5.1
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
> This fixes the following vulnerabilities:
> 
> - CVE-2023-4256:
>     Within tcpreplay's tcprewrite, a double free vulnerability has been
>     identified in the tcpedit_dlt_cleanup() function within
>     plugins/dlt_plugins.c. This vulnerability can be exploited by
>     supplying a specifically crafted file to the tcprewrite binary. This
>     flaw enables a local attacker to initiate a Denial of Service (DoS)
>     attack.
>     https://www.cve.org/CVERecord?id=CVE-2023-4256
> 
> - CVE-2023-43279:
>     Null Pointer Dereference in mask_cidr6 component at cidr.c in
>     Tcpreplay 4.4.4 allows attackers to crash the application via crafted
>     tcprewrite command.
>     https://www.cve.org/CVERecord?id=CVE-2023-43279
> 
> - CVE-2024-22654:
>     tcpreplay v4.4.4 was discovered to contain an infinite loop via the
>     tcprewrite function at get.c.
>     https://www.cve.org/CVERecord?id=CVE-2024-22654
> 
> See the release notes:
> https://github.com/appneta/tcpreplay/releases/tag/v4.5.1
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/tcpreplay/tcpreplay.hash | 4 ++--
>  package/tcpreplay/tcpreplay.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/tcpreplay/tcpreplay.hash b/package/tcpreplay/tcpreplay.hash
> index e73e2d2c57..6dc6e48f9a 100644
> --- a/package/tcpreplay/tcpreplay.hash
> +++ b/package/tcpreplay/tcpreplay.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking pgp signature
> -# https://github.com/appneta/tcpreplay/releases/download/v4.4.4/tcpreplay-4.4.4.tar.xz.asc
> +# https://github.com/appneta/tcpreplay/releases/download/v4.5.1/tcpreplay-4.5.1.tar.xz.asc
>  # using key 84E4FA215C934A7D97DC76D5E9E2149793BDE17E
> -sha256  3ff9753cc43bb15e77832cee657e3030dbcdd957fa247e6abacc605689e24051  tcpreplay-4.4.4.tar.xz
> +sha256  5126613f783062b43f514b05ad981376050a8fee35b03c8de4445ddeefd95049  tcpreplay-4.5.1.tar.xz
>  sha256  07cf5e92d475287a7d1663b33097f40cae5adf03ed8920fcd4374e3dfb48c8ad  docs/LICENSE
> diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
> index c5b3f9baa4..17766707e6 100644
> --- a/package/tcpreplay/tcpreplay.mk
> +++ b/package/tcpreplay/tcpreplay.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TCPREPLAY_VERSION = 4.4.4
> +TCPREPLAY_VERSION = 4.5.1
>  TCPREPLAY_SITE = https://github.com/appneta/tcpreplay/releases/download/v$(TCPREPLAY_VERSION)
>  TCPREPLAY_SOURCE = tcpreplay-$(TCPREPLAY_VERSION).tar.xz
>  TCPREPLAY_LICENSE = GPL-3.0
> -- 
> 2.50.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
