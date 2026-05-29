Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66251CD5BD2
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:30:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3925D842D1;
	Fri, 29 May 2026 08:30:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4nQm-2VrYDZ5; Fri, 29 May 2026 08:30:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F99C842CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043413;
	bh=DqBU2BhQj+0/zW6K70EHLMLQ2zMfSLSK4SSbdeXr6vU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Eg7YNpgCD9QPCHlCYFbDmMpDv36EqzPLTtPquoOzg52L3bKhQ/D3BPPp8It6d0D49
	 HW9c8QHk7W8hyADz8MLvENSLAYHX+kxk+K1ICjL7HTi49SzUbuyBXyuk0s7JjIJbpz
	 FKGKBaKmReVhmwhTO5M79YkZqmWJ8WejYYFpozoEy5wcZdbSjupIrjYZvmobYucjCE
	 rDIpFqUmSHxEFW9C3aR6X9rmzWHYcVLy7GrHsZ/q3GtTrgt8PQOySSk/5EYVxxCbLp
	 bw5bTQrX+K13m3sM8f0umSEcL6WQkDVUIwgc/mhcD6SpFprYYcPJnFo6pyRralMVOB
	 5WCZTQCVrT58g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F99C842CA;
	Fri, 29 May 2026 08:30:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 12E30288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B63E1842BA
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gige8Lymr96e for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:30:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B1D4F842B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1D4F842B7
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B1D4F842B7
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:07 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4906869f0cbso58800155e9.1
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:30:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043406; x=1780648206;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qCccy0tOF3PnnMgiCdq/U13vjXfPbcBLafLtXZVdLEs=;
 b=f40wmySo/AN6kVaJm7rLNBkmv+II3t+y9KODqoqXshVBB/wiNgAuEH6GBZ8SUV5eF6
 HdCpFclV4d48JlNQmShfU8wCvPiWeQ/UeDRaMhLjf/rdCMahACjrPar7+CAzzK5t/4qJ
 PnoCfitDRunNqRaA/KBVtqUuDU9D7uQGO18C6TgPntD2Ig3OMx6OgtFLE12qH3IG5jlX
 XppYyqwI4i6r2u0K6PucTxklg9dt4UVReOY+lbGJAodkr0fWZeuOpSS9vGeGmrrRxjqg
 WHCsXl1f3Cll7DSYILq8MQ7irgcWq3h0FrcXqL4p0BqUrJd0Wm1cnlkhH2c899Xh1ZJT
 N2qw==
X-Forwarded-Encrypted: i=1;
 AFNElJ//m/WzG82sGiTBLV7bWWfWL7FokWaj7mCie+8WDN1wHTRpfcWVvqmIXH6nzaq2UKx6BxzNOtM6DrA=@buildroot.org
X-Gm-Message-State: AOJu0YxYMepvPZWa2/uKj1aUA43w8k0mxeNgTedWUMYiM7+fQUhcAxwE
 kULAHlEz9A/7D4Ncts0fEgXojaOs8qnjpfeXDGiGglpWfAwL10gsP+eYrcqNJ5wdA5M=
X-Gm-Gg: Acq92OHXzVkkwmCoXovUcbZnCFh/kNg5UOwVvdytueM5KxR/PCMv+XkYKL3KQ2PE4XW
 dxekQrAtL4q4fSAe9y5T917JQuVGeP7OPG5QGcE2cusHc1WuIal8hYwRkdyX4uoehmNe2YLlPGV
 SuM3nZjVzt5SMmq5wf6ofNo6lzwOEP8MNTN54DrhObZtGcXXPFlzh5AbTrL/uyNwV+LD3xojVw1
 4v/YUtQ4/f5Qsr64uVbH0tw8qAUzOGJw5e+fGgmqk2DYjYiXm0bSapGr79ONQqChGKt4epF08SF
 j/X7Zy66TUAAi5CX7hu7/Xl4yxW+uWvWf5P4DAZwjcQ5KBc3tOhvv3CUD03LxiXW93goSEQ+JsL
 PhXQWjYBmKUipMrCKmfMOmQkAct/WD5a9MSroeyKwB1fWZlzSFjrxdGGehG7pHQDxMquoX3IRqS
 GIQdcjd/CJYHLvaITIlwigCCIgBcoabvVBKOntcMkt6aJemBdGG5lAeTlfcw==
X-Received: by 2002:a05:600c:8582:b0:490:467e:a3d7 with SMTP id
 5b1f17b1804b1-4909c0bcc87mr23133805e9.30.1780043405583; 
 Fri, 29 May 2026 01:30:05 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909cabfd6esm30339345e9.15.2026.05.29.01.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:30:05 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:30:04 +0200
Message-ID: <20260529083004.58707-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260426092637.2320150-2-bernd@kuhls.net>
References: <20260426092637.2320150-2-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043406; x=1780648206; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qCccy0tOF3PnnMgiCdq/U13vjXfPbcBLafLtXZVdLEs=;
 b=UDFQEnlJhC1KR42vL8mos4DOT9yWRrMFR2ybHCnfSGY6IZhFJNGgXNLRMJYVGkHXOH
 NAcZEHmMaQfE/BLw2zvyT8//b4z2C+424/yBoVzvTf+FCj1eb9cD6G7iFUB+L7EohRq1
 Ns7B1NvZ6CMMD2gML/+kmDddMVXWJc14qc6ro9A+8jtJC2Z7AxOti5EdtWNRpZuAHLKo
 8L2msTFa7C/Kbrw8t6DibqG2ijuYSBhItLIGLHkRwO39G9zyHlEfVFrJvPFrj16jeoDR
 kwwYHrkRQVwILwpPqc1iELg9YHSgSSUgj44AasrfqePN3utcXPU0WikXtqY/LwISsPhC
 Uc/g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UDFQEnlJ
Subject: Re: [Buildroot] [PATCH 2/4] package/libgpg-error: bump version to
 1.60
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
> https://dev.gnupg.org/T8112
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/libgpg-error/libgpg-error.hash | 4 ++--
>  package/libgpg-error/libgpg-error.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libgpg-error/libgpg-error.hash b/package/libgpg-error/libgpg-error.hash
> index ede1a2113e..1e52e78d22 100644
> --- a/package/libgpg-error/libgpg-error.hash
> +++ b/package/libgpg-error/libgpg-error.hash
> @@ -1,6 +1,6 @@
>  # From https://www.gnupg.org/download/integrity_check.html
> -sha1  a9876a9e4cb54298960bd4202baf891642060428  libgpg-error-1.58.tar.bz2
> -sha256  f943aea9a830a8bd938e5124b579efaece24a3225ff4c3d27611a80ce1260c27  libgpg-error-1.58.tar.bz2
> +sha1  851a1619aee8f7723ed50f09cb6a186c483c280c  libgpg-error-1.60.tar.bz2
> +sha256  11b2a738e212f3eab0fe8637bc341d3181ca964e97bb2654de91aab7dae4ce09  libgpg-error-1.60.tar.bz2
>  
>  # Locally calculated
>  sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
> diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
> index 5207d926df..808339b935 100644
> --- a/package/libgpg-error/libgpg-error.mk
> +++ b/package/libgpg-error/libgpg-error.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBGPG_ERROR_VERSION = 1.58
> +LIBGPG_ERROR_VERSION = 1.60
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
