Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D8CCA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 20:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C695160641;
	Sat, 10 Oct 2026 20:15:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WUPKL3jZOGs0; Sat, 10 Oct 2026 20:15:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A791B60632
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791663341;
	b=GP/CElbSJbiUGdrasrX4Vq/3+bbvE5d53KgyfMQefy8fMgvq2MyYqWdkXnDx48NTS24L
	 OnBp22EBSva3wksr1O4yerUf2NvI/tvRHy4v6QRnzCVNyISCs4uZb1wRPEvdxqkQdVhwg
	 Steq48CpBiXfZ9rLKV+VKzKeU7BCzNweZtWhPxD9f8nU8fI27kGsquCahjP06QJE1envJ
	 LpoywPFFq5JSyk0Y2n7IVqZ2yyqBqUaXAmtOY3PC3zAsgZlrjO11L5zalKS693KskfvWz
	 gULnRmmL0tDVIyTEdVdIbXHWipDCrnf8f6E5nXMhpHXbVxCaHUorN193zDOWQjzhpgw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791663341;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ay1DnyNUqoiFesixNxXTBR1V11XjQZSzRdMEXfvTuLo=;
	b=Y6LdnhVKr7jeQMV06E7Klzyie9cBAJ1CJWVN/xWwRfR9QFdutiRtN3GAs1/ThCN0RD3J
	 NWPMV7Y79fTh5/D3EGnv9nj87C3kHZdUtmxx/efb8ogQLSmZRZCOLtV2KXf9L9YR9ueUH
	 1xLFSyFFRiccWdbIvesIrDB3i40NOSJI9+s0zADilZhhCi5FDYUJFhKh5ngxpT8X0ib75
	 hCr//uVjRNh1n0YqCHgOay1A3gPVHnXbzxdcRhP2pUZtmWRCjyV5YU23RBfiLyisfLuGR
	 qB1Vf8gd00b7aqAcZdX19IQ1BGskEFmP7xt+P8tzBQfNoR5LVoBqi+RrAv067yeizOQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791663341;
	bh=ay1DnyNUqoiFesixNxXTBR1V11XjQZSzRdMEXfvTuLo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=J35/Vf6zVXrBUtX86aHnPKk6qDsI+ZekN+KOmOtBlDwWHlZ7zz1ncRlUDNDx1cvNH
	 shDp05OpvTuNH248WNkUlsDHuMxrEeSycnfEn+xKD6cRsJqutyQGmmjz8su5snUYoe
	 P/1byzpfYC1wdvYALdWPd0UNnBiLyJTC9giJp6BS9Vcth9eYKiotasx0Q9OPlV+iZ2
	 1s5SQQNZlvoM4GFT4wHB8ulC5+ME/Sns5kduPuKEd9E4gn1nyO+HKgR/6k4poIiGR7
	 u1rboeuzau85hmkgw9uJvSsvY6YdQVh9umjgw/gt5OpSTctWaYkB1pJMe+buej3XiC
	 HxEwz6du0LkrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A791B60632;
	Sat, 10 Oct 2026 20:15:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A3131105
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E217407CF
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:15:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nXRowdWPwYkb for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 20:15:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CF02D40871
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791663338;
 b=qoOnKYERcrq0X+G63l2nxuSS/xbrS3myt8L+3AyXHoVnq8v1hWHKrRl2KzCzNH8A2Qq3
 +9jnVipNnIoBvV3CE5z/eJmELbGcMyOtjvWwFPcwM20LGupJl2gDKdpcba9mkyUcRnhfC
 9RUCuJJM2StA4zYJa5FBxWtx1Vaxq08f6KWJqUsxPd3zABl/sYvalW4cYF8tYaEDajPM5
 WhymTEDtQ+zjd3uOvBAVdiA3jsaHNQGkr3xHMqYw/j1aCbCNtcj8AgTZV3LejI8pJF0nv
 GktLsuozwQxN9ndn8/dFLgQ6LUCuqJtAxaqHnh+eKYo+apV0BSdMg2GnfcnEUd2wR/w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791663338;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=aSytfih3oZTWBCiGHsG0u94ZSHbXuvDlYhYCoBHoExY=;
 b=SMkI+yW/bnglcAZJ4n4uDS0zv469n7Zw3h1EUSzmRg04p7B4kcpKhAY7BYkqBQMznxeE
 PriLAXVDJfQX/QLQIffWkW9T843hwm2/pluD8Cy+f3Oo8hUCZ4LQp1Gsn7kkfZciGPQG4
 2E6wuX8hCsjAsV2K/MS9nharO8cEAL72YYZJTZE5pKDoK+gmaxarg9FCsLTk/eunVAhzs
 oLlFdUJvlLHLTsCg018EdKw/e1nhg0HKOz0uzfbr4kZ/x3sCwo1DDzZuD9U2iCrwpsfzx
 ZKDiWSha3onEmI7dxjetKb91drzQx3+cj/LqFqkAeVHRFiKJLw2BsKdQV5hC6jFU80g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=eIk+m8NF; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::431"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF02D40871
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:15:36 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-48af4d4e61fso414678f8f.2
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 13:15:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791663334; x=1792268134;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=aSytfih3oZTWBCiGHsG0u94ZSHbXuvDlYhYCoBHoExY=;
 b=v9WjxScwlmaiOKjNCgblH5UjwY3ru4aPo4t7URA+1yCL7G0Z/xH9Yb8D0AVXnRw1ic
 SIyCiho4lwgfUxhsgI4JOmJENJzYDsFpzspEZoDco+LC+RkkbOg5tyP33Vt4Gus+LX+O
 iGzzpsvaweMyeRhEOm+qZmvM09Smf9e+9ojTLUBAla4rzHnr3070GcoczIurDWZ+/l1X
 i32TzelapxnSaoc5pv4RDbQgFcXKbHAg2DLNZioVgXwS+rzg88Xl8DkmkAyKo4Q9dQbK
 GzIlpoO4EZGpllBZF4b97SeFgRyF4uqoAGpH4TD6UB4ajmWmiHESRmmY5/RGp3b8LIGf
 F8Gw==
X-Gm-Message-State: AFq9FYJRV6vZHR9x9AvZ3g4Jd+Jq5mosmQVHbTBRAnWzjafkJBRdh6i9
 4br6GWkTJn6Xm6lgEjHraidXbQWQUpN3uTo5QXRDA+x27pJk3ix9xmwHIqzeB89jj5nornhMkzL
 kNgdeI5A=
X-Gm-Gg: AYBFou2FPPEnTDD0CheW/YozMsmifNTQa/e4AP7JUFPkfqKlBfRVYBnptH3VtLHe+MA
 baoukhdJzduSyvsdlCp8vmB/vaDKIqquQY8I4g5w8k6TZWNKAEDqgGkYFCUVVNR0bIxLBNxR/WU
 ZmXfHD4yvNKi6dN20rpwbMkC1LX+0/RNw2eWLAnIqyYrW9mVwagBpTXSidjjYdXevtFJ2PvGXLB
 sFvYs10A846w2+5FmGD+M7GivWT7YUwy0oWeB2+PzC6z89z+0ceGV77HtDHEObpDX6mAJvlxys0
 XRm75U0VePyIfrLIac1ZEJEPRL+tKDizi8Oijuu6Xfx6oqoMCSiVbkBk0bBYQf9PdBQavn3i/je
 1uA2U7Pnx8f8IiFn3s5kE5pRKZQ4cLrNbw3iHmyECgySfd8tp8ylXEM3NNmwcuET7jznK4fleDv
 VHmCslhZCZqLILDdHxBa0gbJiKpBZd0aPNbhtdwmKayxY8M6VjK6eifUw0bB6347FD/lHR+/vyj
 A+bONmWLerWJ3L048oVUcYdyr0OLReQSVCmQjfoF5b903WnmwMDYZp2gbutUUCuWw3RNk2SQoMw
 T0gDoWG1Hg==
X-Received: by 2002:a5d:5c03:0:b0:48b:1b1:af12 with SMTP id
 ffacd0b85a97d-48dbad4dab2mr9209635f8f.56.1791663334098; 
 Sat, 10 Oct 2026 13:15:34 -0700 (PDT)
Received: from dragon.telekom.ip
 (2001-1aeb-401-dd00-a87-9755-c250-f5ef.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:a87:9755:c250:f5ef])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db99b800asm10225432f8f.22.2026.10.10.13.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 13:15:33 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 22:15:05 +0200
Message-ID: <20261010201508.963412-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/3] Add first-class support for all active
 upstream Linux versions
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: ju.o@free.fr, thomas.petazzoni@bootlin.com, arnout@rnout.be,
 git@jdknight.me, thomas.perale@mind.be
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently we have many configs based on active upstream Kernel versions.
However, they are all using a custom kernel version string, and must therefore
be updated individually. Since there are many security fixes landing each week
in Linux, and Buildroot contains scripts to automate these version bumps,
having an option to follow the upstream releases automatically helps to:

- Reduce the number of individual patches to update each and every board
- Get frequent security updates on boards that don't receive patches frequently

This idea had already been submitted a while ago in
https://patchwork.buildroot.org/project/buildroot/patch/20241108231236.2838-1-git@jdknight.me/

The script utils/bump-stable-kernel-versions remains unchanged, because its
key regular expression that perform the updates also matches these new
symbols defaults.

Titouan Christophe (3):
  linux: always select host-uboot-tools for mips
  linux: add first-class support for all upstream linux versions
  configs: update defconfigs with custom versions to
    BR2_LINUX_KERNEL_LATEST_X_Y

 configs/aarch64_efi_defconfig                 |  3 +-
 configs/acmesystems_acqua_a5_256mb_defconfig  |  3 +-
 configs/acmesystems_acqua_a5_512mb_defconfig  |  3 +-
 configs/am574x_idk_defconfig                  |  3 +-
 configs/amarula_vyasa_rk3288_defconfig        |  3 +-
 configs/arm_fvp_ebbr_defconfig                |  3 +-
 configs/armadeus_apf27_defconfig              |  3 +-
 configs/armadeus_apf28_defconfig              |  3 +-
 configs/armadeus_apf51_defconfig              |  3 +-
 configs/asus_tinker-s_rk3288_defconfig        |  3 +-
 configs/asus_tinker_rk3288_defconfig          |  3 +-
 configs/avenger96_defconfig                   |  3 +-
 configs/bananapi_m2_berry_defconfig           |  3 +-
 configs/bananapi_m2_ultra_defconfig           |  3 +-
 configs/beaglebone_defconfig                  |  3 +-
 configs/beagleboneai64_defconfig              |  3 +-
 configs/beagleboneai_defconfig                |  3 +-
 configs/beagleplay_defconfig                  |  3 +-
 configs/beagley_ai_defconfig                  |  3 +-
 configs/broadcom_northstar_defconfig          |  3 +-
 configs/chromebook_elm_defconfig              |  3 +-
 configs/ci20_defconfig                        |  3 +-
 configs/engicam_px30_core_defconfig           |  3 +-
 configs/freescale_p1025twr_defconfig          |  3 +-
 configs/freescale_t1040d4rdb_defconfig        |  3 +-
 configs/freescale_t2080_qds_rdb_defconfig     |  3 +-
 configs/friendlyarm_nanopi_neo_defconfig      |  3 +-
 configs/friendlyarm_nanopi_r2s_defconfig      |  3 +-
 configs/friendlyarm_nanopi_r3s_defconfig      |  3 +-
 configs/globalscale_espressobin_defconfig     |  3 +-
 configs/grinn_chiliboard_defconfig            |  3 +-
 configs/grinn_liteboard_defconfig             |  3 +-
 configs/hifive_unleashed_defconfig            |  3 +-
 configs/hifive_unmatched_defconfig            |  3 +-
 configs/icnova-a20-adb4006_defconfig          |  3 +-
 configs/imx23evk_defconfig                    |  3 +-
 configs/imx28evk_defconfig                    |  3 +-
 configs/imx6-sabreauto_defconfig              |  3 +-
 configs/imx6-sabresd_defconfig                |  3 +-
 configs/imx6-sabresd_qt5_defconfig            |  3 +-
 configs/imx6slevk_defconfig                   |  3 +-
 configs/imx6sx-sdb_defconfig                  |  3 +-
 configs/imx6ulevk_defconfig                   |  3 +-
 configs/imx6ullevk_defconfig                  |  3 +-
 configs/imx6ulpico_defconfig                  |  3 +-
 configs/imx6ulz_bsh_smm_m2_defconfig          |  3 +-
 configs/imx7d-sdb_defconfig                   |  3 +-
 configs/imx7dpico_defconfig                   |  3 +-
 configs/imx8mm-evk_defconfig                  |  3 +-
 configs/imx8mn-ddr4-evk_defconfig             |  3 +-
 configs/imx8mn_bsh_smm_s2_defconfig           |  3 +-
 configs/imx8mn_bsh_smm_s2_pro_defconfig       |  3 +-
 configs/imx8mp-evk_defconfig                  |  3 +-
 configs/imx8mqevk_defconfig                   |  3 +-
 configs/imx93-evk_defconfig                   |  3 +-
 configs/imxrt1050-evk_defconfig               |  3 +-
 configs/khadas_vim3_defconfig                 |  3 +-
 configs/kontron_smarc_sal28_defconfig         |  3 +-
 configs/lafrite_defconfig                     |  3 +-
 configs/linksprite_pcduino_defconfig          |  3 +-
 configs/loongarch64_efi_defconfig             |  3 +-
 configs/mangopi_mq1rdw2_defconfig             |  3 +-
 configs/mender_x86_64_efi_defconfig           |  3 +-
 configs/microchip_sama7g5ek_mmc_defconfig     |  3 +-
 configs/microchip_sama7g5ek_mmc_dev_defconfig |  3 +-
 configs/minnowboard_max_defconfig             |  3 +-
 configs/mx51evk_defconfig                     |  3 +-
 configs/mx53loco_defconfig                    |  3 +-
 configs/mx6cubox_defconfig                    |  3 +-
 configs/mx6sx_udoo_neo_defconfig              |  3 +-
 configs/nexbox_a95x_defconfig                 |  3 +-
 configs/nezha_defconfig                       |  3 +-
 configs/olimex_a10_olinuxino_lime_defconfig   |  3 +-
 configs/olimex_a13_olinuxino_defconfig        |  3 +-
 configs/olimex_a20_olinuxino_lime2_defconfig  |  3 +-
 configs/olimex_a20_olinuxino_lime_defconfig   |  3 +-
 configs/olimex_a20_olinuxino_micro_defconfig  |  3 +-
 configs/olimex_a33_olinuxino_defconfig        |  3 +-
 configs/olimex_a64_olinuxino_defconfig        |  3 +-
 configs/olimex_imx233_olinuxino_defconfig     |  3 +-
 configs/orangepi_5_plus_defconfig             |  3 +-
 configs/orangepi_lite_defconfig               |  3 +-
 configs/orangepi_one_defconfig                |  3 +-
 configs/orangepi_pc2_defconfig                |  3 +-
 configs/orangepi_pc_defconfig                 |  3 +-
 configs/orangepi_pc_plus_defconfig            |  3 +-
 configs/orangepi_r1_defconfig                 |  3 +-
 configs/orangepi_zero2w_defconfig             |  3 +-
 configs/orangepi_zero3_defconfig              |  3 +-
 configs/orangepi_zero_defconfig               |  3 +-
 configs/orangepi_zero_plus2_defconfig         |  3 +-
 configs/orangepi_zero_plus_defconfig          |  3 +-
 configs/pc_x86_64_bios_defconfig              |  3 +-
 configs/pc_x86_64_efi_defconfig               |  3 +-
 configs/pine64_defconfig                      |  3 +-
 configs/pine64_pinecube_defconfig             |  3 +-
 configs/pine64_star64_defconfig               |  3 +-
 configs/polyhex_debix_model_a_defconfig       |  3 +-
 configs/qemu_aarch64_ebbr_defconfig           |  3 +-
 configs/qemu_aarch64_sbsa_defconfig           |  3 +-
 configs/qemu_aarch64_virt_defconfig           |  3 +-
 configs/qemu_arm_ebbr_defconfig               |  3 +-
 configs/qemu_arm_versatile_defconfig          |  3 +-
 configs/qemu_arm_vexpress_defconfig           |  3 +-
 configs/qemu_arm_vexpress_tz_defconfig        |  3 +-
 configs/qemu_hppa_b160l_defconfig             |  3 +-
 configs/qemu_loongarch64_virt_efi_defconfig   |  3 +-
 configs/qemu_m68k_mcf5208_defconfig           |  3 +-
 configs/qemu_m68k_q800_defconfig              |  3 +-
 configs/qemu_microblazebe_mmu_defconfig       |  3 +-
 configs/qemu_microblazeel_mmu_defconfig       |  3 +-
 configs/qemu_mips32r2_malta_defconfig         |  3 +-
 configs/qemu_mips32r2el_malta_defconfig       |  3 +-
 configs/qemu_mips32r6_malta_defconfig         |  3 +-
 configs/qemu_mips32r6el_malta_defconfig       |  3 +-
 configs/qemu_mips64_malta_defconfig           |  3 +-
 configs/qemu_mips64el_malta_defconfig         |  3 +-
 configs/qemu_mips64r6_malta_defconfig         |  3 +-
 configs/qemu_mips64r6el_malta_defconfig       |  3 +-
 configs/qemu_or1k_defconfig                   |  3 +-
 configs/qemu_ppc64_e5500_defconfig            |  3 +-
 configs/qemu_ppc64_pseries_defconfig          |  3 +-
 configs/qemu_ppc64le_powernv10_defconfig      |  3 +-
 configs/qemu_ppc64le_powernv11_defconfig      |  3 +-
 configs/qemu_ppc64le_powernv8_defconfig       |  3 +-
 configs/qemu_ppc64le_pseries_defconfig        |  3 +-
 configs/qemu_ppc_bamboo_defconfig             |  3 +-
 configs/qemu_ppc_e500mc_defconfig             |  3 +-
 configs/qemu_ppc_g3beige_defconfig            |  3 +-
 configs/qemu_ppc_mac99_defconfig              |  3 +-
 configs/qemu_ppc_mpc8544ds_defconfig          |  3 +-
 configs/qemu_riscv32_nommu_virt_defconfig     |  3 +-
 configs/qemu_riscv32_virt_defconfig           |  3 +-
 configs/qemu_riscv64_nommu_virt_defconfig     |  3 +-
 configs/qemu_riscv64_virt_defconfig           |  3 +-
 configs/qemu_riscv64_virt_efi_defconfig       |  3 +-
 configs/qemu_s390x_defconfig                  |  3 +-
 configs/qemu_sh4_r2d_defconfig                |  3 +-
 configs/qemu_sh4eb_r2d_defconfig              |  3 +-
 configs/qemu_sparc64_sun4u_defconfig          |  3 +-
 configs/qemu_sparc_ss10_defconfig             |  3 +-
 configs/qemu_x86_64_defconfig                 |  3 +-
 configs/qemu_x86_64_efi_defconfig             |  3 +-
 configs/qemu_x86_defconfig                    |  3 +-
 configs/qemu_xtensa_lx60_defconfig            |  3 +-
 configs/qemu_xtensa_lx60_nommu_defconfig      |  3 +-
 configs/roc_pc_rk3399_defconfig               |  3 +-
 configs/rock4se_defconfig                     |  3 +-
 configs/rock5b_defconfig                      |  3 +-
 configs/rockpro64_defconfig                   |  3 +-
 configs/rockpro64_ebbr_defconfig              |  3 +-
 configs/sipeed_licheepi_4a_defconfig          |  3 +-
 configs/sipeed_licheepi_zero_defconfig        |  3 +-
 configs/solidrun_clearfog_defconfig           |  3 +-
 configs/solidrun_clearfog_gt_8k_defconfig     |  3 +-
 configs/solidrun_macchiatobin_defconfig       |  3 +-
 configs/spike_riscv32_defconfig               |  3 +-
 configs/spike_riscv64_defconfig               |  3 +-
 configs/stm32f429_disco_xip_defconfig         |  3 +-
 configs/stm32f469_disco_sd_defconfig          |  3 +-
 configs/stm32f469_disco_xip_defconfig         |  3 +-
 configs/stm32f746_disco_sd_defconfig          |  3 +-
 configs/stm32f769_disco_sd_defconfig          |  3 +-
 configs/stm32h747_disco_sd_defconfig          |  3 +-
 configs/stm32mp135f_dk_defconfig              |  3 +-
 configs/stm32mp157a_dk1_defconfig             |  3 +-
 configs/stm32mp157c_dk2_defconfig             |  3 +-
 configs/stm32mp157c_odyssey_defconfig         |  3 +-
 configs/ti_am62x_sk_defconfig                 |  3 +-
 configs/ti_tda4vm_sk_defconfig                |  3 +-
 configs/visionfive2_defconfig                 |  3 +-
 configs/wandboard_defconfig                   |  3 +-
 configs/warp7_defconfig                       |  3 +-
 linux/Config.in                               | 55 +++++++++++++++++--
 linux/linux.mk                                |  2 +-
 package/linux-headers/Config.in.host          |  4 +-
 176 files changed, 224 insertions(+), 356 deletions(-)

-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
