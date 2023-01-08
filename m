Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C7CC54EBC
	for <buildroot@archiver.kernel.org>; Sun,  8 Jan 2023 19:41:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E74F40147;
	Sun,  8 Jan 2023 19:41:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E74F40147
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fX1F5cLfvHbk; Sun,  8 Jan 2023 19:41:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D442740120;
	Sun,  8 Jan 2023 19:41:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D442740120
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7B7CD1BF577
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 19:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4FBB460A9D
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 19:41:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FBB460A9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EQSUew-b9zTi for <buildroot@lists.busybox.net>;
 Sun,  8 Jan 2023 19:41:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40429607C1
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 40429607C1
 for <buildroot@buildroot.org>; Sun,  8 Jan 2023 19:41:02 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id h21so6255715qta.12
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 11:41:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pLPoiGMpZ0o5ZCqtDPp4tVBBrGONjblkAyZw4bI8IZk=;
 b=NhUY0HLEAKPoJ0qHzrCkQRjWeCQpJ1k+c3luVhxzvFZgvUOvO+fGrpUFFzEaF3XcXt
 euZjb4DbzLMfAeoYYfndlPwmOfZkPR4fxvwA9cfyjBmFtElKzEeLrUR+2DIP9WnUfIgQ
 jlvkWnEgvwPyZ/t1HySDfYzIm3AxPgCjcY166qGonra14lRyCVxPmrcK76EbKdf0tYyY
 liaPPM3fyi2x7nj92yzXld9ETtDqHJskiCLu3zMbbGK91UYjy7rnrO0srn9UsY+d2Zyx
 nwdVg1n0pmhDSLp+SQ2rVqBiZbAY5YGjnMxBbIdNAUuGCtnVKUa+iJXg8O3pp25LoaFF
 yGKQ==
X-Gm-Message-State: AFqh2kr0fTMCW38kZbLayMUb2QvY1wJvBKuPDq7hafKZWWZmJAD91dOA
 pH5CN/p+79+fOQWkka6PqjwsbqG/49o=
X-Google-Smtp-Source: AMrXdXs5U48XsTJY4mBycLcaZIMaN73PaOgMM0u10VDdPgwHH66z0avDWc6BkLyK19aKCxPXDaHwLg==
X-Received: by 2002:ac8:43d8:0:b0:3a9:82a1:fb02 with SMTP id
 w24-20020ac843d8000000b003a982a1fb02mr78822998qtn.16.1673206860818; 
 Sun, 08 Jan 2023 11:41:00 -0800 (PST)
Received: from [10.4.10.38] (pool-108-26-182-112.bstnma.fios.verizon.net.
 [108.26.182.112]) by smtp.gmail.com with ESMTPSA id
 x4-20020a05620a258400b006fca1691425sm4171226qko.63.2023.01.08.11.40.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Jan 2023 11:41:00 -0800 (PST)
Message-ID: <44a3a208-4843-42fe-c037-76f1cca0d043@gmail.com>
Date: Sun, 8 Jan 2023 14:40:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
To: buildroot@buildroot.org
References: <20221217051337.3778405-1-Mr.Bossman075@gmail.com>
Content-Language: en-US
From: Jesse Taube <mr.bossman075@gmail.com>
In-Reply-To: <20221217051337.3778405-1-Mr.Bossman075@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pLPoiGMpZ0o5ZCqtDPp4tVBBrGONjblkAyZw4bI8IZk=;
 b=f19YVfPeIAn7SniL7U+IwP9Odi5+eQ/W1m33W1PycZEoMa6IWpCviOQ++uFrcS6mPR
 +xdfxe48HtxJtKCjavFFtUf+SqrDcDzOtLi2oH5XUXNk+g4UUktvkG2kFlugPtOKnaef
 JaO6mo1CT9402q2dQ1ktDfP/+ETtn8dCSKbnHkkNPxybR+fLjtkG6+5FCXipjqvfwzEu
 qJrP282n7oiJ4oWX+UCg1qS7UILD9Ya/1NEg4SYC/jSzP+eBrTsAmKQKoPGwXu3h99fn
 FdpGlcrrlvbid572MqYaoHy4BXlq1MDifm8H00SqQEqwfhWtvKkuGN+8Gn/+v5CSTg1x
 rCIA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=f19YVfPe
Subject: Re: [Buildroot] [PATCH v2 0/4] Add RISC-V 32 NOMMU support
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
Cc: Mark Corbin <mark@dibsco.co.uk>, jacmet@gmail.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Charles Lohr <lohr85@gmail.com>,
 Yimin Gu <ustcymgu@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

Peter Korsgaard would you be willing to review this set?

Thanks,
Jesse
On 12/17/22 00:13, Jesse Taube wrote:
> This patch-set aims to add NOMMU support to RV32.
> Many people want to build simple emulators or HDL
> models of RISC-V this patch makes it posible to
> run linux on them.
> 
> Yimin Gu is the original author of this set.
> Submitted here:
> https://lists.buildroot.org/pipermail/buildroot/2022-November/656134.html
> 
> Though Jesse T made the configs more concise.
> Aswell fixed the 1k line Dconf,
> and split into 3 distinct patches.
> 
> A couple things to note:
> - UcLibc seems to want __ARCH_WANT_TIME32_SYSCALLS
> for adjtimex, but Linux doesnt provide this for RV32.
> - Patch 2 adds __ARCH_WANT_STAT64,
> but I'm not sure if this is needed.
> - Busybox doesnt build umask or unset for NOMMU systems.
> I have seen this happen on STM32 aswell as I.MXRT
> 
> [__ARCH_WANT_TIME32_SYSCALLS]:
> https://patchwork.kernel.org/project/linux-arm-kernel/patch/20190218210712.3503891-5-arnd@arndb.de/
> 
> Jesse Taube (1):
>    configs/qemu_riscv32_nommu_virt_defconfig: New defconfig
> 
> Yimin Gu (3):
>    package/elf2flt: add RISC-V 32-bits support
>    package/uclibc: Add RISC-V 32-bit support
>    arch: Enable support for RISC-V 32-bit NOMMU
> 
>   arch/Config.in.riscv                          |   2 -
>   board/qemu/riscv32-virt/nommu/defconfig       |  16 ++
>   .../riscv32-virt/nommu/patches/linux-headers  |   1 +
>   ...nfig-Allow-RV32-to-build-with-no-MMU.patch |  43 ++++++
>   ...le-stat64-and-time32-for-RV32-uclibc.patch |  40 +++++
>   board/qemu/riscv32-virt/readme.txt            |   6 +-
>   configs/qemu_riscv32_nommu_virt_defconfig     |  31 ++++
>   package/Makefile.in                           |   4 +-
>   .../0007-Added-RISC-V-32-bit-support.patch    |  87 +++++++++++
>   .../uclibc/0001-RISC-V-32-bit-support.patch   | 145 ++++++++++++++++++
>   package/uclibc/Config.in                      |   2 +
>   11 files changed, 372 insertions(+), 5 deletions(-)
>   create mode 100644 board/qemu/riscv32-virt/nommu/defconfig
>   create mode 120000 board/qemu/riscv32-virt/nommu/patches/linux-headers
>   create mode 100644 board/qemu/riscv32-virt/nommu/patches/linux/6.0/0001-riscv-Kconfig-Allow-RV32-to-build-with-no-MMU.patch
>   create mode 100644 board/qemu/riscv32-virt/nommu/patches/linux/6.0/0002-riscv-Enable-stat64-and-time32-for-RV32-uclibc.patch
>   create mode 100644 configs/qemu_riscv32_nommu_virt_defconfig
>   create mode 100644 package/elf2flt/0007-Added-RISC-V-32-bit-support.patch
>   create mode 100644 package/uclibc/0001-RISC-V-32-bit-support.patch
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
