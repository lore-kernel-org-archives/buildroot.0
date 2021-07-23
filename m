Return-Path: <SRS0=JV6j=MP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7486C4338F
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 22:26:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36D2160EB4
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 22:26:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 36D2160EB4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0AAC840200;
	Fri, 23 Jul 2021 22:26:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gCtWerqn_iRz; Fri, 23 Jul 2021 22:26:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E721401CB;
	Fri, 23 Jul 2021 22:26:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 313701BF3EE
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 22:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FDB64063D
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 22:26:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q0AQXsHJT_mL for <buildroot@lists.busybox.net>;
 Fri, 23 Jul 2021 22:26:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1664C40467
 for <buildroot@buildroot.org>; Fri, 23 Jul 2021 22:26:01 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id j2so2635222edp.11
 for <buildroot@buildroot.org>; Fri, 23 Jul 2021 15:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mn9gqN+ATrS5xm9It698KKBS1aaYXQquCXBkHeVgOoA=;
 b=ZVFw265eRb5m4kqSTKfLZ/at2cXSeQl/DxAy3zRMUYafkAj9sDe/PcZacwLEylYD4I
 sBGT9loZaEhJpKuu+6DRrwl7B6lVM21dcYfs3MjjQ+8lNI8JQp36ifJsIbiat4cLkbqZ
 gSOIVz3fmt0+G2DfAFJga58hjcRi8fpP0Qo+w5jJ3Rb0K6WH4OuxaHMQ6ro/CS1YvV7y
 JZKXOl4/Vy+7Jehe3efxrAdGyTOfur1j/LsHyk/cz/8iPMZNmhiwr4rugZtsI6w+u0qP
 jTjbX/qC1hHK0iZlDKBlsvFUL/Xx3u4L/A87Fa1sSETJCYMjh2IZXZKuLAvhICY/LtNT
 JUSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=mn9gqN+ATrS5xm9It698KKBS1aaYXQquCXBkHeVgOoA=;
 b=OlAD0Y5dCMMapk7J/cXwWGaePF1vv/93848qUbMemwW/KpXFFQbL34dzw8N+5PchuB
 WiWfYlqsJD/oV93OfheIasOT2uZMwCzz+xvyhxTEeO4FOOfhNcJlkjsbTm4sXGYuzFlF
 SkEirybygofJS1dneSQwYwPxA+9wJ2zRp/ExCgmQjeXAv34cchr05+NUaYJhydy47pbV
 3KZ1Q+KTbGkIjpBDXIoYhx8uue5zyeeh1LmzByzdxOm7POsBebmWpemqBtJLrbthh/kG
 qKJZ9WRvIU4MFgk1tWFqaZxXaAPRR5uKGDXGtviUBET/OcZM1uRRP0udfrWEyddf7Q0A
 cesA==
X-Gm-Message-State: AOAM532fkV2oxPN0o6vye56C/hYsgyFq3FWf2PuLF0FWsid3qy/YkB6L
 ksfbhoLL+S0f8dYF8VAGJaDdjQ==
X-Google-Smtp-Source: ABdhPJwVkJvJKi8M2tB/Uj8l6JHxNnTRsZFeMzM9bMwViZAbVANY/AQJiIuLxZkYuJgRm1RJ8Z4NuA==
X-Received: by 2002:aa7:c3d0:: with SMTP id l16mr7976504edr.225.1627079160160; 
 Fri, 23 Jul 2021 15:26:00 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id t4sm11389269ejo.125.2021.07.23.15.25.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jul 2021 15:25:59 -0700 (PDT)
To: Damien Le Moal <damien.lemoal@wdc.com>,
 buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mark Corbin <mark@dibsco.co.uk>
References: <20210715004843.337268-1-damien.lemoal@wdc.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <4bcbc59a-0294-8cc8-0138-d0cdeb1ada7f@mind.be>
Date: Sat, 24 Jul 2021 00:25:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210715004843.337268-1-damien.lemoal@wdc.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v2 0/9] Add RISC-V NOMMU and Canaan K210 SoC
 support
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 15/07/2021 02:48, Damien Le Moal wrote:
> This series adds support for building RISC-V NOMMU kernel bootable
> images for boards using the Cannan Kendryte K210 SoC.
> 
> The first patch makes MMU builds optional for RISC-V. The second patch
> enables RV64 support in elf2flt (patch sent to uclinux-dev). The third
> patch changes the base name of the toolchain to avoid build errors.
> 
> The following 5 patches add default build configuration files for
> various boards: MAIX-bit, MAIX-go, MAIX-dock (Dan Dock) and MAIXDUINO
> from Sipeed and the Canaan KD233 development board.
> 
> Finally, patch 9 documents how to build and install images for these
> boards.
> 
> Changes from v1:
> * Rebased on latest master
> * Simplified patch 3 as suggested by Baruch
> * Fixed typos in documentation (patch 9)
> * Added reviewed-by tags
> 
> Christoph Hellwig (2):
>   package/elf2flt: add RISC-V support
>   package make: build RISC-V nommu builds as linux
> 
> Damien Le Moal (7):
>   arch/config: Make RISC-V MMU optional
>   board: Add Sipeed MAIX-bit support
>   board: Add Sipeed MAIX-Go support
>   board: Add Sipeed MAIXDUINO support
>   board: Add Sipeed MAIX-Dock support
>   board: Add Canaan KD233 support
>   board: Document Canaan K210 based boards support

 Given the feedback from Yann and from me, I've marked the series as Changes
Requested in patchwork.

 Regards,
 Arnout

> 
>  arch/Config.in                                |    2 +-
>  board/canaan/k210-common/README.md            |  318 +++++
>  .../k210-common/busybox-tiny-initramfs.config | 1183 +++++++++++++++++
>  .../k210-common/rootfs_overlay/usr/sbin/init  |   26 +
>  board/canaan/kd233/README.md                  |    4 +
>  board/canaan/kd233/linux-dtb.config           |    2 +
>  board/sipeed/maix-bit/README.md               |    4 +
>  board/sipeed/maix-bit/linux-dtb.config        |    2 +
>  board/sipeed/maix-dock/README.md              |    4 +
>  board/sipeed/maix-dock/linux-dtb.config       |    2 +
>  board/sipeed/maix-go/README.md                |    4 +
>  board/sipeed/maix-go/linux-dtb.config         |    2 +
>  board/sipeed/maixduino/README.md              |    4 +
>  board/sipeed/maixduino/linux-dtb.config       |    2 +
>  configs/canaan_kd233_defconfig                |   23 +
>  configs/canaan_kd233_sdcard_defconfig         |   23 +
>  configs/sipeed_maix_bit_defconfig             |   23 +
>  configs/sipeed_maix_bit_sdcard_defconfig      |   23 +
>  configs/sipeed_maix_dock_defconfig            |   23 +
>  configs/sipeed_maix_dock_sdcard_defconfig     |   23 +
>  configs/sipeed_maix_go_defconfig              |   23 +
>  configs/sipeed_maix_go_sdcard_defconfig       |   23 +
>  configs/sipeed_maixduino_defconfig            |   23 +
>  configs/sipeed_maixduino_sdcard_defconfig     |   23 +
>  package/Makefile.in                           |    5 +-
>  .../0004-elf2flt-add-riscv-support.patch      |  293 ++++
>  package/elf2flt/Config.in.host                |    2 +-
>  27 files changed, 2085 insertions(+), 4 deletions(-)
>  create mode 100644 board/canaan/k210-common/README.md
>  create mode 100644 board/canaan/k210-common/busybox-tiny-initramfs.config
>  create mode 100755 board/canaan/k210-common/rootfs_overlay/usr/sbin/init
>  create mode 100644 board/canaan/kd233/README.md
>  create mode 100644 board/canaan/kd233/linux-dtb.config
>  create mode 100644 board/sipeed/maix-bit/README.md
>  create mode 100644 board/sipeed/maix-bit/linux-dtb.config
>  create mode 100644 board/sipeed/maix-dock/README.md
>  create mode 100644 board/sipeed/maix-dock/linux-dtb.config
>  create mode 100644 board/sipeed/maix-go/README.md
>  create mode 100644 board/sipeed/maix-go/linux-dtb.config
>  create mode 100644 board/sipeed/maixduino/README.md
>  create mode 100644 board/sipeed/maixduino/linux-dtb.config
>  create mode 100644 configs/canaan_kd233_defconfig
>  create mode 100644 configs/canaan_kd233_sdcard_defconfig
>  create mode 100644 configs/sipeed_maix_bit_defconfig
>  create mode 100644 configs/sipeed_maix_bit_sdcard_defconfig
>  create mode 100644 configs/sipeed_maix_dock_defconfig
>  create mode 100644 configs/sipeed_maix_dock_sdcard_defconfig
>  create mode 100644 configs/sipeed_maix_go_defconfig
>  create mode 100644 configs/sipeed_maix_go_sdcard_defconfig
>  create mode 100644 configs/sipeed_maixduino_defconfig
>  create mode 100644 configs/sipeed_maixduino_sdcard_defconfig
>  create mode 100644 package/elf2flt/0004-elf2flt-add-riscv-support.patch
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
