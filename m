Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA2B0EF99D3
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 958A161629;
	Fri, 13 Feb 2026 19:38:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id or-7HbnMURrm; Fri, 13 Feb 2026 19:38:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54D9D6162A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011497;
	bh=NjP6SxMdz/q2U0E5lXPXW6GVtivzVPvXse/CRQreamM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rDwAsP5/Qa+17SnLlAn7tDTpQNYzrjwJDnaufpVWoPd3xhvjCadbqpRTeuGijCQRk
	 MuT5mCQrK3Iyw0b7mCKouCOwjqmMhpzARe1lka+A1Qs1nbM6ba4LPlAwXqN1fyDI1W
	 B7ISf9O6RfVAE3y0728qFDVoHhjeWN2NVMpSMUwABuLUYNnpHGtdG3m/CR+2L48PbK
	 Ote4hgzaNa34ZmzN6C2lG16AHG3m6jrwYFLO09dsbyONec0R0DUwVMPEZHyTPIjDkn
	 ds8ZdZijNecKpKMU/Tt5jjHhj3MWziM1DJ2oLR3mw69VT/03XH7mK7xVhCSJcBGrKb
	 Ef6/ntvljF5RQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54D9D6162A;
	Fri, 13 Feb 2026 19:38:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B4A5F69
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A64FC41F72
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y78V7hUc7c6V for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5F63641E52
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F63641E52
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F63641E52
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:28 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4806e0f6b69so10394735e9.3
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:37:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011446; x=1771616246;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AmPoQYk/00xY4SnB03BswHAiIR1HgztrhhPg9D8j4iY=;
 b=qBfJWnff3LKTjivcMKJg7vDjszKBO87EJg4UV7kM8YbJZ5rPC776Qa+oTGrllMO6dX
 6BYjTwFzF5T+KWUNN+v8GPEktFeqKgNsrCsnp2tVmPsDva3I2eMF/AWhUjnyDaXHs7BI
 8X6jbt+1KcSOoBMnFpje0pvRr+Lu9plZHto+BDtUUaHlQH5ClbOWITXZ+2Su2orBlsBR
 eymEGowPd8+O91zizB0rYewQoZZNKbKf8H9h/mThtA2/gEok3DK4yIL6PUqBpH0XKs3h
 jhMqpDPFOV/Us8UrUT0WTxGkC7b5eetVwdVc9IgshpnUee6dnW0fH6yOgDDcJTSGJdu6
 u+Pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUws7SyJ2Xv6HbEMFRVOJ6Z0PGaNxqBUDgnw5L7s1nX5P1f93HdCxbs/msZ1kVAhJWlX+t68ev+w0U=@buildroot.org
X-Gm-Message-State: AOJu0YxLNgbobpZwMn5nvthapAjMt54K+5i9OSS+9h1VPrRp9TNuelED
 83uoPgi1kRHHmQqhVVQ+O/wdDtCdyqso57pgHsl0UHqVl6f/hmzr2ihq7AGyeN34zx8=
X-Gm-Gg: AZuq6aJw21HskBODOP1WZH1QTu+D0HmfcC7e/6+0CAnqirS5VNw8KlA8j7wB4YJxY7e
 auds91U4EoYHNuMIWBIDjjZcga4LFiltBXkBSnuxmt+T4O/i3kdZY7JhaXTo6Mf9VZ7ZMuGEDpC
 SECJ3fAuVpeSo177jcHlzXOQ01FlqYzyW1cwbLOKDcS9Ql+gnv3E1DARj2PICWSRXNo1N5k6zXU
 jl3JBpIDxJoslZcUNQviFcVZHtqxDq1+0tvGH3/HNRU/wV4NS7yUQESewQNRJJAH4U6eXnmBgs6
 mYkFGJRxhVecdt0/eSJE/ArGo29CPwEVBQIyXXieikn/NgcaFRJc02D4RHyroHyT3txYyJhYsfD
 MHHj/DfsVRGyEwbEGkp681Vv7eWPa0FtZTNZiHm90UQckzFJeyBntG6MjkpvomR6FRI7O+AYRHW
 d1L6bQcsotFvDtIMk=
X-Received: by 2002:a05:600c:3143:b0:480:53ce:45d3 with SMTP id
 5b1f17b1804b1-483710858d3mr65889085e9.18.1771011446130; 
 Fri, 13 Feb 2026 11:37:26 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796abc9b2sm7225049f8f.21.2026.02.13.11.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:37:25 -0800 (PST)
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:37:25 +0100
Message-ID: <20260213193725.39340-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251001-fix_license-v2-5-bf18911c835d@bootlin.com>
References: <20251001-fix_license-v2-5-bf18911c835d@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011446; x=1771616246; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AmPoQYk/00xY4SnB03BswHAiIR1HgztrhhPg9D8j4iY=;
 b=G8IQqZC105ZATut2R7AHhBAGYw+IDmdAr8swMH0qOEEnOU9VrUtAmnEcKs9oDwfuPs
 toBop/mIgx95Rn+XC2bjTdFKpG3VPbJwOcKoMViLvfnMoZuM/fRgBbqVfST8ff4MO/p2
 4agojXBsAxYsR2mvpL2B99+iaxR8bda8KSGn2QqImsiYoz51erD7G2iZvsQdh/gPXKDc
 5bj5vHGQ7WziVdtR0fLU1WAv+7/ZkWAmV9WMCBm5/eUJn2UXw1/EGxMRriWqzt7M/g2h
 gAibVL6IfHMhYluMuNcc6s2hvuXgg5Ca/vLKT+4qga9qQCx0SOVzHy7h5rOXcnB+J2Kt
 0iLQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=G8IQqZC1
Subject: Re: [Buildroot] [PATCH v2 5/7] barebox: Add support for custom
 license files
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
> The Barebox package was not providing any license file when a custom
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
>  boot/barebox/Config.in  | 16 ++++++++++++++++
>  boot/barebox/barebox.mk |  4 +---
>  2 files changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
> index c3cb0b33325328415349408f5be01a4a32dfcf12..469497aff6833ebdfd61b95cc938c9380a0374fb 100644
> --- a/boot/barebox/Config.in
> +++ b/boot/barebox/Config.in
> @@ -45,6 +45,22 @@ config BR2_TARGET_BAREBOX_VERSION
>  	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
>  	default BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
>  
> +config BR2_TARGET_BAREBOX_CUSTOM_LICENSE_FILES
> +	string "Barebox license files"
> +	default "COPYING"
> +	depends on BR2_TARGET_BAREBOX_CUSTOM_TARBALL || \
> +		   BR2_TARGET_BAREBOX_CUSTOM_GIT
> +	help
> +	  A space-separated list of license files related to the Barebox
> +	  package.
> +
> +config BR2_TARGET_BAREBOX_LICENSE_FILES
> +	string
> +	default BR2_TARGET_BAREBOX_CUSTOM_LICENSE_FILES \
> +		if BR2_TARGET_BAREBOX_CUSTOM_TARBALL || \
> +		   BR2_TARGET_BAREBOX_CUSTOM_GIT
> +	default "COPYING"
> +
>  config BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR
>  	string "custom patch dir"
>  	help
> diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
> index 929ed48ada8321c7b42a615501fb90645556a37b..cbd6f9313c8012de809d4b0d82f3ffd5d39f680b 100644
> --- a/boot/barebox/barebox.mk
> +++ b/boot/barebox/barebox.mk
> @@ -39,9 +39,7 @@ $(1)_DL_SUBDIR = barebox
>  
>  $(1)_DEPENDENCIES = host-lzop
>  $(1)_LICENSE = GPL-2.0 with exceptions
> -ifeq ($(BR2_TARGET_BAREBOX_LATEST_VERSION),y)
> -$(1)_LICENSE_FILES = COPYING
> -endif
> +$(1)_LICENSE_FILES = $$(call qstrip,$$(BR2_TARGET_BAREBOX_LICENSE_FILES))
>  
>  ifeq ($(BR2_TARGET_BAREBOX_NEEDS_OPENSSL),y)
>  BAREBOX_DEPENDENCIES += host-openssl host-pkgconf
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
