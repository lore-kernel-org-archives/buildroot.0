Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08EDDFD9E11
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 20:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0EDA607EF;
	Thu, 26 Feb 2026 20:47:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z7jaG5nhg6xr; Thu, 26 Feb 2026 20:47:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C6EB607FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772138843;
	bh=KSyCK9eu9/L27V3juycyhrgYyGWSFZYYks70F0l7Qj8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XBBa682B/wD8fzTDCZrKG0+wNtRFr6HsWEs/UgdXxwdzE4kHOiaD1yjZGQhefHbPt
	 zgIke1lKnZHgMhnz4NE2Jkd1fWN+scTa87uLajEqj4vbS7DYejEDANAOX7yumWrUZU
	 FNekVG6268wDA4NmT5GhReIsULew3xfv1djv1kccxh11njEY90c/KumYaj9obBpaSR
	 1jwAOagIuTmBVgafP9c7PJkFo6uTaLKtbljc2j8KPeLs8SALbkEDEHo+XLOh22rc23
	 ddiTPHBiUls32uOVnKq1tm+mOFU4VD2ignDPsOTwf7j9wSG3RQAtOUKShaLe6i6nh8
	 xe49SL9hqhO+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C6EB607FB;
	Thu, 26 Feb 2026 20:47:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DEEB11F3
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB71580E4E
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:47:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Laley6nz2RZ for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 20:47:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B69BB80E4D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B69BB80E4D
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B69BB80E4D
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:47:12 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-436317c80f7so1648364f8f.1
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 12:47:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772138831; x=1772743631;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Dkne2T/TKdB0ybFQJ6walVI8BOARZfHQj+j1/7d4EbY=;
 b=vMVEKyqu/wD89oHgkD6BUhFeSJ75CAebVaBozDvHYamtDhJ7MDyLZJb0h6jlN+/Oel
 NovvVPq4ONEEx3bk+hj+jMfdbqzDFelXpR3/u+4iuoq9+Bd75twzbzcb748FTlUBCHXo
 58XCb6JpWI6a0iR14V52VF9W6iihcO7l1gVAhgpHRQ7ObncIM1zJ3wmM1+ZFs9uJ55/h
 oroe/l/wyoO+CRMo4Lb3p2zAc6UknJkzLJLDX5PMw2Zcwwx1LxCW2sCq44ZuqXi2bJNM
 pKXQyopMCO0AErqIEd3DOj6F36FJAiDPVJ8AR1FVrNr0WEYes3hzMxAJCldbwlqfJq0J
 tiYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyWnKZxcv0AWbNb4nB8HUi/j4lE4dj+t9QYKK0jJGNLuqleb5GjCQM7TNWWxqd5LQf8G2Z6ZeCI7A=@buildroot.org
X-Gm-Message-State: AOJu0Yz6wvRStEPTmNO+8uMzhXF/Hmx0eTBfzSK5tpFUhpOpdMq05sJQ
 UtIMokPfJzRcdThkA5AN380CjI0ZPBMMV+QXguqxqnoQwwllzTaAlI0NwVFMXQHTCD5JZkbB0xz
 mpfHd
X-Gm-Gg: ATEYQzxlFMXx9aN3S4lLC+Ec/GJwcvWoNjIWBusyLc+gq5px8757ibYNbdLsTPnAhP4
 WuFVhs0kftpilFXg0WB6ft+wyIVJ1x603cJgsOuWHHky5uU7KNL4e9wgcs7OAkY2YZQ/udD4s4d
 dtgNf40XorZKx/P7K70qrVqDDLxsdgv/3vMnsLJBQBME15L49M4+KAikllRPCyhsJDXM6GEOSha
 GZdY4uiC8IspzQ6JrS16DkIcVTSXpdMA/6GloX4DuTkXe6Tif2w25oxinp9CTEjEirLR0mTO1vI
 y4FMpPF7OhksUoDZcfn0W7EizzPlp9+EaOzAOwIJoxuSvpOxu7DZ605Iydp2Bzn14rygbqyUU7r
 jUQlmox62Kgc/VeGRBF6ZlsSdxg6txQdxITjUfNd+b7e/gmHCg6kGZbjHQZZPztfs8BXhH2XysY
 OPtIZHC2F7rkqOkeI=
X-Received: by 2002:a05:6000:2401:b0:439:8c72:1d8f with SMTP id
 ffacd0b85a97d-4399d97499dmr716114f8f.2.1772138830662; 
 Thu, 26 Feb 2026 12:47:10 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c60f8e5sm2148648f8f.4.2026.02.26.12.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 12:47:10 -0800 (PST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 26 Feb 2026 21:47:09 +0100
Message-ID: <20260226204709.253947-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221202603.467160-1-bernd@kuhls.net>
References: <20260221202603.467160-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772138831; x=1772743631; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dkne2T/TKdB0ybFQJ6walVI8BOARZfHQj+j1/7d4EbY=;
 b=U0PMg3i7XkMzZe7UW/8m+C9Tqh/64nJhK7+QAN3ndUBrmokiDfg6kUC14kxL8hm9JA
 BJNsluCZFgOz4a1QZG7FS1vLjhOtT4jjtGXVGdggDGNyFmgGfNeFof0wrNUudxwPvaXo
 DrCNrK+1nPExGZwsEIelo7k7b+L5ztyeMm6zLl3FYXbCsVhBQAhdEf9DjTZkI52xp1uq
 nOynG/oZmckEUEso3ziO+3R0hYcF+OMhsufSTNPHvIzhiRi3JViO8qhwXj06ZmYOB2W8
 67E/qFNhHDdZ1Q+WJJNgm8Jt/8tUrr6NHccwqW9CNkgAtsIrml/R3aWBD+GYRe/VWeUn
 gsgw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=U0PMg3i7
Subject: Re: [Buildroot] [PATCH 1/1] package/qemu: Remove CRIS support
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
> Buildroot commmit edfc67fb1a5f0fe67ba9de91e90b06a44902c231 bumped the
> package from 9.1.0 to 9.2.0 without removing support for CRIS which was
> removed upstream in version 9.2.0:
> https://gitlab.com/qemu-project/qemu/-/commit/01d01edc9fc4623e93118bc8cb8c69a46d707026
> 
> https://wiki.qemu.org/ChangeLog/9.2
> "The CRIS target has been removed without replacement"
> 
> Fixes:
> https://autobuild.buildroot.net/results/376/376ea96ddfc0f220bca8bd241614303747f61bd4/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  Config.in.legacy       | 6 ++++++
>  package/qemu/Config.in | 5 -----
>  package/qemu/qemu.mk   | 2 --
>  3 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 4539b19bbe..a2a7b06a6d 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,12 @@ endif
>  
>  comment "Legacy options removed in 2026.02"
>  
> +config BR2_PACKAGE_QEMU_TARGET_CRIS
> +	bool "qemu cris support has been removed"
> +	select BR2_LEGACY
> +	help
> +	  CRIS support has been removed since Qemu 9.2.0.
> +
>  config BR2_PACKAGE_DVDRW_TOOLS
>  	bool "dvdrw-tools removed"
>  	select BR2_LEGACY
> diff --git a/package/qemu/Config.in b/package/qemu/Config.in
> index e16eafe446..0b16c8c284 100644
> --- a/package/qemu/Config.in
> +++ b/package/qemu/Config.in
> @@ -189,11 +189,6 @@ config BR2_PACKAGE_QEMU_TARGET_AVR
>  	help
>  	  AVR 8-bit microcontroller architecture.
>  
> -config BR2_PACKAGE_QEMU_TARGET_CRIS
> -	bool "cris"
> -	help
> -	  ETRAX CRIS microcontroller architecture.
> -
>  config BR2_PACKAGE_QEMU_TARGET_HEXAGON
>  	bool "hexagon (linux-user, only)"
>  	depends on BR2_PACKAGE_QEMU_LINUX_USER
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index 97f8e22091..b7007e3b98 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -65,7 +65,6 @@ QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_AARCH64) += aarch64-softmmu
>  QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_ALPHA) += alpha-softmmu
>  QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_ARM) += arm-softmmu
>  QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_AVR) += avr-softmmu
> -QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_CRIS) += cris-softmmu
>  QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_HPPA) += hppa-softmmu
>  QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_I386) += i386-softmmu
>  QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_LOONGARCH64) += loongarch64-softmmu
> @@ -102,7 +101,6 @@ QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_AARCH64_BE) += aarch64_be-linux-user
>  QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_ALPHA) += alpha-linux-user
>  QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_ARM) += arm-linux-user
>  QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_ARMEB) += armeb-linux-user
> -QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_CRIS) += cris-linux-user
>  QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_HEXAGON) += hexagon-linux-user
>  QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_HPPA) += hppa-linux-user
>  QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_I386) += i386-linux-user
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
