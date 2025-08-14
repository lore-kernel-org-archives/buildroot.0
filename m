Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C67DCA0EDC
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:31:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA3306077F;
	Thu, 14 Aug 2025 20:31:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L-S5giL9-an1; Thu, 14 Aug 2025 20:31:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECCDA607AD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECCDA607AD;
	Thu, 14 Aug 2025 20:31:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6840D1BA
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6BBE8402D0
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JfCRzERq0BHN for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:31:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7488C4021A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7488C4021A
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7488C4021A
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:29 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3b9e413a219so1064244f8f.3
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 13:31:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755203487; x=1755808287;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dPhu90dhkXncC3bikD6ugFy4W8NyAXNC6dE0cQ66FxE=;
 b=FxCez8nAi7NGFG9oYKj7lRl/Zapz0ukYSqWkIua5bjCMSEBsnW2UeZAR+fe7FZ2Q3A
 sxFXKi0OodlX3tdwi+riRnjpO0ZM8zpjUV2T8eTj+6tVjWf0lVhVtZz/ykVfQ1w3cmS8
 Nw0rNFdaMPNb9/tDvLgD3r9txQpPI06kZX03HBYV5oFM9CzwT139M5950jkXT9aUyz9z
 7CzKAIeVX5Cf3jQ0yLBNfdwIq4ZTzLRU401K8qbLbbZClsalGJCGTbeDyEf1A9SHyFXZ
 eL+a5gLXrEBVnnDDmWBjSFTgvgN8K1WmiwFTmHg7wwZ0NV0aRcCtnNB5n66HNTTvbOaI
 7WCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHcDTBjzb7SdfYdrZuAYkbgj+5aclq2y1EJOdKw9BvzcXcDDjXK3axVI3tQ0qrHllwTezj1XQFCWY=@buildroot.org
X-Gm-Message-State: AOJu0Yy/uxN7vs+4TR0HJN2Bh1FKL24J5iuWbNkOFasIiNsaORb2wLPB
 qsP2yqSGRNqBldWQdG/zIdtlKUyD4O3TjpR+uoA6CmvG76tZcUUgm6CQCiiuprin4Mk=
X-Gm-Gg: ASbGncuZyRpm27rc65j2Jq1hl/iOVXBsWbPMjeCCJXOXg9uxv56q+/sa1qGqU5lBLfR
 BPfUgDMlLnQmKCb4WyuJYv2R7FbItaRiGTviqnYGha6tFRO4L+/SCnlyQE50Ar8CEz1VvERl5D4
 Qu3N50CWczujKQxiZVsKlD1f1YxFaB3GW5uP62dSzgZyCvwVSk7w1IRMI3HWoEZ0SjFNVXWSEM+
 Tf2E3d31fNyglozCujI1UJyjc+T9HiGvA4440VqKfANccz1cSEXfo9117WlRA+0venCek0CKwH3
 MaUXL0WVlua7Pkx9DZgwBlZddJLbLjcsrFAzF+ZSmjHQ7bJflmPyyf/Uqpx2LseEXVXVrIuDegr
 CoBZAkCRqvcPQhA==
X-Google-Smtp-Source: AGHT+IEcHMmGGYG49/VgMJjAnQKhJ9epA0bxSDixt93TfK4y/031mCRBG2PfrC8EcTME8wPXUQO6YA==
X-Received: by 2002:a05:6000:230b:b0:3b7:9350:44d4 with SMTP id
 ffacd0b85a97d-3b9e415a4b2mr4243086f8f.11.1755203487433; 
 Thu, 14 Aug 2025 13:31:27 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c4530b3sm52843796f8f.34.2025.08.14.13.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 13:31:27 -0700 (PDT)
To: Peter Seiderer <ps.report@gmx.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 14 Aug 2025 22:31:26 +0200
Message-ID: <20250814203126.2814877-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803144208.195144-2-ps.report@gmx.net>
References: <20250803144208.195144-2-ps.report@gmx.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755203487; x=1755808287; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dPhu90dhkXncC3bikD6ugFy4W8NyAXNC6dE0cQ66FxE=;
 b=hgDXugC4vxk31IG+EMiDAn7Z+EqNIxQHCckwDcCeui6hxlrZeNXDzBfzizsLwE1CmC
 QUkwIkpVGqnY6cStozwtJY/BHyBRrj1OdTRmWwd4GP2ZypsNya6MVJHF3+EkRiMcCUcg
 JDOBqSFFysHQtwtTfdtvA+/aeWdXMbczg5HgC3mvpJjSYLAZnc7mIUggvsP1OSvJJTN7
 5DkR8tqrKZ31mcbf4DqZfTV6rnTv53S3/ENXpUy4ST4v1//Rc8YIqZnTrexoc2WTTTPN
 m+DqQhAUax+8Kq6QguYksX0q2dtwUygu5UQtjp7plDA7A/5FZczw+ZZiz83kbyVV1g0m
 6hHw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=hgDXugC4
Subject: Re: [Buildroot] [PATCH 2/3] package/rpi-firmware: bump version to
 95be71b
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
> Version 95be71b matches with kernel 6.12.41.
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to 2025.05.x. Thanks

> ---
>  package/rpi-firmware/rpi-firmware.hash | 2 +-
>  package/rpi-firmware/rpi-firmware.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
> index c2ca9343f1..0645d6ad77 100644
> --- a/package/rpi-firmware/rpi-firmware.hash
> +++ b/package/rpi-firmware/rpi-firmware.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  b120625c1e0d2dec819638a6fda97c74d1c86e184c6a4263cdf04faa2d5bbe2e  rpi-firmware-1.20250326.tar.gz
> +sha256  6c1b017867c3a51e606859f1cd50df61b94af311577583b6b2a113d11131ee93  rpi-firmware-95be71b8c0f63f03dc06dd0e4c2e5535e6fb4a93.tar.gz
>  sha256  c7283ff51f863d93a275c66e3b4cb08021a5dd4d8c1e7acc47d872fbe52d3d6b  boot/LICENCE.broadcom
> diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
> index 2577d16a01..d0b6abcc6f 100644
> --- a/package/rpi-firmware/rpi-firmware.mk
> +++ b/package/rpi-firmware/rpi-firmware.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  # Please keep in sync with configs/raspberrypi*_deconfig
> -RPI_FIRMWARE_VERSION = 1.20250326
> +RPI_FIRMWARE_VERSION = 95be71b8c0f63f03dc06dd0e4c2e5535e6fb4a93
>  RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
>  RPI_FIRMWARE_LICENSE = BSD-3-Clause
>  RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
