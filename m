Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B6CEC83F1A
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7379B60EBD;
	Fri, 11 Jul 2025 10:44:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FQFCaqXyBPII; Fri, 11 Jul 2025 10:44:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D7C261438
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D7C261438;
	Fri, 11 Jul 2025 10:44:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C77F1199
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE50340510
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gpKep53wnklT for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:44:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C971F40251
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C971F40251
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C971F40251
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:51 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a6d1369d4eso1164515f8f.2
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 03:44:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752230690; x=1752835490;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dZUPSX3pg6ibWJy1eVLUaqFbx+VlFFqvwx4N4UowS/c=;
 b=mmg6NmcH9U5L/v40LD9PJYRVgplCk/WxxDIG03fqIMmaGcXM9J6W7yeyZltMvJQ6vC
 xJS1/EnOOpCXECzaHcs5sWP512oV0CHJqOi6XWDEFfBu7QZypuNpnMk2sE0WNNxkzzU9
 fYHfUC8h/PlwHDhFdS8l8F55gGNmfk0fLdsJer70GvthmaQX2Pya21jRnDokyVc3j6xF
 tuQHnvKPdbjL1rAjs9H3t47Ao/v1dRXGqPV4/R8qDBNvwd47OthjT2IYS668HojRXoIj
 qwyfkc3+oTdl5KH26T3amLkGMy2P3AqImuMbEIxsi1ZIIlCJt8xDOj6ORW4+0tbIVYqI
 2Ilg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCXXMlm5BIuE8K/lLwU5kxbO/Ga/Lh4cosL/Uo81XT4QBosaHIirATJCz9hB325bZji4ltfd2FQ0Q=@buildroot.org
X-Gm-Message-State: AOJu0YyJLOjHTlWcpPqHniiSrV4BZnyGLnT0eYOayorNZ5Pv+LYzQ9L7
 6sa/mAEugban93Zm2M96NMY0XvCZ3UpaEYVKXh1/h27lE6GX9TdCm4ao7kolPPOgpJg=
X-Gm-Gg: ASbGncs5n9YxOK/ZCFGfq1c4U79hw/jho/jD3DHIUcjJxsmdGEi3XxAv2ypa+TvCCU/
 riuwx4DhWXp3IziFXIe/7r+YYZ0Sogp995OAozN4tfl3AJTxUTlr00AuiWUDurZQZUBnnbFkVKe
 WmyBaJvJT/sesCSK1kpfd2M2xLVRniR2jHAxWadpgEHPRbrqIlGMkBmX5tF8LzgcahO12F3e+c4
 eKi9VScEqTT2eBT2OxM+hd68XBTPTkZmVBS9wTyWcebIo7lwQgsI40z3d7rKKahg+5Xhue2hnhO
 oOgjlLe4NNEljjr77gbHETLu1Nf+PIjh6Sr9A05CBI06mx8aBi14hW9Em3g+BGkJdROym3gY4NF
 5VSkHyl4VvV3i+Q==
X-Google-Smtp-Source: AGHT+IFZVgVjiRJajWVYogJ1Z8PTVSl0Kn7pQzCZqChJUj+mhOxyZutVcistcM1tj0WQS6yG28TMjQ==
X-Received: by 2002:a05:6000:4202:b0:3a5:8a68:b815 with SMTP id
 ffacd0b85a97d-3b5f358792bmr1523898f8f.46.1752230689852; 
 Fri, 11 Jul 2025 03:44:49 -0700 (PDT)
Received: from arch ([79.132.233.65]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454dd439051sm43916225e9.8.2025.07.11.03.44.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 03:44:49 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 11 Jul 2025 12:44:48 +0200
Message-ID: <20250711104448.823828-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250702100710.2191088-1-peter@korsgaard.com>
References: <20250702100710.2191088-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752230690; x=1752835490; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dZUPSX3pg6ibWJy1eVLUaqFbx+VlFFqvwx4N4UowS/c=;
 b=L1CiddRFP+5QWErBmqBU45zbUvTCfohKxj78GZurRxPEHpqwOwMWrUI7Mb6y1fdcgZ
 27Py+FVRZWd3thpmpnDq7KXw9SqDfuy3hxEmP1mIjVGFVh7JYkmDn2EeOwCK0EW8eGHU
 9B3wBtgiGGeQXf3XNscDtoC1/863TR67S29bPLGeh2/Tck/gbc0r6lVlX09g6JyqKkdz
 5ZXRzf8VHPhnOAWOpAeWbNGj/an+UJeS22emm4hfbooU6PLzLPDihj/5nU48oKpyyb+i
 nzu8OolS3PynAIBS8Q4Cf8uZmpnH9oYUvTyHoxCdUycnWTFUoBqv9sHd9escT0F+JqdF
 07PA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=L1CiddRF
Subject: Re: [Buildroot] [PATCH] package/jose: add CPE identifier
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
> cpe:2.3:a:latchset:jose:14:*:*:*:*:*:*:* is a valid CPE ID.
> 
> See:
> https://nvd.nist.gov/products/cpe/detail/7E6A7E16-E8B0-47BA-B7C7-0D4102933031
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/jose/jose.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/jose/jose.mk b/package/jose/jose.mk
> index 9fd9d1dcaa..88050be5ed 100644
> --- a/package/jose/jose.mk
> +++ b/package/jose/jose.mk
> @@ -12,5 +12,6 @@ JOSE_LICENSE_FILES = COPYING
>  JOSE_INSTALL_STAGING = YES
>  JOSE_DEPENDENCIES = host-pkgconf zlib jansson openssl
>  JOSE_CONF_OPTS = -Ddocs=disabled
> +JOSE_CPE_ID_VENDOR = latchset
>  
>  $(eval $(meson-package))
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
