Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB090C25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 20:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 225F281EC4;
	Wed,  5 Jun 2024 20:59:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kN2s5DgBeWM1; Wed,  5 Jun 2024 20:59:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F320081EB6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F320081EB6;
	Wed,  5 Jun 2024 20:59:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 458F41BF2A2
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 20:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 325F6413BE
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 20:59:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XYRdChaF3ENV for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 20:59:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 740ED40708
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 740ED40708
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 740ED40708
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 20:59:36 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-421572bb0f0so3584845e9.0
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 13:59:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717621174; x=1718225974;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qgQNxIOSOu/JBp0SvqweH1HmYFjuqbrvEnBHwS1zINE=;
 b=FInrE1NAew02CDRm0a42uO1P23ysJeW26AeOX+GE0Cx1dCqVXMHakAjj5xL3fpvIht
 jWSAzNTp1xxQmYn2UPg7CDMKtSj6WQl1yMU7Iqzb9H5yblxuwxCuFeFbcEXhkeL+pgdU
 G600BrIK6m2dH0KqvVNqw8zsL84vij+t3N3h+Zn3CHRT47ltZjCvuZ/MnRcJgljUhZJ5
 zHaKNho+M/vsBEcOfstAigoYg6Q6Skk7u2H2cHCzUHwT3iO0BKlU/EuqyYEUrWv0kZqy
 K6za7cJ2DxzLRaJNNcKyKmMxgBHuQtANBETgCQZX62h0RP/Hvg0Cr46luF5mhN6zKULH
 HAAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpnB2v35hmDjyWnnDU7otnj6WAHQVa8Q7K7udoY2hkkH2BTkbV7sBW4lhcVZOhu3vOSr/sOifH7KcpnULF5HucCnLQpp2flw==
X-Gm-Message-State: AOJu0YzIRsMvnquZvDmgQCIQ/dhIjQKmOBjh6+/qKZL0uRrV71hZPJie
 y5+r7pFQw3m1u27duPIFfAlPfNgxg6HyGsABCxs4E3v6LSXqkwzzuXEvzb4aGi7UkWD/Glf73C2
 Z
X-Google-Smtp-Source: AGHT+IEqSRVtb16JsqpqiJhtBD2/U3FiuWJIg6ePyQ8wl+awuv6tvV5NM2LtmgYY0BDdSms7qxGOdA==
X-Received: by 2002:a05:600c:898:b0:421:5288:63f0 with SMTP id
 5b1f17b1804b1-421562e6931mr29133585e9.16.1717621174063; 
 Wed, 05 Jun 2024 13:59:34 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd04e48b9sm15707911f8f.64.2024.06.05.13.59.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jun 2024 13:59:33 -0700 (PDT)
Message-ID: <1074b6c7-b6db-4663-a812-21c3a2283aee@mind.be>
Date: Wed, 5 Jun 2024 22:59:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20240605121809.313685-1-giulio.benetti@benettiengineering.com>
Content-Language: en-GB
In-Reply-To: <20240605121809.313685-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1717621174; x=1718225974; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qgQNxIOSOu/JBp0SvqweH1HmYFjuqbrvEnBHwS1zINE=;
 b=fSTB9I8CPOVhcsIqPa59Kp1bUrDfbVrenGZ1bb97u5yC6zsMY1UTHBzcS5JCU8yuJv
 jSSB3qoRgjLW33ONkNOUx7Jd+MnYWKKBDoxQ7XHW3W2xdHRyj62jw/3WpqPd/Idhpb+c
 EE55pM3dj2infozUItuECGuL7sT87cbjWkspmQfoHY7bh++/bNV+0bDmAHHeBj8X33ps
 /TdemR9rknEfBNfgmEDsCOylzunVcHIitjNv8aQxG7Wws9ph2xkV8sd3tQaGBa2E/FZd
 /cpiFGqnKLx5xSm/a4nlHTJrh1OYtaiLEQSZ7ej9lvzLSPZoQ/TQ2eAbsKLscZZ0g9uH
 HzMA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fSTB9I8C
Subject: Re: [Buildroot] [PATCH] package/esp-hosted: bump version to
 2024-06-05
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/06/2024 14:18, Giulio Benetti wrote:
> Drop both local patches that have been committed upstream.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  I think this isn't just bugfixes, so for next rather than master, is that correct?

  Regards,
  Arnout

> ---
>   ..._ng-fix-build-failure-on-Linux-6.9.0.patch | 37 -------------------
>   ...x-Bluetooth-build-failure-on-Linux-6.patch | 37 -------------------
>   package/esp-hosted/esp-hosted.hash            |  2 +-
>   package/esp-hosted/esp-hosted.mk              |  2 +-
>   4 files changed, 2 insertions(+), 76 deletions(-)
>   delete mode 100644 package/esp-hosted/0001-esp_hosted_ng-fix-build-failure-on-Linux-6.9.0.patch
>   delete mode 100644 package/esp-hosted/0002-esp_hosted_ng-Fix-Bluetooth-build-failure-on-Linux-6.patch
> 
> diff --git a/package/esp-hosted/0001-esp_hosted_ng-fix-build-failure-on-Linux-6.9.0.patch b/package/esp-hosted/0001-esp_hosted_ng-fix-build-failure-on-Linux-6.9.0.patch
> deleted file mode 100644
> index 21e8730d37..0000000000
> --- a/package/esp-hosted/0001-esp_hosted_ng-fix-build-failure-on-Linux-6.9.0.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From 1cd8671eb64a1278466e7a9c90ceca1be0f8c0d5 Mon Sep 17 00:00:00 2001
> -From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> -Date: Mon, 1 Apr 2024 17:15:19 +0200
> -Subject: [PATCH] esp_hosted_ng: fix build failure on Linux 6.9.0
> -
> -With Linux commit:
> -https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=620d269f29a569ba37419cc03cf1da2d55f6252a
> -spi_master compatibility has gone, so let's redefine missing needed
> -macros spi_master and spi_master_put() locally if Linux version is >=
> -6.9.0.
> -
> -Upstream: https://github.com/espressif/esp-hosted/pull/358
> -
> -Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ----
> - esp_hosted_ng/host/spi/esp_spi.c | 5 +++++
> - 1 file changed, 5 insertions(+)
> -
> -diff --git a/esp_hosted_ng/host/spi/esp_spi.c b/esp_hosted_ng/host/spi/esp_spi.c
> -index d0bd513bd6..9817056b2d 100644
> ---- a/esp_hosted_ng/host/spi/esp_spi.c
> -+++ b/esp_hosted_ng/host/spi/esp_spi.c
> -@@ -378,6 +378,11 @@ static int __spi_controller_match(struct device *dev, const void *data)
> - 	return ctlr->bus_num == *bus_num;
> - }
> -
> -+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 9, 0))
> -+#define spi_master			spi_controller
> -+#define spi_master_put(_ctlr)		spi_controller_put(_ctlr)
> -+#endif
> -+
> - static struct spi_controller *spi_busnum_to_master(u16 bus_num)
> - {
> - 	struct platform_device *pdev = NULL;
> ---
> -2.34.1
> -
> diff --git a/package/esp-hosted/0002-esp_hosted_ng-Fix-Bluetooth-build-failure-on-Linux-6.patch b/package/esp-hosted/0002-esp_hosted_ng-Fix-Bluetooth-build-failure-on-Linux-6.patch
> deleted file mode 100644
> index c701aaa82f..0000000000
> --- a/package/esp-hosted/0002-esp_hosted_ng-Fix-Bluetooth-build-failure-on-Linux-6.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From f8903bc2be7ae5ac9fb9bbeed8512e974c6e60ec Mon Sep 17 00:00:00 2001
> -From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> -Date: Mon, 3 Jun 2024 21:53:38 +0200
> -Subject: [PATCH] esp_hosted_ng: Fix Bluetooth build failure on Linux 6.8.11+
> -
> -After Linux commit:
> -https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=84a4bb6548a29326564f0e659fb8064503ecc1c7
> -BT_HS has been removed and consequently AMP controllers can't be created,
> -so at this point only HCI_PRIMARY has been left as unique controller type
> -to be created and this became implicit with no need to define if the
> -controller if HCI_PRIMARY or HCI_AMP. So let's assign HCI_PRIMARY up to
> -Linux 6.8.11 only preventing build failure.
> -
> -Upstream: https://github.com/espressif/esp-hosted/pull/400
> -
> -Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ----
> - esp_hosted_ng/host/esp_bt.c | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/esp_hosted_ng/host/esp_bt.c b/esp_hosted_ng/host/esp_bt.c
> -index 3b78c11698..4598ac0e0a 100644
> ---- a/esp_hosted_ng/host/esp_bt.c
> -+++ b/esp_hosted_ng/host/esp_bt.c
> -@@ -240,7 +240,9 @@ int esp_init_bt(struct esp_adapter *adapter)
> - 	hdev->set_bdaddr = esp_bt_set_bdaddr;
> - #endif
> -
> -+#if (LINUX_VERSION_CODE <= KERNEL_VERSION(6, 8, 11))
> - 	hdev->dev_type = HCI_PRIMARY;
> -+#endif
> -
> - 	SET_HCIDEV_DEV(hdev, adapter->dev);
> -
> ---
> -2.34.1
> -
> diff --git a/package/esp-hosted/esp-hosted.hash b/package/esp-hosted/esp-hosted.hash
> index d449f5030e..3afee5aef4 100644
> --- a/package/esp-hosted/esp-hosted.hash
> +++ b/package/esp-hosted/esp-hosted.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  8f25c01522fdcb2003ffbfcc0ccf4981f27bddc8080ba978e33590d56f5ae20b  esp-hosted-669fd9cd1892bb8b364701968d5f06225346eea9.tar.gz
> +sha256  2c87d68c2b74dd000b128696abc0cdc76d22abfefb6581ff61b7d7bcdaab51f5  esp-hosted-b1422afc4fe0a2ea1ffd6b5459edddc4d968ee71.tar.gz
>   sha256  ed57d96d27be775b22f9571d3724ef84e0d0b8f24b805ec7f87a32189de19a9c  LICENSE
> diff --git a/package/esp-hosted/esp-hosted.mk b/package/esp-hosted/esp-hosted.mk
> index 520ad5dc8c..70ca7bf572 100644
> --- a/package/esp-hosted/esp-hosted.mk
> +++ b/package/esp-hosted/esp-hosted.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -ESP_HOSTED_VERSION = 669fd9cd1892bb8b364701968d5f06225346eea9
> +ESP_HOSTED_VERSION = b1422afc4fe0a2ea1ffd6b5459edddc4d968ee71
>   ESP_HOSTED_SITE = $(call github,espressif,esp-hosted,$(ESP_HOSTED_VERSION))
>   ESP_HOSTED_DEPENDENCIES = linux
>   ESP_HOSTED_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
