Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A04CCF31BA
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 20:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A17FA8120B;
	Wed,  2 Oct 2024 20:02:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uXJrk3AheZpJ; Wed,  2 Oct 2024 20:02:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41E2A8120E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41E2A8120E;
	Wed,  2 Oct 2024 20:02:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0A3541BF2EF
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 20:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC5A141061
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 20:02:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vg1fafvGCLXS for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 20:02:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 59DE0409C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59DE0409C4
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 59DE0409C4
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 20:02:09 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-42ca6ba750eso1488805e9.0
 for <buildroot@buildroot.org>; Wed, 02 Oct 2024 13:02:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727899328; x=1728504128;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OYfNM3T+cSJ0qff/yhqy/QBXMylnt2kOmUoMIEqUbnI=;
 b=FT4meZkh38AnfMIsOuQ/MihE8Uo2tW3h8NG5H9+CVkh2GBcgJwUQER6gpfN+WlBC/R
 Fk4eNQAWj6MtKkc5WFpXi7HzZMRACLjvsnxL0uIf8WGf+fdylu+v3Qztvi1sScHl4x2Y
 i2dyUdyKgS5hfRODmPf3EesEAYJQHi9PyoDKDsaXkgTcrl0F1dU1k6UCoJPZC9gT0w3w
 iPTFWn3Kz6O7TRUshcZdv0PqTwLldGmms+t1O3GxFnOXiKFIScft1qUGiaeYOKFbEREv
 S5UR1NinqzfVVfTUDtnoLoVVUCQazwyMSQJ4Q8oA9dIJ06DHmGx/b8u5VHKPkZY3Svip
 UpYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvynMHXUVOwOV58KufxPwc5vk3k9wpAGpm6r2vbheyFiZOslqlhUY9ZbatR+B19e1x/dq0vHC7pQ4=@buildroot.org
X-Gm-Message-State: AOJu0Yyp3bSXGvFPr0k97I+pjFmR1d0HXG5OWqyx2M6ZF8jGpMLS5LBh
 Wu45198I4DB3nIEEmOxAyNRok+BkkNvBZ634LLd4qmV5QHMPASgg1qilsHqH1dA=
X-Google-Smtp-Source: AGHT+IF3R4EEyTWieR5inYC7td4QaB3EBeLZA9c3KMyoKufzsC4GMd8fgTfoFUSNQSl3X9MxPj/Fkg==
X-Received: by 2002:a05:600c:3b85:b0:42c:baf1:4c7 with SMTP id
 5b1f17b1804b1-42f7df119a4mr4945355e9.4.1727899326971; 
 Wed, 02 Oct 2024 13:02:06 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f79d8d3edsm27183725e9.7.2024.10.02.13.02.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Oct 2024 13:02:05 -0700 (PDT)
Message-ID: <9f148de8-692d-4f2e-ac27-b218d380fa03@mind.be>
Date: Wed, 2 Oct 2024 22:02:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1726936373.git.yann.morin.1998@free.fr>
Content-Language: en-GB
In-Reply-To: <cover.1726936373.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1727899328; x=1728504128; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OYfNM3T+cSJ0qff/yhqy/QBXMylnt2kOmUoMIEqUbnI=;
 b=ZlYKBf+kGOlVY3kWnrph2onuuQnJRfZAY9vqZQSAcf8chQXci1OZA94AbDUWUK8jCk
 qRO3adZ3DbKBvyhnZTRMy8F0mtmAq/FW/iB4DWsrn3Sy28EDZglW03DxQItl8cb0hyE6
 VFWejy/xuYGhXWER5FjD6AFuZZkfQc5Sl6w267Lo6OIlzM3D4lZjxv4aACrcDc1KYYWr
 02M4KLqyBWXtUg/Xs44z2cC+wpN24aQqvPpyKevJWRo5bX2jAqKy1bfI0jl2lhOK2mp3
 tzqYVJXPslBOz5/oClcVkf2GLskU13maOmYe+QRvBM4xznVWk/Ie96Rf1O9t+v7BOTWF
 IYzQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ZlYKBf+k
Subject: Re: [Buildroot] [PATCH 0/3 v2] configs/*: regenerate all defconfigs
 (branch yem/defconfig)
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
Cc: Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21/09/2024 18:32, Yann E. MORIN wrote:
> Hello All!
> 
> This short series (with a big patch) implements the decision taken
> during the hackathon in Vienna, where it was decided that defconfigs
> should just be generated with savedefconfig [0].
> 
> Of course, things are never so simple, as Edgar noticed: when a
> defconfig uses the latest version of the kernel headers, that would be
> omitted from the defconfig, and when a newer version would later be
> added, the defconfig would be automatically bumped to use that one,
> which would be wrong (and would break at build time anyway).
> 
> To workaround the issue, we force a default to the oldest version we
> support, as that will ever change, and so it is OK if that is omitted
> from the defconfig (in practice, we have no such defconfig), while
> enforcing the actual kernel version to be saved for all other
> defconfigs.
> 
> Update the manual to not instruct to hand-edit the defconfig file.
> 
> [0] https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs

  Series applied to master, thanks!

  I re-ran the script to regenerate the defconfigs. Nothing more was changed, so 
that's lucky :-)

  I did the following additional check:

         for i in configs/*_defconfig; do
             diff="$(diffconfig ../buildroot-next/$i $i)"
             if [ -n "$diff" ]; then
                 echo "==> $i"
                 echo "$diff"
                 echo
             fi
         done

in order to check if there's anything else like the kernel header update that is 
surprising. There are actually quite a few! The following are IMHO unfortunate 
that they are not in the defconfig, but there's no workaround possible like we 
have for the kernel version. Mostly I think they're unfortunate because the 
default is a pretty random option, nothing meaningful. For example for the 
subarchitecture options, we might want to switch to a generic option as the 
default at some point.

BR2_arm926t
BR2_cortex_a53
BR2_RISCV_64
BR2_m68k_68040
BR2_powerpc_power8
BR2_i386
BR2_x86_i586
BR2_BINFMT_FLAT  -   we may want to switch to FDPIC as a default, when available
BR2_PACKAGE_HOST_AMLOGIC_BOOT_FIP_DEVICE
BR2_PACKAGE_QORIQ_FM_UCODE_PLATFORM
BR2_PACKAGE_SUNXI_MALI_UTGARD_DRIVER

  The BR2_i386 case is funny: it's our default, but we have only 2 defconfigs 
that use it!

  There is one default that is potentially problematic (similar to the kernel 
one), but possibly not: BR2_TARGET_XILINX_PREBUILT_VERSION. As long as AMD makes 
sure that all the defconfigs are tested whenever xilinx-prebuilt is updated, it 
is fine, but otherwise...

  Anyway, in general, I guess we as maintainers have to pay special attention 
whenever a default is changes for something that is potentially used in 
defconfigs. It's unfortunately hard to invent CI that takes care of this (it 
would be easier with merge requests because then there's a base you can compare 
with - but even then it's hard to differentiate expected changes from unexpected 
ones).

  Oh, what we are also missing is a checkpackage check that the defconfig really 
is minimal. If we need to run 'make foo_defconfig; make savedefconfig' such a 
check would be _really_ expensive...


  Regards,
  Arnout


> 
> Regards,
> Yann E. MORIN.
> 
> 
> ----------------------------------------------------------------
> Yann E. MORIN (3):
>        package/linux-headers: default to old kernel version
>        docs/manual: do not instruct doctoring the saved defconfig
>        configs: regenerate all defconfigs
> 
>   configs/aarch64_efi_defconfig                    | 30 ++------
>   configs/acmesystems_aria_g25_128mb_defconfig     | 14 ----
>   configs/acmesystems_aria_g25_256mb_defconfig     | 14 ----
>   configs/acmesystems_arietta_g25_128mb_defconfig  | 14 ----
>   configs/acmesystems_arietta_g25_256mb_defconfig  | 14 ----
>   configs/am574x_idk_defconfig                     | 25 ++----
>   configs/amarula_vyasa_rk3288_defconfig           | 45 +++++------
>   configs/arcturus_ucls1012a_defconfig             | 13 ----
>   configs/arcturus_ucp1020_defconfig               | 11 ---
>   configs/arm_foundationv8_defconfig               |  1 -
>   configs/arm_fvp_ebbr_defconfig                   | 17 +----
>   configs/armadeus_apf27_defconfig                 | 19 +----
>   configs/armadeus_apf28_defconfig                 | 17 +----
>   configs/armadeus_apf51_defconfig                 | 14 +---
>   configs/aspeed_ast2500evb_defconfig              | 29 ++-----
>   configs/aspeed_ast2600evb_defconfig              | 27 ++-----
>   configs/asus_tinker-s_rk3288_defconfig           | 40 ++++------
>   configs/asus_tinker_rk3288_defconfig             | 39 ++++------
>   configs/at91sam9260eknf_defconfig                | 13 ----
>   configs/at91sam9g20dfc_defconfig                 | 18 -----
>   configs/at91sam9g45m10ek_defconfig               | 15 +---
>   configs/at91sam9rlek_defconfig                   | 15 +---
>   configs/at91sam9x5ek_defconfig                   |  5 +-
>   configs/at91sam9x5ek_dev_defconfig               | 21 +-----
>   configs/at91sam9x5ek_mmc_defconfig               | 27 ++-----
>   configs/at91sam9x5ek_mmc_dev_defconfig           | 26 +------
>   configs/atmel_sama5d2_xplained_mmc_dev_defconfig | 19 -----
>   configs/atmel_sama5d3_xplained_defconfig         |  3 +-
>   configs/atmel_sama5d3_xplained_dev_defconfig     | 20 +----
>   configs/atmel_sama5d3_xplained_mmc_dev_defconfig | 19 -----
>   configs/atmel_sama5d3xek_defconfig               | 14 +---
>   configs/atmel_sama5d4_xplained_defconfig         |  7 +-
>   configs/atmel_sama5d4_xplained_dev_defconfig     | 24 +-----
>   configs/atmel_sama5d4_xplained_mmc_dev_defconfig | 19 -----
>   configs/avenger96_defconfig                      | 15 +---
>   configs/bananapi_m2_ultra_defconfig              |  1 -
>   configs/bananapi_m2_zero_defconfig               |  6 +-
>   configs/bananapro_defconfig                      | 49 +++---------
>   configs/beaglebone_defconfig                     | 27 ++-----
>   configs/beaglebone_qt5_defconfig                 |  4 +-
>   configs/beagleboneai64_defconfig                 |  4 +-
>   configs/beagleboneai_defconfig                   |  2 +-
>   configs/beelink_gs1_defconfig                    | 13 +---
>   configs/canaan_kd233_defconfig                   | 18 +----
>   configs/chromebook_elm_defconfig                 | 31 ++------
>   configs/ci20_defconfig                           | 18 +----
>   configs/cubieboard1_defconfig                    | 15 ----
>   configs/cubieboard2_defconfig                    | 30 +++-----
>   configs/engicam_imx6qdl_icore_defconfig          | 36 ++++-----
>   configs/engicam_imx6qdl_icore_qt5_defconfig      | 96 ++++++++++--------------
>   configs/engicam_imx6qdl_icore_rqs_defconfig      | 36 ++++-----
>   configs/engicam_imx6ul_geam_defconfig            | 36 ++++-----
>   configs/engicam_imx6ul_isiot_defconfig           | 36 ++++-----
>   configs/freescale_imx28evk_defconfig             | 20 +----
>   configs/freescale_imx6dlsabreauto_defconfig      | 27 ++-----
>   configs/freescale_imx6dlsabresd_defconfig        | 27 ++-----
>   configs/freescale_imx6qsabreauto_defconfig       | 27 ++-----
>   configs/freescale_imx6qsabresd_defconfig         | 27 ++-----
>   configs/freescale_imx6sxsabresd_defconfig        | 27 ++-----
>   configs/freescale_imx7dsabresd_defconfig         | 21 +-----
>   configs/freescale_imx8mmevk_defconfig            |  2 +-
>   configs/freescale_imx8mpevk_defconfig            |  2 +-
>   configs/freescale_imx8mqevk_defconfig            |  2 +-
>   configs/freescale_p1025twr_defconfig             |  9 ---
>   configs/freescale_t1040d4rdb_defconfig           |  9 ---
>   configs/freescale_t2080_qds_rdb_defconfig        | 10 ---
>   configs/friendlyarm_nanopi_neo_defconfig         | 17 -----
>   configs/friendlyarm_nanopi_r2s_defconfig         |  1 -
>   configs/galileo_defconfig                        |  3 +-
>   configs/globalscale_espressobin_defconfig        | 13 +---
>   configs/hifive_unleashed_defconfig               | 33 ++------
>   configs/icnova-a20-adb4006_defconfig             | 18 +----
>   configs/imx23evk_defconfig                       | 20 +----
>   configs/imx6-sabreauto_defconfig                 | 34 +++------
>   configs/imx6-sabresd_defconfig                   | 34 +++------
>   configs/imx6-sabresd_qt5_defconfig               | 96 ++++++++----------------
>   configs/imx6slevk_defconfig                      | 16 ++--
>   configs/imx6sx-sdb_defconfig                     | 18 ++---
>   configs/imx6ulevk_defconfig                      | 21 +-----
>   configs/imx6ullevk_defconfig                     | 32 ++------
>   configs/imx6ulpico_defconfig                     | 37 ++-------
>   configs/imx7d-sdb_defconfig                      | 23 ++----
>   configs/imx7dpico_defconfig                      | 45 ++++-------
>   configs/imx8mqevk_defconfig                      |  2 +-
>   configs/imxrt1050-evk_defconfig                  | 20 +----
>   configs/khadas_vim3_defconfig                    | 26 +------
>   configs/kontron_bl_imx8mm_defconfig              | 27 ++-----
>   configs/kontron_pitx_imx8m_defconfig             | 24 +-----
>   configs/kontron_smarc_sal28_defconfig            |  3 +-
>   configs/lafrite_defconfig                        |  1 -
>   configs/lego_ev3_defconfig                       | 28 ++-----
>   configs/linksprite_pcduino_defconfig             | 48 +++---------
>   configs/ls1028ardb_defconfig                     | 22 +-----
>   configs/ls1046a-frwy_defconfig                   | 25 +-----
>   configs/mender_x86_64_efi_defconfig              | 57 ++++----------
>   configs/minnowboard_max_defconfig                | 30 ++------
>   configs/mx51evk_defconfig                        | 37 +++------
>   configs/mx53loco_defconfig                       | 35 +++------
>   configs/mx6cubox_defconfig                       | 17 -----
>   configs/mx6sx_udoo_neo_defconfig                 | 22 +++---
>   configs/mx6udoo_defconfig                        | 18 ++---
>   configs/nexbox_a95x_defconfig                    |  1 -
>   configs/nitrogen6sx_defconfig                    | 37 +++------
>   configs/nitrogen6x_defconfig                     | 36 +++------
>   configs/nitrogen7_defconfig                      | 39 +++-------
>   configs/nitrogen8m_defconfig                     | 58 +++++---------
>   configs/nitrogen8mm_defconfig                    | 58 +++++---------
>   configs/nitrogen8mn_defconfig                    | 58 +++++---------
>   configs/nitrogen8mp_defconfig                    | 58 +++++---------
>   configs/octavo_osd32mp1_brk_defconfig            | 22 +-----
>   configs/octavo_osd32mp1_red_defconfig            | 22 +-----
>   configs/odroidc2_defconfig                       | 28 ++-----
>   configs/odroidxu4_defconfig                      |  2 +-
>   configs/olimex_a10_olinuxino_lime_defconfig      | 19 +----
>   configs/olimex_a13_olinuxino_defconfig           | 43 ++++-------
>   configs/olimex_a20_olinuxino_lime2_defconfig     | 29 +------
>   configs/olimex_a20_olinuxino_lime_defconfig      | 29 +------
>   configs/olimex_a20_olinuxino_micro_defconfig     | 16 +---
>   configs/olimex_a33_olinuxino_defconfig           | 48 ++++--------
>   configs/olimex_a64_olinuxino_defconfig           | 45 ++++-------
>   configs/olimex_imx233_olinuxino_defconfig        | 29 +------
>   configs/olimex_stmp157_olinuxino_lime_defconfig  | 17 -----
>   configs/openblocks_a6_defconfig                  | 16 +---
>   configs/orangepi_lite2_defconfig                 | 59 ++++++---------
>   configs/orangepi_one_defconfig                   |  9 +--
>   configs/orangepi_one_plus_defconfig              | 38 ++++------
>   configs/orangepi_pc_defconfig                    |  1 -
>   configs/orangepi_pc_plus_defconfig               | 34 ++++-----
>   configs/orangepi_r1_defconfig                    | 11 +--
>   configs/orangepi_zero2w_defconfig                | 57 +++++---------
>   configs/orangepi_zero3_defconfig                 | 52 +++++--------
>   configs/orangepi_zero_defconfig                  | 53 ++++---------
>   configs/orangepi_zero_plus2_defconfig            | 67 ++++++-----------
>   configs/orangepi_zero_plus_defconfig             | 50 +++++-------
>   configs/pc_x86_64_bios_defconfig                 | 42 +++--------
>   configs/pc_x86_64_efi_defconfig                  | 46 ++++--------
>   configs/pcengines_apu2_defconfig                 | 17 +----
>   configs/pine64_defconfig                         | 43 ++++-------
>   configs/pine64_pinecube_defconfig                | 13 ----
>   configs/pine64_sopine_defconfig                  | 42 ++++-------
>   configs/pine64_star64_defconfig                  | 28 +++----
>   configs/qemu_aarch64_ebbr_defconfig              | 21 +-----
>   configs/qemu_aarch64_sbsa_defconfig              | 42 +++--------
>   configs/qemu_aarch64_virt_defconfig              | 24 +-----
>   configs/qemu_arm_ebbr_defconfig                  | 21 +-----
>   configs/qemu_arm_versatile_defconfig             | 24 +-----
>   configs/qemu_arm_vexpress_defconfig              | 27 ++-----
>   configs/qemu_arm_vexpress_tz_defconfig           | 48 +++---------
>   configs/qemu_m68k_mcf5208_defconfig              | 27 +------
>   configs/qemu_m68k_q800_defconfig                 | 28 +------
>   configs/qemu_microblazebe_mmu_defconfig          | 24 +-----
>   configs/qemu_microblazeel_mmu_defconfig          | 24 +-----
>   configs/qemu_mips32r2_malta_defconfig            | 26 +------
>   configs/qemu_mips32r2el_malta_defconfig          | 26 +------
>   configs/qemu_mips32r6_malta_defconfig            | 26 +------
>   configs/qemu_mips32r6el_malta_defconfig          | 26 +------
>   configs/qemu_mips64_malta_defconfig              | 27 +------
>   configs/qemu_mips64el_malta_defconfig            | 27 +------
>   configs/qemu_mips64r6_malta_defconfig            | 27 +------
>   configs/qemu_mips64r6el_malta_defconfig          | 27 +------
>   configs/qemu_nios2_10m50_defconfig               | 19 +----
>   configs/qemu_or1k_defconfig                      | 21 +-----
>   configs/qemu_ppc64_e5500_defconfig               | 19 +----
>   configs/qemu_ppc64_pseries_defconfig             | 23 +-----
>   configs/qemu_ppc64le_powernv8_defconfig          | 22 +-----
>   configs/qemu_ppc64le_pseries_defconfig           | 22 +-----
>   configs/qemu_ppc_bamboo_defconfig                | 30 ++------
>   configs/qemu_ppc_e500mc_defconfig                | 19 +----
>   configs/qemu_ppc_g3beige_defconfig               | 26 +------
>   configs/qemu_ppc_mac99_defconfig                 | 25 +-----
>   configs/qemu_ppc_mpc8544ds_defconfig             | 30 ++------
>   configs/qemu_riscv32_nommu_virt_defconfig        | 21 +-----
>   configs/qemu_riscv32_virt_defconfig              | 23 +-----
>   configs/qemu_riscv64_nommu_virt_defconfig        | 22 +-----
>   configs/qemu_riscv64_virt_defconfig              | 24 +-----
>   configs/qemu_riscv64_virt_efi_defconfig          |  6 +-
>   configs/qemu_s390x_defconfig                     | 21 +-----
>   configs/qemu_sh4_r2d_defconfig                   | 24 +-----
>   configs/qemu_sh4eb_r2d_defconfig                 | 21 +-----
>   configs/qemu_sparc64_sun4u_defconfig             | 22 +-----
>   configs/qemu_sparc_ss10_defconfig                | 22 +-----
>   configs/qemu_x86_64_defconfig                    | 23 +-----
>   configs/qemu_x86_defconfig                       | 24 +-----
>   configs/qemu_xtensa_lx60_defconfig               | 29 ++-----
>   configs/qemu_xtensa_lx60_nommu_defconfig         | 29 ++-----
>   configs/raspberrypi0_defconfig                   | 37 +++------
>   configs/raspberrypi0w_defconfig                  | 37 +++------
>   configs/raspberrypi2_defconfig                   | 38 +++-------
>   configs/raspberrypi3_64_defconfig                | 38 +++-------
>   configs/raspberrypi3_defconfig                   | 37 +++------
>   configs/raspberrypi3_qt5we_defconfig             | 49 ++++--------
>   configs/raspberrypi4_64_defconfig                | 37 +++------
>   configs/raspberrypi4_defconfig                   | 37 +++------
>   configs/raspberrypi5_defconfig                   | 39 +++-------
>   configs/raspberrypi_defconfig                    | 38 +++-------
>   configs/raspberrypicm4io_64_defconfig            | 41 +++-------
>   configs/raspberrypicm4io_defconfig               | 41 +++-------
>   configs/raspberrypizero2w_defconfig              | 38 +++-------
>   configs/riotboard_defconfig                      | 36 +++------
>   configs/rock5b_defconfig                         | 57 ++++++--------
>   configs/rock64_defconfig                         |  3 +-
>   configs/rock_pi_n8_defconfig                     | 43 ++++-------
>   configs/rockpro64_defconfig                      | 47 +++++-------
>   configs/roseapplepi_defconfig                    | 10 +--
>   configs/s6lx9_microboard_defconfig               |  6 +-
>   configs/sheevaplug_defconfig                     | 32 +++-----
>   configs/sipeed_lichee_rv_dock_defconfig          |  2 +-
>   configs/sipeed_licheepi_nano_defconfig           | 19 +----
>   configs/sipeed_licheepi_zero_defconfig           | 21 +-----
>   configs/sipeed_maix_bit_defconfig                | 18 +----
>   configs/sipeed_maix_bit_sdcard_defconfig         | 33 ++------
>   configs/sipeed_maix_dock_defconfig               | 18 +----
>   configs/sipeed_maix_dock_sdcard_defconfig        | 33 ++------
>   configs/sipeed_maix_go_defconfig                 | 18 +----
>   configs/sipeed_maix_go_sdcard_defconfig          | 33 ++------
>   configs/sipeed_maixduino_defconfig               | 18 +----
>   configs/sipeed_maixduino_sdcard_defconfig        | 33 ++------
>   configs/snps_arc700_axs101_defconfig             | 13 +---
>   configs/snps_arc700_nsim_defconfig               | 11 +--
>   configs/snps_archs38_axs103_defconfig            | 13 +---
>   configs/snps_archs38_haps_defconfig              | 11 +--
>   configs/snps_archs38_hsdk_defconfig              |  3 +-
>   configs/socrates_cyclone5_defconfig              |  6 +-
>   configs/solidrun_clearfog_defconfig              | 17 +----
>   configs/solidrun_clearfog_gt_8k_defconfig        | 43 +++++------
>   configs/solidrun_macchiatobin_defconfig          | 44 ++++-------
>   configs/spike_riscv64_defconfig                  |  1 -
>   configs/stm32mp157a_dk1_defconfig                | 15 +---
>   configs/stm32mp157c_dk2_defconfig                | 13 ----
>   configs/stm32mp157c_odyssey_defconfig            |  4 +-
>   configs/ts5500_defconfig                         | 13 ----
>   configs/uevm5432_defconfig                       | 15 ----
>   configs/versal_vck190_defconfig                  | 15 ++--
>   configs/versal_vpk180_defconfig                  | 17 ++---
>   configs/visionfive2_defconfig                    |  2 +-
>   configs/wandboard_defconfig                      | 33 +++-----
>   configs/warp7_defconfig                          | 37 ++-------
>   configs/zynq_microzed_defconfig                  |  2 +-
>   configs/zynq_zc702_defconfig                     |  2 +-
>   configs/zynq_zc706_defconfig                     |  2 +-
>   configs/zynq_zed_defconfig                       |  2 +-
>   configs/zynqmp_kria_kd240_defconfig              | 15 ++--
>   configs/zynqmp_kria_kr260_defconfig              | 13 ++--
>   configs/zynqmp_kria_kv260_defconfig              | 15 ++--
>   configs/zynqmp_zcu102_defconfig                  | 11 ++-
>   configs/zynqmp_zcu104_defconfig                  | 11 ++-
>   configs/zynqmp_zcu106_defconfig                  | 11 ++-
>   docs/manual/adding-board-support.adoc            |  6 +-
>   package/linux-headers/Config.in.host             |  1 +
>   249 files changed, 1462 insertions(+), 4637 deletions(-)
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
