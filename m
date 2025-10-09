Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6005CCD184
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 14:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A987583EA0;
	Thu,  9 Oct 2025 14:55:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KcUOXLJi6zuX; Thu,  9 Oct 2025 14:55:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96C5483DDF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96C5483DDF;
	Thu,  9 Oct 2025 14:55:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A6AB119
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13C9D41068
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:54:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id olwTFrNHd17e for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 14:54:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3CAF6410D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CAF6410D2
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3CAF6410D2
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:54:57 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-421b93ee372so587364f8f.2
 for <buildroot@buildroot.org>; Thu, 09 Oct 2025 07:54:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760021695; x=1760626495;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i7jllKb13c8GWaj4Kq4Wc5IjHMzVXAldRFTEhij7uDw=;
 b=dpg7giSo/p97JCQ7LCjCsxrVl2Z1Jk+QwkQTpJ4c2imieH4KlbMQlBw3AOu3/QJaKI
 0U6S9klJ1vzhO6uKACK0dPUFlOEUjfdiMgo02IYYpbIMAfV4FnV8s7e2ko6H98Fy+/Rc
 Iym8JCK4YC9vQOXcDNqfLsmEB8LNvWMKYef1+cAOCFXH3hGYOwjkf0BwfJL6ScuHaKLR
 IEQfKW8QGUnKdlexWsK5HIE1og0pSoksucGGjjWTxwheKg9u5Qt2jnv+lJ4kDWo7VCyX
 /If0SHMydeLTsDYJ4AxVd6H1/YGpwp19AtpvnmMdujN8phFHTAUeXGo7T7kCgwtmd8Oz
 4SCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFC8ekvvZs2+QpS2waYOf4M4tze1SYhoX/7KAm4j16cfCD9vmvfeYTXYR0T3XVoQGLEhNT/mCWaCo=@buildroot.org
X-Gm-Message-State: AOJu0Yzcwjgi7iNWThQJfccvoQU2NKh6W3hFJ3YCg+qTlW7P5regyGzE
 zMEx2O12QnN6ginvKhbtA8vfBLRBgXpQdTnhX7LetMPiVfSFx3KZ33DE0NmoAvcyTew=
X-Gm-Gg: ASbGncsdwDTHSHrZf9/tWbhC5OSu1Lyr+MHLxtXVLaFUaoOhnHaQXuRRLqFIQqjEq0X
 8Fen/KFIVez7fgseAEgiGPJCGRbXRCmRA7Zw5jKHHIhmkrLz9qglCjY8SWEoNBUlyfhfIK+oiQF
 Y0vq2lyesLjK1LEc4GV2ViUNkCBsgDpIL6r85LKrvclJuHWdTnUcs0G3dLhXAoAWEySRFHXUgUM
 HCKfSokNHtNJ6wi86bYzzg7/hSbpUDwqsnR/atqZnHUAJthsjMpYRND0d8hx7I0+yz/E365CGBq
 Qyskqti8a9hxgASm+NaviaArsrxi7RHL/8hRN3pqL81F10mlVSyzZ+T9ObXMPGulCFbKzQ4dPqb
 lKlRf20EmrNRAAuGCmHMOOmcCeRuRKsvkmD8fbQiy
X-Google-Smtp-Source: AGHT+IFJoMf34MyeAZw/H56YGeeXNESUnWbMII+V6v7de/XMcxk6XfGvZIyXyLUjREQrhGCepi03fw==
X-Received: by 2002:a05:6000:2c0e:b0:3ec:de3c:c56 with SMTP id
 ffacd0b85a97d-42667177c79mr5330116f8f.16.1760021695195; 
 Thu, 09 Oct 2025 07:54:55 -0700 (PDT)
Received: from arch ([79.132.232.153]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8a6c3esm35496854f8f.1.2025.10.09.07.54.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 07:54:54 -0700 (PDT)
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  9 Oct 2025 16:54:54 +0200
Message-ID: <20251009145454.483042-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <aOJcQeRIGwDSpK01@waldemar-brodkorb.de>
References: <aOJcQeRIGwDSpK01@waldemar-brodkorb.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1760021695; x=1760626495; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i7jllKb13c8GWaj4Kq4Wc5IjHMzVXAldRFTEhij7uDw=;
 b=WMoa9XPjiG/TqkOFRWJKBSiVVq4/Jqjde8Lhn/dus48UrKlBscPG/CWKY+4BDxlt4a
 KG/I72wvElGroEVn6ulBzL5+ZKESz0e3apNaUXalBRGM0Srba+VazIVkr9hsFNivv8Qq
 O5FqRFM9itC/h152cwhAOTjjHoPxsoF7/IA34CUXhhVo70iIwARqAr+wqb3dtBWNslj8
 u0GMSfMqpmYjdNNH0PUrXkxAatCrUVt+AcZUuSFaUPc2YXGfKwIhKU+3meFCe4cCrtOU
 NLS7onotxhBadXFVzQ/W/EVOWqxGvgQq5RBvWrGvuEUTrjn6djTaw15QtcqUE0BN3faz
 Z/JQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WMoa9XPj
Subject: Re: [Buildroot] [PATCH] package/ruby: update to 3.4.6
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
> See here for changes:
> https://github.com/ruby/ruby/releases/tag/v3_4_4
> https://github.com/ruby/ruby/releases/tag/v3_4_5
> https://github.com/ruby/ruby/releases/tag/v3_4_6
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
>  package/ruby/ruby.hash | 4 ++--
>  package/ruby/ruby.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
> index ec17b092a4..90faed4c32 100644
> --- a/package/ruby/ruby.hash
> +++ b/package/ruby/ruby.hash
> @@ -1,5 +1,5 @@
> -# https://www.ruby-lang.org/en/news/2025/04/14/ruby-3-4-3-released/
> -sha512  b30aad675cdcc1bdfe9e5fffe9d1925db3b3ac854a5e34180c368bc6e66f73e29ba5d802fea249353b7d799c01384c58bdd763fd1b679303158baa7824b9c08e  ruby-3.4.3.tar.xz
> +# https://www.ruby-lang.org/en/news/2025/09/16/ruby-3-4-6-released/
> +sha512  29000b3396ab95fc2dc13d2d78441ff5c34258e5421115181c54b1b4d55d5c0d4f3d0c3cec6b32b9a1bb8de5c51b383fcad4369ec3fb244fd0ce182afbe79ba4  ruby-3.4.6.tar.xz
>  
>  # License files, Locally calculated
>  sha256  a2021e52d5d6adf7e3f45aab9d2b860ce03cdf6153776853e11d5668193eecfd  LEGAL
> diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
> index b06a728799..ffe42968b5 100644
> --- a/package/ruby/ruby.mk
> +++ b/package/ruby/ruby.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  RUBY_VERSION_MAJOR = 3.4
> -RUBY_VERSION = $(RUBY_VERSION_MAJOR).3
> +RUBY_VERSION = $(RUBY_VERSION_MAJOR).6
>  RUBY_VERSION_EXT = 3.4.0
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
