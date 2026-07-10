Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B3DAC43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D878E40D9C;
	Fri, 10 Jul 2026 13:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 01ZYD1kbedmu; Fri, 10 Jul 2026 13:52:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3CFE40DC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691571;
	bh=ixjv4ZObvD/BdToA9xjSi6oMPq/SxlzchS5aE3Bu+6Q=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kkfiqsbp71xcqdHgP5cB8KNFEG4YRNnbbLWX5+hh1KD9+zOPcrN3DWlMwItglDVJM
	 2dURvAukwyctNdfDQhP+IpGMf3vn5wkNuM0w11m+q4Vx7Ha4DwDzAQ/5AQ+vivdMPf
	 VXH6TgMKdlHrIdKYd99ZhwJ+8TiN7DmEjHbbGnltWtwLsvtRcp/DQUil8Id5EyZRq+
	 TcZn76m49cj1iCM5vMKoPWKVvtLS9AeEbwTnz72j/0Rwq5EoolnGqzAxIJg1cA+6Tm
	 WW5Tg3o4UHHfhVkB35xg6OIxpHaYS5WaD6+QEKL4oW0G+5jPKH9c5LACJnCQpb875W
	 zo7A7jrkeRD8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3CFE40DC1;
	Fri, 10 Jul 2026 13:52:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 93108A3C
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8514D606FA
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pfl4fKkALs6V for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:52:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 68D4C606B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68D4C606B4
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 68D4C606B4
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:49 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-493d92b7db3so9090115e9.2
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 06:52:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783691567; x=1784296367;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=2xN9aQ4REGc2CtB9KYEeYNYBnfv++bqdfrSL5D+WlbA=;
 b=qO5akn8HlddtcZ5yMhOAeLHVgeCoGV8JhPDAbfZ/Nu3bBW1y1lTjsbwyDkERX/Vd2O
 re6m8s8ARHEbBCMjrr4lakOAg18nf5YT7L82NZgeMWLqXdM+vWoIZu+wpdvcJ3kBrzit
 83+TwEGHAIvy1+HvdwoyyqnG1XhICsfUjVui+ZC4eoBjMKLJpDP2zV8eARz9VL/DiKrS
 IY/y10YRrkZ0ZXDHXhw6n+QQzIWc5+ygkgYpHQQiOi/6ZcDjRq5vPnuH9B+6tJVCk3Ak
 QpZS23gY4xQEtAt3dDPDxzNxWdSyG6y3R+MZnL+BKoj6e6/vm4bx/27Gbbr634hkCG6z
 npKw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rogr2HhU0c5Vos5aoXFJu0REET7apLqBQm/8hTATj98TXXXTxuG116GRud3R0EF4tJ29159Ih0b5WA=@buildroot.org
X-Gm-Message-State: AOJu0Yw17XW4QDgyJX7d+Bioy2nwK9r5nOeXUd4/Is3uyhMGoQFqK4pC
 //1RcmR9BSc2xP+F1ANIwiwg7L8L9jtAqm7aC5uAVlVBLe/pXBeRpPLbJVsbczU0jbdtewBFv9H
 o6tai
X-Gm-Gg: AfdE7ckVDEXoCzIlMKON0RkBO0CWhCrpF5w/ZH7bY7bvPkBoBkQTnHpxZId7dy/zbJo
 qK1zGVGpYsQ3niPnIYkJ5lX9AE70z6GWXiNjlJkLpWhDfRgFAJuKkZ6L0virGruiwL3zu0bv7d/
 LGvs9cDJg2atmAq3Yj9fVNCpMkgja0Ld50B1XB3rPdFKKNw4TQA3dkhIJz6pfsNuuM21ENAOfa2
 LiDQOx+ojU0A9aFc+Kqyz9ahWu/edOm4vg/VEddU8CCglr2T853N7wrLceEOVoZyMO38Z0ir4Sn
 atedAFdWTOBp8DXQOlT+nBY2BfUPb85iCUUc5r7/DqtFzrY32fdH5uEw8Xz7PGN87HiDI5866Dg
 j7+vg+mYPENDVp+jDxfgsCEw9NLvUeb///fjucnB0zUvOT8t8zFFE+upcYkP6fJWidJ5bRM/Ais
 zltPI4Zw==
X-Received: by 2002:a05:600c:e555:10b0:493:cd3f:d051 with SMTP id
 5b1f17b1804b1-493e68ddcf7mr86095065e9.25.1783691567298; 
 Fri, 10 Jul 2026 06:52:47 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493f567eadfsm38640585e9.6.2026.07.10.06.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 06:52:47 -0700 (PDT)
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 10 Jul 2026 15:52:46 +0200
Message-ID: <20260710135246.760974-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <akYJoolzlfi9uuQW@waldemar-brodkorb.de>
References: <akYJoolzlfi9uuQW@waldemar-brodkorb.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783691567; x=1784296367; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2xN9aQ4REGc2CtB9KYEeYNYBnfv++bqdfrSL5D+WlbA=;
 b=QQVh2WwHJkirDgp/ZwIxwn81iCHuPjALCyXfnMCZHhyAph2ucOETRznXJv/8u5oxqc
 v+fsUGewzgqr2nx/DSHKKaKW/oh5sBb0ruhc1TR9Dmb0YwDybsgqUv9TwuRxK6E8JPgZ
 W02EnSTM2d2+MqVOoFNgdhJG55DtToFFYVHugBs8xRNFvyll/B6TwLhd2u7Yb4SKU8Q7
 CszluGT+B8Il2KGlaZwCfXewoomlCLo5QdwOjqqGKxSWxkInk8/mze8hg83UpGFHJlPU
 d57CdARHcb+nUjPJa481F2zBQaI1B372NQkgqlA97+/2tkd7MkVZ69PwZ5zSAfsU95fj
 +4Yg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QQVh2WwH
Subject: Re: [Buildroot] [PATCH] package/ruby: security bump to 4.0.5
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
> See changes here:
> https://github.com/ruby/ruby/releases/tag/v4.0.5
> https://github.com/ruby/ruby/releases/tag/v4.0.4
> 
> Security fix for:
> CVE-2026-46727: Use-after-free in pthread-based getaddrinfo timeout handler
> 
> See here for details:
> https://www.ruby-lang.org/en/news/2026/05/20/getaddrinfo-cve-2026-46727/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to 2026.05.x. Thanks

> ---
>  package/ruby/ruby.hash | 6 +++---
>  package/ruby/ruby.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
> index 7512d1153b..453c028d22 100644
> --- a/package/ruby/ruby.hash
> +++ b/package/ruby/ruby.hash
> @@ -1,6 +1,6 @@
> -# https://www.ruby-lang.org/en/news/2026/04/21/ruby-4-0-3-released/
> -sha256  22cf6005d25bbe496b5ebe9224d63a1aaabfbfe02591bb5d612517c5a7836f29  ruby-4.0.3.tar.xz
> -sha512  5816fb264ce76df59f4bfe0cadceb45025fada2e61f2c14024d6b03f63d304820cddf94afcf82a4951fd12f3b0d9148683f856f3f2245d56042fc8407b6cbff5  ruby-4.0.3.tar.xz
> +# https://www.ruby-lang.org/en/news/2026/05/20/ruby-4-0-5-released/
> +sha256  5dc5521ea54c726e6cc10b1b5a0f4004b27b482e61c04c99aed79315e30895e5  ruby-4.0.5.tar.xz
> +sha512  379d78a6d1af0455df60da46551f43438ad3ee81f83787554fc34cb1c8febb1bd363e3dc1a057b34a69f96526efc308d3dccc4b87d368897c2d1ccf179096463  ruby-4.0.5.tar.xz
>  
>  # License files, Locally calculated
>  sha256  a74812486cffbdc55141a5d9f165d782cbb202660d827622ec966237d4717b99  LEGAL
> diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
> index 7e6f6d8146..eae9db2156 100644
> --- a/package/ruby/ruby.mk
> +++ b/package/ruby/ruby.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  RUBY_VERSION_MAJOR = 4.0
> -RUBY_VERSION = $(RUBY_VERSION_MAJOR).3
> +RUBY_VERSION = $(RUBY_VERSION_MAJOR).5
>  RUBY_VERSION_EXT = 4.0.0
>  RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
>  RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
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
