Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B149ACD6E4C
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:30:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 859AE42333;
	Fri, 29 May 2026 08:30:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MCfvVj5V1Ooa; Fri, 29 May 2026 08:30:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2DCC42331
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043427;
	bh=Qe2lUbSDUpsIb2ZKj/DgjwgNvaX+qkDiXGliTrq2Pqg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=a+iPI2+u4dQ946aLkioCA/IHIVnjZxUpZ5drDPC8XewkYcXe1vgzvHrS2DvyqGIQ/
	 sZ4UpKTZaMK6m2ky4EDPMz4k/5A5vbCbTB3+Hdywpkh5DfWbsdsfSQP4nycTGhOajo
	 o8xNUY0tHG8SXCzuWVVfzZAi9jgkkxkqYFGX34FRHYXY6mTuCzyYNr5dSK8IE7mZHL
	 +5XNMMOIr5lFNoKsZj316iR/PxfeE1T9RspKlkihX8SsYb6M3qIV93LXtRxrTPVq2u
	 +vbBQVrdKBfIcPG5vvdjT07eFwz5WvpEYnQzzYduW7MCO7AZEh2DGTWj5Y7k4Y/fry
	 eYw2i7b+MGyRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2DCC42331;
	Fri, 29 May 2026 08:30:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 639EE28E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 454C54070D
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oM8sKZvnRfHa for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:30:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 388A1406F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 388A1406F3
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 388A1406F3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:16 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-49050bfe053so42490295e9.3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:30:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043414; x=1780648214;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=P3yP2t2+FuYxfH5LRhplaaMbdtIO6/qaGBKwqhPI8RM=;
 b=slHAi/OQHG6P8IF1VPEXWXFA8NAgsPuf/AxwSgxEAVyO9ITkIMLxQtJGomSgVUzjqq
 y12gJF6d9L3MRTXmc16xyZ6QNp26KoaJ3RhJnUlvqsfc27GDdT21+HIAdeE766t0co5u
 y+G/TWp1kx3K+zn+RMdJ2mjLdlu4ikRFBd8smnkoUz5fQgHR45ZSaO5YDAelnM2jZ1lN
 RAMdVSFb2E/hl/l4J39Gi2VXSGM8vI+Zd7wOMXcFs4SgydlLhJrZoZS/NQ1RAPwxZ627
 3opkOMFDHyM17D72tWFrGKlLAsyPg66du6Qr3z0xMcIg/5H/ojcm7D+Ot5N3P47deejv
 LQjg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/dD/x04/EGGiG01RNkR/I6QTDgCmTxujSSRdFZLQFjbq7B0XdwECrzmjfe2uR3bpoHh3yD0z3UKoo=@buildroot.org
X-Gm-Message-State: AOJu0Yy7LWxzP737RdmwGqleFBJidW3lYeuoALPodgVqD7w+oB+kYI81
 uKEqGhmj8o0rMko+gJ56QoH1SjhTK6eY8RoNPgYWb2O+hOzVf/POMK/YFke/ilaVycE=
X-Gm-Gg: Acq92OF0CbyuuTAHUaNzruB4EZPnIlWspoPKZH2mI1mcdJNlFe7r3zql2vosi5vmMZ7
 UA4FuyFMDv0ZAktHtLVp4xoY8BVHF6sFudn7qVey5W1BMcOc/7Js5/b8x1npb71/LH3mLf+9UQA
 iWTsKIfSa2Zjwh1bZpBToHFHk8gK0sN68EStVsw8AepaA18mwq+164gT6MyxlgZbA7QvxYdncVA
 UebtzPryF0pZ15RTMvKXGZCwQJl/R+NC7w+jCEdzcqP8Yv/vVcgtdyZ0xpBpmNeRQAeCPD4H274
 yxLlUzL6fZU1pVIg3Ok/B9gy9D4fv0JezrWilDbOoZY5mdLJ1c5GERKdmKcJCKGDkp2uSQk4NNu
 5fwMSopxLk4eefoHjMhr7VYSVrrX26bS8SvdliXg8B2PM7GCdsrEEnlJe3L09UmIDcPoeEUZ6QP
 xallYhU2mZJfEhgRV/2AXh6hH26QGdanRYxTJxAhaMIHpzPCOkhpVqcIQ4JIGYTxnaR4ZN
X-Received: by 2002:a05:600c:c8f:b0:490:9d1b:f05c with SMTP id
 5b1f17b1804b1-4909d1bf0demr29195905e9.33.1780043414110; 
 Fri, 29 May 2026 01:30:14 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909d6a0e42sm23584355e9.8.2026.05.29.01.30.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:30:13 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:30:13 +0200
Message-ID: <20260529083013.59157-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511160016.1225647-1-bernd@kuhls.net>
References: <20260511160016.1225647-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043414; x=1780648214; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P3yP2t2+FuYxfH5LRhplaaMbdtIO6/qaGBKwqhPI8RM=;
 b=dhgu4JJWSYEbCFRirAhuOq02Yja2IOoE+uwyDgCkNo80iahcaQ4B65vpYxeItf6Wzd
 adCXXgXNNLeN0kR9r5qFpeO50g/inKEBpCFVECqlzlFN5K9xwHu3QiJIhUgpmk98fQkk
 cIHKTSlqDzdEMIJLgFTmSgaYbxrkHoMAYI6/ST3SKzYU/QjZduv1gCwz0NgEPsR5hpVB
 1X9ZDPYaAkZ/279RduXUPdLdTI2neqoJqtLb+okIvt68LyPztYwcUeahgTfOuemi+/TS
 MqDQN6svihiHTFrFXCDNn6Q6hlpBerz6YWvUsHfeQ072VmVo48kblbuHis3ZTViPWH8K
 S4lQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dhgu4JJW
Subject: Re: [Buildroot] [PATCH 1/1] package/libgpg-error: security bump
 version to 1.61
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
> https://github.com/gpg/libgpg-error/blob/libgpg-error-1.61/NEWS
> https://dev.gnupg.org/T8239
> https://lwn.net/Articles/1071807/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/libgpg-error/libgpg-error.hash | 4 ++--
>  package/libgpg-error/libgpg-error.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libgpg-error/libgpg-error.hash b/package/libgpg-error/libgpg-error.hash
> index 1e52e78d22..cddf2c7828 100644
> --- a/package/libgpg-error/libgpg-error.hash
> +++ b/package/libgpg-error/libgpg-error.hash
> @@ -1,6 +1,6 @@
>  # From https://www.gnupg.org/download/integrity_check.html
> -sha1  851a1619aee8f7723ed50f09cb6a186c483c280c  libgpg-error-1.60.tar.bz2
> -sha256  11b2a738e212f3eab0fe8637bc341d3181ca964e97bb2654de91aab7dae4ce09  libgpg-error-1.60.tar.bz2
> +sha1  ec35eea78798a0321986168ea28d55baccd5934b  libgpg-error-1.61.tar.bz2
> +sha256  7a85413f2bc354f4f8aa832b718af122e48965e9e0eb9012ee659c13c6385c93  libgpg-error-1.61.tar.bz2
>  
>  # Locally calculated
>  sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
> diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
> index 808339b935..df95e5fe0c 100644
> --- a/package/libgpg-error/libgpg-error.mk
> +++ b/package/libgpg-error/libgpg-error.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBGPG_ERROR_VERSION = 1.60
> +LIBGPG_ERROR_VERSION = 1.61
>  LIBGPG_ERROR_SITE = https://www.gnupg.org/ftp/gcrypt/libgpg-error
>  LIBGPG_ERROR_SOURCE = libgpg-error-$(LIBGPG_ERROR_VERSION).tar.bz2
>  LIBGPG_ERROR_LICENSE = GPL-2.0+, LGPL-2.1+
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
