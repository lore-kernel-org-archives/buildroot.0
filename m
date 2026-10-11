Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3898CA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 14:10:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90C2E605CA;
	Sun, 11 Oct 2026 14:10:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XWz-wbOLSE4N; Sun, 11 Oct 2026 14:10:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9C89F605F9
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791727831;
	b=NJHg0sY1RX1z1MwyaWON8yxKngE8QVcYyKuLnlp6z5AsRuEkPdqtps1hvZLHEHyrM4NF
	 BBWaO9gSBfzVEINIiOo/iB/pP7xCmYRVVK4ZxvxhoV9FfkoRgtMKM4JEUoXs8TMbirgMd
	 cTyw8Ol1t72iBySJ1OQoWKvCuB3lYpdKxFbak0Zof1R2FA0ps3vkpM2GAEWrom5ztsk8w
	 iPMy9W8Wk14VftfWmbtNCvGohPxUz9dp/vl5c9s96lmR58PnizYvUnFC93oEkqqDIcqa/
	 NeAto976VaB/opqaRyMCWbUpMh7VeOf8SIrYIAstXjl3000wzBS0J5uQ7t8RvclMF5A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791727831;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=HXZ72XGsjI6uwqtIPTz7RKBnZmPtSoSsM9UZC/zKRGo=;
	b=l8jlyAwHQGu6P8npGkgFnU1zrppE6jb96/Y7C1nt+ygtlXITGm8kdHh+zJ5di4Hf9UOD
	 dy2xkvA8QhvoWr/Jd6oL0olJfQnrkW7Q4dunhHmIgGOE3AeCUgbEtZgVbYz+JWe3Mp2z8
	 o73Ieb09o2y/juCHRs5QOmGk2xnXlGVFDkxqOryeipqaYjnfbEUPhsS7KLdAUrvPh9nkB
	 5zkg/EbJTZYMe3hVAV01f+2tWzmX9bHIRbi0o9YbQsyEQFV4LP6X58mqsxEbvLoakYcb6
	 PwIoYzrdF6Hw3n4JnmYeH/mbz048Stt33khgQCevspr/oqo7gZhKybOgsAbE49H/9Bw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791727831;
	bh=HXZ72XGsjI6uwqtIPTz7RKBnZmPtSoSsM9UZC/zKRGo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rLRorDE6Pc3aOhMff+NBlTOUcGmcByecINfbNox3nUgfX0UZU3i/jR8uvHVYhvTu6
	 VoUc2QQMpeA1lqqteJ7YPSEG5ixPVIfiVpCtW5whmsSZp66AAsun2X8QILBHD4RViR
	 5FcjPmlNq++cXp/opNAGOoYbyDgQp9JqLtnzb6Bgw3dYRZTttbNgzfB2ixa4EFM4p+
	 ZE47qM9V5l+iuOl6ocQxE21Wk4Qd+mvI/yOqxC8GgpL6Wcwxv/0Q30PzN+nGBo87Am
	 sMc8s3XnaCWOiwj+tAsknSG1E9pca1FUFylT0vZ9YAigESkJ5c23z6QHhIUfji95RU
	 REqPOWP869HVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C89F605F9;
	Sun, 11 Oct 2026 14:10:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C0262E0
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 14:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E7BE405AA
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 14:10:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EKCmYsTM1F6f for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 14:10:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6847D40573
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791727828;
 b=qYjfaHdGAYNCRz9WF6kHS26ghB3j3GrSHcqpaYDmjPTG1F8JzUIYIiXWxE6N0gycRy7Y
 jPMGMx/itdXYONLCcyQzY6pWZnfqDDjlsWMevb5DJENex5JsodYmrlXF8arltXE8HU57m
 2s1z7GZGAOzbxxwoSXOU9cl6vSNX3npEycB/K7RQUMkboP4gVP4HRsOx72bqnUkdlayUp
 vCKWWQdj6ZoMntNum5X+nzdS7syS9blZX0wJcoNrusjqgT640BTVKBT39ZiyCmXHKkoc3
 ijHb4XjZ/n3wdxqjW/72/PpIJeCaIzg4Bja/voq7CPn+IzTmJIXcmzJ4odahMsk62Fw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791727828;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=0yiaNCTicMBDM4ONvTODwV77ua50cqXT33Cf06YbE5I=;
 b=kv7mf0x0eAi0UbEVlnX7ODM7MGM6hHtmPfy1kXfeYF+Jy3rYhPIj+FN6Fz8YOg5t33pt
 OaBJ5e7WwB/29UvyTw7xutpWxy8RVxY0whXDCEcK3ig17ejQzlQwKLblKUYnsdzEMu2aN
 EJDQIpfpkLYGJKR4iT/EbDo2Zhxb7ObQkYaZKyyQ2uovX6VUXAhX/PhBCaE8qeIll5rVh
 nFB+UDJrBxjcPDbiTcN+HtD5YZQps2SknpQTHWxNrq7S+8tIsej0tktOPvIeoFmLTj1SI
 GEAFGeR6XCnU8hx1q59T2OAFviKBOdMjDAJPXgI9ENDWurkzdmZ2PmYSPAINwhYt93A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=DUwv1Rec; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6847D40573
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 14:10:27 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4a1682bff3cso4783735e9.1
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 07:10:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791727825; x=1792332625;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=0yiaNCTicMBDM4ONvTODwV77ua50cqXT33Cf06YbE5I=;
 b=Ddm8csrh3X7jb05dp8sP9c20kgLlvpWdEyMWDTjjbyRQtGSI8MuuykfJnLOihIo4QE
 MvNIUKASUk47LPVgexTO1vFmXCUhAEuchMhe3W+SIqdTdcEnTZP10zM9YV3cmqtV2YgP
 kqrJX9dcSBSijBDgHPR9lHYb/BtrMJYCLtQqTzOJdh8oxpXilv+k5UcEl1IOagSkfFoS
 YirelnTnTzlPaImplbWIBqK7rBnn8WZK/le0lLzjuDgFJpbVDcM/jl7bMKyyV3VTQLmJ
 SLCv/uLkltCvqQ2g+CTxqNu+34chAYsMTGjJbT1mKDe/yJIBAD/1Vbff7L0Y0dAJZCLa
 ibQA==
X-Forwarded-Encrypted: i=1;
 AKwUvByxacN6ZoGjhCLkPLAZBL9HJ2gn8vMNZv8gRTHo6NA3lTrIW4s2xKJnjRTOJcheMQIo0Q6lW3nUTm0=@buildroot.org
X-Gm-Message-State: AFq9FYK85QNJzabRu4lPh2CmeopXQh1X4eubXKnCXjvjQivblWNR5mSA
 YLIsDTTjLMeX5SV7E2dP74kkKfp+ooAMQU+NdZ938IV3bAxSshj91I5NPFvytFcFJLs=
X-Gm-Gg: AYBFou1Sc2btRdEKZFzoaiBxb0vLUabysI6+FK6OrbCcfEqrmZXc1mVAcHRCsKdvfbI
 JwHlRVHmlnWnYlNf+kaWVvOeVGe7sOyP39iK8F67XEnzXBJEhQHhourXy6aE+ujZ5bzEBs+g04F
 OqHJWwBu6Zc0VZ3jdOeiWgqIwCBBjNg6zzc97Qf6WZJ8IQswBmSGoPjY5CiWMBEjnA4idfpsnDn
 R3iy4nMug2S4m1CM+PmQCFcSlTzg8N/EX2LGVDL4CYix+mvNnqCLSCnGfF+fdAOJpCRx2BJ23ce
 BpDxghu4lMM58aavLRjZosPKHeHuxSh06WzmdD4WcEi4mNfU4BSQmMH8p4zrn9Nh2PFoDvSdrIG
 yoUP7ayeWD43D5Bg6dSgDHa/YLftSAX4qCp6he1/kVJNa0q9aCVAwT/trcED59II+GUsNilk4El
 khPum8MvO9v+dsR1x3GeI5R+J4SVLt4D4M4NVyEhc33Hz7rnsSbAUn0cMxZ8Vfpndf4R5VtRyDy
 X77601o0aEu3sXfdtIyQBz6AmduZd9r5V4RHJU3MjI2j8Y5WKKS5/q2
X-Received: by 2002:a05:600c:609a:b0:4a1:717b:7976 with SMTP id
 5b1f17b1804b1-4a18e4b15e5mr131108815e9.35.1791727825195; 
 Sun, 11 Oct 2026 07:10:25 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-f938-e455-e8cc-7064.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:f938:e455:e8cc:7064])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9acfa28sm14712953f8f.51.2026.10.11.07.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2026 07:10:24 -0700 (PDT)
To: Heiko Stuebner <heiko@sntech.de>
Cc: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org,
 Etienne Carriere <etienne.carriere@foss.st.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Heiko Stuebner <heiko.stuebner@cherry.de>
Date: Sun, 11 Oct 2026 16:10:23 +0200
Message-ID: <20261011141023.720881-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260318184110.2121178-3-heiko@sntech.de>
References: <20260318184110.2121178-3-heiko@sntech.de>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 2/3] boot/uboot: add option to override
 the CPE_ID_VERSION
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

Hello Heiko,

A general comment to your series.

If your custom version is based on 'git' instead of a git commit hash you can
use 'git describe' to have a something that should be parsable by tools that
read CPE ids

Otherwise I have the following comment:

In reply of:
> CPE_ID_VERSION defaults to {pkg}_VERSION by default.
> 
> When using custom tarballs or repo-revisions, this VERSION will contain
> either "custom" or the repository revision as its value.
> 
> This prevents tooling like CVE checkers, etc that use the show-info
> output to know what base version to check against.
> 
> To solve this add a config option to (optionally) allow overriding the
> CPE_ID_VERSION if needed.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>

> ---
>  boot/uboot/Config.in | 11 +++++++++++
>  boot/uboot/uboot.mk  |  3 +++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index 3331b81e8c..410ad60e9c 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -83,6 +83,17 @@ config BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION
>  
>  endif
>  
> +config BR2_TARGET_UBOOT_CUSTOM_CPE_ID_VERSION
> +	string "Set custom U-Boot CPE_VERSION"

Here instead you can default to

```
default BR2_TARGET_UBOOT_VERSION
```

> +	depends on BR2_TARGET_UBOOT_CUSTOM_TARBALL || BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG || BR2_TARGET_UBOOT_CUSTOM_SVN
> +	help
> +	  CPE_ID_VERSION defaults to the package version, but when using
> +	  custom tarballs or custom repository revisions, the version of
> +	  that software is unknown and set to custom or the revision.
> +
> +	  Allow to set a separate CPE_ID_VERSION, that will generate
> +	  more accurate CPE entries for the software-version used.
> +
>  config BR2_TARGET_UBOOT_VERSION
>  	string
>  	default "2026.01"	if BR2_TARGET_UBOOT_LATEST_VERSION
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 5b3f46ac74..795bfd6c00 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -11,6 +11,9 @@ UBOOT_LICENSE = GPL-2.0+
>  UBOOT_LICENSE_FILES = $(call qstrip,$(BR2_TARGET_UBOOT_LICENSE_FILES))
>  UBOOT_CPE_ID_VENDOR = denx
>  UBOOT_CPE_ID_PRODUCT = u-boot
> +ifneq ($(BR2_TARGET_UBOOT_CUSTOM_CPE_ID_VERSION),)
> +UBOOT_CPE_ID_VERSION = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_CPE_ID_VERSION))
> +endif

This would allow to instead just do the following unconditionally:

UBOOT_CPE_ID_VERSION = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_CPE_ID_VERSION))

>  
>  UBOOT_INSTALL_IMAGES = YES

Best regards,
PERALE Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
