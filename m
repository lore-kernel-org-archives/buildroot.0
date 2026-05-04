Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE5FFF885A
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8679041C3D;
	Mon,  4 May 2026 14:48:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QAXzJ5NMUk5M; Mon,  4 May 2026 14:48:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B56A141C18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906091;
	bh=O78SjY0RzkcQZzs38+y7GdCffofgnyM1rMXQLTb0rrk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XYZz9OJ7VVC8Dsqh9Q4hL+wSOc1SD5/EnHFLZjQyCuG6+m/wDCjFTDtH9zjn1UpKg
	 XxXHGTU2ly9UKiyuRlLtja4gP87MdOpEVM6yE0bwzOSn7gGVZmdSE2YGTTBFTKD1VC
	 yLYprF2aYTM2W8VspRrGO8i3nGKVJM0DdCv8W8pxmR6iswuAb/lkGEl9mJ7wdJLkJE
	 TkWF/xsTDImXFVsgoZdFhIpAp5IvQzbCTi6mWh2+TOsNB1U4boJXEG4nSoBoGcaQXZ
	 Fb4HgSaqv75rPD/ylowrNyF1xTUFA88B6xFsFlC04F50Hcw+8teZlE7EOEnyjCHTt+
	 Mr0vfP+cyYG0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B56A141C18;
	Mon,  4 May 2026 14:48:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A170A25D
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93AA7845D6
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JEXHiyJFCxaC for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:48:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8945C845DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8945C845DD
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8945C845DD
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:09 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso30318565e9.1
 for <buildroot@buildroot.org>; Mon, 04 May 2026 07:48:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777906088; x=1778510888;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Hnduu5p2LqDaptLbGtKbo93KIaInbVoNSBUcM9N6RxA=;
 b=Fs+P0JFCYNKtGb8131/JAwHqckXAin4FEMEmxsKn/Bs2kCJBiqqi5iFPOyHMnuRR5t
 bmU5d6dJ9/c36g6VgcD9ErctdZzJcMI2mqhq8jVsiwunfkzUCpqSuVq6bdKVTo7aHnSe
 w9TR1ILDOlvWTLKVnGaoloNanXTjRZopIiR5HCxUKmsCkAUoM7plAfLZMVomhnFiDbgP
 iD7hYw7iL8yhMZefhk4huLlJIBE8ZePORe652/KVA0s2ep5WuRlKIEMq9oDHL43P3Sel
 TB5X6nkfhaZJXWM+JSBznc1rDNZfrMHdLTYoYtELmF/ebrzd6JdxEddMnrVB6LBbR0UW
 NTUw==
X-Forwarded-Encrypted: i=1;
 AFNElJ937Izw4SLPUnom8rNupi/7Rs/8Wk8tdW4dxBh+KgZlpqneqKYsiGg2SICommYP3/mzu2ZaEQDzDF4=@buildroot.org
X-Gm-Message-State: AOJu0Ywov2ayTeW0CMjepkYLWWbhlvk5OZ3tLnOjMSVYhNZiR5dI5lrY
 gNib2rm6dEzuW1Qy+v2HZiIzgXHoNzupmpy7QxcmjqbzC23Xy9UpMVxOhNzVY7096WE=
X-Gm-Gg: AeBDietB6iP5ZqOnNBx+FN2aHM1VBwc+GUJ0qQwM6tgjx2Bp07Nq+ZqawBsGseFEuFy
 SYapWd0tk5xKaIhK+Sg0oJXekXrwGB+kpCzwnEdtF9jLkntXoYv9fuXnX9dtSp2p6Lht0Kdk+Lp
 Go9Pg2az0z/N2M6t+vPf0YwB6IEXn5qpw/dXSJ0d3ngh3KPhUNzgb6NgBL5xcm7Zq4hdcryizcB
 2btRYvtG7ItnCtQhFgDazis3xlmY+UZvM7KC72EP4M+R+1qV5J7Faxnbx6rpvnh/aVXoOu83Amg
 ZFzWE0BYMHDb/cZ48GNbZXildIxIFa0r6FLCGlwjbMX+0MEbByz0eRwTY3ictr/5VKAWrDWfwO3
 rO/aeUg/jrbEoehqx3BmNwEqkWzZFfu5lR1++vM9p1LZB14wp/SLzXEm6Bu7uwKZ4XVt/XMj/Fv
 twBBZzggAsXh3qRCoDTrqid/Q9/vFS30L/6a0g
X-Received: by 2002:a05:600c:c058:b0:487:2671:fb8f with SMTP id
 5b1f17b1804b1-48a98874de2mr128628725e9.8.1777906087652; 
 Mon, 04 May 2026 07:48:07 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-44acad8f974sm24031303f8f.23.2026.05.04.07.48.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 07:48:07 -0700 (PDT)
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Mon,  4 May 2026 16:48:06 +0200
Message-ID: <20260504144806.10935-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <acDe3WDkqsQZlkOK@waldemar-brodkorb.de>
References: <acDe3WDkqsQZlkOK@waldemar-brodkorb.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777906088; x=1778510888; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hnduu5p2LqDaptLbGtKbo93KIaInbVoNSBUcM9N6RxA=;
 b=GavEOsgzQeX1x0RKVq7YxAKABsZvpLf+WL3U6mTMqbmy4di36NLdLngxCfFBjfR7Kh
 IHJjNwn8D+mPiFmBLbNydSS8S1StGIXjByxqODoFx2NzYb+BDxkx6cRszdDs3i7RclSG
 MdjfGv+apb3tn3/kpOsV35hi25jfZHEXX1rlXOo2jT4URxJ0zRKZW+g/P7VvomRm0P93
 4eQJ/OHQn3f6Cu1f/k9NXZp3DRpWS5r/VuvttSezynde8HsV367YuyvAVdqS+ErdZ15c
 M7U42ZhMz7dyL59++HxDHPfT174GUbPkgpH9WqP47ySS/6g4jMjpzDp5IagMHzytxsqQ
 pL5Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GavEOsgz
Subject: Re: [Buildroot] [PATCH] package/ruby: bump to 4.0.2
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
> See here for news in the release:
> https://www.ruby-lang.org/en/news/2026/03/16/ruby-4-0-2-released/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to 2026.02.x. Thanks

> ---
>  package/ruby/ruby.hash | 4 ++--
>  package/ruby/ruby.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
> index bd64f97339..9908fe8d4f 100644
> --- a/package/ruby/ruby.hash
> +++ b/package/ruby/ruby.hash
> @@ -1,5 +1,5 @@
> -# https://www.ruby-lang.org/en/news/2026/01/13/ruby-4-0-1-released/
> -sha256  0531fe57dfdb56bf591620d2450642ea0e0964f3512a6ebee7dc9305de69395f  ruby-4.0.1.tar.xz
> +# https://www.ruby-lang.org/en/news/2026/03/16/ruby-4-0-2-released/
> +sha256  4618db85bb9ec04d8152d0099db488694a3d3c4f52106625e4ad547f1318db87  ruby-4.0.2.tar.xz
>  
>  # License files, Locally calculated
>  sha256  a74812486cffbdc55141a5d9f165d782cbb202660d827622ec966237d4717b99  LEGAL
> diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
> index 5e8b40a556..6bd8ad43c5 100644
> --- a/package/ruby/ruby.mk
> +++ b/package/ruby/ruby.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  RUBY_VERSION_MAJOR = 4.0
> -RUBY_VERSION = $(RUBY_VERSION_MAJOR).1
> +RUBY_VERSION = $(RUBY_VERSION_MAJOR).2
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
