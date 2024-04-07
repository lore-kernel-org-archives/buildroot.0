Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0793CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 14:48:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60152600C6;
	Sun,  7 Apr 2024 14:48:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 30nQqDSXBZzU; Sun,  7 Apr 2024 14:48:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B1B4608A5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B1B4608A5;
	Sun,  7 Apr 2024 14:48:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A19E11BF30F
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 14:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B36D40600
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 14:48:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FXNh8PsJ42au for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 14:48:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 29F4B4053A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29F4B4053A
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 29F4B4053A
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 14:48:13 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-416664dbee1so1265395e9.0
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 07:48:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712501292; x=1713106092;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VOFXuDJdM7T1Mcsw0Ne9apcewT84t0Z2qOftAEgDDjE=;
 b=ol0+phtGtGNyTh2bR0YuC+ViK4L3KldpY/mRdd/cya2j+EB/o9b0yNAYU16ZD5oAiW
 yLul96i58MrE2L7HziFb2BzOTHW3fJkij8R1uH9aPEISWqMeF+6bYCkmE66hfAMT48a8
 a4ywUQLRlyQBGb+VMCJk2PH/INa1te4BKPVYusZt5YwDxejFHwglWaSZFJoj7Vh+C2Hq
 5Ch1Qlc2C0VDuylLvSTFZ3mWbPQLNY2zJCNg5tN3oXsZylJnZfOxclEe+W6jcHh6g4S6
 Or8AYRTqqowvdKL4g//CIQ6ImB7PZ+oiXlt05aq2ozsJjdQSO8aGid7fFSC1j40cQNoo
 uAow==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAvwcEQ7xoPM0Xx4AGAvklex55WMPgCWHMuFpVguo0+V9usWXN1HHkI9iuzDLyEd/YYXsZ2UxIrGtGpBFE/DXAGECxQsny3w==
X-Gm-Message-State: AOJu0YzKINIy6ytYi5sn0BGSI4x1n+PSOsBg8J7Z1mgtXo6C5WwspLMa
 +bcMuT5O7T2+F1AeELFDvtr3DG06F0Qs+mya3qjNuUReRCRZP0rYplU0TZw9ozQ=
X-Google-Smtp-Source: AGHT+IGATzm/Em0a1HpI8DAVxySkZupTe5JKZTE5MA6NPWr1Muis05iKlU6XTpqVys9rvYx5O/6UYQ==
X-Received: by 2002:a05:600c:1d1b:b0:416:4eae:9adc with SMTP id
 l27-20020a05600c1d1b00b004164eae9adcmr1827027wms.6.1712501292059; 
 Sun, 07 Apr 2024 07:48:12 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 bd8-20020a05600c1f0800b004162b0b88f4sm12888966wmb.31.2024.04.07.07.48.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 07:48:11 -0700 (PDT)
Message-ID: <19077b76-db3a-444a-a62b-d3104c02427f@mind.be>
Date: Sun, 7 Apr 2024 16:48:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20240224115922.234596-1-bernd@kuhls.net>
Content-Language: en-GB
In-Reply-To: <20240224115922.234596-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712501292; x=1713106092; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VOFXuDJdM7T1Mcsw0Ne9apcewT84t0Z2qOftAEgDDjE=;
 b=Act+Ij1VE86uGtCq0UGKKcPZpzDl++YlcMdcaukByo0xvASiLYHfsvPIh9lQ6RBAyK
 ZO+X621nvxHEUTrLMfcme7pb4oaflyLvm2IIc96xabPDivmo/vBbGXT0o4E7mrbLcUQ0
 NQltINt5gmrHgPy/SpY7TJbkwEbix8iMsSetruclLA7M3Id6zcyjdmsdpq7MD4wBtxun
 QYXpahjdEDdLBIAYUOYjEx9oAs/QNcN576dah6aap3gSqN7Bb3qEdZYe3e+5OuDdgOBQ
 L3PTcq8Cs3Uw963a/aCAthBTZvmyqaD82N3JzSG/zwu5oadzCqIr/MA5B9vLu2Cj7EJG
 mz/g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Act+Ij1V
Subject: Re: [Buildroot] [PATCH 1/1] package/cmake: bump version to 3.28.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/02/2024 12:59, Bernd Kuhls wrote:
> Release notes:
> https://www.kitware.com/cmake-3-28-3-available-for-download/
> https://www.kitware.com/cmake-3-28-2-available-for-download/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/cmake/cmake.hash | 4 ++--
>   package/cmake/cmake.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
> index 51fff6c3ef..74b4a0a3a8 100644
> --- a/package/cmake/cmake.hash
> +++ b/package/cmake/cmake.hash
> @@ -1,5 +1,5 @@
> -# From https://cmake.org/files/v3.28/cmake-3.28.1-SHA-256.txt
> -sha256  15e94f83e647f7d620a140a7a5da76349fc47a1bfed66d0f5cdee8e7344079ad  cmake-3.28.1.tar.gz
> +# From https://cmake.org/files/v3.28/cmake-3.28.3-SHA-256.txt
> +sha256  72b7570e5c8593de6ac4ab433b73eab18c5fb328880460c86ce32608141ad5c1  cmake-3.28.3.tar.gz
>   
>   # Locally calculated
>   sha256  4a01ccf2dc580ba570d02bc015bbe0ec92f1f318717aae9540ba841ba7946756  Copyright.txt
> diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
> index 23d00b95c5..49d1f9fea5 100644
> --- a/package/cmake/cmake.mk
> +++ b/package/cmake/cmake.mk
> @@ -6,7 +6,7 @@
>   
>   # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
>   CMAKE_VERSION_MAJOR = 3.28
> -CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).1
> +CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).3
>   CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
>   CMAKE_LICENSE = BSD-3-Clause
>   CMAKE_LICENSE_FILES = Copyright.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
