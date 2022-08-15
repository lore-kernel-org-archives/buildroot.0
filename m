Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79036C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 18:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C58840137;
	Mon, 15 Aug 2022 18:05:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C58840137
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8LRpoLGRJh6s; Mon, 15 Aug 2022 18:05:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 402024011F;
	Mon, 15 Aug 2022 18:05:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 402024011F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0F0931BF2C6
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 18:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DAF32404F7
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 18:05:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAF32404F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kUDNkSwCOpvA for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 18:05:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF2C340297
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DF2C340297
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 18:05:44 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id w19so14819097ejc.7
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 11:05:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=/FPNr6cqnnKZDtuGM1ZGR7F4nRmY5+MKWWMzCf4XxjE=;
 b=mlUZIkIQiCB5d8xZNXACLDWVijSyigx9DdyAwixTYWhIGWfVUWr9A/lHW3QHHgGIo1
 ROWrak5Xy6v42UKr59QG4t1697qQOBStaTpqA7/zGF5UhrXV3MVakYIPRO025TqinP6x
 AQb0vjAY3EATcHCrMgABDq60kmFB3DGqsQc9ciFuUTwWtQ0UOW3h0e3AnkC3vC4S12oI
 yx9uCkdEiqOXrt64jknhZRhGN2Odh9WH6sbORAs9A7xFZyeBw4D+yEaan6IVLVczQwTX
 IdEkRnKz9PArZ+RMcdfocdZT4Rs0x2/EsmdaAbml0dtdWim7bI57n06na/j++OuyBHrA
 AG+w==
X-Gm-Message-State: ACgBeo1P9QXlxAv5eMjLSq4yqPd/sd3Juz1y0cNpfWpJs4zuLm6luqCv
 oC4WAfaepCvbVo1oE4oX7ao=
X-Google-Smtp-Source: AA6agR6uOk4UYLcLT3hh2r568BVnPssZ9/97iupDx3lhAfk83EH8zD6iiONPLTmuzXkkC8nSJYYVPw==
X-Received: by 2002:a17:906:5d13:b0:733:10e:b957 with SMTP id
 g19-20020a1709065d1300b00733010eb957mr11053355ejt.452.1660586743058; 
 Mon, 15 Aug 2022 11:05:43 -0700 (PDT)
Received: from localhost (tmo-096-168.customers.d1-online.com. [80.187.96.168])
 by smtp.gmail.com with ESMTPSA id
 d20-20020a170906305400b00734decfa445sm3944448ejd.151.2022.08.15.11.05.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 11:05:42 -0700 (PDT)
Date: Mon, 15 Aug 2022 20:05:39 +0200
From: Thomas Huth <huth@tuxfamily.org>
To: Laurent Vivier <laurent@vivier.eu>
Message-ID: <20220815200539.11e239e2@tuxfamily.org>
In-Reply-To: <20220815144907.3300089-3-laurent@vivier.eu>
References: <20220815144907.3300089-1-laurent@vivier.eu>
 <20220815144907.3300089-3-laurent@vivier.eu>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v4 2/2] board/qemu/m68k-virt: Add virt-m68k
 linux config
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Mon, 15 Aug 2022 16:49:07 +0200
schrieb Laurent Vivier <laurent@vivier.eu>:

> Build a 5.19 (first version with the m68k virt machine) kernel
> for "qemu-system-m68k -M virt" machine.
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  DEVELOPERS                                 |  2 +
>  board/qemu/m68k-virt/config.linux          | 89 ++++++++++++++++++++++
>  board/qemu/m68k-virt/readme.txt            |  5 ++
>  configs/qemu_m68k_virt_petitboot_defconfig | 28 +++++++
>  4 files changed, 124 insertions(+)
>  create mode 100644 board/qemu/m68k-virt/config.linux
>  create mode 100644 board/qemu/m68k-virt/readme.txt
>  create mode 100644 configs/qemu_m68k_virt_petitboot_defconfig
...
> diff --git a/configs/qemu_m68k_virt_petitboot_defconfig b/configs/qemu_m68k_virt_petitboot_defconfig
> new file mode 100644
> index 000000000000..50cd0544dbfd
> --- /dev/null
> +++ b/configs/qemu_m68k_virt_petitboot_defconfig
> @@ -0,0 +1,28 @@
> +BR2_m68k=y
> +BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> +BR2_CCACHE=y
> +BR2_CCACHE_DIR="$(HOME)/.buildroot-ccache-m68k"

Not sure whether CCACHE should be enabled by default (and also enforce the
directory here)? Maybe omit the above two lines?

> +BR2_RELRO_NONE=y
> +BR2_TARGET_GENERIC_ISSUE="Welcome to Petitboot"
> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> +BR2_ROOTFS_MERGED_USR=y
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyGF0"
> +BR2_ROOTFS_OVERLAY="package/petitboot/fs-overlay"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19"
> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-virt/config.linux"
> +BR2_LINUX_KERNEL_XZ=y
> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> +BR2_PACKAGE_KEXEC=y
> +BR2_PACKAGE_KEXEC_ZLIB=y
> +BR2_PACKAGE_DTC=y
> +BR2_PACKAGE_DTC_PROGRAMS=y

DTC on m68k? Does the virt board use device trees?

> +BR2_PACKAGE_ETHTOOL=y
> +BR2_PACKAGE_NET_TOOLS=y
> +BR2_PACKAGE_NETCAT=y
> +BR2_PACKAGE_RSYNC=y
> +BR2_PACKAGE_PETITBOOT=y
> +BR2_TARGET_ROOTFS_CPIO=y
> +BR2_TARGET_ROOTFS_CPIO_XZ=y

 Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
