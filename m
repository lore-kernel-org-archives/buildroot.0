Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E625EF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DE8261387;
	Fri, 13 Feb 2026 19:41:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WIjLpAmNjYtv; Fri, 13 Feb 2026 19:41:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AC54613A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011679;
	bh=8CFuSYAo5H33dpKXhyH3tNGQIyetfw+hL/K8dHm3LEc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oNN/MWikAhonVOLjnK6APkSioTOW0So6KWrySN1Z97+Qai22q2aLP1tyJKpxBZSIJ
	 CeunFDOtd/PJcK+8VxpQKQNI+0agTWQRT7zyYfuyWNgXmENasO8w0mtaC5LzZirlvd
	 XedEKv8IeE3Iktq11HC+Ju3+KuD4WK+vLbkO5NZGZiZZRK/pnyyXAg+1oUc980rJeF
	 KZaDM1pCDpD81eVdeRtuuzZxrVK8/za1xNe9lRU0y4UqmSe0pikJC2Id1uZrt/3XQI
	 DIsibdGvQ3Tl0XIpX0mW5Fqy4clW4rcdgBSVJCM/3af+nyq3i9jq6/1CnFrfvRtKlH
	 ta3aXj/6/WISQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AC54613A8;
	Fri, 13 Feb 2026 19:41:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 66145EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5486B4090B
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:41:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5woerxqizCBA for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:41:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B26894085E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B26894085E
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B26894085E
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:41:15 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4807068eacbso10334535e9.2
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:41:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011674; x=1771616474;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=i4Jik/NE9021YzVkTnj2jGjhXFNqYe27klRqss1cJx8=;
 b=d+YV/t2dRx0DaRglwlDG+BDQJnvBmFuCpKq6Yd4ImjllJFFjAqeki13CWFiFXHIbqf
 zA9AYpRG64RnPexGzlE08ddk008IVZv2atw4LK42Y5pOrvghG9kjvC1ZHrip5frCjlS1
 4gifGrPb/vNA5B1wo9VkJtulIJnCXtCWkPCq8UUJA/8TIzVFO0ewDRN9G8iCy+6icVQd
 bP74HUEyF1Uq3lc0f+039f3lNCkQx8vhhtz1Bac1UqUl/GPyJyxI5uV3G44We/M/EJBG
 vjeUlk/kMgjmBY3mw0sodnsLtYIyOJDK6vgdX24CH/yWXy9/3jgPDSBjkt5rCbdACARX
 O6Dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdjKNmKp+OEzOuRVEBqIYGANjoRROBOKtV/N/pX9PhBXRvDBKWrtQqzCs4frRSfEQWUkkLaRit/uU=@buildroot.org
X-Gm-Message-State: AOJu0YxTiW3DtE/KOOdogo53GzfQT7bXnEzE+R50K+iquAkvvgdgvS82
 W5qv/HZTonK5YhBzoTllySfQPVC02o2z9qakP5mAHPJQDh6ZVc94GQKKAVuF6G6AH8A=
X-Gm-Gg: AZuq6aLfPX9f6JRMQAEKEplubagiKN6sm5PsaQ9jcmDvX3TGceM0ysW/3160PvgZKwn
 s2y/KzQ4Juijo6rIAylN4R8uAEPNABz83gfjP4uWE1K7DA80Myp/G+YINq79d9gsYkzOdnMJxQM
 0VKSDqHjoUyi9kU1snvKuK98pJiQ6l3ynvbKzBEeTtCY9YvdDgS4lcPgfUsPTye0FdKbIS47mxB
 ze2UKcYqyyFqTGl7J/hXczn/6LGBn3bkfPIE65n+lCmOM+yRKzdp39tsBtnWnJ7GNOat4viwFej
 dLpXDvXQAproul8U+xOFQQtlh+3Klad+ciZq4v77L83BcPICjzPneVcRE/NJko2dPBdJ8BGbvTa
 B5ZkU35jyOWt6ZsxhSPzoUs1EY1VpNpgxRFi0VUC3WeGJrHTFA3YmMAJsWkv+r0eSmn3Pouqw1d
 JFuIT9h5Ed+wT+lvg=
X-Received: by 2002:a05:600c:4f90:b0:483:6f7c:19f4 with SMTP id
 5b1f17b1804b1-48373a6f4a7mr43670415e9.30.1771011673533; 
 Fri, 13 Feb 2026 11:41:13 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48370a53c51sm24042615e9.6.2026.02.13.11.41.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:41:13 -0800 (PST)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:41:12 +0100
Message-ID: <20260213194112.48564-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260204150049.3057699-1-peter@korsgaard.com>
References: <20260204150049.3057699-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011674; x=1771616474; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i4Jik/NE9021YzVkTnj2jGjhXFNqYe27klRqss1cJx8=;
 b=RjbHYNeQyjPpcFGkrF/ZH50zTWR8iE97U75jscPFLyg6dsLGkPvUDo84iiLBbWnnlE
 G/7hReEbY2G7dD+aZb2nhUT4ugNB7cUNGnkenQb3YPhW2YRi+j+kCwHalX4y6zIB2lJy
 xyTSBU9S7y/dndizBPkNAp/oClHgpnfYNCIFnCSdjrz8++h9+eE95tmLbInHNz+2c/WW
 JeW+M3nQ7wveOYXgCzp3Yrd533EOmSodqGiyOjAp/Wl5swq4BNeVuHLp66zcYdX48vkZ
 SN2cCjo7mUFSHfHPcbVaduSekyFsa4sETONELWnQJOYUtRJKw/3h6TgNgI1y8nv784e+
 71qQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RjbHYNeQ
Subject: Re: [Buildroot] [PATCH] package/{glibc,
 localedef}: move to sourceware.org git repo
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
> As described in https://gitlab.com/buildroot.org/buildroot/-/issues/160, the
> github mirror is getting shut down - So move to the sourceware.org git repo.
> 
> The github mirror was originally used because of performance and reliability
> issues with sourceware, but that seems be resolved now after server/RAM
> upgrades - E.G. from the sourceware news:
> 
> April 22, 2024
>     server2.sourceware.org now has 512GB RAM, thanks Red Hat.
> 
> https://sourceware.org/
> 
> So change back to fetch glibc (and localedef) from sourceware.org over git.
> 
> Notice: The git archiving leads to slightly different paths and permissions
> in the tarball, but the file content is identical:
> 
> mkdir a && tar -C a -x --strip-components -f \
> 	path/to/glibc-2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125.tar.gz
> mkdir b && tar -C b -x --strip-components -f \
> 	path/to/glibc-2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125-git4.tar.gz

Applied to 2025.02.x & 2025.11.x. Thanks

> diff -urpN {a,b}; echo $?
> 0
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/glibc/glibc.hash       |  4 ++--
>  package/glibc/glibc.mk         | 10 ++--------
>  package/localedef/localedef.mk |  5 +++--
>  3 files changed, 7 insertions(+), 12 deletions(-)
> 
> diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
> index a58bb7b9a7..0a11cfdb5e 100644
> --- a/package/glibc/glibc.hash
> +++ b/package/glibc/glibc.hash
> @@ -1,5 +1,5 @@
> -# Locally calculated (fetched from Github)
> -sha256  f63ffa06cd17ee8ff891f6de41de6e189b96edc6b2be2807ae597291f4464388  glibc-2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125.tar.gz
> +# Locally calculated (fetched from git)
> +sha256  737e3b2bfee2e3e209e514133f4ff7d2bef0d0dc903fd46b4e2244f6c998f7b2  glibc-2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125-git4.tar.gz
>  
>  # Hashes for license files
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 44bf9c4b06..80d21b86ed 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -8,14 +8,8 @@
>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
>  # When updating the version, please also update localedef
>  GLIBC_VERSION = 2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125
> -
> -# Upstream doesn't officially provide an https download link.
> -# There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
> -# sometimes the connection times out. So use an unofficial github mirror.
> -# When updating the version, check it on the official repository;
> -# *NEVER* decide on a version string by looking at the mirror.
> -# Then check that the mirror has been synced already (happens once a day.)
> -GLIBC_SITE = $(call github,bminor,glibc,$(GLIBC_VERSION))
> +GLIBC_SITE = https://sourceware.org/git/glibc.git
> +GLIBC_SITE_METHOD = git
>  
>  GLIBC_LICENSE = GPL-2.0+ (programs), LGPL-2.1+, BSD-3-Clause, MIT (library)
>  GLIBC_LICENSE_FILES = COPYING COPYING.LIB LICENSES
> diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
> index 254a79026a..4da110417a 100644
> --- a/package/localedef/localedef.mk
> +++ b/package/localedef/localedef.mk
> @@ -8,8 +8,9 @@
>  # As in glibc.mk, generate version string using:
>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
>  LOCALEDEF_VERSION = 2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125
> -LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
> -LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
> +LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
> +LOCALEDEF_SITE = https://sourceware.org/git/glibc.git
> +LOCALEDEF_SITE_METHOD = git
>  HOST_LOCALEDEF_DL_SUBDIR = glibc
>  
>  HOST_LOCALEDEF_DEPENDENCIES = \
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
