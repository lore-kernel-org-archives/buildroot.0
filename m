Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 876E0CD6E45
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:30:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BFD2615DD;
	Fri, 29 May 2026 08:30:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uleDc2LqJkDq; Fri, 29 May 2026 08:30:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EA15615DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043448;
	bh=7ChCqQBhrP8ZkoeBfmYy+exoQqgxmHU0/jDBocicgBg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MB74vaD5+RGGaIPtunSq/G+PyPejx6UugzniTWVCyqDRD5oGBK28Hy51iAXslObgo
	 TXvSuuu0hMx0O3ENOpDD21K/91BBg2yNQj9gH8vX/NaELC31NJP4DGXKVFfKD+Z6ic
	 ylU6tHByMteD4jOaH2QlRrejMpyVLlDx8WGevWS6uCx8wyEiJRWK0hcsNRExM3eufy
	 HPEoydhINM/hmPnybPGwnqtXcPrFVY69L5WlsdgomnhZMx0Rpr97j+wIfXpxHkI1tU
	 os+arozCapIeOpVJAQ65u3HzY8tM/auPgD8UWw4VnXf0MmFiboY9yWgVi3Ar/hnTHz
	 0yapkH+9EpPFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EA15615DE;
	Fri, 29 May 2026 08:30:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 66A7B288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56BA4615C3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fl2AQ5N1hOOF for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:30:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 56FF8613CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56FF8613CC
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 56FF8613CC
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:35 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-490388fd0dbso79513145e9.0
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:30:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043433; x=1780648233;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hOHhGjXKlk9dKm/Sm3AimYLf1Zlqh9NRtnsKsZKrli4=;
 b=giBf4JyqhWDVARW4+89DkEEQq5vSoP5HS7vxbOThpytAFCucjUU7eUdZKWWfLA5iyb
 5pIHlHqnF7DbbgFvjv61hYylE2ah8I/pPgTWGDmrBh2sZ9bGbx5MeZPST5zJq/7zvcVX
 DcN4VCJDtK9Veoe7PPqi4e/dJzKtZYw5H8pzmcWwbm1P0krnThRgm6g3XLlEeKGD8XSH
 7H4LhGeZ8HwtTvEFRM5MsRMcXhYiMqrP43ZsuIsllJvCYS6qJE3GHBKprFQ8n3zZck4L
 ZD+IkHU99xnYRfZwj1qGcXOAvn9fErPws7NYltvsX39nj1ue0usm4/bql6RsQdkCy+Nc
 AF1Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ+FPWum5EqP3OlIfadBusONDk6l/t0GnCFgG93ju2szklJFdA/1I+dKDRWvbmxyXhYXdr7yR+Q+DFM=@buildroot.org
X-Gm-Message-State: AOJu0Yyo6WV4x2DKXq4FjebetZF+4jIUeH+hstxjDSIdIt6aYg06MQgW
 yyESX0Y26dkMAa3QsTgZlMs88JqNeTjvut3R9ptBobRw2iB0gNReUMa+fdQN2nqzIKg=
X-Gm-Gg: Acq92OHOs5k9jpEBBpZakssBRNARTBAgpBxv6Qo0Qhf+oI/2+kCtsaxvb2TyOkzTfHX
 bv29kwR9/esBc8ADQFrS1eKmQQVOpBnb7Q8sz6X+YUqXarq/mqnwDtM0wAkgaWjT0o0BVd/72g0
 d4KFbkQwaHsICtDiJyxMgk8bwNeVIr+J6nVKmtulyi84r+0r281s0joLmsqfxVk6QF8fqjUKZz+
 EN8I5RqSlZ2Wns+dSm01DTKQlIwpEw6xXZEoT6MU8uDtH0W8RZKz7G/rTe1qGF+dbMi/F2l/11U
 HKK/pg1m+BsA8FSFF1+RgvVIobFsEAPZIGAJ2Z1WbF3bBgcY7RVk0iVqtr2+uC43+ht4EAS+FC1
 SY51LnIM7OXBZ+iY0Lsf4LVHdKQZtfhEF5i6mNNI8PQ4gmlX14udufq22+boINDON5lJDf05TYU
 1syhuLg4cHcClTZ1TkasL0mohSvwK0vVI8ByPHdjbxyVFqsGaxoF8E7g77Zg==
X-Received: by 2002:a05:600c:1d14:b0:490:45bb:8dd9 with SMTP id
 5b1f17b1804b1-4909c0a1134mr34429235e9.8.1780043432929; 
 Fri, 29 May 2026 01:30:32 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c12b2dbsm12420075e9.6.2026.05.29.01.30.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:30:32 -0700 (PDT)
To: Andreas Mohr <and@gmx.li>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:30:32 +0200
Message-ID: <20260529083032.59932-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518220229.17936-2-and@gmx.li>
References: <20260518220229.17936-2-and@gmx.li>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043433; x=1780648233; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hOHhGjXKlk9dKm/Sm3AimYLf1Zlqh9NRtnsKsZKrli4=;
 b=OV0OkBLthatzTkR7B6zc9x4VoGHgVWNEtw2tHn6eNstqBUz6PYFgV0k2t9AHAidY60
 q39q6it9FxKnrSgyT3GqjYGi7rzmX4uV4RYsRHgFDjxlGHQcyLDt4aEdWAdqMll92AT0
 zMntHxG7AJnhbd81PWtmqWr6CBInPdwlC9AkoUzbq/6nA4z+05PaI9/tHUuaRYU3rpKR
 N8e/TPXMa+hlhclE92i1zUIvYdkm5i9hjy44PTdEVTYZx19X1TiPVSpgQvurBSVSpMQ1
 r15vd/0YMrZRBYaem2rdANhTevDeeycp7GbT/C5fHO4pLBEj4LH3yEr7nOpULbMF3Pus
 IVtA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OV0OkBLt
Subject: Re: [Buildroot] [PATCH v4 2/2] package/libargon2: fix pkgconfig
 version string
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
> Current build generated pkgconfig/libargon2.pc has wrong version string.
>     Version: ZERO
> 
> Signed-off-by: Andreas Mohr <and@gmx.li>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/libargon2/libargon2.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libargon2/libargon2.mk b/package/libargon2/libargon2.mk
> index 8ca0071a..e968aa08 100644
> --- a/package/libargon2/libargon2.mk
> +++ b/package/libargon2/libargon2.mk
> @@ -11,6 +11,7 @@ LIBARGON2_LICENSE_FILES = LICENSE
>  LIBARGON2_INSTALL_STAGING = YES
>  
>  LIBARGON2_OPTS = LIBRARY_REL=lib
> +LIBARGON2_OPTS += ARGON2_VERSION=$(LIBARGON2_VERSION)
>  
>  # GCC_TARGET_ARCH is not defined for all architectures, but libargon2
>  # only uses it to detect if some x86 optimizations can be used, and
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
