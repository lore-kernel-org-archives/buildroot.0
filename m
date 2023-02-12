Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C72C05027
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 20:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95E4181448;
	Sun, 12 Feb 2023 20:59:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95E4181448
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lI_XdwjteWCF; Sun, 12 Feb 2023 20:59:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9B1081449;
	Sun, 12 Feb 2023 20:59:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9B1081449
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 871351BF20B
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 20:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D28360AC2
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 20:59:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D28360AC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0JdqIhWcKFKO for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 20:59:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B1BF60C0C
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4B1BF60C0C
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 20:59:48 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id cr22so11915967qtb.10
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 12:59:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E5moweojJo3Qh4CgBkVJ4LQf6iiGPL3NYq8eSwKNm78=;
 b=KmnHbMURnePgRaMWbdZUJX9MKiDNm3lr+D+P1vk2APVX7XUyGCZnTZnBvHuQ9JSkfY
 9apF5PzM8q17Pn8+BDNdj/6FVClsU12p7cqEpdJjWtANgsyhJ417CFEyQPvCtZ1ZmNJx
 prhQ5CMx5DENpmM1aIf4B3uunUPs9WO52JUUz9OYd5gQ21SA2uaEln+CYD0jwW75jzEE
 mIlIbjvDSHLporZpbSq4ryxUfnC9BMu9NWpYDFWR+2XzphdiRVIdbtW9Ak52iZcVppvp
 klTXuE7pW9FnpqPGIsO4SK49qJ34KvWOIgNpXczINQu1XllnvWEkwHMoDl7SuPLxMZij
 VvKA==
X-Gm-Message-State: AO0yUKX/ZztYPLXqXt4USEbBTJveFNq4F7lTtkSK/OhAYeY7GQOfVvIw
 KMNOkYeXl8OeMmcjNM4D1/LYPzVGEQL2yA==
X-Google-Smtp-Source: AK7set9n1h+TuZV/bsKhCd68w9cnzT0g5Eim3c4gefdDUdrBIUq0YzjTbVxafy8mC8KX8TwSZxmaQA==
X-Received: by 2002:ac8:5907:0:b0:3b8:6555:342c with SMTP id
 7-20020ac85907000000b003b86555342cmr27339807qty.11.1676235586956; 
 Sun, 12 Feb 2023 12:59:46 -0800 (PST)
Received: from [10.4.10.38] (pool-108-26-182-112.bstnma.fios.verizon.net.
 [108.26.182.112]) by smtp.gmail.com with ESMTPSA id
 j8-20020ac85c48000000b003b9b41a32b7sm7972943qtj.81.2023.02.12.12.59.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Feb 2023 12:59:46 -0800 (PST)
Message-ID: <d7553ec3-4bc1-a53b-558c-bc7c7651f30d@gmail.com>
Date: Sun, 12 Feb 2023 15:59:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: buildroot@buildroot.org
References: <20221217051337.3778405-1-Mr.Bossman075@gmail.com>
From: Jesse Taube <mr.bossman075@gmail.com>
In-Reply-To: <20221217051337.3778405-1-Mr.Bossman075@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E5moweojJo3Qh4CgBkVJ4LQf6iiGPL3NYq8eSwKNm78=;
 b=kry4EzVAgDOVYNeWPBKtmcb9bKyf7zTZSeS+PT2Yrp0/uwYYdElLODqOm7bZYioBjl
 Lobxn/NUTt+q/oMZaxOTphs6qDvoG762pfxL63RHeBzF6lIJKaVyQwUw44jKjm6ZRven
 dnehyToHoz9WtNLfDMk0dD4WrnGnayLTDCBR4C4fnxKE/mD9RWM2DcBS+S276jS2ZcN4
 y5pXjR4PIMX1FSa6PJ5p2ugzZFkeVBWB14UeAoB6Dfjqi8bYAYNhe04VKT6gvPYxb1vx
 k3r1KPeVQd1NbY3sFaJIHYmjJHMYjXKiJGeaZvKtXtMYIoUmacpvfMFHMPAhOkjtwqgL
 X6BQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kry4EzVA
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
Cc: Mark Corbin <mark@dibsco.co.uk>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Charles Lohr <lohr85@gmail.com>,
 Yimin Gu <ustcymgu@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Any updates on this set?

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
