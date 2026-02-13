Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C643EF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E72A615C7;
	Fri, 13 Feb 2026 19:38:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z4r_7gHo3xnN; Fri, 13 Feb 2026 19:38:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B07961628
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011494;
	bh=YYwECXrB/ducor/i9Zonca1eVWu+SIt2ldPjGxXvkGc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Dbe1o3N8DFyQtRJfFrj/NZUM2YjbHJ+/976K5ZTfhZ++NB8XAGc7PVUPGm+sX1CqL
	 LzBn92TO4cHpAoINcipWpvwkdKlbRQMHik9jIkPkWyOPtOsWykkyDyZwUnLJYfUV6L
	 +1AtfcOh6ZNFfVpkoMmhHf/d3hp+jIGDYYYGavhSuC+J5HNcnm7VAjZemuaD4DgeLf
	 kFu1woNTSFsTPsbXOXwdVMJkg2gHHB51jlByxNrjP523PaExs5y1v0rwWUEDahrpsk
	 PXdkn3P20ZZ0Y7USEEmic3bPhwilN6d4nB8Ph5t3khUmLbXt10sdf+4UzJzJeh30IX
	 hte5SMniAki6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B07961628;
	Fri, 13 Feb 2026 19:38:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 68DCBEC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BE2B846E1
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id so1jqZdxza7Z for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 161E48455D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 161E48455D
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 161E48455D
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:26 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4834826e555so12808785e9.2
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:37:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011444; x=1771616244;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MWe7gE+NXP0j+OtUdyhsjBt3oAiVCCru06v5kbJbTr0=;
 b=B9PuYRp1Q55AACQjrhT/yHRkQjjTVlPDxOakQuUCEpRVR4azm886ZP0YwRmPHbWRxB
 juCSs9PugdD7YwnB8JILCMkIItzE/TzPkfFhyO8UrINqB5+7r1AO4tw499fOvI0MNDKF
 /UOLJteDubKIodrE1HnM5pZhWsgTaRNXxMgqpgLRoOnLYMazFaxpopOrRTEmH9fElIgA
 KfVRn9i1/QZbtX4pPNyP8NBb7Bp41IfJDsiRYrVU/ktVjZOqRgbAE94E45Za0Y7LsfNB
 /txGe1PsI8tIxgTrq/a+Be0wyKBPGWK3F11PgsS99UgCkAtUy7hSQwRMzQOcpta6Itsx
 WHSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnwckEWWPn7fXwg8fRg+Eh1FRtPPZpo+UQhXTe9R2wGJ9NrjAfSDopiZ3JwudHCMX35v3qxpM4qCc=@buildroot.org
X-Gm-Message-State: AOJu0Yxxo/OZlKtXnyooxIunAb48fy/S+5kYyG1CAV5sltz4qG3z5u9F
 MOTpzN9VlKukqxzwIJU4WbPF3zF54K6FoK77lWTxhfXK0ak7bgx6OiFhqlCQI4SRsPKHLm4gjF8
 My+PT
X-Gm-Gg: AZuq6aIzCAKrZ5Hysw+GUvaijPDe3iyor6WPTSQKQXG6fQaWqvgKw5irFfoplwf8gKY
 malem/AxMk91F99LiDzDNfQLP4+kh2mulA/7aNPX4/IvTOa05jrUzPSmoeadUWZ93OHQvhATM2P
 G8+9oryLylWKzEmJRCxEqpTNw0JqQVK/bLWGfz6aXL31eTVOyrV7XuhNF8LSw5VuvBFaZvsPYUB
 eeN+NRSRfZ3jmJAZ4waG2IiRDts2Hr1I3bbeBeaxFO2r7FVoZCC0lgmG7qlWZ0MDHaodfWEZQwU
 fdd8+1S4L7mEKzb9o+iFzo6AzTfRdT09te0/GdD2+UTv4RBFvrOApK2c0RTOEhrSzUVuaVPCgqv
 1cr0W9jLx0TBIk9QNVq+aDLycAg+7RANigHkGnhpTk1u6wvWsebEMfkaCItPYhNqR7zGgTBHV0l
 4FMfh7X5NpI+YCJ5U=
X-Received: by 2002:a05:600c:4744:b0:482:f564:d613 with SMTP id
 5b1f17b1804b1-48379ba8f46mr6555365e9.15.1771011444096; 
 Fri, 13 Feb 2026 11:37:24 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835dcfafcdsm370223525e9.9.2026.02.13.11.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:37:23 -0800 (PST)
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:37:23 +0100
Message-ID: <20260213193723.39176-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251001-fix_license-v2-6-bf18911c835d@bootlin.com>
References: <20251001-fix_license-v2-6-bf18911c835d@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011444; x=1771616244; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MWe7gE+NXP0j+OtUdyhsjBt3oAiVCCru06v5kbJbTr0=;
 b=IY5F8Nw3YCEpIkUdsEHlDoc3vd5w1tzcrQACYaSTmadDrnVQgip/SidDD9rktulPra
 kj7dpGOSWw99+lt36VN5HIXOWOvwelLufCpWXpWJD4lmFqJqgFIGq/kIh6EG5/VxuOyP
 WBz1NBTWO+FHcRl3Q7AGVC419bg6a4n37NuibhVPgU7xApghrIox1xYOgYUpVDpA+yMc
 gbX2Ktms60T3EtzC6yGT9OPLFQQihkcxkgCNbL56aOyIGkh/VDBcY4UnZT1kUoahxc5Z
 qD8a0Aed6zyrDLQW7toScubIbeIWBjf4REzCauzGodxIHYN9zM5Ta5M4B4UphWU3ja3r
 BfZw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IY5F8Nw3
Subject: Re: [Buildroot] [PATCH v2 6/7] arm-trusted-firmware: Add support
 for custom license files
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
> The ATF package was not providing any license file when a custom
> Linux version was selected.
> 
> Fix this by adding a Kconfig option to specify the license file,
> with a default value set to the commonly used license paths.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
> 
> Change in v2:
> - Do not show license option if it is not a custom repo
> ---
>  boot/arm-trusted-firmware/Config.in               | 16 ++++++++++++++++
>  boot/arm-trusted-firmware/arm-trusted-firmware.mk |  9 +++------
>  2 files changed, 19 insertions(+), 6 deletions(-)
> 
> diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
> index 72684e5974c1c0c9f8f3453254c5699a0a5d7106..1bc6cac831247a1fdcc4b2cb7f9846eaa472a62b 100644
> --- a/boot/arm-trusted-firmware/Config.in
> +++ b/boot/arm-trusted-firmware/Config.in
> @@ -80,6 +80,22 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION
>  
>  endif
>  
> +config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_LICENSE_FILES
> +	string "ATF license files"
> +	default "docs/license.rst"
> +	depends on BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT || \
> +		   BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL
> +	help
> +	  A space-separated list of license files related to the ATF
> +	  package.
> +
> +config BR2_TARGET_ARM_TRUSTED_FIRMWARE_LICENSE_FILES
> +	string
> +	default BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_LICENSE_FILES \
> +		if BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT || \
> +		   BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL
> +	default "docs/license.rst"
> +
>  config BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM
>  	string "ATF platform"
>  	help
> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> index dca16d396044c5004480fdfb4cf15df6837b4413..303fd2cb09bc1bf59b8ccd2e0865f43099318154 100644
> --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> @@ -18,14 +18,11 @@ else
>  # Handle stable official ATF versions
>  ARM_TRUSTED_FIRMWARE_SITE = https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git
>  ARM_TRUSTED_FIRMWARE_SITE_METHOD = git
> -# The licensing of custom or from-git versions is unknown.
> -# This is valid only for the latest (i.e. known) version.
> -ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION)$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_10_VERSION)$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_8_VERSION)$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_12_VERSION),y)
> -ARM_TRUSTED_FIRMWARE_LICENSE = BSD-3-Clause
> -ARM_TRUSTED_FIRMWARE_LICENSE_FILES = docs/license.rst
> -endif
>  endif
>  
> +ARM_TRUSTED_FIRMWARE_LICENSE = BSD-3-Clause
> +ARM_TRUSTED_FIRMWARE_LICENSE_FILES = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LICENSE_FILES))
> +
>  ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE):$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION)$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL)$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT),y:y)
>  BR_NO_CHECK_HASH_FOR += $(ARM_TRUSTED_FIRMWARE_SOURCE)
>  endif
> 
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
