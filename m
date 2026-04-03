Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDAECE7E363
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 10:28:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9023D61119;
	Fri,  3 Apr 2026 10:28:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wbghIY7JgZgl; Fri,  3 Apr 2026 10:28:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD3936110E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775212101;
	bh=2bhybxwFokN89wKNNEUn2dyD9qFw4ResO/dKSiln0n0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=goD+KdsQroSqUf+brH7YL89H482p4L9v34WjLXuaPwFcvnlINHPQ4NIoIRInqhfnc
	 DKbnMb+eWoENDvcgL/8bokei7ADtClafcd1FEIasG3gtJMhw3iR4mc0DucXVrR1HBT
	 5EsGjz108tntcDgizApZ9bhMdhWNxBgCqEsU2i1sca2o93UESjizo5tEsskCD2ISQk
	 2JOI88LvqAD5BIv9Owrchw4NuQrq9OIjxEPEQ5gdFdjAa2UXMkwV+b6LJDWPeNQPrJ
	 Zl+dN2FFDflOQSWUllBSH9vWxvYA75kIjulwyONWDePle+7cbL2VoM6ba8/mgNf5je
	 1lNCdrbKznibA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD3936110E;
	Fri,  3 Apr 2026 10:28:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 96E641A9
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D53C40E65
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sx8AhjVJUFZn for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 10:28:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 81AF940E55
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81AF940E55
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 81AF940E55
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:16 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4888244e9f9so15758815e9.0
 for <buildroot@buildroot.org>; Fri, 03 Apr 2026 03:28:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775212094; x=1775816894;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Y3f5XNarwS9a+7WdlM+mIc+4iIW4BMptLKXwMj1WWRk=;
 b=lB0Z8GJiMZZXenLb7hvtdDUm1TmqzMp663cLKi7YCaqgFIC5UrUGBQEU+Hv5uw1w/R
 ZPdcIgJagr+ggnb4llk6KbLNz7/7KRs1fjEzOnOOXqwPwdClVtK3AOOITEXMPU7p/2fE
 e4JFfmXqNZoy5xU9NXqXQPKh/WGaVUulNOXFkfWXgoHMPIKDWD+i7sPvDSaMQeMhhbP4
 b56QSsIh8xG+clt01ufH7zYFLNkLQJ7ROTBtCopx/2MdQgFMFnC209LIujkYxVSKIniG
 deMgCQQUjcIL3c7/H3c4k2EAErHlFDFVYkv6PFgGZo8MNtl9dBQKSaqs8c9ppPB3c/GB
 hYWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUha454OhwOJ09ZV3SdICV/7acxvEIdPwScfz3na7dNehN+bDjD0sSmniO2Eawlc6Rv7Rej6oH18/k=@buildroot.org
X-Gm-Message-State: AOJu0Yy7gnNsEBAeoby+znQXN7HKrruE61+y4pGVrF/IKktXo1LxOz6b
 Bgk3z5B4ZIUZXWN7/EXHdLzELa6r+HHrnyMBDhKzcFiBbztSrBv9FfKxEc5ZrHX++PCvoLO2VF7
 9GqpFLt8=
X-Gm-Gg: ATEYQzxodCkeOgLbZh8aC8T+r5uLkkmxzhYDlQ6r/U/OwHtCFNvTLQNIAOWD5kZhGcU
 KcHt0FFkV+KyHnR7zLPhQVrJhCrlNk+1CHVIXfifkY2JTRP2+PIY20Pzckz20BhwqnUUIEDs5+A
 3uNdn0/Tum8ElLtjgfnKKnujwI9pjAg7O4Mf9aGGNv+Oh7alidVa8WkcnOQs9HEtP7iBtzDaRoZ
 g0c8aHP34D1ilJiQ3p+od49Q5g7HF3yIDmGI/266UIFu5RRxUnxRSrhJmFURP+V3ejKuMhT+wZ3
 mAfylAHVBg8nurTw+6gAemYMGSHLnZpNK3kXQksoPtPf7VPE+KIYi8XePZk66oGsnsoxqfFd3HI
 ZBezz5qKbH7sHe9qQctJFdpC+bdCSmX4rCeNA1xhPmVkPc+EPG+VSlhVy73Iufi3lcg8lRQ0Xg2
 DTgd40Ug066w2K4QPh
X-Received: by 2002:a05:600c:1d86:b0:488:8b52:f7de with SMTP id
 5b1f17b1804b1-48899715a69mr32891035e9.12.1775212094352; 
 Fri, 03 Apr 2026 03:28:14 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48899e7a024sm15921475e9.23.2026.04.03.03.28.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2026 03:28:14 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  3 Apr 2026 12:28:13 +0200
Message-ID: <20260403102813.210570-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327175743.1982788-1-bernd@kuhls.net>
References: <20260327175743.1982788-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1775212094; x=1775816894; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y3f5XNarwS9a+7WdlM+mIc+4iIW4BMptLKXwMj1WWRk=;
 b=Uxso8Eu0BdhDIStuEidJjkAKfkZA2NnBzUJx7ohoFD8LVhue6kv3uOcKBq1jaXI+ME
 KtlB+kO2cSU4T0YkroaFGupxnomoZCN5ccRhabX+XmH9rssffZi7si6uyGO7s7e9r92Y
 h2sqKb6JRcrbhkjNDyijH+0fqyuXLpNTfQ+m4+ibAHGi1nscP38ekDHetgQ1x8YRuJ2K
 ClB15uqXf5r+1Z/4c+Av2BLJgzlzasvlHGIXfi5PGhFynR8STZpC/jWmbLC6ZV0ljiMD
 Yc0jAV8TZKkirHq/1PBCKR+cMYxU9vbpBiScWh9mjmgIONxXXfy6VMftjKLm3Faa0FC0
 SLQw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Uxso8Eu0
Subject: Re: [Buildroot] [PATCH 1/1] package/libpng: security bump to
 version 1.6.56
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
> Fixes the following security vulnerabilities:
> 
> CVE-2026-33416 (high):
> Use-after-free via pointer aliasing in `png_set_tRNS` and `png_set_PLTE`.
> 
> CVE-2026-33636 (high):
> Out-of-bounds read/write in the palette expansion on ARM Neon.
> 
> For more details, see the advisories:
> https://github.com/pnggroup/libpng/security/advisories/GHSA-m4pc-p4q3-4c7j
> https://github.com/pnggroup/libpng/security/advisories/GHSA-wjr5-c57x-95m2
> 
> Release notes:
> https://github.com/pnggroup/libpng/blob/v1.6.56/ANNOUNCE
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/libpng/libpng.hash | 6 +++---
>  package/libpng/libpng.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
> index 7901f82c3a..ae28eee087 100644
> --- a/package/libpng/libpng.hash
> +++ b/package/libpng/libpng.hash
> @@ -1,5 +1,5 @@
> -# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.55/
> -sha1  13f7bedf27009e59961f823cc779a5f9f5341a91  libpng-1.6.55.tar.xz
> +# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.56/
> +sha1  71eb3636e60b6ea66f2f670cdf1f7160b7a1fa8b  libpng-1.6.56.tar.xz
>  # Locally computed:
> -sha256  d925722864837ad5ae2a82070d4b2e0603dc72af44bd457c3962298258b8e82d  libpng-1.6.55.tar.xz
> +sha256  f7d8bf1601b7804f583a254ab343a6549ca6cf27d255c302c47af2d9d36a6f18  libpng-1.6.56.tar.xz
>  sha256  bdb0a645ea18c60507d0368379b1ac5474b92255fcc2d115e07486a7672ba526  LICENSE
> diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
> index 01c1cbbec7..7c5bc35a77 100644
> --- a/package/libpng/libpng.mk
> +++ b/package/libpng/libpng.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBPNG_VERSION = 1.6.55
> +LIBPNG_VERSION = 1.6.56
>  LIBPNG_SERIES = 16
>  LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
>  LIBPNG_SITE = https://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
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
