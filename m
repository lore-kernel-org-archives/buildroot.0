Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA73C43211
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A9E282336;
	Fri, 26 Jun 2026 14:55:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AwUIzQ3IFKeI; Fri, 26 Jun 2026 14:55:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA78781BCB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485710;
	bh=CIz6Kgmtn3Ki4o12lecGnh/GawxY63lVjq6xUxqyPKk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pkoWGp7ZjxqRN7CLC7+pGfbv1c2JTfpVw1IJBq1v01Nl6jbrJCJDMRsXtgj5DhRUb
	 CoCp0wt58hgqF5Da0psndUaZPZvPnC/zwW6qArly5CArwYaIpsO1wLPOsM2D/iQteY
	 83GqS7dkM1IdMuX9HVzyATC+IhHGOhy0uvPSACFN8TDo7lM+eZiU7dfwjUTJo/BZaR
	 JNkbhs00VSFIkqqpA4Vxl19f6rCQr2eCnjLyLXY4KocN5hPfJ5x9rfdok9XkMnoYGP
	 TGTd56lnmyRY+F9+B+2zecY2/46b9LplCmkUZTQwWFGy6IYuRfeGM+vQlxbAmpR7Q5
	 +XaIOEHsvaPyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA78781BCB;
	Fri, 26 Jun 2026 14:55:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A91B3A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDB0F81314
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:55:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wo2D6hdtMVlZ for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:55:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 86CD182336
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86CD182336
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 86CD182336
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:55:08 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4921eed3fa2so7668355e9.0
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:55:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782485706; x=1783090506;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gbNts+pZG6dOMygQYmLKaz7Wyvu6a+Xa7me2lJWFjKs=;
 b=A4ibsNa8EpqWZXj/i4RqHP2zM8R/eXFXbQkgxTeig/liX4L4xi20lPVKr4gwuB5+D1
 3CYPH5bFoScexuMtNfiijWY68ObafyKWBDM8L6WwTmni5kEMxo/OBgazEQEOgFyU5C6i
 em4nQyGOhR4YP31ruX7zppO3lLnQlGLdL+637qay8powdxZlLTjGym32Nr6SV+oR6X/g
 XeyMyWRGCN25vnODtv4k2JCN7Xom0455qB1k8aKbkoylidCqPftYWn7yOjOcrJ6p2ZQr
 F2K3HYLFs54RW5VUWy1OIouubOB/15DaQUwh1F6P0hVw+m0nm4dkYbx1QOB9RBQZ7Plo
 P/sQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9uSiy4hcVGYOWR70Rs5JFq8E1et7tHdv8hgRFNabz0Cd4PwRKBs12FGFMcxQ+jylcAVDIbn6y3pSw=@buildroot.org
X-Gm-Message-State: AOJu0YzPbicJou96E9UXG3XN8nkT+UfWrxW+QfdlXHp8nduTvvBniAud
 8KU9rCfn85cNu+tFbz5sqMlwNE/S8i55DIDdAu3c/waBslqXuTrzA2zOFzJzp7KM7j/K/MojEjI
 9PS4n
X-Gm-Gg: AfdE7cm8ZOg8THeB5B8yquc9KdJbvAPWk8wfJ3Ea0hp0TcEddtJn5VCrdmf5RS9C0ac
 FUqzwKclwmBwSp5WBCM2i41wb2t6UDZStPjqz6oU7E+MfxFRJdTIHj7eRX4xUjn86HDcTnM60DG
 Qflo/JIta1e0JuxQOilYSGTrXzebwBu3tvXkPWtgS2sC09avHLddgGl5PGwu1zSM9mZUSrcWWWq
 wfrWPKhu0JY9Ank6qLwD2o+H6Ep8/yTPfSeAF0cb7PUc4Qhy5GF7wA5KdesmwbVfRJ+tt86nQ/9
 auwi7eG7SBc1z6hZti0GLzihQXIFKrAGfa9Oa61IH4u2AsPNMGzjMDWN/V63deDaBTQiQl8fuQV
 5o5g3N3AQbNzeziPyQ5RF1t/LSq6OAvOlnfANPsoAcLLChglZDI9mkCqSjJuZks3zEgvtr4K0ro
 0hrfoW5fH9I9DZiv8=
X-Received: by 2002:a05:600d:8495:10b0:492:611e:ead6 with SMTP id
 5b1f17b1804b1-492668985e2mr84452075e9.21.1782485706000; 
 Fri, 26 Jun 2026 07:55:06 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4926c285fc1sm39996755e9.1.2026.06.26.07.55.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 07:55:05 -0700 (PDT)
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 26 Jun 2026 16:55:05 +0200
Message-ID: <20260626145505.342480-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20251023180908.586944-1-dario.binacchi@amarulasolutions.com>
References: <20251023180908.586944-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782485706; x=1783090506; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gbNts+pZG6dOMygQYmLKaz7Wyvu6a+Xa7me2lJWFjKs=;
 b=askRDFj8OED5S8u9bKK/jlbtz+yqkma4lETmpWisvljOakIJu3BKj7uqsg8bqBEz3Z
 QEQfgNCDyEmRzBSU2wjsqMm4GN3P513gn5D/OHkTRS6yYgLDz4b/rhXJJ8tIi3Wg79RF
 fi0YHuxJyppIUuLEPWipnhloHNvskTu1eQdia9NyQJckjsqqrQPLa1lNnvYFuDd/9R9m
 7qJjM1O21iBA6PKIzvKXWrIRPTIwjvfaWtrTZEt1UHmCSjT0pfrAnjgK1T+twVW7aRad
 p8xW5fZgZ8G0p9WrQfJtFYMKGMo9sIwYXLZ4ry+CHmIYkaXCPwFIdHtCJ/6f+n5Fp/yF
 AC4A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=askRDFj8
Subject: Re: [Buildroot] [PATCH 1/1] package/libgsasl: bump to version 2.2.2
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
> Update COPYING.LESSER license hash due to postal address fix and
> README to year update.
> 
> Release notes:
> https://lists.gnu.org/archive/html/help-gsasl/2025-03/msg00000.html
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to 2025.02.x. Thanks

> ---
>  package/libgsasl/libgsasl.hash | 10 +++++-----
>  package/libgsasl/libgsasl.mk   |  2 +-
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/libgsasl/libgsasl.hash b/package/libgsasl/libgsasl.hash
> index 81907f8875a5..de24d73c2dfd 100644
> --- a/package/libgsasl/libgsasl.hash
> +++ b/package/libgsasl/libgsasl.hash
> @@ -1,11 +1,11 @@
> -# From https://lists.gnu.org/archive/html/help-gsasl/2024-01/msg00003.html
> -sha1  c238b3af05af3804808cbf734f049a06840d787c  gsasl-2.2.1.tar.gz
> +# From https://lists.gnu.org/archive/html/help-gsasl/2025-03/msg00000.html
> +sha1  8a845b7ec78e5f27bf69438074ad23867c00d4fe  gsasl-2.2.2.tar.gz
>  sha256  d45b562e13bd13b9fc20b372f4b53269740cf6279f836f09ce11b9d32bcee075  gsasl-2.2.1.tar.gz
>  
>  # Locally calculated after checking pgp signature
> -sha256  d45b562e13bd13b9fc20b372f4b53269740cf6279f836f09ce11b9d32bcee075  gsasl-2.2.1.tar.gz
> +sha256  41e8e442648eccaf6459d9ad93d4b18530b96c8eaf50e3f342532ef275eff3ba  gsasl-2.2.2.tar.gz
>  
>  # Hash for license files:
> -sha256  8908e3d66e17102a3b921e1f7f80be5dc9c905ad15561579d46a7074387e311b  README
> -sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
> +sha256  e3d1b8a82b97dc6083b2600a6beb0396bbefbe384fc1cd39d0e8cb04bbf2bd33  README
> +sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING.LESSER
>  sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
> diff --git a/package/libgsasl/libgsasl.mk b/package/libgsasl/libgsasl.mk
> index b8570058a41e..8670f43b6f22 100644
> --- a/package/libgsasl/libgsasl.mk
> +++ b/package/libgsasl/libgsasl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBGSASL_VERSION = 2.2.1
> +LIBGSASL_VERSION = 2.2.2
>  LIBGSASL_SOURCE = gsasl-$(LIBGSASL_VERSION).tar.gz
>  LIBGSASL_SITE = $(BR2_GNU_MIRROR)/gsasl
>  LIBGSASL_LICENSE = LGPL-2.1+ (library), GPL-3.0+ (programs)
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
