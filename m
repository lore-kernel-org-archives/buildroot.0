Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FFE8C2BA1A
	for <buildroot@archiver.kernel.org>; Wed, 19 Jun 2024 20:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC2C981399;
	Wed, 19 Jun 2024 20:34:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K5sUV1pRBju1; Wed, 19 Jun 2024 20:34:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65A1380EE0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65A1380EE0;
	Wed, 19 Jun 2024 20:34:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 856011BF846
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 20:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 702F2607B8
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 20:34:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I6-5At9bLivi for <buildroot@lists.busybox.net>;
 Wed, 19 Jun 2024 20:34:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2268860681
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2268860681
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2268860681
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 20:34:32 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-424720e73e1so1831145e9.1
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 13:34:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718829271; x=1719434071;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SQZZddroRchXardxStKNDCaRPx2iQTcK+O5v77Ip1cs=;
 b=ECFuo8Cb/zuw0TYhTbH3ar6+nSUpGBPXkopH/6brKtQpMnTtw0D6w2OI2+DeXFvGv2
 fIkRvOt2U0gTvGk4UDa8TZVMPGfX90Ft4S8cv1r8l7pLerS+9MowEo4lCFZh1FL69/VN
 trm6QXjzMnO8y+4JrlFReHvhQvhmhuV0sWzIA59t+ZAMpxkor7lbzGXk+pTeDcCfeDaA
 UymFoLgV7Az4B6DLj42geHVKpwbNY6MGj5//sdeuWbdVqiHvD9uMSLMgSdAhR7pr3S4j
 BUuIJsdKAoZwkTuuHxxeA4/bAOtjq2g02kzfx7qUWO8cR6cUZkx1ccPi0nlfGPTaT3qP
 KXow==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1p2f4taOcIioQpcPrPbqTBkkeOaL9XOiyZFExIVHpmK++0qJzePWoqBvw2s+goxANmTUA8hTKG3rO3P58D53jNp718Ot/dw==
X-Gm-Message-State: AOJu0YwSbx04ngH+76vLXD4/z5M4YSx+OeT3IcC2CDwsVQAjPqf5HDu/
 IpBJhFrszYeNNpUSBVslPeRYc1ljBUyaTuPF5ulARRCw9wP0hgmY6XfeauIPw4Fw5kZlHpFc5qU
 P
X-Google-Smtp-Source: AGHT+IFv6yXP97R6beVpPwFBf06WqJ285wH5QozxNRhr+LX3wxCn0mnf3qLrmN2zbQt5l9JKzh0Srw==
X-Received: by 2002:a05:600c:3b93:b0:421:e179:b1d5 with SMTP id
 5b1f17b1804b1-4247529bdabmr21520455e9.38.1718829270934; 
 Wed, 19 Jun 2024 13:34:30 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4247d1e2fc2sm1623335e9.34.2024.06.19.13.34.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jun 2024 13:34:30 -0700 (PDT)
Message-ID: <9a1111a6-dcb1-4e41-b732-a7f6c2087f6a@mind.be>
Date: Wed, 19 Jun 2024 22:34:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20240605121809.313685-1-giulio.benetti@benettiengineering.com>
Content-Language: en-GB
In-Reply-To: <20240605121809.313685-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1718829271; x=1719434071; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SQZZddroRchXardxStKNDCaRPx2iQTcK+O5v77Ip1cs=;
 b=IMqbNGpEQk3Nl9HxHr+A5FwTIuOazLZsE2xX4nFOzxMG6uhCiRRzX20wq6xh71X+qN
 zt7byGu72Pt4wy/4QsiMguauTbiMAFwZNtD1B7cdKL+u9QFezsurutn4i7fvVgCaCoXh
 pePrS5tj/QcE58zj/G+/FI/GCRJSsCGFhuCALI9/Z9NgPsTzrgcEquNWnFcmX/akn9sQ
 eWhgMX6xTXrtOwfiBpv5+v5uYck+ntAw6vxZtG9/YfcU06RizDomBc5W3WDfmSs2TMhz
 OZGNFoG9isOFlFVUwh8uwFr5+Uzm6Sgqu7QKOtuZ6QvuXgKP014sf732gjvUgJL5rxTe
 JZyA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IMqbNGpE
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

  Applied to master, thanks.

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
