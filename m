Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B9DCF9D0D6
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 15:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D14161CFB;
	Tue, 14 Apr 2026 15:46:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ie8LlGG-Mvha; Tue, 14 Apr 2026 15:46:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93675608C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776181569;
	bh=qTtKBkd6dm0Ad4DzTcWQq4VYP2gkcImkb/AeCevnwws=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UPQzJwtrZkTW4Z0h7qq0ZZqypaVOGwFWNHdJY7xE/Rg7Bh09SBAVcTURSeAwgdBKE
	 OBh4/Lv6k139xeFjZHO5eE+02N9c84n+sf2WTs7Sfk60m86TppkFVq55WsKgiJqFOf
	 NJ+Fydw5EeKWBhTQxyqstwlQM06hH/JsaEoz8Ofa2FbwArKXty8Y9KHfYIuGe30p27
	 6N4zlZ/+rWm1naXhyy1YWkzWsfOB2X9nc7flaDzh/jlvnOxIey5bOJP2lMeCMhlLus
	 zSmGmBmZM37+z9fR1IekOGfeuz7TGkl87gaBbUqE5y07i5f0ztD3M+Shc3/K8LZagS
	 9HeWxxz6tqg/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93675608C0;
	Tue, 14 Apr 2026 15:46:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D44B237
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:46:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9AC3E60789
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:46:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sktp0JD_W98j for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 15:46:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AD001606D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD001606D9
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AD001606D9
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:46:06 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-43d0deb7ad5so4522600f8f.2
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 08:46:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776181564; x=1776786364;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OOshWj524u1ok1CKOSjLtMrEQOvlh38r3IIsNLgQNnw=;
 b=CK/a6nl+rwpIakYXfSKVBdf+bEYW3F8JWsWI1WlhPmmc0elAridiyAeKvNjtvPBgVq
 NJRRP75dUSAKiumO9xNfgxGB+0KhSRZzcyl0nIZIRlLwSRIYpCDc/ChUqC6yApWJ9fR7
 EoEtMBHotw414EYmgyUnuk6RiOF8gtE26552d/Np8DAwZNWKAKa12E+fauGfe7Xdnj3R
 4VQ4D1F3b05ZIKFgbs7oWaDtbBE/jl6WknGuMC1GfVBLqelzmZpq1oc7Rx7Sy/Tq+7Yj
 xRuiiw7O+3tE+YDA6jAXNWF8zUF536lpwLYD+ckvj4zvKS9+kUUm/W1/zuA4j2gn4TfM
 Sntg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+nt7yNwSaduuwhapwj8VelNDbFhvE7GCY9uYO8If820OyeLBK5iuqFIga2+7pS8Eghx9BZhbAKTXs=@buildroot.org
X-Gm-Message-State: AOJu0Yzv/Hcst5Y/Gg59SnhtwMLomRcP0M3kbOzTbFzEqyYkKeRVgbAX
 iqBR6Raw/KecF5wG0buMdGmgvte+jJBTro94P7YLSISgT1iwzm+OyXplFlyPYBd/D6c=
X-Gm-Gg: AeBDiesxSF+G7d98bToxWBrmO8RgL19mz8460pTR84cdoN8eEIldeBKPrMSRqcW+LSI
 jcndtWGooni1DchdGLow74eafcKUPNUaxYAkcgChTIfrcbTajFT9sq47BFRF7+QDPgwo5oC0XF+
 nrd0mZv0fr+78AZMEtRztJu4TQJIYmNXPyZWKYZgu8a6tDCu/DFPiJOcSqBsxkgXbsW8Ox9begq
 X0JyRfh6An1hJsVDvCNmi3aVMgkjgnknT2Z/vluJKoT3PBM6xIx9Hs2XZezaRbFCUZOjlI/YPP9
 CR42hy6X4VWPXcSVuFX11WSFfGoF8pA2/QLq6oSoxP51vPnWZUVND8r/QXqOnGTAwBZy3MgSLtH
 Ez3w3QLirA+SGtoKlX/LyK3AJRCXHurZ40o2PoepgrkuXQy6vWeU0alXR4n2S4D8P8lo2nhv0aE
 jD2K+fJjWf5tQOKj4/
X-Received: by 2002:a5d:5f94:0:b0:439:c62a:6dc2 with SMTP id
 ffacd0b85a97d-43d642b1920mr28300309f8f.41.1776181564468; 
 Tue, 14 Apr 2026 08:46:04 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43ea764eff2sm5246015f8f.27.2026.04.14.08.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2026 08:46:04 -0700 (PDT)
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Tue, 14 Apr 2026 17:46:03 +0200
Message-ID: <20260414154603.335745-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331-fix-tartget-typo-v1-1-4f5ff0ea325a@bootlin.com>
References: <20260331-fix-tartget-typo-v1-1-4f5ff0ea325a@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776181564; x=1776786364; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OOshWj524u1ok1CKOSjLtMrEQOvlh38r3IIsNLgQNnw=;
 b=MepuM5ANO2UKGwHOAOBANAw2lYnuqv+IIf8PlLgZS948vSTsVuBM5hHiaZcEYfTLTN
 8pU71q0iiywmXCD7HExrrMRAdZLuT1JUjeVcY+aMxNgjtt8nzjxo4BS6mpHOr9V40jje
 UM52hORtFFSn+IITSeyIdycvfVGYopElwBzvi0s4V6rkUtQwHdBm7TDVW7IBRnvVs8Rd
 6tJAwYK7XTkDd2L+kXY584pJFg7/8q9qODkp9BC72GSEUHwJ8vb96x0x6C959i/uJIEc
 z0KduIZrG6PUOntgHxGYJJ2S2YIeTK6Uq+8uV7/BMB1GVQRyi7Stgq3E98PjW0+5HQH0
 r/Ug==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MepuM5AN
Subject: Re: [Buildroot] [PATCH] system: fix typo in comment
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
> Fix "TARTGET_DIR" -> "TARGET_DIR" typo.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  system/system.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/system/system.mk b/system/system.mk
> index 52e810868a82..3da9d3b2ddd1 100644
> --- a/system/system.mk
> +++ b/system/system.mk
> @@ -60,7 +60,7 @@ endef
>  endif
>  
>  # This function rsyncs the skeleton directory in $(1) to the destination
> -# in $(2), which should be either $(TARTGET_DIR) or $(STAGING_DIR)
> +# in $(2), which should be either $(TARGET_DIR) or $(STAGING_DIR)
>  define SYSTEM_RSYNC
>  	rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
>  		--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
> 
> ---
> base-commit: 9018402c2c0bd92be0664df82d943e11fe782a6b
> change-id: 20260331-fix-tartget-typo-8cc846e7647d
> 
> Best regards,
> --  
> Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
