Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A6F6CD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75BFD84357;
	Fri, 15 May 2026 13:34:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0AHxBAXM_qrh; Fri, 15 May 2026 13:34:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABEFF84378
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778852065;
	bh=Xi1c0YsMhwENUbW3iq7m1rA1EktQbl4VvAjskCj2q0k=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Po6PDtRj+mtA118gdf/hH8CrVYjn/ghvICi+J+BDU7W1j/7iEfG2/EwyU9nccMBxT
	 ondBqGkIXG5x/LsZuZt3bAdAONI3bc7BQHSfmUT6AYCYAcYZUOoEJFp7uKxbjuxqQw
	 VpsGWvRrPS3rWGwc4t/534w9sxJFHpVEvZF7csRYWXUs+ekOK/Ftd9RZLbCM0UcUsG
	 PbkburpOmjR59MrjjKTCaWjpcW7mpi3ada+b7FyGFASfhpY7EYGdmqCExQAKVnrPFn
	 ltxNwMRK600/FZkAu59Da//laxgkwOeUMyz5jkOQf0qgP/w4nf9YOY9h9GvUWa9JVS
	 yisOiJuu9lvgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABEFF84378;
	Fri, 15 May 2026 13:34:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E24D336F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D35EB4123B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ezqJ6tTATzFb for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:34:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5770241123
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5770241123
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5770241123
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:19 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-488a14c31eeso62012805e9.0
 for <buildroot@buildroot.org>; Fri, 15 May 2026 06:34:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778852057; x=1779456857;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YgV8/PSnXek+rbE/5fFO3cOqooaf3GOK2n4H9BEMIFM=;
 b=I9/sgl/tT3qa6PCs4imTuExd8CKM0WvlevLZHX0/IcWWGSh2I4iNJDQtF6cxpi7uQ8
 pES/BcEjonR6uQha81ymVH+nFZPOmFc3f7JjUIlOu8POyBGyt0MJUGWsj5S+Cr69tCC+
 jU3w6XkPmqI95914q8EYCWoErS/pO7ggpMfqn74CjOcQnBxCV6kc5T+rbGQsxSftaOXt
 PErfPSfIOzDVpDueasjgYliI4v6ypCkeAVttU3AjUVyn3uIHMgua4xGP4Hps7RYgtU9J
 ZzSw1pHJjyBOO+xWiKiHQif+zbKpo1QGKW7BrkW0Dn/wNqJglJXeb3QY8Dd/exp27XLf
 1Oow==
X-Forwarded-Encrypted: i=1;
 AFNElJ8LHWIPdz4CVkH/3OZZybuIIEJgubNYNoo6H/Vac7Yz2SfAfn1viGdo9N4zaZox1QqU0Hj3fC0z1cI=@buildroot.org
X-Gm-Message-State: AOJu0YxEmOrsBJcgSagOzcjcGJtvnrlzgVXBSSz5s56uCDgjy0/gJy7m
 2skElAHHqz0q+jiEdlSaet450PgHfU2V//zOIAzX/q/CZVg7nmylIkgEDR0SOnYg8PY=
X-Gm-Gg: Acq92OGeLviFkCuLvuTkuBoySF6Nv+MZtRNYhemSPn/9jNY4llM7ESZFSwEvo6riGVo
 E23ShTz0+xEbQL+Q5ARviiNd0CkgirVbmesOeMyNkijM2rH9/YWdjPPdJmayBdg+/hsxGHy1DKZ
 BCdEk7S1Z+ZC2+Gc5u/iy4DEijP/Q60Uj79VlcSe2ZKhaCALYkWXF/e6L3sq+/ajPvzc+FvppL2
 0t0ol/8ta6ZxOcPQnm1NDeuuNtOasa0V7bdjxGgIDBF0t/rigsgZOE1b8261Ya3Km3KCh9CCDD1
 +76ISz1iwDhpJtXwnnkw3MUZXESu8s1bWu/bfiGPZvRPUiRcBB4NouPPCoGoi0EWUqJ2wvJwlAp
 +W/bpI3V6Z3vFtEiMgjBaHY3oZUEJ6pMGSemf07lTBkfFHQXpKKAVNDS1XIOQDdECrfrQN0rse3
 PnlZkTHgXUTcd/jI6bANkcSivZ/upfOECrQR1TXA/CShJJOTF8F3S028Q=
X-Received: by 2002:a05:600c:858d:b0:48f:e230:80a3 with SMTP id
 5b1f17b1804b1-48fe6514c31mr45334965e9.33.1778852057238; 
 Fri, 15 May 2026 06:34:17 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe53ab6aasm71454015e9.2.2026.05.15.06.34.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 06:34:16 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 15:34:16 +0200
Message-ID: <20260515133416.316723-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260430183544.2362642-2-bernd@kuhls.net>
References: <20260430183544.2362642-2-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778852057; x=1779456857; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YgV8/PSnXek+rbE/5fFO3cOqooaf3GOK2n4H9BEMIFM=;
 b=MgFeYYXhq4iAb3b8WsBt+G35A7PU1h5iao9tfntpfIaempkXQ86zHKkUDUo0Zzj5z0
 FbEPAA55QoGs0qicWoZxfjXV3r9fjIeX+OwCQmeFRgeWXlV6KPKRSzH8ZVrwWZ6GA0Om
 sUsq2riqIa394X/FsRaJxXKz4T9euCn6UzRyXZCKJvTgd8U2MnhzW2zhsLXW9eaeCF5d
 jAUGI6S+cEqYHZMoC9Aj9JPalGwK+NIywKL0hGaOQ0EDIz2mLHE6rTYSMwA5UtZrz7Oj
 1w4ge6pL8wH6VDztjYyCZRJrRRz7bDW86m1+pIM8StVAU5AWUf8L+P/B/8VHWFIeba+C
 AaxQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MgFeYYXh
Subject: Re: [Buildroot] [PATCH 2/2] package/libpjsip: security bump version
 to 2.17
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
> https://github.com/pjsip/pjproject/releases/tag/2.17
> 
> Fixes the following CVEs:
> 
> CVE-2026-25994, CVE-2026-26203, CVE-2026-26967, CVE-2026-29068,
> CVE-2026-28799, CVE-2026-32942, CVE-2026-32945, CVE-2026-33069,
> CVE-2026-34235, CVE-2026-40614, CVE-2026-40892, CVE-2026-41416,
> CVE-2026-41415, CVE-2026-42225.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/libpjsip/libpjsip.hash | 2 +-
>  package/libpjsip/libpjsip.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libpjsip/libpjsip.hash b/package/libpjsip/libpjsip.hash
> index 65f52bf3b1..5f8e4b0eda 100644
> --- a/package/libpjsip/libpjsip.hash
> +++ b/package/libpjsip/libpjsip.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  3af2e481d51aaa095897820fa2ee26c30e530590c6ca56d23e4133bbdad369eb  pjproject-2.16.tar.gz
> +sha256  065fe06c06788d97c35f563796d59f00ce52fe9558a52d7b490a042a966facce  pjproject-2.17.tar.gz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
> index 38adeff626..449e44586d 100644
> --- a/package/libpjsip/libpjsip.mk
> +++ b/package/libpjsip/libpjsip.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBPJSIP_VERSION = 2.16
> +LIBPJSIP_VERSION = 2.17
>  LIBPJSIP_SOURCE = pjproject-$(LIBPJSIP_VERSION).tar.gz
>  LIBPJSIP_SITE = $(call github,pjsip,pjproject,$(LIBPJSIP_VERSION))
>  
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
