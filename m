Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62DAFC87FCA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 344A740599;
	Thu,  7 Aug 2025 18:24:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ertvVGhnYD3E; Thu,  7 Aug 2025 18:24:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26B6C4055D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26B6C4055D;
	Thu,  7 Aug 2025 18:24:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AFA9610A
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92F1F60642
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id locuDk34KIVk for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:24:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 805E9605F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 805E9605F1
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 805E9605F1
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:19 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-459d44d286eso11191425e9.0
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591057; x=1755195857;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CAkTbrPyXV9l+ou4uEMFZaus084KEuI6f55aI4K42L4=;
 b=mzPgg5nwR/s15oPCo3Xs9dKoXwqzKMwSxIBlf/Aq9dM2FKE9gJqjThe/57ElA7fxmF
 oJ5WJWm4swYaJVgZhIA/D0fmCDZ2xdr90BbounwKYXOGKYmj1MqDcVMUksJu5S/MVC5x
 6nJTjFIj2KDnt5Z27Oo9mrIZAAogGBTbDNoQaryF58wEC3MMNwSGIoTsa4XDyh9FLixc
 b/ccy7Ewilrc3nMDFGe7DrhzfHlKnTjzkkepbMwW4rSloAR0BqKWyazpVwOGgE4I1bjT
 Jh5KF1YOpYvVjitYyQFoAmrgzr0E+eXAp7ixj2kTuXjsuJ4r2y/r5EZL7UyIRqJ0VSGn
 7BJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIP3Ds6Pj4xozIfbXNwcIYXoUF49wOZHmT42ThYjwkx0fCiNGix/itWFiFAe2lqcDidUa5xxpkQ8I=@buildroot.org
X-Gm-Message-State: AOJu0Yz3K8bZNMIssmQbA6Jm4lHjdiE8qXFek1mGlgCDQuDBa7td+rrx
 q7CeSGuhAi2vNPbgy7QZJmhvlvwM0nwgbsxROiXGfSz7+5kOHqyHpiPSsUPSX+HKkxESUo6pCfn
 Al2VO
X-Gm-Gg: ASbGnctqrfdSE3bINX7HOCgeLBxqOMOcUu53/nVxGpBr9pcEMLYqTyin5neBo22hHtZ
 0Q9atR/n0Ta4JpP76DGv3yq5058ZmGkz4CsFY3b+zbARcif8SfrLIPA5JA/Q34/1KrIEQcN2ndG
 l4dYTbW5jgvtWPiSUg1VB+u63glDdrh8wkI3Gj0UuooCCqgKNhpTppL67EjNPRvbeVif9vU7vHM
 prlEZywYhxHauHJEBc0hDSBHhLcmmf4EUlmqOh6KdxDRJ50zH2Ai09jR9p//fKqV7QfRWWJuThf
 jzcTzCyzqFZB3lp2nMNEbI2QSPaCEuLqZcx1ggESlh8pemOoHmnbdPB0C61IHwx3Pbq/Vn4L3QO
 Fee5RnA/tRrYc2w==
X-Google-Smtp-Source: AGHT+IHLX1vGlM85/V4m+HdTN/N+lif8WR/HHl/M3Ud5Wno3Km1p6rmCUxXjdQSFrTgLab17BM56Ew==
X-Received: by 2002:a05:6000:250e:b0:3b7:8ca6:bc15 with SMTP id
 ffacd0b85a97d-3b8f97f5ccfmr3930367f8f.29.1754591057559; 
 Thu, 07 Aug 2025 11:24:17 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459dc2647f6sm86489565e9.2.2025.08.07.11.24.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:24:17 -0700 (PDT)
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:24:16 +0200
Message-ID: <20250807182416.724872-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250721210132.C4BFA869C2@busybox.osuosl.org>
References: <20250721210132.C4BFA869C2@busybox.osuosl.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591057; x=1755195857; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CAkTbrPyXV9l+ou4uEMFZaus084KEuI6f55aI4K42L4=;
 b=iDmbQM2zNsbWf68wPqOsxdynaMVYGHZyLmP4ZDirwla9jCKfh945TsgBA9Xq89bswi
 B4Dosz3lnQc56axSeBZCFhevmtckrrlD63jO2f71l80sq4H1wUxG3XMzLc9867wnib+7
 3Y+CaH0jXYeAFARskMD+f2fwK5tM5Vm2ie5Azfy92PhzDutnTKALv1QIzMJ+MtCx3n/1
 UJ/MLniwukzcfLQlEES2q+vusxMUMf7Wh1v3AWjUO+yerCWUV6NuZpiZ1KsD8B09bfcu
 4CeavmhwrjroPm9gjhhe82lQ2M5TpC0OBr0sDGawRhlaXxuZ1jp3uJyMbW+x08tfP4BI
 64og==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=iDmbQM2z
Subject: Re: [Buildroot] [git commit] package/rtl8723ds: fix build failure
 with Linux 6.15
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
> commit: https://git.buildroot.net/buildroot/commit/?id=54ee4a71c0b3c775067dca517a3780f31cc7f257
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Benetti Engineering just took over Larry Finger(lwfinger)'s repository [0]
> rtl8723ds since Larry unfortunately passed away[1](RIP) and there are
> pending PRs that will never be checked as stated here. So basically move
> github user to benetti-engineering-sas and update version with latest that
> fixes build failure with Linux version 6.15. And let's drop local patches
> that are now upstreamed as well. And of course let's update package's
> URL due to the moving.
> 
> [0]: https://github.com/lwfinger/rtl8723ds/issues/53
> [1]: https://lwn.net/Articles/979419/
> 
> Fixes:
> still not occured.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  .../rtl8723ds/0001-Fix-build-with-Linux-6.13.patch | 35 ----------------------
>  .../rtl8723ds/0002-Fix-build-with-Linux-6.14.patch | 33 --------------------
>  package/rtl8723ds/Config.in                        |  2 +-
>  package/rtl8723ds/rtl8723ds.hash                   |  2 +-
>  package/rtl8723ds/rtl8723ds.mk                     |  4 +--
>  5 files changed, 4 insertions(+), 72 deletions(-)
> 
> diff --git a/package/rtl8723ds/0001-Fix-build-with-Linux-6.13.patch b/package/rtl8723ds/0001-Fix-build-with-Linux-6.13.patch
> deleted file mode 100644
> index 2350dc2e5e..0000000000
> --- a/package/rtl8723ds/0001-Fix-build-with-Linux-6.13.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From d71ab09447d9c3043203b5c3b5868e99bc4e0ca8 Mon Sep 17 00:00:00 2001
> -From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> -Date: Wed, 16 Apr 2025 22:00:59 +0200
> -Subject: [PATCH] Fix build with Linux 6.13
> -
> -Commit:
> -https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9c4f830927750a2bf9fd9426a5257f0fdce3b662
> -adds struct net_device *dev as argument to set_monitor_channel(), so let's
> -add it to cfg80211_rtw_set_monitor_channel() according to Linux version.
> -
> -Upstream: https://github.com/lwfinger/rtl8723ds/pull/51
> -Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ----
> - os_dep/linux/ioctl_cfg80211.c | 5 ++++-
> - 1 file changed, 4 insertions(+), 1 deletion(-)
> -
> -diff --git a/os_dep/linux/ioctl_cfg80211.c b/os_dep/linux/ioctl_cfg80211.c
> -index 53ccef4..75391e7 100644
> ---- a/os_dep/linux/ioctl_cfg80211.c
> -+++ b/os_dep/linux/ioctl_cfg80211.c
> -@@ -4520,7 +4520,10 @@ static int	cfg80211_rtw_set_channel(struct wiphy *wiphy
> - }
> - 
> - static int cfg80211_rtw_set_monitor_channel(struct wiphy *wiphy
> --#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 8, 0))
> -+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 13, 0))
> -+	, struct net_device *dev
> -+	, struct cfg80211_chan_def *chandef
> -+#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 8, 0))
> - 	, struct cfg80211_chan_def *chandef
> - #else
> - 	, struct ieee80211_channel *chan
> --- 
> -2.39.5
> -
> diff --git a/package/rtl8723ds/0002-Fix-build-with-Linux-6.14.patch b/package/rtl8723ds/0002-Fix-build-with-Linux-6.14.patch
> deleted file mode 100644
> index 3027489e33..0000000000
> --- a/package/rtl8723ds/0002-Fix-build-with-Linux-6.14.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From d75e35dea1b2551c12e54d5997a1db946ab06080 Mon Sep 17 00:00:00 2001
> -From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> -Date: Sun, 18 May 2025 01:24:26 +0200
> -Subject: [PATCH] Fix build with Linux 6.14
> -
> -Commit:
> -https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7a53af85d3bbdbe06cd47b81a6d99a04dc0a3963
> -adds argument "unsigned int link_id" to get_tx_power(), so let's add it to
> -cfg80211_rtw_get_txpower() according to Linux version.
> -
> -Upstream: https://github.com/lwfinger/rtl8723ds/pull/52/commits/d75e35dea1b2551c12e54d5997a1db946ab06080
> -Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ----
> - os_dep/linux/ioctl_cfg80211.c | 3 +++
> - 1 file changed, 3 insertions(+)
> -
> -diff --git a/os_dep/linux/ioctl_cfg80211.c b/os_dep/linux/ioctl_cfg80211.c
> -index 75391e7..adc1fec 100644
> ---- a/os_dep/linux/ioctl_cfg80211.c
> -+++ b/os_dep/linux/ioctl_cfg80211.c
> -@@ -3362,6 +3362,9 @@ static int cfg80211_rtw_set_txpower(struct wiphy *wiphy,
> - static int cfg80211_rtw_get_txpower(struct wiphy *wiphy,
> - #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 8, 0))
> - 	struct wireless_dev *wdev,
> -+#endif
> -+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 14, 0))
> -+	unsigned int link_id,
> - #endif
> - 	int *dbm)
> - {
> --- 
> -2.39.5
> -
> diff --git a/package/rtl8723ds/Config.in b/package/rtl8723ds/Config.in
> index e5123a2aae..0921a55d37 100644
> --- a/package/rtl8723ds/Config.in
> +++ b/package/rtl8723ds/Config.in
> @@ -5,7 +5,7 @@ config BR2_PACKAGE_RTL8723DS
>  	help
>  	  rtl8723bs wifi driver
>  
> -	  https://github.com/lwfinger/rtl8723ds
> +	  https://github.com/benetti-engineering-sas/rtl8723ds
>  
>  comment "rtl8723ds needs a Linux kernel to be built"
>  	depends on !BR2_s390x
> diff --git a/package/rtl8723ds/rtl8723ds.hash b/package/rtl8723ds/rtl8723ds.hash
> index f2829d3f04..d647f9ff28 100644
> --- a/package/rtl8723ds/rtl8723ds.hash
> +++ b/package/rtl8723ds/rtl8723ds.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  4f3006ffc1604854edbd6d25ad468ca57f6bcfd7814e4dab57725f144f00aa94  rtl8723ds-52e593e8c889b68ba58bd51cbdbcad7fe71362e4.tar.gz
> +sha256  97231efcd0e36b8a95c7baf2aa387fd9cf8303ddd66ce463f25c83f9f989e405  rtl8723ds-97d714fdbfc562f71f2e72e5ce6cceb8e2a8be8a.tar.gz
>  sha256  cd5c66af63b509ccd75ec85fee41b6e5cbb77cd6bf9392a54900acc0f02be4a6  COPYING
> diff --git a/package/rtl8723ds/rtl8723ds.mk b/package/rtl8723ds/rtl8723ds.mk
> index 2536450d80..f1b345d548 100644
> --- a/package/rtl8723ds/rtl8723ds.mk
> +++ b/package/rtl8723ds/rtl8723ds.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -RTL8723DS_VERSION = 52e593e8c889b68ba58bd51cbdbcad7fe71362e4
> -RTL8723DS_SITE = $(call github,lwfinger,rtl8723ds,$(RTL8723DS_VERSION))
> +RTL8723DS_VERSION = 97d714fdbfc562f71f2e72e5ce6cceb8e2a8be8a
> +RTL8723DS_SITE = $(call github,benetti-engineering-sas,rtl8723ds,$(RTL8723DS_VERSION))
>  RTL8723DS_LICENSE = GPL-2.0
>  RTL8723DS_LICENSE_FILES = COPYING
>  
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
