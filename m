Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F9CF436B7
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:25:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33DE481350;
	Fri, 17 Apr 2026 15:25:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y0V4KriP7xur; Fri, 17 Apr 2026 15:25:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C637981367
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439500;
	bh=8Bld8HJSfD55YamL3oBiBzvmQ8uEOe3BWNb0nlo8XQo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=g/7V7ZB4D+CMfkFVIP/RDKdA6KKHbc202HHo6DztMUtKBbqsgM/AOljvIQUKjQbDo
	 FIKODu1J+ocJT9eVe7W4E/XCrpLheUjssQg9wO1G7Xzet1JaXupcZX0yaOS66nWhR9
	 kSkbHeOpmh413PF9bb3gv2x/mJiaaoUhC6qOsVj6P1WfknORdULQFDLJGgCQs0Mhab
	 nW5OVF5HlGgKys8IvIhPErxjemvEGUbtucptCAO0SBeZ5eSKOAob9m+w41ejDJP9q9
	 4kDgzBXz4gA5GQVaNtYnXU9ywHfZ/d8BYTdnWPIReMK5mNnRppOsFhNFRaYq4i0QIS
	 C4nubevs0Vsxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C637981367;
	Fri, 17 Apr 2026 15:25:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 30128259
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22C8B406D8
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:24:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZLkHF_jNQBkz for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:24:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F2FBB405E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2FBB405E0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F2FBB405E0
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:24:56 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-488a14c31eeso6175515e9.0
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:24:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776439495; x=1777044295;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hIOXqvEOTyh0ZU39bcl2aMAwba1m2tWv9oV2stpCsjA=;
 b=MvM4CSekTftjgGcOuMKOoEqzx0hmLmj1WW/n/skmuNkvQgk59/raUCOr4tBDEjxYBz
 uf5qUAVUt7t06EK3ftAvCe0dAyVUFyKYnb6qv74lan5QovOCh2nW1hcwxrVduQ7jYlkb
 DvF04soszGZnG+uWx0T3Nstl0F1pCuTM2RZNbiUXVAyZSsu1NzOgy4pGpBq3BoyzA5Cr
 KMA06i5BaViTeIjvruMlpcDTROLIIEXH1txhP62GZN+z9IOT0RhW0fturtOvcp2HASrc
 9FtgGCiPim7sco+4tq8ImEt7Qdh11dVs6vqkt/UH6yOXLFtONni5XVEBeNvFbcftrQzW
 uBcA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/2hltRIsntizjhJOitMiLjggifDk3VCnC/gorWnPzSBO4xXWWiYdIoCmYdh26J18HZhBx8Yc7Q13E=@buildroot.org
X-Gm-Message-State: AOJu0Yzoiv5/WYd2DICAsxnz9AbGQQVR2Fp5a6fB52XKAg7Z6KFKvrzw
 TsiaoucKUOcp7NxDNsEsBHMxTtObOmSreMDj1GKlk3yvTiZJk4in4Jg/h8dZmUFVsuU=
X-Gm-Gg: AeBDieuBDa7ZpSgh9MD5NC2YaqwhDvHe/6ZVvGZz2e98HYLCFn2UHaNUjeklwKsysPl
 tDqPWNPnz9azbuZaWdZOPs01NyQA4jb6oIRZM+rtIn9SWl8Q0/exLsV16zrXg9YXisH8a6wN8UW
 DE4IcJOcGL0XRQB6+tXi23RNzauneS7a6NpY++b8PpISy/SWKhi2m3nJTGFTn4DImEQ7EC4fM74
 XnbEYWot/2D6bAChvu1m9YCyh5Gdev4B7EbRtVQW7WLW8rfd14dSfKZnwGTuR036PSddULX2kPv
 Ephx8L8F4Tjm4hUrjKyTBgeRDqVgS1PZ+lQOtiO/LWxn4CiOOyvB7aScfcnYNFW7gL3rnItr3ei
 BT2g0bRJ0dIOYDtwmZz4dXZrr4qzc7G6N6H1CNcyQpDbJjC/kj6JuKxJYAi18VTuM43Lu+A/b/V
 Etwx1+uKytPS7x9sDJXwndp0NKrc8=
X-Received: by 2002:a05:600c:8706:b0:488:d6eb:e635 with SMTP id
 5b1f17b1804b1-488fb753abdmr53379685e9.12.1776439494868; 
 Fri, 17 Apr 2026 08:24:54 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc1c0354sm46141625e9.11.2026.04.17.08.24.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 08:24:54 -0700 (PDT)
To: Michael Nosthoff <buildroot@heine.tech>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 17 Apr 2026 17:24:54 +0200
Message-ID: <20260417152454.313349-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260408074029.4005543-2-buildroot@heine.tech>
References: <20260408074029.4005543-2-buildroot@heine.tech>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776439495; x=1777044295; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hIOXqvEOTyh0ZU39bcl2aMAwba1m2tWv9oV2stpCsjA=;
 b=F4lvd7Kx2rBU/Zt/2tdZiAEgkxJZ0FW9cE8pOd/99jW8oR5IeiPCeJi+uyrJK96uEn
 oKA4ubsxdkbpEMKds6rFMJtfTXf5KRqoYSHQj1nUnyaFDFZcDa+Javvfqm75Kns9yJRd
 B8/58kWMOUIfWHGOb0sJWIPFlA3jWyhhgd4D6RDB7nhIwwVJS3/Ml210pEsQGBbqzxQy
 0Hnu+PZpoCoccuRiCdJeHmKsubsLpaa+Wp5hDIvBWr0z2s1w5JpCy4ziv5reVnrvE8Sp
 pfcS25r5liRmeaaolHlhrCXhl4KO+fLPJRSs9HPRUAjj2WIn9xbM+446K5RgBfzQzQbz
 NagQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=F4lvd7Kx
Subject: Re: [Buildroot] [PATCH v2] package/libgpiod2: bump to version 2.2.3
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
> Changelog:
> https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/NEWS?h=v2.2.3
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to 2026.02.x. Thanks

> ---
> V2: use correct package name
> 
> ---
>  package/libgpiod2/libgpiod2.hash | 2 +-
>  package/libgpiod2/libgpiod2.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libgpiod2/libgpiod2.hash b/package/libgpiod2/libgpiod2.hash
> index 24bcfafc6c..157e605ed5 100644
> --- a/package/libgpiod2/libgpiod2.hash
> +++ b/package/libgpiod2/libgpiod2.hash
> @@ -1,4 +1,4 @@
>  # From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
> -sha256  7e3bff0209d75fbca2e9fcff1fd5f07cc58b543e129e08b6d4bb1e4a56cfec0d  libgpiod-2.2.2.tar.xz
> +sha256  70012b0262e4b90f140431efa841ca89643b02ea6c09f507e23cec664a51b71a  libgpiod-2.2.3.tar.xz
>  # Hash for license file
>  sha256  f646ad5159efb51c1130a4b43c31f0759750b1e254d2acf510f368ee2e2085c3  COPYING
> diff --git a/package/libgpiod2/libgpiod2.mk b/package/libgpiod2/libgpiod2.mk
> index ae3bcfa207..8803a282fe 100644
> --- a/package/libgpiod2/libgpiod2.mk
> +++ b/package/libgpiod2/libgpiod2.mk
> @@ -6,7 +6,7 @@
>  
>  # Be careful when bumping versions.
>  # Dependency on kernel header versions may change.
> -LIBGPIOD2_VERSION = 2.2.2
> +LIBGPIOD2_VERSION = 2.2.3
>  LIBGPIOD2_SOURCE = libgpiod-$(LIBGPIOD2_VERSION).tar.xz
>  LIBGPIOD2_SITE = https://www.kernel.org/pub/software/libs/libgpiod
>  LIBGPIOD2_LICENSE = LGPL-2.1+
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
