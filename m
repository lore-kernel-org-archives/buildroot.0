Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B83AC433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 15:13:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3313D81470;
	Sat,  8 Jan 2022 15:13:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jO4BXQWnBR5P; Sat,  8 Jan 2022 15:13:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36D2881427;
	Sat,  8 Jan 2022 15:13:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BE0B71BF5A1
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABF2A60B2A
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:13:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CoGGVPFgZN_L for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 15:13:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 99E4F60AA9
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 15:13:13 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 o7-20020a05600c510700b00347e10f66d1so479876wms.0
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 07:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Ne97tmOELCV4jTNxaOWlKCbb61KvzkWutcrhb58twro=;
 b=KQFs/AOc4u4foIqaVET1GbE/W1AGOFTRMpEi90KpbTIBTbOMaWpX6G4hjH27QgWOb3
 KuqejHkJfawCwKdnrqPylJIswtS2i0L7Z4GFMQFj/d5RtaShfo6ofKGgPoRgFpXHbrS1
 tGmQ4eOlD86x9Tr22aWSP4GeVsJk+bCDcZBBTH/B69qC2ntgWGm7i52+1sUfN/iUDyCg
 V3WCLg7wFelfG8Vi6fTQBCMI9ozYpsPpBNdLibnSPoKS46xscrjoCGLE0MnxaCl9/F1B
 AjZRTNQkLU60UeEbjaVPPeYshE2IOp0A6tGDVUU9iq1OjCmFt3uw+CN2t3EX2Fep2H+M
 4VZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Ne97tmOELCV4jTNxaOWlKCbb61KvzkWutcrhb58twro=;
 b=rdQ7/hvwUs1UoYGgy66LDRbfGRNNaQa/3LP4XVAo7i9lNoWduUW1z6mC2R1duRp3Jm
 EsraawXH/FrO5OyusElCPl+GD+TU+fCcEextDwpS/uLb87uuLGdFEHGYx0/9WkW3a04G
 A7SaPZhykyHm+2McQzAUcgtl9JlslHGR67+jwcc1KsSaNnuPuW+Tl4D/qz9/imA8FxVX
 ICcpHWpxrLua9uoBqFA86uaFVrzPPyC4ZP8vceLA37/nXvxeGuPQrN4n8yc/AnCBGGt/
 VUwnzTJvpyiavWwN1JgntZN3D+7Y8ES4/Qfp6zNKvNlavKLO9qYnQMVt+WCIZIPuUx9t
 w9nQ==
X-Gm-Message-State: AOAM532FHl/D1i0+Xy/HCe34ivswqA3TtdRzrjHG3FaY/cQMSMz56x67
 Od0bej6owSFC6QffHL7rgglVIw==
X-Google-Smtp-Source: ABdhPJzBgqt7YIYO1pxvGJXfa91bTCGqyXJ72MQ9rZMf3zz1whJVgUenbbZIwppdj2qxBoIVSxeWow==
X-Received: by 2002:a05:600c:4b95:: with SMTP id
 e21mr15053023wmp.187.1641654791970; 
 Sat, 08 Jan 2022 07:13:11 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id l12sm1925480wmq.2.2022.01.08.07.13.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 07:13:11 -0800 (PST)
Message-ID: <bfad28b5-f1ba-2735-fe23-89f57c837302@mind.be>
Date: Sat, 8 Jan 2022 16:13:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220108091349.918259-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220108091349.918259-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/btrfs-progs: bump version to
 5.15.1
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/01/2022 10:13, Bernd Kuhls wrote:
> Reformatted hashes.
> 
> Upstream relicensed libbtrfsutil to LGPL-2.1+ and removed
> libbtrfsutil/COPYING.LESSER:
> https://github.com/kdave/btrfs-progs/commit/9e30f779e3cbf12a88ebe309ee371851fdfd3aa0
> 
> Add optional support for udev:
> https://github.com/kdave/btrfs-progs/commit/f74ebeee5c239e007a0144e93f0eee26949a85ec
> https://github.com/kdave/btrfs-progs/commit/1d0fa3781ef9374388b683cf96f9c48245025cf6
> 
> Changelog:
> https://github.com/kdave/btrfs-progs/blob/master/CHANGES
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/btrfs-progs/btrfs-progs.hash |  7 +++----
>   package/btrfs-progs/btrfs-progs.mk   | 15 +++++++++++----
>   2 files changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/package/btrfs-progs/btrfs-progs.hash b/package/btrfs-progs/btrfs-progs.hash
> index aac144963e..339eab02aa 100644
> --- a/package/btrfs-progs/btrfs-progs.hash
> +++ b/package/btrfs-progs/btrfs-progs.hash
> @@ -1,6 +1,5 @@
>   # From https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/sha256sums.asc
> -sha256 d41961b0a92160c80f894ad9a1882822889c2e1d084cbf3e08b8c214a5cf0137  btrfs-progs-v5.11.tar.xz
> +sha256  6230f8f33961bd62633d601b0d049a3c6b833c1a1a7a2f2782d0c5796e7ab920  btrfs-progs-v5.15.1.tar.xz
>   # Locally computed
> -sha256 0d5bf346df9e635a29dcdddf832dc5b002ca6cdc1c5c9c6c567d2a61bb0c5c15  COPYING
> -sha256 3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  libbtrfsutil/COPYING
> -sha256 e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  libbtrfsutil/COPYING.LESSER
> +sha256  0d5bf346df9e635a29dcdddf832dc5b002ca6cdc1c5c9c6c567d2a61bb0c5c15  COPYING
> +sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  libbtrfsutil/COPYING
> diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
> index 96456d1238..50c8e59e50 100644
> --- a/package/btrfs-progs/btrfs-progs.mk
> +++ b/package/btrfs-progs/btrfs-progs.mk
> @@ -4,14 +4,13 @@
>   #
>   ################################################################################
>   
> -BTRFS_PROGS_VERSION = 5.11
> +BTRFS_PROGS_VERSION = 5.15.1
>   BTRFS_PROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/kdave/btrfs-progs
>   BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
>   BTRFS_PROGS_DEPENDENCIES = host-pkgconf lzo util-linux zlib
>   BTRFS_PROGS_CONF_OPTS = --disable-backtrace --disable-zstd --disable-python
> -BTRFS_PROGS_LICENSE = GPL-2.0, LGPL-3.0+ (libbtrfsutil)
> -BTRFS_PROGS_LICENSE_FILES = COPYING libbtrfsutil/COPYING \
> -	libbtrfsutil/COPYING.LESSER
> +BTRFS_PROGS_LICENSE = GPL-2.0, LGPL-2.1+ (libbtrfsutil)
> +BTRFS_PROGS_LICENSE_FILES = COPYING libbtrfsutil/COPYING
>   BTRFS_PROGS_INSTALL_STAGING = YES
>   
>   # Doesn't autodetect static-only and tries to build both
> @@ -31,9 +30,17 @@ else
>   BTRFS_PROGS_CONF_OPTS += --disable-convert
>   endif
>   
> +ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
> +BTRFS_PROGS_CONF_OPTS += --enable-libudev
> +BTRFS_PROGS_DEPENDENCIES += udev
> +else
> +BTRFS_PROGS_CONF_OPTS += --disable-libudev
> +endif
> +
>   HOST_BTRFS_PROGS_DEPENDENCIES = host-util-linux host-lzo host-zlib
>   HOST_BTRFS_PROGS_CONF_OPTS = \
>   	--disable-backtrace \
> +	--disable-libudev \
>   	--disable-zstd \
>   	--disable-python \
>   	--disable-convert
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
