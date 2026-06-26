Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB448C43458
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E9C0824EE;
	Fri, 26 Jun 2026 14:56:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PiBPGvmrknBO; Fri, 26 Jun 2026 14:56:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9913C82542
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485807;
	bh=GMGAF/ER1Q9nX2pn+mVpFJ4Y9+T1f0ew7PFsJ/819a0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sK6MxfcUGwzegL4spcnbAhFBfcuSnoJ6oXnmJztNgLlJqfaXJporaX4IPw2cxMGE4
	 2zC/Z1E3DmFhR3SeiyqOQe+kWas+lviqux24LRxUtYHntHRLMiaNQULksGtk38EYB6
	 +O4P8Sc6YGjRhq1pR9uBPiCIehglzNUWu8hsISz1xmGsB3+hEyZEesPXjrLtaLLc10
	 yA3PWTU1/w7IaVNyqEyS2NgcnWBKGIkegiPg6ZNfrdo+XchRYM9w4kW8mdLq9l78y2
	 mnGsXt1T7/dhvishqF6jKP1tmQ+Xf+tMcgBR0d6iCTt2slubbYk6llhq95WW83m0UR
	 gHbp8znbuovSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9913C82542;
	Fri, 26 Jun 2026 14:56:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AD4D231
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70CCD41211
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hYnIvtMAUdtT for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:56:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 62D784121C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62D784121C
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 62D784121C
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:30 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4926fe5be4bso2720415e9.0
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:56:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782485788; x=1783090588;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=10EuPAGhcQiPLrURdJHv95ctfwMHKqRzopMeQfpv8pc=;
 b=KqJrMDqa3PPRnXeAO8d/shbQ3ubOU3WfJEpsTJa5rds5tb9snf81KVoTEnJqLRTfN2
 qon40pZppwVheToWaMg5GyJGylt8Xj9Xm6ODGAn9arTvJypLchglh/dBo4R+7FAV+MBi
 f3pa+8tfix6/MkVWDvZJzl1hwesh5fFZeN2F4CN2F4Tr+R4+YEroLND7vhxTctIYST0t
 hzDdjZRNh6IPfhlO7XSGQwqy4H83cXDoNxheeTOe3xUpu5FjPgzfuUl7JOgOxPX0/EPI
 MezUQ+Xt9oDgO58hSzOpGGcBn6hL7oPSJpowYkL9lMXdPo5FJcPC/byXpO8g1WcnvLOa
 XK1A==
X-Forwarded-Encrypted: i=1;
 AFNElJ/rW2sfDC/nPyXJLJkZBbaL2S/cJ4aL8jJGQ5BwEuTtP+o8CiAPgWUhUt+0syEHu9+aYCMvgite8Mk=@buildroot.org
X-Gm-Message-State: AOJu0YxwEYmRYtJRoQUptB1M1C0CXMzJnqKmOgjyILpRQx0Lvw8bwjIk
 I0xqoBSJFi+3GYY+8pTI0mbVOtsbiAop7Iq5UH7nf6jVPeoIYBH4ZTYHGEnUMBtracs=
X-Gm-Gg: AfdE7cmV8PHg5CpRhmSg+jQQp1Jpb8x9WayLfepaQG20C5kNDerSj6Sz70IipV+u2eS
 7bKqrFulTK1Mbe19TogBFd2+2gsRvyjgC5yVe+3qyyrY2X49whUJyglGSJ/HKVCxsmrBwveV2iJ
 qgEQfnJkJDrME7qfOF9tSku4Wkjr4cQFz6f1aRnwwtPLOTzF2VANoImUstw9pZsEh1cB0820Fab
 N2IglrDxHaOBC7ESl6rIBxO/tSrLIuFOJlQqKPdTWxxU5+gCEbh2+EebETFk2Nbtl+M33Q23pza
 N80Htl3Mr6dmou4hRq0HL3wPZXXoTratAo6ectJt2PRF65FXerUAQQQljaSfJXyOa1cIs8cMtKv
 COjKovQWRsuhWaIYEq2bZ7Nxs1d+V17zvbJhRDP5El3eH6ooIFlYGHBP1Kut/aTS5f3LDNso8Qb
 LHyPDf
X-Received: by 2002:a05:600c:4ed1:b0:492:4717:59fb with SMTP id
 5b1f17b1804b1-4926fc78e7amr20261015e9.17.1782485788449; 
 Fri, 26 Jun 2026 07:56:28 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49268fef710sm148073215e9.7.2026.06.26.07.56.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 07:56:27 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 26 Jun 2026 16:56:27 +0200
Message-ID: <20260626145627.345249-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260619181321.3345513-1-bernd@kuhls.net>
References: <20260619181321.3345513-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782485788; x=1783090588; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=10EuPAGhcQiPLrURdJHv95ctfwMHKqRzopMeQfpv8pc=;
 b=bsAPuIRp+qU4+mSYnMeImFBfkgs7GCLuuC4Yzb/0QWqXiu2aI5sRhlk57ttDwTa+0W
 ZfBp9yu0+nT29NUB2I2hyIkxRGOuIYbOq9Du8ialTHIDufpti9cRIMk+/Wu83iwKw1yi
 2UndcXYtaFv7dEKlJy1pCQQNF5Ci4sJYGnIQH9dNmFhZuC7KDSPW5siVbWILA0N425f1
 fvO488KRhzAF0OiXEUAJN5kL4bAWuoXtB2/vME+Jy7RKn6Rktlcu7MtMayp5nP4N/sdo
 uDFuFp2G1s1vD+/qKlSUZyeUZu9SVF8tx3sI4Xhg9oxQfsG4yhfHaOwlEVsMyfn+Wfyk
 kSbg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bsAPuIRp
Subject: Re: [Buildroot] [PATCH 1/1] package/libgsasl: security bump version
 to 2.2.4
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
> 2.2.3: https://lists.gnu.org/archive/html/help-gsasl/2026-05/msg00001.html
>        Fixes CVE-2026-48829: https://www.cvedetails.com/cve/CVE-2026-48829/
> 
> 2.2.4: https://lists.gnu.org/archive/html/help-gsasl/2026-06/msg00001.html
>        https://lists.gnu.org/archive/html/help-gsasl/2026-06/msg00002.html
>        "GNU SASL Security Advisory: NTLM client use-of-uninitialized-value"
> 
> Upstream does not provide sha1/sha256 hashes anymore.
> 
> Updated license hash due to copyright year bump:
> https://gitlab.com/gsasl/gsasl/-/commit/ec96bad53988cb79060964cf1f1568da4e301fd6
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/cacbb2a74a1a47440ad8e193de23bc645f99817d
> 
>  package/libgsasl/libgsasl.hash | 8 ++------
>  package/libgsasl/libgsasl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/package/libgsasl/libgsasl.hash b/package/libgsasl/libgsasl.hash
> index de24d73c2d..4995ffe823 100644
> --- a/package/libgsasl/libgsasl.hash
> +++ b/package/libgsasl/libgsasl.hash
> @@ -1,11 +1,7 @@
> -# From https://lists.gnu.org/archive/html/help-gsasl/2025-03/msg00000.html
> -sha1  8a845b7ec78e5f27bf69438074ad23867c00d4fe  gsasl-2.2.2.tar.gz
> -sha256  d45b562e13bd13b9fc20b372f4b53269740cf6279f836f09ce11b9d32bcee075  gsasl-2.2.1.tar.gz
> -
>  # Locally calculated after checking pgp signature
> -sha256  41e8e442648eccaf6459d9ad93d4b18530b96c8eaf50e3f342532ef275eff3ba  gsasl-2.2.2.tar.gz
> +sha256  d32be15efd3a04cb19b232f721bdca02cc6ad7ab415df7d79fb2dd2c0da3e0be  gsasl-2.2.4.tar.gz
>  
>  # Hash for license files:
> -sha256  e3d1b8a82b97dc6083b2600a6beb0396bbefbe384fc1cd39d0e8cb04bbf2bd33  README
> +sha256  16a8258f525326a71cba997365505ad32089be4be7a7100f64f308ed01419a11  README
>  sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING.LESSER
>  sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
> diff --git a/package/libgsasl/libgsasl.mk b/package/libgsasl/libgsasl.mk
> index 8670f43b6f..db3b64e282 100644
> --- a/package/libgsasl/libgsasl.mk
> +++ b/package/libgsasl/libgsasl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBGSASL_VERSION = 2.2.2
> +LIBGSASL_VERSION = 2.2.4
>  LIBGSASL_SOURCE = gsasl-$(LIBGSASL_VERSION).tar.gz
>  LIBGSASL_SITE = $(BR2_GNU_MIRROR)/gsasl
>  LIBGSASL_LICENSE = LGPL-2.1+ (library), GPL-3.0+ (programs)
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
