Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E05C83F09
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 06:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAE7E60AF5;
	Fri,  4 Jul 2025 06:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7gONgYNZdsnD; Fri,  4 Jul 2025 06:46:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 068D360B6B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 068D360B6B;
	Fri,  4 Jul 2025 06:46:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BC7C7AB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC37C83D15
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:46:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E3bw49eVSR0s for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 06:46:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0EE508350D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EE508350D
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0EE508350D
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:46:41 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4538bc1cffdso4973825e9.0
 for <buildroot@buildroot.org>; Thu, 03 Jul 2025 23:46:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751611600; x=1752216400;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=snfG6n00QFCT5RjTJNl0ufiiMjieaSrDjCLaXtIADac=;
 b=fhbQefS9h0nz+38tR8hgcIy2yWIM30VFPylz4t+gU56hOuz1vvwqLCZlIYkEBaePNY
 XtcQZ3TTKCd4/8Brg1wRKn/t2hbFzkFfeeB9nkJgkDL9tYg25qTQMqaLSMEP1dEQ2f/3
 GX/TBLooRhuFR9jpldAI/1AJIUNIPc/MKp5l7nbm5aMW8GukQ2hKfgGT+MACejujpyDt
 osnPFLowKdt4A831AcalBk4edLaQbOURyX/pZdiGKeg5BOHqJUHU8zZvjXpuWlX0YubK
 IEx4kQdkIOHzNYWifoRvYJ5IPzKE+XRlcKguU9yRN3t5CiUnJuI4lzxZFJaDWJ3enZ6g
 OWVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIzufB9D5fvGw5ij2U1qyktDUA8nlENKU+1U8njeqZVTvIBuG0wHgVhr5ZCqBod7IzZWNq3XcVycM=@buildroot.org
X-Gm-Message-State: AOJu0YysE6GtR27YNB3Xf+34cDgT5rk/vfr3DrIt/TAoya1G0QX+C3E9
 F+mQxEdPICmE295AHYzW39VVxCfXwQxAZtj4sZMN1ugF5Eh11ybf+tBKBSqUzgDqFzQ=
X-Gm-Gg: ASbGncu1fjQLJET+LaVQrSXLGBr+fjg5yww2ldAmLzjHF8CjVIWcRDUK0mRV2bIjIXR
 3X6Yg0zTbOtoH7RDdj0S/T0ugfHvbOVvLMgA7tQ17ve9adcxWTADz5AQECd6fvyKyeH3jkDjIJ0
 1BK9OME0EHi9b0KjPPCbH3HdBJdtPALfD9uXMsCTbgkeaSUQwEWWYpdEfxfM/MbPTCsr4bnNWKn
 tgnsKTN0mlnqkKKQtlBURRs/FWTC2QaNHOLWXqwZziwAWZhc31oeZRWxyCDkRlKq9ht0b37LEQa
 VNJa7BHrvbITU7cDKxEcZLtepUNl4c2+9XqwKWtJh7AAdDFbson+BFbhsylF1azJXNFH1mBPDW7
 0Y2R+1VqNKUK0g9f0prLm
X-Google-Smtp-Source: AGHT+IGN15Fclozo7/M05ZD6V7aGLdYX+BCf7miS5V+ZLYREhKT0+WF2N8a8nh2pcfTATMkIbfnm6A==
X-Received: by 2002:a05:600c:6092:b0:453:59c2:e4f8 with SMTP id
 5b1f17b1804b1-454b4e6bc98mr6631295e9.1.1751611600037; 
 Thu, 03 Jul 2025 23:46:40 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b471b966cbsm1617776f8f.49.2025.07.03.23.46.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 23:46:39 -0700 (PDT)
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Jul 2025 08:46:38 +0200
Message-ID: <20250704064638.4063857-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250623115102.2284223-1-maxime.chevallier@bootlin.com>
References: <20250623115102.2284223-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751611600; x=1752216400; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=snfG6n00QFCT5RjTJNl0ufiiMjieaSrDjCLaXtIADac=;
 b=RyvoZeVDPj7ZzNkL9OUHeAR9mTqy2wJaIEFfqhSFoE26xjlwiF0dm6I3cOnwiJe+s+
 //PatNrrSeDVtk4cD0xDZpEZGXiUO2jKXtAdbdL8IMFsh5Cw1o9WZspnfi7CNqkw469v
 fmxvrN4nJHIXglfaUnYbnbk8f7uL3EtmIqNFR2LTgqVW0xtUIwROLv/i8m6kebIIOdug
 pAik/eXPWx2az4FDusNzzo++YFrU6KV5TiBveyxXmuwmr4gJpRGu19mmacCNHPxB42nH
 Zqs/dPNqpzS8xuGvyvhUTgCBGYKX8RucU24/B9s0DCFzIkeCcFlAuWPru0QEu/KMN/vz
 Motw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RyvoZeVD
Subject: Re: [Buildroot] [PATCH] package/linux-tools: rtla: Pass TARGET_LD
 to the make arguments
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
> In Linux v6.8,  the rtla Makefile was rewritten :
> 
>   01474dc706ca ("tools/rtla: Use tools/build makefiles to build rtla")
> 
> The new Makefile uses default linker values, so the host linker being used to
> produce the final rtla binary.
> 
> This results in the following error :
> 
> ld: [...] trace.o: error adding symbols: file in wrong format
> 
> Add LD=$(TARGET_LD) to the RTLA_MAKE_OPTS to fix rtla cross-compilation.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Applied to 2025.02.x. Thanks

> ---
>  package/linux-tools/linux-tool-rtla.mk.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/linux-tools/linux-tool-rtla.mk.in b/package/linux-tools/linux-tool-rtla.mk.in
> index 449371ddfe..d9bdcc3016 100644
> --- a/package/linux-tools/linux-tool-rtla.mk.in
> +++ b/package/linux-tools/linux-tool-rtla.mk.in
> @@ -9,6 +9,7 @@ LINUX_TOOLS += rtla
>  RTLA_DEPENDENCIES = host-pkgconf libtracefs
>  RTLA_MAKE_OPTS = $(LINUX_MAKE_FLAGS) \
>  	CC=$(TARGET_CC) \
> +	LD=$(TARGET_LD) \
>  	EXTRA_CFLAGS="-D_GNU_SOURCE" \
>  	LDFLAGS="$(TARGET_LDFLAGS)" \
>  	PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig
> -- 
> 2.49.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
