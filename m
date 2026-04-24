Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC64EFED3F0
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C60AA42963;
	Fri, 24 Apr 2026 16:26:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gonafokNumce; Fri, 24 Apr 2026 16:26:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 391A742958
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777047998;
	bh=hSZggql8YqHV/jLIfe2lRcIg6QqSNNbMHxgSLsNqT6A=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=J3XEx8hRJywnLWSOKH/ESQvliTnMEla3zTiMEmMECeWwSi+dcsBYX1yYlHzGEVkp+
	 KguxCo1htyz/s5ZPzQwnrK5yUCHd/vfn3i+kAGNrPHTMPdOf1YiP5WENNPvfYYYfEW
	 T2WmhEQLpMdoZ7kTUM8w3T7/QGpU2KUsulfScmMUoOIbt+yJFO1u0/ZIWTh5k1aC8Q
	 lNapCh+sCOKtqzRTVYJ4u+ZJChI5C8X0f3EkhGZPPRnJn9Zq1tKVqNFWAyD1SCvZw+
	 EAQ1QZPCe7guKc9EZc4BKAPoG0kjRON4HfzrzVZa6Y2rUNcblml4WveDRPRPAPK5We
	 0Ye4RSTF3eeKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 391A742958;
	Fri, 24 Apr 2026 16:26:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 71046206
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:26:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62DFE42389
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:26:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FX0Icm8FwrSW for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:26:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2AF52423CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2AF52423CF
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2AF52423CF
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:26:35 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-43cfd1f9fd1so4996641f8f.3
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 09:26:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777047994; x=1777652794;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qwDk63wyw/ZHMK9LMXzU3Eh02QnRg7oGIhylPS5i93w=;
 b=cWpY9e0AhkxddKhxaylWnXzn9HNXuTMs7cnm6RHxBO5aiYPHBJcE1mhnm+ggYAehFv
 PO/WUB9AnQrKwpo2lhSL2fQWMeQuFeT8fkg6aOiyTtn4+9GIKs/FgbbYw+JwqAHPY3YU
 yec9wKF1MoERfdbVh3pDZbnEXsxLEIZvjc1/GlrlzPTj6j0MvEoJlcuFI/NuEFuyCkmO
 HGeiWB9Y5o0YZOVgNsmu2j/HVX+CfOY4ibxn33hfZkx3Bmioljr39y/sQ8rSmGDS90lC
 ai/Q1tZbxR9J9kEVwlpUQWKzp3avdzUmeP37qe8okZTTMiUOorgaSHeC+kBEg73kvDv4
 yw2Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ8/6Z1XhqQ+HXsAs4urDm30sg4DFXQJg5ua4GKw+o7kMegMhz6fvdoA8IY4FOD2IWXNf+GlCQsUTr4=@buildroot.org
X-Gm-Message-State: AOJu0YwrpAXSt4AiuciGwCRjLDg4UsllDJ5/jCFQRpvfbJqDFdmMZYyR
 YdTnQji3UtwvjwOWXM53A+5UE3R/6j5Vx8c+KqrD2zJEgzqkvCcJMYB2KfStCVhKEtEDQlFOpu/
 gVeDy
X-Gm-Gg: AeBDiesBAdpajKIkJ6WMPPXHyFgrsOZ2qwkiMaIPaTSLjSMcuw022ZgUBdoQoNl0wkM
 iGh4XBQhlBTO2+pI/1aT/dssNJWS6y9jHnGV3jC+/dPaWUg7xaaLS4f+YzX89yMJ4aWD9SMdU87
 LMcr610u3CEwAY5Qda8x2iaV0IYCiz2yAE21LEClOZWHOlBAj79ATDFtnoPW8BNPCWIlmMuT7at
 HQNkwQgJ+XrHm1whLboyjzQVYp3uznw3agje74LAf81bMBnDYfi87UpHkZdNTsu1hZyA01x9ZDl
 5Ys1cgVpoK0+L2arnYlsUfzVGF+DZe1w1vzONNrQEGSDxKobi/3X0o+e4tmdwI5hgHSiHjupr/8
 z3kVOioWTE+/5z2gpf22t/onbiEH6j2x6JkZK/JkKK5YdGI4on4ZKiFB6FUezgPlJZp/QPflhLm
 k4xKUxlXIzJBk0cHLjob67GUNKdQ==
X-Received: by 2002:a05:6000:2212:b0:43d:7868:21e5 with SMTP id
 ffacd0b85a97d-43fe3dcbee2mr50210692f8f.12.1777047993768; 
 Fri, 24 Apr 2026 09:26:33 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4cc0f31sm60823132f8f.12.2026.04.24.09.26.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2026 09:26:33 -0700 (PDT)
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:26:32 +0200
Message-ID: <20260424162632.160712-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20251022163831.20816-1-dario.binacchi@amarulasolutions.com>
References: <20251022163831.20816-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777047994; x=1777652794; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qwDk63wyw/ZHMK9LMXzU3Eh02QnRg7oGIhylPS5i93w=;
 b=WzFcpWgnfctCMuPAqFW7NHH7Y5yiaIkCsv97oBx6TGrmqYZoydNCwW0D/4kIp1xael
 aAoW0+sJdlRkLYJHYAlk+cnxBe3DjrcrxFR+L/6gn/1R84sojvDCwobIDy0vZVK9pFms
 3aghgdpQdvOZ/doWZz1163r6Bj5/HqS5HCoxvV0IWS5ly9RLZZW94t606OL1BV4meON3
 srEOkMDm3LQG4vOrHor3+tEQou3/3evGcVu44S7B1Pm+KXAAjnx2P+qdohqcmrms3sGn
 lw5A189R8Hb7scgLfE6qTHhn2s4dCUFVqE/N9DfkrCFaQmKImSfw/c4YCG+2UiGrZVld
 3JSg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=WzFcpWgn
Subject: Re: [Buildroot] [PATCH 1/1] package/libexif: bump to version 0.6.25
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
> https://github.com/libexif/libexif/releases/tag/v0.6.25
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to 2025.02.x. Thanks

> ---
>  package/libexif/libexif.hash | 2 +-
>  package/libexif/libexif.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libexif/libexif.hash b/package/libexif/libexif.hash
> index 0d082aedb0f0..9e95e27f3ea7 100644
> --- a/package/libexif/libexif.hash
> +++ b/package/libexif/libexif.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  d47564c433b733d83b6704c70477e0a4067811d184ec565258ac563d8223f6ae  libexif-0.6.24.tar.bz2
> +sha256  7c9eba99aed3e6594d8c3e85861f1c6aaf450c218621528bc989d3b3e7a26307  libexif-0.6.25.tar.bz2
>  sha256  36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  COPYING
> diff --git a/package/libexif/libexif.mk b/package/libexif/libexif.mk
> index 858901f40eba..0e50d78fbed3 100644
> --- a/package/libexif/libexif.mk
> +++ b/package/libexif/libexif.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBEXIF_VERSION = 0.6.24
> +LIBEXIF_VERSION = 0.6.25
>  LIBEXIF_SOURCE = libexif-$(LIBEXIF_VERSION).tar.bz2
>  LIBEXIF_SITE = \
>  	https://github.com/libexif/libexif/releases/download/v$(LIBEXIF_VERSION)
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
