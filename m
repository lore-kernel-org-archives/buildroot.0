Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58017C2BA18
	for <buildroot@archiver.kernel.org>; Sun, 23 Jun 2024 07:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 040C381E1F;
	Sun, 23 Jun 2024 07:41:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lGc8xxjnMp2Q; Sun, 23 Jun 2024 07:41:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FAB381E23
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FAB381E23;
	Sun, 23 Jun 2024 07:41:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 63A381BF59E
 for <buildroot@lists.busybox.net>; Sun, 23 Jun 2024 07:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D86040158
 for <buildroot@lists.busybox.net>; Sun, 23 Jun 2024 07:40:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2LwrtVfVPoap for <buildroot@lists.busybox.net>;
 Sun, 23 Jun 2024 07:40:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F143A40015
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F143A40015
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F143A40015
 for <buildroot@buildroot.org>; Sun, 23 Jun 2024 07:40:57 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-366e70d0330so428126f8f.1
 for <buildroot@buildroot.org>; Sun, 23 Jun 2024 00:40:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719128456; x=1719733256;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NmurcB7UcqAoLDqnOLbKEOOxcNrzIc+cez/gpcJUzPs=;
 b=V38ubzJq90693Q4nwdJe7BHP/7aE5rOEoujixrQTsNdhWMJqsHckQ1JnQGJMuqzxio
 58zPw5c4zb9BOYBTgrdL7mO9tDCQXCZyWwOO37QoYQSlewT8H9SC65Zy9blT241bUTVk
 277UzUc/JDN6aFnx0BhKPIkmd0PlGKMQu+A49kgHYkFMBJdS0c+uR9aVoBlkACO/Mdiy
 ORbYBMESb1Uc4xY/GiEGACnQpPD7/wugnnD9R4ppakEwDthege1cgs9Gr2lZValq5Jx1
 oIEUGprA5H0dd0TzayDdlwnGS+8+OXbxocnZf1W8UQ6+6CvMGw67NOaceQeUDfTFkPlM
 Avxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsZS+5qv5UQ7ugdUMjA+stzhYhdLLa9aEqbtXtADHGmGN8+/6oZEwvtb6uMJGwP6vJmlSwsazrI5z5MDZt0ZvmjOj0WxfEgg==
X-Gm-Message-State: AOJu0YxVZG83mZZoPF+2Ka4K2lUe5pBTxynqr41UP1/DAXp/3JMRr1bR
 hcwVctK5hbiMgfB+Z2/JbnkOoOavRHFFhx5nfU6g+aWZrWlLggaPj3SnWTGhv485OinXdne9DQh
 X
X-Google-Smtp-Source: AGHT+IF4/stfjOv23TE+Yz+njAt6gUKjEjWf5ojC1X5UmMeJikFkOhLjSSdnv3qWZA9p/bVdNqcp+A==
X-Received: by 2002:a5d:5228:0:b0:35f:1128:250d with SMTP id
 ffacd0b85a97d-366e9659d6amr746796f8f.68.1719128455789; 
 Sun, 23 Jun 2024 00:40:55 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3663a8c789esm6683167f8f.91.2024.06.23.00.40.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jun 2024 00:40:55 -0700 (PDT)
Message-ID: <0f36a666-274b-4980-aa08-e738f0fccb79@mind.be>
Date: Fri, 21 Jun 2024 23:49:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Athaariq Ardhiansyah <foss@athaariq.my.id>, buildroot@buildroot.org
References: <ec99ecde-ff6e-40c6-9622-f4440462a026@gmx.de>
 <20240603230940.51746-1-foss@athaariq.my.id>
Content-Language: en-GB
In-Reply-To: <20240603230940.51746-1-foss@athaariq.my.id>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719128456; x=1719733256; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NmurcB7UcqAoLDqnOLbKEOOxcNrzIc+cez/gpcJUzPs=;
 b=fAetbv3r9jJenPwF+5AltFsx28uduUk4n9LG6ep/qzP+mWYPTjY3akENAq8SaZfGik
 36idwgkZL1ErIjTHSI0JjCcpQhnapWP8jv/BEtwZK09o9gs2Dgh2EJCSW4eUvzKpQQyq
 qGSj1Li9sG81mVAqWLiqiNvB1ZXcHkoT8TC0pHMc1dz/qOSStl2XFMoApvZ04uWn1FS3
 ZzWnjvCVt0KfKeFpcGRhGi35xIPaPgOnCfyhkOiiU1iWXql4tjQe6jDH3oIANiO6nSKH
 Q+cT1KKhYDpIyoYzZcKHAF0RMKmgZSeutqEkRFDh5g6mHheiMZBrp1dOeMh2MnHjFo0V
 UcNA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=fAetbv3r
Subject: Re: [Buildroot] [PATCH v3 1/3] package/rpi-firmware: bump version
 to v1.20240529
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
Cc: Martin Bark <martin@barkynet.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Athaariq,

On 04/06/2024 01:09, Athaariq Ardhiansyah wrote:
> Latest RPi firmware already provided support for Raspberry Pi 5.
> 
> Signed-off-by: Athaariq Ardhiansyah <foss@athaariq.my.id>
> 
> ---
> Changes v1 -> v2:
>    - Fix missing description due to terminal issue
> ---
>   package/rpi-firmware/Config.in         | 5 +++++
>   package/rpi-firmware/rpi-firmware.hash | 2 +-
>   package/rpi-firmware/rpi-firmware.mk   | 2 +-
>   3 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
> index a9aeaed745..e4de5ddaa3 100644
> --- a/package/rpi-firmware/Config.in
> +++ b/package/rpi-firmware/Config.in
> @@ -63,6 +63,11 @@ config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_DB
>   	help
>   	  The debug set of files for versions 4.
>   
> +config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI5

  This symbol isn't used in the .mk file, so what's the point of defining it at 
all? These variant symbols are not part of a choice, which means that for 
variants that don't need specific boot firmware, you don't need to have an 
option at all.

  In fact, AFAICS for RPi5, no firmware is installed at all... The only thing 
that gets installed is the config.txt which is copied from board/raspberrypi. 
It's a bit silly to download a 185MB archive and then not use it at all! 
Wouldn't it make more sense to handle the config.txt in the post-image script?

  So, I think this symbol should be dropped, and I think that probably we 
shouldn't enable rpi-firmware in raspberrypi5_defconfig.


> +	bool "rpi 5"
> +	help
> +	  The default set of files for versions 5.
> +
>   config BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE
>   	string "Path to a file stored as boot/config.txt"
>   	help
> diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
> index 33e05a2f4a..57afe3a1e5 100644
> --- a/package/rpi-firmware/rpi-firmware.hash
> +++ b/package/rpi-firmware/rpi-firmware.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  dd43e77ca1a8969cdb7f05dd72a57f90862071d5a93bdd6aea8246aba85689cf  rpi-firmware-83dafbc92c0e63f76ca2ecdd42462d56489d1c77.tar.gz
> +sha256  a116479e4e8e3bae354860d00321e5df5010cdbe10a3db9e59c81858a0aec84d  rpi-firmware-3590de0c181d433af368a95f15bc480bdaff8b47.tar.gz
>   sha256  c7283ff51f863d93a275c66e3b4cb08021a5dd4d8c1e7acc47d872fbe52d3d6b  boot/LICENCE.broadcom
> diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
> index 11177aee02..5eef3974d3 100644
> --- a/package/rpi-firmware/rpi-firmware.mk
> +++ b/package/rpi-firmware/rpi-firmware.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -RPI_FIRMWARE_VERSION = 83dafbc92c0e63f76ca2ecdd42462d56489d1c77
> +RPI_FIRMWARE_VERSION = 3590de0c181d433af368a95f15bc480bdaff8b47

  This version comes from the stable branch, while previous versions were on the 
master branch. I think that is a good idea in fact, but it should be mentioned 
in the commit message.

  Regards,
  Arnout


>   RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
>   RPI_FIRMWARE_LICENSE = BSD-3-Clause
>   RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
