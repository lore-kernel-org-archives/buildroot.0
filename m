Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3392ECAC592
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 12:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E27D18229C;
	Fri, 19 Sep 2025 12:58:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sQJBHNGSMcjP; Fri, 19 Sep 2025 12:58:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E55882FD7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E55882FD7;
	Fri, 19 Sep 2025 12:58:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 71DF0E7
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 582804087A
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:58:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tNoC_3XOkFiZ for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 12:58:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8331140C14
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8331140C14
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8331140C14
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:58:01 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3ebc706eb7bso1072691f8f.3
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 05:58:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758286679; x=1758891479;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T1zuT67GAjCaVBKMMVsWFIsbeJltw6O/trHtzTQ9sOo=;
 b=pT5UumjCjZSjZThTqg6uSSlOS/gnPovQ5B3KFf2yXITiuO0K/NrK1lk+JdIyWWoloP
 NTbj0O9gGE0EZ+lDTEdthooBlAfvJ+MeajOLuiYAnPhpNFpn7Qu7NBnDV6PQc/gt2RUq
 o6gPCIQSUYt+7PbkX+F+WK2zHlL4aAFoPCF7MRz/GOrCNHRHLLmO6RBQANNlvyK1qQIy
 G+yq2W9jwmVdU6tVrHZsqXNLDX/DlBkcrwWpKJ4Z0AKjfswKj1/QgIxCfc2nZiWa2lGv
 hEZDcuMik3cRNwHhMOydYcfUc88OHvBHwIyMMq3N3kA0rVPdsgGcWw0wcZ+limAjE/0B
 JSLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVb4nzHkMdfhdeGdBUmd0GjW5VRLYm9gFZgnMk+gJcpAxsWteDg1wZHR5tuLeg1K8/NonjvxmC9LLc=@buildroot.org
X-Gm-Message-State: AOJu0Ywf6NnjnMdmzPkixbdmO1LD+fM98bcAoij+TTjGSWQKUpG147+m
 gwyLtgsjIUQ+SUEvE1dqwbFiAs77ab6UvMAvmyFpBChbGVsHmm6RwuwWvd7jDY8SG9E=
X-Gm-Gg: ASbGnctLQkrHTrVK8d4Fq27TSi6UaaGFwtTJSMJFhxWAU4/4J4Ph3D8c+svj0jx7OS6
 ryTCgwxFJhkUTyqjHe/EI2D49WcLEq/yXkp+c46F7qOtlHcoJXnbfGxX5P315uqbXEexE7B/efi
 oJC0mDLUDPL0OckF3a3UmISp8XHvEk+vn49js+v5EuiGUsTkr7gO1KJmYp2xn2UWKF41TOpd+Vh
 C6fjxARibNTELCqbDlpy5/YmC5gcBRPx4G67ti31SjyBnbhNeVQ9UTpVWtz5lKJ2j1r82bZyf5I
 JFtxRKmZ5wS8GKfmqbCuVB+kAqfjADcfOJ//Q7bE79serSw+9leGxDPGlRHsvjBD/hMh0pj1m4P
 tCMAJFIwGD1KhyDM=
X-Google-Smtp-Source: AGHT+IGtIdr7gmGpZiAPNdxuluQjjD+YnfY0cJ3EF+Jwng4bPYfjJlGUS8VobNqy7ahxDCV4C4/Mkw==
X-Received: by 2002:a05:6000:610:b0:3e7:471c:1de3 with SMTP id
 ffacd0b85a97d-3ee7db4c459mr2506518f8f.14.1758286679526; 
 Fri, 19 Sep 2025 05:57:59 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-464f64ad359sm102066995e9.22.2025.09.19.05.57.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 05:57:58 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 19 Sep 2025 14:57:56 +0200
Message-ID: <20250919125756.137631-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909161156.59592-1-bernd@kuhls.net>
References: <20250909161156.59592-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758286679; x=1758891479; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T1zuT67GAjCaVBKMMVsWFIsbeJltw6O/trHtzTQ9sOo=;
 b=OFfYklCfmuWmhZKhF6ZJArbienftLhKU5p5XhCP3nSmN2A2jjuk58WW8i8gxmyu03w
 6jRbO60WneI+0UkEa74BERES9CaClpWalV+gqHQCvZ1GZjA08KQ+qSRfWb5sAE9NB40j
 U0Oyn4TMtZH4IVeXQUA2p25T9vyDNDHvCo+Pz7Nxp/GZREWa5tefYXNLglHcFgX9QWfR
 WzRcFBpturZbr2fWnRGtq12BMsh69URDs2ot6LOXpB5sR5hhv/xVQx4tdz3bRbY9LZeM
 1/+PCIzDeX/lHeDAcfO1hhu6uXIjuyDMff7GbIACFC0/YTRoJG6hOZXBaOcozPy4rG2z
 rmsQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OFfYklCf
Subject: Re: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.22.4
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
> https://www.samba.org/samba/history/samba-4.22.4.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.08.x. Thanks

> ---
>  package/samba4/samba4.hash | 4 ++--
>  package/samba4/samba4.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
> index 069b08feb4..f0e19d8741 100644
> --- a/package/samba4/samba4.hash
> +++ b/package/samba4/samba4.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after checking pgp signature
> -# https://download.samba.org/pub/samba/stable/samba-4.22.3.tar.asc
> -sha256  8fd7092629a3596d935cd7567d934979f94272918ec3affd0cc807934ecf22ba  samba-4.22.3.tar.gz
> +# https://download.samba.org/pub/samba/stable/samba-4.22.4.tar.asc
> +sha256  a41a828848abdf5e942c900ca178597e18aab7b61d3c06a9b5ba43661988010b  samba-4.22.4.tar.gz
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
> index 270a55593b..c1d1b0b160 100644
> --- a/package/samba4/samba4.mk
> +++ b/package/samba4/samba4.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SAMBA4_VERSION = 4.22.3
> +SAMBA4_VERSION = 4.22.4
>  SAMBA4_SITE = https://download.samba.org/pub/samba/stable
>  SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
>  SAMBA4_INSTALL_STAGING = YES
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
