Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358ECFF885A
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F2AA41C46;
	Mon,  4 May 2026 14:48:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ifmBRiGmyE5; Mon,  4 May 2026 14:48:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3136541C49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906098;
	bh=IzOGkQ7x/lH8kjcRf/Q0kD7V1syoPgnhHyD+04KuWkE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eNrTe4r/OH2YjCNrv2EF0Zj4NfDOnn4iSGczQjnj/L8239EYArWBSF2PyP0GhWopA
	 nWK4kPnKkIKPsqakXgaSVpmDE+iv4z0aPOfp1dOK1D/HkblvVGPX2dDkEyxfB2i8qn
	 9/RLlD/ePTSSHntyg/pjIBs6K2zVVfnXLcoR3ciqhFHQWT1T7o/ev4hSYh8ovQFQjn
	 8xNUjMcQLJeVT3cIhiB8puwfYwDZTU4bfMMLtaVfDkusbyS68HurTavfS6t/jgdJOR
	 91cDWMAUwJWThxa8L06XKL2Xth9nIFjCidFs3apBELeAJ2IF2WLR0X3W/Au1FG73HW
	 gd0RlEdeARLSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3136541C49;
	Mon,  4 May 2026 14:48:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F315625D
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E459C6159E
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kFuIra-AUR5t for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:48:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 96E13614F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96E13614F3
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 96E13614F3
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:13 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-488ad135063so38309105e9.0
 for <buildroot@buildroot.org>; Mon, 04 May 2026 07:48:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777906092; x=1778510892;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5hSmO9MbQ15fJgXcIjeKoOJ4+mT8oYdpTMwRdNFYk5g=;
 b=F5p1ORH8MlYpZWttT6VYGJzB4S21vxX65tn2jrAXLnpGlR6d7g1wq8Q9yZyMYmSpUk
 F2r7jxVa3gMqwPz44aehCt22S1UahOO0viWzs4JuEjTCmYj4osccra3sLYJpEuyfqk6O
 7+Co/f1c+0JkQLeYBlzfBffDz48h5nWxSpjZhlTbjq34l1WiWSHkZYuFlN6XA+/9+nZR
 cO0KY5k1rgU6uOxG+qoifND5eWCZr4z4LK+SxT/n07P14pVfniOA//6EJ87KpdoEHO/W
 +h7BPZBmKOO2JEr/gnzvrI3LOktKO8uGvQeMtRK1RrhSC6Mc+c2wZ42hP9QI7N/qxIzd
 7Faw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/6bKPliXWK4YOK0bAnyCUfL/LaTdVWN8nA17mfoWF7N1kb1KglGKBAQGXTwSLU6ylPxiruFzp6CE4=@buildroot.org
X-Gm-Message-State: AOJu0YwlSwH2Ye8cDkfb93jb8iSyyifmD6p/jwSOhAzVIstsfaukHEFD
 S33jypCBmyW34zWfxDMEqpJzWGa9Pa74sTHMAj5oQ/UBb2oHyMGKqhR0LGwzhLDZao0=
X-Gm-Gg: AeBDiet5ZcMJzUBBiAj3ib/mjeTRFbk8T9vKBtxVRCRh35002Jgt9MZoj5lJcz8RLoO
 uzO6jN0Nz219ekWHY/Ey7Yo+R4NzTVLpUfi42LB6YUMXLNh8DUBn4FrRLrrmr03glTnaG0fE30K
 MPd1K/mtwUIf0U68u/S26zm5KjEp3mZhlGlINt9Ol1YRjSdBd6aT2kK1ACvNGwsqS+Cq2afRAyO
 ZTP8EHEIzeWVG3nl6M1//t+xSatYaiksRIdPdqMMgR01U/UAPaO4u0tCbrCOeHFSHvBDSYIRf5X
 JnXkwevdl/TKtJfXgYw4ZpgI7p3LjoRjj8gzH8yEoUgiyju1xQ50uiC8ysuFVLi3av/sp1Ta93+
 4gpH4gu8nOKFfPxAAdvTjDhieqMlH2k7vc6lin8i520s2fq+6LTD5U0X4uhcfq12kE2/aqH1EWy
 r9JXHYPcU/dsfO5HxNW4eeMsdi1mkzxjs82yFd
X-Received: by 2002:a05:600c:83ce:b0:489:1c1f:35e6 with SMTP id
 5b1f17b1804b1-48a98870ae4mr164182055e9.6.1777906091663; 
 Mon, 04 May 2026 07:48:11 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a8eb75fe8sm284017005e9.8.2026.05.04.07.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 07:48:11 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Mon,  4 May 2026 16:48:10 +0200
Message-ID: <20260504144810.11144-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260421185941.2721885-1-bernd@kuhls.net>
References: <20260421185941.2721885-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777906092; x=1778510892; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5hSmO9MbQ15fJgXcIjeKoOJ4+mT8oYdpTMwRdNFYk5g=;
 b=DwVe4xvJEtayV26HXZmtkA5kLbIT4NSwJk2XolYZSlXq5jEXw+6uDoUgTAWMh2NKMl
 1+Eot1sRif5iZ7BmOM+3CD3OpAtatYqad4lD2o+WzssIfRr4IJ45zWDPLVG+4mXufCu0
 3C6HOx2vLPp1pvKW8RKOAe9jkPYKQqHHcOR0/InMgDk1/qukSQ/LhYDdqET71gP2SLX6
 pXU30zYb7w2b8TdpDsm3ilRwaRaA7gnuoeFF9+BYzV+t/MN0YGFvT50SLd/ohxHO7AdB
 uZwX6LbBHX1QmKX889Um6MfNVsEDz9RPSVOIo319iNkizmDKVQfpA8oOV1ZmhEVuw46Y
 vK/g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DwVe4xvJ
Subject: Re: [Buildroot] [PATCH 1/1] package/ruby: security bump version to
 4.0.3
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
> https://www.ruby-lang.org/en/news/2026/04/21/ruby-4-0-3-released/
> 
> Added sha512 tarball hash provided by upstream.
> 
> Fixes CVE-2026-41316:
> https://www.ruby-lang.org/en/news/2026/04/21/erb-cve-2026-41316/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.02.x. Thanks

> ---
>  package/ruby/ruby.hash | 5 +++--
>  package/ruby/ruby.mk   | 2 +-
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
> index 9908fe8d4f..7512d1153b 100644
> --- a/package/ruby/ruby.hash
> +++ b/package/ruby/ruby.hash
> @@ -1,5 +1,6 @@
> -# https://www.ruby-lang.org/en/news/2026/03/16/ruby-4-0-2-released/
> -sha256  4618db85bb9ec04d8152d0099db488694a3d3c4f52106625e4ad547f1318db87  ruby-4.0.2.tar.xz
> +# https://www.ruby-lang.org/en/news/2026/04/21/ruby-4-0-3-released/
> +sha256  22cf6005d25bbe496b5ebe9224d63a1aaabfbfe02591bb5d612517c5a7836f29  ruby-4.0.3.tar.xz
> +sha512  5816fb264ce76df59f4bfe0cadceb45025fada2e61f2c14024d6b03f63d304820cddf94afcf82a4951fd12f3b0d9148683f856f3f2245d56042fc8407b6cbff5  ruby-4.0.3.tar.xz
>  
>  # License files, Locally calculated
>  sha256  a74812486cffbdc55141a5d9f165d782cbb202660d827622ec966237d4717b99  LEGAL
> diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
> index 6bd8ad43c5..7e6f6d8146 100644
> --- a/package/ruby/ruby.mk
> +++ b/package/ruby/ruby.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  RUBY_VERSION_MAJOR = 4.0
> -RUBY_VERSION = $(RUBY_VERSION_MAJOR).2
> +RUBY_VERSION = $(RUBY_VERSION_MAJOR).3
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
