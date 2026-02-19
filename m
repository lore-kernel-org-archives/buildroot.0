Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF437E9A053
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:26:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A66768130D;
	Thu, 19 Feb 2026 17:26:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 32Ji5QuLYlAT; Thu, 19 Feb 2026 17:26:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C92D483BA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771522011;
	bh=2DgqEw4S+N6bXMoWSpD6wJz9mY0C61KTbzMYuLj4Fbg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=elQFs4+ANTrnPefzLO4/YFSjcjCB+8bJ/lY+P2jwfTvfafmFy6wySgtWXy5sHt53u
	 kM8ua+SRlGhc/SmEBC452mNojnOh9GgrGz6xnsikWVhPvyjjRxPtmzCYPuR4joiQUZ
	 iN5K2p7rDb5XjZMTJBY5MA6whGZ0NSnDY9xcef6oXQIJqH455aUYwUnDMkzZcHf9uT
	 88UxVDuLdUvAyyyysWNHIuqHthpQbCBLiZjSiV1e1qvhFuPLInsC9CnBPFhWlr2qo4
	 1vQu4SnittKAngC5KU+n9/LAsDK/Nc4axLblzmcCIldAbPKUogUeoRK7U+kI552m14
	 7t+opqQrelXSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C92D483BA4;
	Thu, 19 Feb 2026 17:26:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 06B281CE
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E0ED0406E1
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9PiJTjhK1sfV for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:26:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D6F6240642
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6F6240642
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D6F6240642
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:41 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-48372efa020so9892495e9.2
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 09:26:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771522000; x=1772126800;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3yDHtDHjWIhyIQDIzag+5EAQTwCNKEqDd4hW2ScBL7U=;
 b=XRB7djiEJu3Ha9FW0Yi0YVOn9rMT2m2teHy+VEYX20o6mI2Ugg5xdmQjPiZGOaIlbd
 KyIbFuW5ZV0dSSVoGiwzTqlAAGiNSn9mlI7DeerhrlpOBA6SwIYit+4pVTiX7oYdG9QN
 mKFxW4KQ/Abv5pKhGYf/gQU6dUXGX4joESrQnbUFCCCBQZuyfgk9YXKCu3APm4F7nZyl
 0coov6k+K1tnzR0zIVz/qER5jvpVQus9IkFjcROUJ2KR+Ft8Nzjd8duQF3L9L7iOka9n
 pkqcE9aqWibzdNktsjrdthrEPTmcGjGGfn/wAx4ddUxdwc+S2MyW/PTfGHN1zev0zN4o
 lYcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPrV/TFrFHAfPxYt2ZfxwVAJtY92HbmAMOQJI77ffs63Vfup7A8mIB7WoET58qiHg8HTRlF07EdKw=@buildroot.org
X-Gm-Message-State: AOJu0YyTBvWBy1Ha1ddUfk1aCbFm3RH0Udt9DIBC58LAC9kfKQwSNsWS
 XkMUenbKvR4Abd72UNU+a4rvjQZ8QJ5St4G1cre/+zeMUvZ/oRz5hOK3GBf1sFfI5ss+YxXSBG+
 xQjRP
X-Gm-Gg: AZuq6aIv/iAgHWnNctuP9IaNRtY9PM0+fWEdmSC5+VsiR7eZzi2/cKB+UKq2ccvzk0T
 pbrhd08CkZ0PfG7f9y5695+WGr6bH4na310CQFtjgtLNOtprJj19+RHQMMEp5mfjgdVS/iRYB3q
 Lj99n0emWqQMY6seTp6qToUnBLhv50+wpehZLkJ9lAkNze6kf4X5ttlLDOfbdfDybR6li1MkvCC
 uD7SPXKZ5brgiPc6quBMLr4muJ+FwRxGTUb8XgcFNEhI+exPP/5JAtviTOcIUt6XZ+2GHeATF+l
 ULnyYCs1UEa3sf99lF49PbbkIaR0Jl+SypEkT/E4U6eOaGDc8u6WJOuq3uZsQyQDiraityXFqU7
 A7ZZ2B2leCF5e6MAVp/RyO6a3Di9ktLGyFuJEELVo8I6qUz3QoKzQCIztf9+JRlyejn2omqVeSC
 pX9BAqySG7LunCmKBsJ8YnkRO6jw==
X-Received: by 2002:a05:600c:310e:b0:483:885:f0b0 with SMTP id
 5b1f17b1804b1-48379c33ad6mr364468215e9.35.1771521999906; 
 Thu, 19 Feb 2026 09:26:39 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4839f9835f9sm20190335e9.19.2026.02.19.09.26.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 09:26:39 -0800 (PST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 19 Feb 2026 18:26:39 +0100
Message-ID: <20260219172639.341223-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260213223027.1192852-1-bernd@kuhls.net>
References: <20260213223027.1192852-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771522000; x=1772126800; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3yDHtDHjWIhyIQDIzag+5EAQTwCNKEqDd4hW2ScBL7U=;
 b=MFgI15mvVkoZp/qNlCP/kLEPyYAx7Ng1JAEmWKkYhIOcsok2C+p9a1Ucrb2liu4yGv
 TUVkERk4vNN3pgZllM68LR2nL3SiTjyUJmuse7b90XSEgVe2mV9JftCkWBFKyU5rN/Oq
 bne4ib/WI5OHpFb9JW4BUqvk/bbx0OJ+MFCXLnXPNuFBriCcT87GPELAkmgeVAbDuJML
 XmPWJfudJoR3xVcwLt9dOZpEhQs4NQTWx/ciC+7Ru34gfIDs3TJ2P48tZPYdwlgFpUQE
 XikZIyRJ7641Iyi8MTtg9hz5K8CTg+vpqiyEtzpUhSAAZsUUyDvagcjRT0erBnzsMvxL
 3SqQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MFgI15mv
Subject: Re: [Buildroot] [PATCH 1/1] package/intel-microcode: security bump
 version to 20260210-rev1
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
> https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/blob/microcode-20260210-rev1/releasenote.md
> 
> CVE-2024-24853:
> https://www.intel.com/content/www/us/en/security-center/advisory/INTEL-SA-01083.html
> CVE-2025-31648:
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01396.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/intel-microcode/intel-microcode.hash | 2 +-
>  package/intel-microcode/intel-microcode.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
> index 4c6676dfb0..41041370e2 100644
> --- a/package/intel-microcode/intel-microcode.hash
> +++ b/package/intel-microcode/intel-microcode.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  5a9a0d17240f486461bc101ef74f2b8c10675cdd02d0ba0bd6168b061c62e970  intel-microcode-20251111.tar.gz
> +sha256  9232313161ce9dee5facd2870a7bd361d6000b1d409552b5c12efc6498e7f402  intel-microcode-20260210-rev1.tar.gz
>  sha256  03efb1491c7e899feb2665fa299363e64035e5444c1b8bc1f6ebed30de964e12  license
> diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
> index e8bbf15a81..9f6592132a 100644
> --- a/package/intel-microcode/intel-microcode.mk
> +++ b/package/intel-microcode/intel-microcode.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -INTEL_MICROCODE_VERSION = 20251111
> +INTEL_MICROCODE_VERSION = 20260210-rev1
>  INTEL_MICROCODE_SITE = $(call github,intel,Intel-Linux-Processor-Microcode-Data-Files,microcode-$(INTEL_MICROCODE_VERSION))
>  INTEL_MICROCODE_LICENSE = PROPRIETARY
>  INTEL_MICROCODE_LICENSE_FILES = license
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
