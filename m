Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5954CA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 20:15:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEB7B60643;
	Sat, 10 Oct 2026 20:15:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TT4w_8uv7iFZ; Sat, 10 Oct 2026 20:15:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1D38C6068F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791663349;
	b=Mfib+tyLDJkSdB5NmFl6wG40jPDEwjdmogdItpvP+3fmeXJHHHlH6lz21rwpemABUV6W
	 EeclNKA3k0qn5W3YQgHdGo2vfqswq93pZs6jySxIOWJSZTqu59EYrmn1S+0hG7vnPKJ/G
	 KHHOIB3U3B6aCli2s+x0SXY76nZO4YNgu2B01BvtDs8AEiriUpsbHqw9IR+ejBvd4d0mt
	 pmGZIUgOfItJUq/nGEL7JA1xuR9aT3JRtx+Ek/OluGpCrSpCJin9N8xF5lOmv/2Ai6nI+
	 NnbLjZFT5TRH8i9lDkn+7c4Y4LNgLayfzng42brA8xIdV45w5pofdTUAQrOE65/ryyQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791663349;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=VQXw4CMs2svIr5CTbMmwlzETU8HAM6MfoeSkEqPj+yg=;
	b=BCUt96s1zHy5CqsXwthnm3je9JiUtfXwbSL0xvCpHhRO3E9EMZ/B8Y7vd/NrrKNPvyhP
	 aVdj08WX44VXDRctkfkKSrADA2aDGeKmDXa5yWgnFYMxzpLt2JHGZzC0d5CofjAVgXAP4
	 4K8Ypufefyh40Ol/I2FI/GP9snRqU6100QRx/Ku0HX+PerCXcQVnu1rhXVVk1U5Yi5CDp
	 ZDA2JbcEerVY/+9wHY6fTPoGfY5vZpsBzKNe3MILDthUtb1bYSmuutP1PzkWxDLdKi1mw
	 nuxfUGT7CMcgKlwXWXpDe0XCp8SIgo7LTkykFnqiNeNwtwipq0YMtPKZIPQPF5y/2gA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791663349;
	bh=VQXw4CMs2svIr5CTbMmwlzETU8HAM6MfoeSkEqPj+yg=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Xbvehi3Gv39NaFWVMlGNUfPr0XErBs+2x+49TQxfuGLN1kBOMA0nZds0i9QlQuHi4
	 CNAVAphT0bUNr3ypXt98D9W+B+rmYiTlNNrMVKA80bDvOFfCxYx6tcyWrrP7M3JXey
	 2RWEJv/lZ50PHgpD2n2ulLQfwYmGjEiqu0qY3xW4KLmdZJl3kTnrMRvPfouS3xr2d8
	 M90M8wsVLLxc+6uMIlFTQFlCWwnyn1c6od1pgIN+eAqEAsMPZYWrTa3putU1P3evKD
	 CuVmuk3B9sQNYoNgl8MU2t+G5k3tEZGQpE2FO8Vj/hQkEKc5e6QWaY1ad03ngCcqEo
	 sopjbHOoPywJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D38C6068F;
	Sat, 10 Oct 2026 20:15:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 35B6A105
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A806400AE
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:15:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JN8zZF6M2xCu for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 20:15:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 20A2340004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791663342;
 b=OYA4VW1GxJik7mPO/sG3D2eD5KosteWhp3jihZHpm9QQspxdxqAz/LuRZtQpygiwU1Ev
 Lz/1v+ZeaRhx9tps2cUjZxngBkUHQS/X2jLJGdiaZEzW7htj4tgLO7dXekcR8B3vZ2AWi
 44bf+08YmiIMGb6FoojodyKeVJ7U7AdJdUg/Uw6y40h8Dt8jlfXcY028ZPhl7ROW+gXxg
 /IYR5WVoxfXKF0JpLGOC5mvAmhn7j+YIrJN1tquSUni2Tp6yk45fNk5w/nOijTPkVCant
 5rgGYOsvwJXOGS8qKoDSr+UzkCyEU+sbj1y9COLjZZUf7Xcaz0dacLJgy05LYesmrEw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791663342;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=MR2ZLSyA0QwVWdhLE01saXx5IWQi8DA6z0YBNK2guJA=;
 b=JvnWwAxKL0mSSZQnR2CHo5pcUjGDRo+w2jffpcs6FxhUYs5aJ8i4WAmF6bpZ0Tj7CWUj
 ISsRJFwxYn56BdGKtkdZUFgIFmpRkNHfvSnoaIHylEwV5R6uKxII3JkgXW+VoOgaM1qQs
 eu4X2NozBiG7zMiCHLouMjiJojzN4kjgG8+monbaPH9rqt5uJG0Ge/Vsah9Af42nE+UKh
 O9mlYpCHFGgqqU3TYzob2vHrq9URxIhSsn39AvpKQzSsuoQvL7XhaDanwHWURuABBNnEw
 stYN0xBJVs9xq+C02Od6InL5mdia+gbs5qhQbuCr3lrCncz8QHGzZviGctb4ZxAsNYQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=PioW1sg4; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 20A2340004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:15:40 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4a16c1608faso10171365e9.0
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 13:15:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791663338; x=1792268138;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=MR2ZLSyA0QwVWdhLE01saXx5IWQi8DA6z0YBNK2guJA=;
 b=beocKSAJ+Uti0VL9PVb0oV+Jati3JDw5iVowYf0QEPvvbhCvb82tkRP+8KNg7t9jPi
 hVI0IkVz9efzT/fhw9OoKgYQk8AMakZc6CZrtFRDlxVIV83O8FY5ItUbeMKU2YJ7eVjt
 jaEneXGrEFkE7QrQ23lYr0bYtaB7VpHu6avAIFoUmEoKe4efA4HjDluvlPUVgoHn8axM
 hwcS4YCfVJegappMAeCu8SPI/eAZTJsjYOe5ycE76Hp2Um7xc8JoHOtRgM8EIXrLuCDI
 0GUN4y/Ze6oWbdght4VNs9ALn+v0jZjrKpUdapyUaCL+ov1pRPtO8WfUVswcEie38W3M
 rA2Q==
X-Gm-Message-State: AFq9FYIJYpaRKXjFnrnBT4IQlWyDMdHhQj4oJ3saAcqBseRJRmSYo1+L
 ViEJPPDJbGcWV7PZ7TEzLEoY5F48hfX0ELuVob8OZxmrzA2iS1BdxEhYqVRMiL0gSq8NWAS1uCf
 m+pW+v40=
X-Gm-Gg: AYBFou070f+tXNCxSP10zxwUyQL0wAIMv9d3HFn3tgUBkEJ2eYsboojZYaocfnx2TrF
 TH+7tpIO8uz4bWSszOQWPUW6N2Z+mY5/Mfb+FDXQD+yUyw/8JLFEMof5dLnZsCrt/qD1nuMoIBY
 8KYN16JTiCjr2zctPS3kQ/jC8XQJjA/IdS6zbTm8OGI6Y2nN5a9dDprNrk1w4cEHKts1qPFaeaK
 IwjX8orIdsuUaaexsalG5rqZOdOqCPKaHpg43KGLl3PFyAmmveUffAEzZGpVwYtiO9HlZ7rX6hT
 cej0ROZncmKan3pbUwhRvpViqo3JxL2qDEFQTrnHc3q01i7KEjmrC2uftK6wLvno9FUXBIHc4FU
 n9Rfwkmr+acZl5F5Ei/sw/Geu47ociy8MCLs7u49NMfAb4jv8h/H9Z51YfOP2U5Fm5ww6kuw8+V
 77CYZdT0zlGh1dPTkS8bTXbUyL5JEhneY7d1RwsGDqncv5KG8ZEo4L9HxX8MfiHjlEkaN484Muw
 Iln3IaLDgn3YwmLptnDqzjAA9sEH44TmujqxGW3yjLb0EE206Pqov/VQrdkpknetyqWwoSkJQ==
X-Received: by 2002:a05:600c:a219:b0:49d:2589:d8e9 with SMTP id
 5b1f17b1804b1-4a18dcc9696mr74959545e9.11.1791663337561; 
 Sat, 10 Oct 2026 13:15:37 -0700 (PDT)
Received: from dragon.telekom.ip
 (2001-1aeb-401-dd00-a87-9755-c250-f5ef.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:a87:9755:c250:f5ef])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db99b800asm10225432f8f.22.2026.10.10.13.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 13:15:37 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 22:15:08 +0200
Message-ID: <20261010201508.963412-4-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010201508.963412-1-titouan.christophe@mind.be>
References: <20261010201508.963412-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] configs: update defconfigs with custom
 versions to BR2_LINUX_KERNEL_LATEST_X_Y
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

Update all defconfigs that are using a custom Linux version based on a
longterm supported Linux version so they use the newly introduced symbols.

We already see from this diff that using that feature updates quite a bunch
of disparate kernel versions accross the tree.

This change was automated with the following Python script:

    import re
    from subprocess import check_output

    MAINTAINED_VERSIONS = {
        "6.18": "BR2_LINUX_KERNEL_LATEST_6_18=y",
        "6.12": "BR2_LINUX_KERNEL_LATEST_6_12=y",
        "6.6": "BR2_LINUX_KERNEL_LATEST_6_6=y",
        "6.1": "BR2_LINUX_KERNEL_LATEST_6_1=y",
        "5.15": "BR2_LINUX_KERNEL_LATEST_5_15=y",
        "5.10": "BR2_LINUX_KERNEL_LATEST_5_10=y",
    }

    LINUX_VERSION_LINE = re.compile(r'(configs/[^:]+):(BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="(\d\.\d{1,2})(?:\.\d+)?")$')

    findcmd = ["git", "grep", "BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="]
    custom_version_configs = check_output(findcmd).decode()

    for line in custom_version_configs.splitlines():
        if (m := LINUX_VERSION_LINE.match(line)) and m[3] in MAINTAINED_VERSIONS:
            content = open(m[1]).read()
            with open(m[1], "w") as out:
                out.write(content.replace(m[2], MAINTAINED_VERSIONS[m[3]]).replace('BR2_LINUX_KERNEL_CUSTOM_VERSION=y\n', ''))
            print(m[1], m[2], "->", MAINTAINED_VERSIONS[m[3]])

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 configs/aarch64_efi_defconfig                 | 3 +--
 configs/acmesystems_acqua_a5_256mb_defconfig  | 3 +--
 configs/acmesystems_acqua_a5_512mb_defconfig  | 3 +--
 configs/am574x_idk_defconfig                  | 3 +--
 configs/amarula_vyasa_rk3288_defconfig        | 3 +--
 configs/arm_fvp_ebbr_defconfig                | 3 +--
 configs/armadeus_apf27_defconfig              | 3 +--
 configs/armadeus_apf28_defconfig              | 3 +--
 configs/armadeus_apf51_defconfig              | 3 +--
 configs/asus_tinker-s_rk3288_defconfig        | 3 +--
 configs/asus_tinker_rk3288_defconfig          | 3 +--
 configs/avenger96_defconfig                   | 3 +--
 configs/bananapi_m2_berry_defconfig           | 3 +--
 configs/bananapi_m2_ultra_defconfig           | 3 +--
 configs/beaglebone_defconfig                  | 3 +--
 configs/beagleboneai64_defconfig              | 3 +--
 configs/beagleboneai_defconfig                | 3 +--
 configs/beagleplay_defconfig                  | 3 +--
 configs/beagley_ai_defconfig                  | 3 +--
 configs/broadcom_northstar_defconfig          | 3 +--
 configs/chromebook_elm_defconfig              | 3 +--
 configs/ci20_defconfig                        | 3 +--
 configs/engicam_px30_core_defconfig           | 3 +--
 configs/freescale_p1025twr_defconfig          | 3 +--
 configs/freescale_t1040d4rdb_defconfig        | 3 +--
 configs/freescale_t2080_qds_rdb_defconfig     | 3 +--
 configs/friendlyarm_nanopi_neo_defconfig      | 3 +--
 configs/friendlyarm_nanopi_r2s_defconfig      | 3 +--
 configs/friendlyarm_nanopi_r3s_defconfig      | 3 +--
 configs/globalscale_espressobin_defconfig     | 3 +--
 configs/grinn_chiliboard_defconfig            | 3 +--
 configs/grinn_liteboard_defconfig             | 3 +--
 configs/hifive_unleashed_defconfig            | 3 +--
 configs/hifive_unmatched_defconfig            | 3 +--
 configs/icnova-a20-adb4006_defconfig          | 3 +--
 configs/imx23evk_defconfig                    | 3 +--
 configs/imx28evk_defconfig                    | 3 +--
 configs/imx6-sabreauto_defconfig              | 3 +--
 configs/imx6-sabresd_defconfig                | 3 +--
 configs/imx6-sabresd_qt5_defconfig            | 3 +--
 configs/imx6slevk_defconfig                   | 3 +--
 configs/imx6sx-sdb_defconfig                  | 3 +--
 configs/imx6ulevk_defconfig                   | 3 +--
 configs/imx6ullevk_defconfig                  | 3 +--
 configs/imx6ulpico_defconfig                  | 3 +--
 configs/imx6ulz_bsh_smm_m2_defconfig          | 3 +--
 configs/imx7d-sdb_defconfig                   | 3 +--
 configs/imx7dpico_defconfig                   | 3 +--
 configs/imx8mm-evk_defconfig                  | 3 +--
 configs/imx8mn-ddr4-evk_defconfig             | 3 +--
 configs/imx8mn_bsh_smm_s2_defconfig           | 3 +--
 configs/imx8mn_bsh_smm_s2_pro_defconfig       | 3 +--
 configs/imx8mp-evk_defconfig                  | 3 +--
 configs/imx8mqevk_defconfig                   | 3 +--
 configs/imx93-evk_defconfig                   | 3 +--
 configs/imxrt1050-evk_defconfig               | 3 +--
 configs/khadas_vim3_defconfig                 | 3 +--
 configs/kontron_smarc_sal28_defconfig         | 3 +--
 configs/lafrite_defconfig                     | 3 +--
 configs/linksprite_pcduino_defconfig          | 3 +--
 configs/loongarch64_efi_defconfig             | 3 +--
 configs/mangopi_mq1rdw2_defconfig             | 3 +--
 configs/mender_x86_64_efi_defconfig           | 3 +--
 configs/microchip_sama7g5ek_mmc_defconfig     | 3 +--
 configs/microchip_sama7g5ek_mmc_dev_defconfig | 3 +--
 configs/minnowboard_max_defconfig             | 3 +--
 configs/mx51evk_defconfig                     | 3 +--
 configs/mx53loco_defconfig                    | 3 +--
 configs/mx6cubox_defconfig                    | 3 +--
 configs/mx6sx_udoo_neo_defconfig              | 3 +--
 configs/nexbox_a95x_defconfig                 | 3 +--
 configs/nezha_defconfig                       | 3 +--
 configs/olimex_a10_olinuxino_lime_defconfig   | 3 +--
 configs/olimex_a13_olinuxino_defconfig        | 3 +--
 configs/olimex_a20_olinuxino_lime2_defconfig  | 3 +--
 configs/olimex_a20_olinuxino_lime_defconfig   | 3 +--
 configs/olimex_a20_olinuxino_micro_defconfig  | 3 +--
 configs/olimex_a33_olinuxino_defconfig        | 3 +--
 configs/olimex_a64_olinuxino_defconfig        | 3 +--
 configs/olimex_imx233_olinuxino_defconfig     | 3 +--
 configs/orangepi_5_plus_defconfig             | 3 +--
 configs/orangepi_lite_defconfig               | 3 +--
 configs/orangepi_one_defconfig                | 3 +--
 configs/orangepi_pc2_defconfig                | 3 +--
 configs/orangepi_pc_defconfig                 | 3 +--
 configs/orangepi_pc_plus_defconfig            | 3 +--
 configs/orangepi_r1_defconfig                 | 3 +--
 configs/orangepi_zero2w_defconfig             | 3 +--
 configs/orangepi_zero3_defconfig              | 3 +--
 configs/orangepi_zero_defconfig               | 3 +--
 configs/orangepi_zero_plus2_defconfig         | 3 +--
 configs/orangepi_zero_plus_defconfig          | 3 +--
 configs/pc_x86_64_bios_defconfig              | 3 +--
 configs/pc_x86_64_efi_defconfig               | 3 +--
 configs/pine64_defconfig                      | 3 +--
 configs/pine64_pinecube_defconfig             | 3 +--
 configs/pine64_star64_defconfig               | 3 +--
 configs/polyhex_debix_model_a_defconfig       | 3 +--
 configs/qemu_aarch64_ebbr_defconfig           | 3 +--
 configs/qemu_aarch64_sbsa_defconfig           | 3 +--
 configs/qemu_aarch64_virt_defconfig           | 3 +--
 configs/qemu_arm_ebbr_defconfig               | 3 +--
 configs/qemu_arm_versatile_defconfig          | 3 +--
 configs/qemu_arm_vexpress_defconfig           | 3 +--
 configs/qemu_arm_vexpress_tz_defconfig        | 3 +--
 configs/qemu_hppa_b160l_defconfig             | 3 +--
 configs/qemu_loongarch64_virt_efi_defconfig   | 3 +--
 configs/qemu_m68k_mcf5208_defconfig           | 3 +--
 configs/qemu_m68k_q800_defconfig              | 3 +--
 configs/qemu_microblazebe_mmu_defconfig       | 3 +--
 configs/qemu_microblazeel_mmu_defconfig       | 3 +--
 configs/qemu_mips32r2_malta_defconfig         | 3 +--
 configs/qemu_mips32r2el_malta_defconfig       | 3 +--
 configs/qemu_mips32r6_malta_defconfig         | 3 +--
 configs/qemu_mips32r6el_malta_defconfig       | 3 +--
 configs/qemu_mips64_malta_defconfig           | 3 +--
 configs/qemu_mips64el_malta_defconfig         | 3 +--
 configs/qemu_mips64r6_malta_defconfig         | 3 +--
 configs/qemu_mips64r6el_malta_defconfig       | 3 +--
 configs/qemu_or1k_defconfig                   | 3 +--
 configs/qemu_ppc64_e5500_defconfig            | 3 +--
 configs/qemu_ppc64_pseries_defconfig          | 3 +--
 configs/qemu_ppc64le_powernv10_defconfig      | 3 +--
 configs/qemu_ppc64le_powernv11_defconfig      | 3 +--
 configs/qemu_ppc64le_powernv8_defconfig       | 3 +--
 configs/qemu_ppc64le_pseries_defconfig        | 3 +--
 configs/qemu_ppc_bamboo_defconfig             | 3 +--
 configs/qemu_ppc_e500mc_defconfig             | 3 +--
 configs/qemu_ppc_g3beige_defconfig            | 3 +--
 configs/qemu_ppc_mac99_defconfig              | 3 +--
 configs/qemu_ppc_mpc8544ds_defconfig          | 3 +--
 configs/qemu_riscv32_nommu_virt_defconfig     | 3 +--
 configs/qemu_riscv32_virt_defconfig           | 3 +--
 configs/qemu_riscv64_nommu_virt_defconfig     | 3 +--
 configs/qemu_riscv64_virt_defconfig           | 3 +--
 configs/qemu_riscv64_virt_efi_defconfig       | 3 +--
 configs/qemu_s390x_defconfig                  | 3 +--
 configs/qemu_sh4_r2d_defconfig                | 3 +--
 configs/qemu_sh4eb_r2d_defconfig              | 3 +--
 configs/qemu_sparc64_sun4u_defconfig          | 3 +--
 configs/qemu_sparc_ss10_defconfig             | 3 +--
 configs/qemu_x86_64_defconfig                 | 3 +--
 configs/qemu_x86_64_efi_defconfig             | 3 +--
 configs/qemu_x86_defconfig                    | 3 +--
 configs/qemu_xtensa_lx60_defconfig            | 3 +--
 configs/qemu_xtensa_lx60_nommu_defconfig      | 3 +--
 configs/roc_pc_rk3399_defconfig               | 3 +--
 configs/rock4se_defconfig                     | 3 +--
 configs/rock5b_defconfig                      | 3 +--
 configs/rockpro64_defconfig                   | 3 +--
 configs/rockpro64_ebbr_defconfig              | 3 +--
 configs/sipeed_licheepi_4a_defconfig          | 3 +--
 configs/sipeed_licheepi_zero_defconfig        | 3 +--
 configs/solidrun_clearfog_defconfig           | 3 +--
 configs/solidrun_clearfog_gt_8k_defconfig     | 3 +--
 configs/solidrun_macchiatobin_defconfig       | 3 +--
 configs/spike_riscv32_defconfig               | 3 +--
 configs/spike_riscv64_defconfig               | 3 +--
 configs/stm32f429_disco_xip_defconfig         | 3 +--
 configs/stm32f469_disco_sd_defconfig          | 3 +--
 configs/stm32f469_disco_xip_defconfig         | 3 +--
 configs/stm32f746_disco_sd_defconfig          | 3 +--
 configs/stm32f769_disco_sd_defconfig          | 3 +--
 configs/stm32h747_disco_sd_defconfig          | 3 +--
 configs/stm32mp135f_dk_defconfig              | 3 +--
 configs/stm32mp157a_dk1_defconfig             | 3 +--
 configs/stm32mp157c_dk2_defconfig             | 3 +--
 configs/stm32mp157c_odyssey_defconfig         | 3 +--
 configs/ti_am62x_sk_defconfig                 | 3 +--
 configs/ti_tda4vm_sk_defconfig                | 3 +--
 configs/visionfive2_defconfig                 | 3 +--
 configs/wandboard_defconfig                   | 3 +--
 configs/warp7_defconfig                       | 3 +--
 173 files changed, 173 insertions(+), 346 deletions(-)

diff --git a/configs/aarch64_efi_defconfig b/configs/aarch64_efi_defconfig
index 78292c0cc4..8bfedc110f 100644
--- a/configs/aarch64_efi_defconfig
+++ b/configs/aarch64_efi_defconfig
@@ -8,8 +8,7 @@ BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/aarch64-efi/post-image.sh support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/aarch64-efi/genimage-efi.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.14"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/aarch64-efi/linux-pmem-netboot.fragment"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
index 3eb805b530..1c277c357e 100644
--- a/configs/acmesystems_acqua_a5_256mb_defconfig
+++ b/configs/acmesystems_acqua_a5_256mb_defconfig
@@ -10,8 +10,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.40"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_DIR="board/acmesystems/acqua-a5/dts"
diff --git a/configs/acmesystems_acqua_a5_512mb_defconfig b/configs/acmesystems_acqua_a5_512mb_defconfig
index 0664a268b0..83c4759497 100644
--- a/configs/acmesystems_acqua_a5_512mb_defconfig
+++ b/configs/acmesystems_acqua_a5_512mb_defconfig
@@ -10,8 +10,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.40"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_DIR="board/acmesystems/acqua-a5/dts"
diff --git a/configs/am574x_idk_defconfig b/configs/am574x_idk_defconfig
index 3ec8829ff7..170abf250b 100644
--- a/configs/am574x_idk_defconfig
+++ b/configs/am574x_idk_defconfig
@@ -10,8 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/am574x-idk/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/ti/am574x-idk/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.18"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/omap/am574x-idk"
diff --git a/configs/amarula_vyasa_rk3288_defconfig b/configs/amarula_vyasa_rk3288_defconfig
index cf99702d0c..747ea44553 100644
--- a/configs/amarula_vyasa_rk3288_defconfig
+++ b/configs/amarula_vyasa_rk3288_defconfig
@@ -10,8 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/amarula/vyasa/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/amarula/vyasa/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.8"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/amarula/vyasa/linux_gmac.fragment"
 BR2_LINUX_KERNEL_UIMAGE=y
diff --git a/configs/arm_fvp_ebbr_defconfig b/configs/arm_fvp_ebbr_defconfig
index 665f59c130..1ed31ef506 100644
--- a/configs/arm_fvp_ebbr_defconfig
+++ b/configs/arm_fvp_ebbr_defconfig
@@ -9,8 +9,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/arm/fvp-ebbr/post-image.sh support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/arm/fvp-ebbr/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_LINUX_KERNEL_NEEDS_HOST_PYTHON3=y
diff --git a/configs/armadeus_apf27_defconfig b/configs/armadeus_apf27_defconfig
index 1bb7c446ed..926718458a 100644
--- a/configs/armadeus_apf27_defconfig
+++ b/configs/armadeus_apf27_defconfig
@@ -6,8 +6,7 @@ BR2_TARGET_GENERIC_HOSTNAME="apf27"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Armadeus development platform !"
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.215"
+BR2_LINUX_KERNEL_LATEST_5_10=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/armadeus/apf27/linux-5.10.config"
 BR2_LINUX_KERNEL_UIMAGE=y
diff --git a/configs/armadeus_apf28_defconfig b/configs/armadeus_apf28_defconfig
index 4db1c558cc..2d0e380c68 100644
--- a/configs/armadeus_apf28_defconfig
+++ b/configs/armadeus_apf28_defconfig
@@ -6,8 +6,7 @@ BR2_TARGET_GENERIC_HOSTNAME="apf28"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Armadeus development platform !"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.215"
+BR2_LINUX_KERNEL_LATEST_5_10=y
 BR2_LINUX_KERNEL_DEFCONFIG="mxs"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x40008000"
diff --git a/configs/armadeus_apf51_defconfig b/configs/armadeus_apf51_defconfig
index 0d9d4f2bc6..a4607bde93 100644
--- a/configs/armadeus_apf51_defconfig
+++ b/configs/armadeus_apf51_defconfig
@@ -7,8 +7,7 @@ BR2_TARGET_GENERIC_HOSTNAME="apf51"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Armadeus development platform !"
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc2"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.215"
+BR2_LINUX_KERNEL_LATEST_5_10=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/armadeus/apf51/linux-5.10.config"
 BR2_LINUX_KERNEL_UIMAGE=y
diff --git a/configs/asus_tinker-s_rk3288_defconfig b/configs/asus_tinker-s_rk3288_defconfig
index 1027a65379..92fee93882 100644
--- a/configs/asus_tinker-s_rk3288_defconfig
+++ b/configs/asus_tinker-s_rk3288_defconfig
@@ -8,8 +8,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/asus/tinker-s/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/asus/tinker/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.79"
+BR2_LINUX_KERNEL_LATEST_6_1=y
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="rk3288-tinker-s"
diff --git a/configs/asus_tinker_rk3288_defconfig b/configs/asus_tinker_rk3288_defconfig
index 8326405536..1e00c084a6 100644
--- a/configs/asus_tinker_rk3288_defconfig
+++ b/configs/asus_tinker_rk3288_defconfig
@@ -10,8 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/asus/tinker/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/asus/tinker/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.8"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3288-tinker"
diff --git a/configs/avenger96_defconfig b/configs/avenger96_defconfig
index bfec6a5870..29fca72e2e 100644
--- a/configs/avenger96_defconfig
+++ b/configs/avenger96_defconfig
@@ -4,8 +4,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_ROOTFS_OVERLAY="board/arrow/avenger96/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp1xx/post-image.sh"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.22"
+BR2_LINUX_KERNEL_LATEST_6_6=y
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="st/stm32mp157a-dhcor-avenger96"
diff --git a/configs/bananapi_m2_berry_defconfig b/configs/bananapi_m2_berry_defconfig
index 35909fbb99..8f285fbd06 100644
--- a/configs/bananapi_m2_berry_defconfig
+++ b/configs/bananapi_m2_berry_defconfig
@@ -8,8 +8,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/bananapi/bananapi-m2-berry/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/bananapi/bananapi-m2-berry/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.8"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun8i-v40-bananapi-m2-berry"
diff --git a/configs/bananapi_m2_ultra_defconfig b/configs/bananapi_m2_ultra_defconfig
index 190481837e..1969b463c9 100644
--- a/configs/bananapi_m2_ultra_defconfig
+++ b/configs/bananapi_m2_ultra_defconfig
@@ -8,8 +8,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/bananapi/bananapi-m2-ultra/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/bananapi/bananapi-m2-ultra/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.8"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun8i-r40-bananapi-m2-ultra"
diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index 1bae3e3bf8..857534d46d 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -11,8 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/beagleboard/beaglebone/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beagleboard/beaglebone/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.38"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/omap/am335x-evm ti/omap/am335x-bone ti/omap/am335x-boneblack ti/omap/am335x-bonegreen ti/omap/am335x-evmsk ti/omap/am335x-boneblue ti/omap/am335x-boneblack-wireless ti/omap/am335x-bonegreen-wireless ti/omap/am335x-bonegreen-eco"
diff --git a/configs/beagleboneai64_defconfig b/configs/beagleboneai64_defconfig
index b41ea09f3e..46ca8bbc15 100644
--- a/configs/beagleboneai64_defconfig
+++ b/configs/beagleboneai64_defconfig
@@ -10,8 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/beagleboard/beagleboneai64/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beagleboard/beagleboneai64/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.16"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-j721e-beagleboneai64"
diff --git a/configs/beagleboneai_defconfig b/configs/beagleboneai_defconfig
index ccabb8c6ba..5f03b5d124 100644
--- a/configs/beagleboneai_defconfig
+++ b/configs/beagleboneai_defconfig
@@ -10,8 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/beagleboard/beagleboneai/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beagleboard/beagleboneai/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.50"
+BR2_LINUX_KERNEL_LATEST_6_12=y
 BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/omap/am5729-beagleboneai"
diff --git a/configs/beagleplay_defconfig b/configs/beagleplay_defconfig
index 90212bda44..7992c1b927 100644
--- a/configs/beagleplay_defconfig
+++ b/configs/beagleplay_defconfig
@@ -8,8 +8,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/beagleboard/beagleplay/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/beagleboard/beagleplay/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.16"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am625-beagleplay"
diff --git a/configs/beagley_ai_defconfig b/configs/beagley_ai_defconfig
index d0a3bf58c4..4a534520be 100644
--- a/configs/beagley_ai_defconfig
+++ b/configs/beagley_ai_defconfig
@@ -10,8 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/beagleboard/beagley-ai/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beagleboard/beagley-ai/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.16"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am67a-beagley-ai"
diff --git a/configs/broadcom_northstar_defconfig b/configs/broadcom_northstar_defconfig
index bbd368ac79..13877a158f 100644
--- a/configs/broadcom_northstar_defconfig
+++ b/configs/broadcom_northstar_defconfig
@@ -3,8 +3,7 @@ BR2_cortex_a9=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/broadcom/northstar/post-image.sh"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.9"
+BR2_LINUX_KERNEL_LATEST_6_6=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/broadcom/northstar/linux.config"
 BR2_LINUX_KERNEL_APPENDED_ZIMAGE=y
diff --git a/configs/chromebook_elm_defconfig b/configs/chromebook_elm_defconfig
index a43b620e1b..429e8d0ec2 100644
--- a/configs/chromebook_elm_defconfig
+++ b/configs/chromebook_elm_defconfig
@@ -6,8 +6,7 @@ BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/chromebook/elm/sign.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/chromebook/mksd.sh"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10"
+BR2_LINUX_KERNEL_LATEST_5_10=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/chromebook/elm/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/ci20_defconfig b/configs/ci20_defconfig
index 4fd7d48c38..ce89888624 100644
--- a/configs/ci20_defconfig
+++ b/configs/ci20_defconfig
@@ -7,8 +7,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/ci20/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.38"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_DEFCONFIG="ci20"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/engicam_px30_core_defconfig b/configs/engicam_px30_core_defconfig
index be5c56e19f..79458542f7 100644
--- a/configs/engicam_px30_core_defconfig
+++ b/configs/engicam_px30_core_defconfig
@@ -8,8 +8,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/engicam/px30core/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/engicam/px30core/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.22"
+BR2_LINUX_KERNEL_LATEST_6_12=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/px30-engicam-px30-core-ctouch2-of10"
diff --git a/configs/freescale_p1025twr_defconfig b/configs/freescale_p1025twr_defconfig
index 568f2060b1..43e6fd4388 100644
--- a/configs/freescale_p1025twr_defconfig
+++ b/configs/freescale_p1025twr_defconfig
@@ -3,8 +3,7 @@ BR2_powerpc_8548=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
+BR2_LINUX_KERNEL_LATEST_6_12=y
 BR2_LINUX_KERNEL_DEFCONFIG="mpc85xx_smp"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="fsl/p1025twr"
diff --git a/configs/freescale_t1040d4rdb_defconfig b/configs/freescale_t1040d4rdb_defconfig
index 851e011983..e0078f1624 100644
--- a/configs/freescale_t1040d4rdb_defconfig
+++ b/configs/freescale_t1040d4rdb_defconfig
@@ -3,8 +3,7 @@ BR2_powerpc_e5500=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
+BR2_LINUX_KERNEL_LATEST_6_12=y
 BR2_LINUX_KERNEL_DEFCONFIG="corenet64_smp"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="fsl/t1040d4rdb"
diff --git a/configs/freescale_t2080_qds_rdb_defconfig b/configs/freescale_t2080_qds_rdb_defconfig
index a598473562..ec11a4f509 100644
--- a/configs/freescale_t2080_qds_rdb_defconfig
+++ b/configs/freescale_t2080_qds_rdb_defconfig
@@ -3,8 +3,7 @@ BR2_powerpc_e6500=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
+BR2_LINUX_KERNEL_LATEST_6_12=y
 BR2_LINUX_KERNEL_DEFCONFIG="corenet64_smp"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="fsl/t2080qds fsl/t2080rdb"
diff --git a/configs/friendlyarm_nanopi_neo_defconfig b/configs/friendlyarm_nanopi_neo_defconfig
index 07be41cbf1..16d3c73a25 100644
--- a/configs/friendlyarm_nanopi_neo_defconfig
+++ b/configs/friendlyarm_nanopi_neo_defconfig
@@ -12,8 +12,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/friendlyarm/nanopi-neo/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/friendlyarm/nanopi-neo/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.18"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun8i-h3-nanopi-neo"
diff --git a/configs/friendlyarm_nanopi_r2s_defconfig b/configs/friendlyarm_nanopi_r2s_defconfig
index 6250237707..c64da9b400 100644
--- a/configs/friendlyarm_nanopi_r2s_defconfig
+++ b/configs/friendlyarm_nanopi_r2s_defconfig
@@ -11,8 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/friendlyarm/nanopi-r2s/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/friendlyarm/nanopi-r2s/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.18"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3328-nanopi-r2s"
diff --git a/configs/friendlyarm_nanopi_r3s_defconfig b/configs/friendlyarm_nanopi_r3s_defconfig
index 971a0ae851..1f2e87271d 100644
--- a/configs/friendlyarm_nanopi_r3s_defconfig
+++ b/configs/friendlyarm_nanopi_r3s_defconfig
@@ -12,8 +12,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/friendlyarm/nanopi-r3s/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.8"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/friendlyarm/nanopi-r3s/kernel.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/globalscale_espressobin_defconfig b/configs/globalscale_espressobin_defconfig
index 5b4f6dcf55..bed887e4f6 100644
--- a/configs/globalscale_espressobin_defconfig
+++ b/configs/globalscale_espressobin_defconfig
@@ -5,8 +5,7 @@ BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Marvell ESPRESSObin"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/globalscale/espressobin/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.34"
+BR2_LINUX_KERNEL_LATEST_6_12=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/globalscale/espressobin/linux-extras.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/grinn_chiliboard_defconfig b/configs/grinn_chiliboard_defconfig
index e91c29607d..bf9f335426 100644
--- a/configs/grinn_chiliboard_defconfig
+++ b/configs/grinn_chiliboard_defconfig
@@ -7,8 +7,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/grinn/chiliboard/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.6"
+BR2_LINUX_KERNEL_LATEST_6_12=y
 BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/omap/am335x-chiliboard"
diff --git a/configs/grinn_liteboard_defconfig b/configs/grinn_liteboard_defconfig
index 480a5a8c23..38a910ce4f 100644
--- a/configs/grinn_liteboard_defconfig
+++ b/configs/grinn_liteboard_defconfig
@@ -7,8 +7,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/grinn/liteboard/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.6"
+BR2_LINUX_KERNEL_LATEST_6_12=y
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6ul-liteboard"
diff --git a/configs/hifive_unleashed_defconfig b/configs/hifive_unleashed_defconfig
index e83af773f7..73e181d77a 100644
--- a/configs/hifive_unleashed_defconfig
+++ b/configs/hifive_unleashed_defconfig
@@ -14,8 +14,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/sifive/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/sifive/common/genimage_sdcard.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.20"
+BR2_LINUX_KERNEL_LATEST_6_12=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sifive/common/linux.config.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/hifive_unmatched_defconfig b/configs/hifive_unmatched_defconfig
index 0b63ce15ff..d6a05ca77a 100644
--- a/configs/hifive_unmatched_defconfig
+++ b/configs/hifive_unmatched_defconfig
@@ -14,8 +14,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/sifive/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/sifive/common/genimage_sdcard.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.20"
+BR2_LINUX_KERNEL_LATEST_6_12=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sifive/common/linux.config.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/icnova-a20-adb4006_defconfig b/configs/icnova-a20-adb4006_defconfig
index 01f4abe215..2e304776e1 100644
--- a/configs/icnova-a20-adb4006_defconfig
+++ b/configs/icnova-a20-adb4006_defconfig
@@ -12,8 +12,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/in-circuit/icnova-a20-adb4006/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.56"
+BR2_LINUX_KERNEL_LATEST_6_6=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/in-circuit/icnova-a20-adb4006/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/imx23evk_defconfig b/configs/imx23evk_defconfig
index 330d5c4502..dc21b2120a 100644
--- a/configs/imx23evk_defconfig
+++ b/configs/imx23evk_defconfig
@@ -3,8 +3,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/mxs/post-image.sh"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.21"
+BR2_LINUX_KERNEL_LATEST_6_6=y
 BR2_LINUX_KERNEL_DEFCONFIG="mxs"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/mxs/imx23-evk"
diff --git a/configs/imx28evk_defconfig b/configs/imx28evk_defconfig
index d34f413440..fa15d970af 100644
--- a/configs/imx28evk_defconfig
+++ b/configs/imx28evk_defconfig
@@ -5,8 +5,7 @@ BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/mxs/post-image.sh"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.26"
+BR2_LINUX_KERNEL_LATEST_6_6=y
 BR2_LINUX_KERNEL_DEFCONFIG="mxs"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/mxs/imx28-evk"
diff --git a/configs/imx6-sabreauto_defconfig b/configs/imx6-sabreauto_defconfig
index 0683a01ff6..5164d4aa8e 100644
--- a/configs/imx6-sabreauto_defconfig
+++ b/configs/imx6-sabreauto_defconfig
@@ -7,8 +7,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.47"
+BR2_LINUX_KERNEL_LATEST_6_6=y
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6q-sabreauto nxp/imx/imx6dl-sabreauto nxp/imx/imx6qp-sabreauto"
diff --git a/configs/imx6-sabresd_defconfig b/configs/imx6-sabresd_defconfig
index bb281e16b8..593bbfee92 100644
--- a/configs/imx6-sabresd_defconfig
+++ b/configs/imx6-sabresd_defconfig
@@ -7,8 +7,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.47"
+BR2_LINUX_KERNEL_LATEST_6_6=y
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6q-sabresd nxp/imx/imx6dl-sabresd nxp/imx/imx6qp-sabresd"
diff --git a/configs/imx6-sabresd_qt5_defconfig b/configs/imx6-sabresd_qt5_defconfig
index d3151819fb..af66e6a98f 100644
--- a/configs/imx6-sabresd_qt5_defconfig
+++ b/configs/imx6-sabresd_qt5_defconfig
@@ -10,8 +10,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_OVERLAY="board/freescale/imx6-sabresd/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.47"
+BR2_LINUX_KERNEL_LATEST_6_6=y
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/freescale/imx6-sabresd/linux_qt5.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/imx6slevk_defconfig b/configs/imx6slevk_defconfig
index f64b5fa41b..b14eec62b0 100644
--- a/configs/imx6slevk_defconfig
+++ b/configs/imx6slevk_defconfig
@@ -7,8 +7,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.51"
+BR2_LINUX_KERNEL_LATEST_6_6=y
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6sl-evk"
diff --git a/configs/imx6sx-sdb_defconfig b/configs/imx6sx-sdb_defconfig
index 5dc3f87171..43f8560a35 100644
--- a/configs/imx6sx-sdb_defconfig
+++ b/configs/imx6sx-sdb_defconfig
@@ -7,8 +7,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.46"
+BR2_LINUX_KERNEL_LATEST_6_6=y
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6sx-sdb nxp/imx/imx6sx-sdb-reva"
diff --git a/configs/imx6ulevk_defconfig b/configs/imx6ulevk_defconfig
index e20d452b66..2ffcd5b982 100644
--- a/configs/imx6ulevk_defconfig
+++ b/configs/imx6ulevk_defconfig
@@ -5,8 +5,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.48"
+BR2_LINUX_KERNEL_LATEST_6_6=y
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6ul-14x14-evk"
diff --git a/configs/imx6ullevk_defconfig b/configs/imx6ullevk_defconfig
index 5d802e6614..84e38ead43 100644
--- a/configs/imx6ullevk_defconfig
+++ b/configs/imx6ullevk_defconfig
@@ -8,8 +8,7 @@ BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.8"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6ull-14x14-evk"
diff --git a/configs/imx6ulpico_defconfig b/configs/imx6ulpico_defconfig
index b8d713c4de..4b378dd267 100644
--- a/configs/imx6ulpico_defconfig
+++ b/configs/imx6ulpico_defconfig
@@ -7,8 +7,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc5"
 BR2_ROOTFS_OVERLAY="board/technexion/imx6ulpico/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.48"
+BR2_LINUX_KERNEL_LATEST_6_6=y
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6ul-pico-pi nxp/imx/imx6ul-pico-hobbit nxp/imx/imx6ul-pico-dwarf"
diff --git a/configs/imx6ulz_bsh_smm_m2_defconfig b/configs/imx6ulz_bsh_smm_m2_defconfig
index 23c23cd758..2339b15618 100644
--- a/configs/imx6ulz_bsh_smm_m2_defconfig
+++ b/configs/imx6ulz_bsh_smm_m2_defconfig
@@ -8,8 +8,7 @@ BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx6ulz-bsh-smm-m2/post-build.sh"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.96"
+BR2_LINUX_KERNEL_LATEST_6_12=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/bsh/imx6ulz-bsh-smm-m2/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/imx7d-sdb_defconfig b/configs/imx7d-sdb_defconfig
index 6520a41cf9..32e808c814 100644
--- a/configs/imx7d-sdb_defconfig
+++ b/configs/imx7d-sdb_defconfig
@@ -8,8 +8,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_OVERLAY="board/freescale/imx7dsdb/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.58"
+BR2_LINUX_KERNEL_LATEST_6_6=y
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx7d-sdb"
diff --git a/configs/imx7dpico_defconfig b/configs/imx7dpico_defconfig
index 3fbdb898a1..51801dac3a 100644
--- a/configs/imx7dpico_defconfig
+++ b/configs/imx7dpico_defconfig
@@ -7,8 +7,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc4"
 BR2_ROOTFS_OVERLAY="board/technexion/imx7dpico/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.48"
+BR2_LINUX_KERNEL_LATEST_6_6=y
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx7d-pico-pi"
diff --git a/configs/imx8mm-evk_defconfig b/configs/imx8mm-evk_defconfig
index 00fe2fa761..2ba3d1eb84 100644
--- a/configs/imx8mm-evk_defconfig
+++ b/configs/imx8mm-evk_defconfig
@@ -9,8 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/freescale/imx8mm-evk/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.16"
+BR2_LINUX_KERNEL_LATEST_6_12=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mm-evk"
diff --git a/configs/imx8mn-ddr4-evk_defconfig b/configs/imx8mn-ddr4-evk_defconfig
index 66c95315f0..34a710de16 100644
--- a/configs/imx8mn-ddr4-evk_defconfig
+++ b/configs/imx8mn-ddr4-evk_defconfig
@@ -9,8 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/freescale/imx8mn-evk/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.16"
+BR2_LINUX_KERNEL_LATEST_6_12=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mn-ddr4-evk"
diff --git a/configs/imx8mn_bsh_smm_s2_defconfig b/configs/imx8mn_bsh_smm_s2_defconfig
index 50a5eb2d9b..c444c98972 100644
--- a/configs/imx8mn_bsh_smm_s2_defconfig
+++ b/configs/imx8mn_bsh_smm_s2_defconfig
@@ -5,8 +5,7 @@ BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx8mn-bsh-smm-s2/post-build.sh"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.96"
+BR2_LINUX_KERNEL_LATEST_6_12=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/bsh/common/imx8mn-bsh-smm-s2/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/imx8mn_bsh_smm_s2_pro_defconfig b/configs/imx8mn_bsh_smm_s2_pro_defconfig
index 6a4a662b92..79c46e6eeb 100644
--- a/configs/imx8mn_bsh_smm_s2_pro_defconfig
+++ b/configs/imx8mn_bsh_smm_s2_pro_defconfig
@@ -6,8 +6,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/bsh/imx8mn-bsh-smm-s2-pro/post-image.sh"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.96"
+BR2_LINUX_KERNEL_LATEST_6_12=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/bsh/common/imx8mn-bsh-smm-s2/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/imx8mp-evk_defconfig b/configs/imx8mp-evk_defconfig
index 2cb7ecbbde..a87f1267dd 100644
--- a/configs/imx8mp-evk_defconfig
+++ b/configs/imx8mp-evk_defconfig
@@ -9,8 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/freescale/imx8mp-evk/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.16"
+BR2_LINUX_KERNEL_LATEST_6_12=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mp-evk"
diff --git a/configs/imx8mqevk_defconfig b/configs/imx8mqevk_defconfig
index bac68f40a6..776109584e 100644
--- a/configs/imx8mqevk_defconfig
+++ b/configs/imx8mqevk_defconfig
@@ -5,8 +5,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/imx8mq-evk.dtb"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.48"
+BR2_LINUX_KERNEL_LATEST_6_6=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mq-evk"
diff --git a/configs/imx93-evk_defconfig b/configs/imx93-evk_defconfig
index f3af2b5183..1e284c2389 100644
--- a/configs/imx93-evk_defconfig
+++ b/configs/imx93-evk_defconfig
@@ -10,8 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/freescale/imx93-evk/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.16"
+BR2_LINUX_KERNEL_LATEST_6_12=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx93-11x11-evk"
diff --git a/configs/imxrt1050-evk_defconfig b/configs/imxrt1050-evk_defconfig
index 813be65e52..563e1ee72a 100644
--- a/configs/imxrt1050-evk_defconfig
+++ b/configs/imxrt1050-evk_defconfig
@@ -9,8 +9,7 @@ BR2_ROOTFS_OVERLAY="board/freescale/imxrt1050evk/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/imxrt1050evk/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.18"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_DEFCONFIG="imxrt"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imxrt1050-evk"
diff --git a/configs/khadas_vim3_defconfig b/configs/khadas_vim3_defconfig
index 32e39fc64b..ee6e01544a 100644
--- a/configs/khadas_vim3_defconfig
+++ b/configs/khadas_vim3_defconfig
@@ -9,8 +9,7 @@ BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/khadas/vim3/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/khadas/vim3/post-image.sh"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.15"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="amlogic/meson-g12b-a311d-khadas-vim3"
diff --git a/configs/kontron_smarc_sal28_defconfig b/configs/kontron_smarc_sal28_defconfig
index b1e175b7b2..d4f568a543 100644
--- a/configs/kontron_smarc_sal28_defconfig
+++ b/configs/kontron_smarc_sal28_defconfig
@@ -11,8 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/kontron/smarc-sal28/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-ls1028a-kontron-sl28 freescale/fsl-ls1028a-kontron-sl28-var2 freescale/fsl-ls1028a-kontron-sl28-var3-ads2 freescale/fsl-ls1028a-kontron-sl28-var4 freescale/fsl-ls1028a-kontron-kbox-a-230-ls"
diff --git a/configs/lafrite_defconfig b/configs/lafrite_defconfig
index 5f70706fa0..24ae65ccfe 100644
--- a/configs/lafrite_defconfig
+++ b/configs/lafrite_defconfig
@@ -8,8 +8,7 @@ BR2_ROOTFS_OVERLAY="board/librecomputer/lafrite/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/librecomputer/lafrite/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.22"
+BR2_LINUX_KERNEL_LATEST_6_6=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="amlogic/meson-gxl-s805x-libretech-ac"
diff --git a/configs/linksprite_pcduino_defconfig b/configs/linksprite_pcduino_defconfig
index a9fe21991f..8771c88918 100644
--- a/configs/linksprite_pcduino_defconfig
+++ b/configs/linksprite_pcduino_defconfig
@@ -11,8 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.3"
+BR2_LINUX_KERNEL_LATEST_6_12=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/linksprite/pcduino/linux-extras.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/loongarch64_efi_defconfig b/configs/loongarch64_efi_defconfig
index c98699330d..2ae9cb8b04 100644
--- a/configs/loongarch64_efi_defconfig
+++ b/configs/loongarch64_efi_defconfig
@@ -6,8 +6,7 @@ BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/loongarch64-efi/post-image.sh support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/loongarch64-efi/genimage-efi.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.32"
+BR2_LINUX_KERNEL_LATEST_6_12=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
diff --git a/configs/mangopi_mq1rdw2_defconfig b/configs/mangopi_mq1rdw2_defconfig
index 469a45b967..2e2a23c9a8 100644
--- a/configs/mangopi_mq1rdw2_defconfig
+++ b/configs/mangopi_mq1rdw2_defconfig
@@ -13,8 +13,7 @@ BR2_ROOTFS_OVERLAY="board/mangopi/mq1rdw2/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/mangopi/mq1rdw2/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.8"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun8i-t113s-mangopi-mq-r-t113"
diff --git a/configs/mender_x86_64_efi_defconfig b/configs/mender_x86_64_efi_defconfig
index 219f02839c..8a0a880492 100644
--- a/configs/mender_x86_64_efi_defconfig
+++ b/configs/mender_x86_64_efi_defconfig
@@ -8,8 +8,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/mender/x86_64/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/mender/x86_64/post-image-efi.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="--data-part-size=32M --device-type=buildroot-x86_64 --artifact-name=1.0"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.28"
+BR2_LINUX_KERNEL_LATEST_6_12=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/mender/x86_64/linux.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
diff --git a/configs/microchip_sama7g5ek_mmc_defconfig b/configs/microchip_sama7g5ek_mmc_defconfig
index 7ab81d1dd0..56433d459d 100644
--- a/configs/microchip_sama7g5ek_mmc_defconfig
+++ b/configs/microchip_sama7g5ek_mmc_defconfig
@@ -5,8 +5,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/microchip/sama7g5ek/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.21"
+BR2_LINUX_KERNEL_LATEST_5_15=y
 BR2_LINUX_KERNEL_DEFCONFIG="sama7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama7g5ek"
diff --git a/configs/microchip_sama7g5ek_mmc_dev_defconfig b/configs/microchip_sama7g5ek_mmc_dev_defconfig
index 2fca9873a6..b3638b5a22 100644
--- a/configs/microchip_sama7g5ek_mmc_dev_defconfig
+++ b/configs/microchip_sama7g5ek_mmc_dev_defconfig
@@ -7,8 +7,7 @@ BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/microchip/sama7g5ek/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.21"
+BR2_LINUX_KERNEL_LATEST_5_15=y
 BR2_LINUX_KERNEL_DEFCONFIG="sama7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama7g5ek"
diff --git a/configs/minnowboard_max_defconfig b/configs/minnowboard_max_defconfig
index f370edbaa1..6f50cb80c0 100644
--- a/configs/minnowboard_max_defconfig
+++ b/configs/minnowboard_max_defconfig
@@ -6,8 +6,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/minnowboard/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/minnowboard/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.11"
+BR2_LINUX_KERNEL_LATEST_5_10=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/minnowboard/linux.config"
 BR2_PACKAGE_LINUX_FIRMWARE=y
diff --git a/configs/mx51evk_defconfig b/configs/mx51evk_defconfig
index e8c3af149b..64f41615ff 100644
--- a/configs/mx51evk_defconfig
+++ b/configs/mx51evk_defconfig
@@ -6,8 +6,7 @@ BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.218"
+BR2_LINUX_KERNEL_LATEST_5_10=y
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx51-babbage"
diff --git a/configs/mx53loco_defconfig b/configs/mx53loco_defconfig
index 004a0f1c19..e331a79432 100644
--- a/configs/mx53loco_defconfig
+++ b/configs/mx53loco_defconfig
@@ -4,8 +4,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.20"
+BR2_LINUX_KERNEL_LATEST_6_1=y
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx53-qsb imx53-qsrb"
diff --git a/configs/mx6cubox_defconfig b/configs/mx6cubox_defconfig
index f2359a4b0c..5ffb2b584a 100644
--- a/configs/mx6cubox_defconfig
+++ b/configs/mx6cubox_defconfig
@@ -10,8 +10,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_OVERLAY="board/solidrun/mx6cubox/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.27"
+BR2_LINUX_KERNEL_LATEST_6_6=y
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6dl-cubox-i nxp/imx/imx6dl-cubox-i-emmc-som-v15 nxp/imx/imx6dl-cubox-i-som-v15 nxp/imx/imx6dl-hummingboard nxp/imx/imx6dl-hummingboard-emmc-som-v15 nxp/imx/imx6dl-hummingboard-som-v15 nxp/imx/imx6q-cubox-i nxp/imx/imx6q-cubox-i-emmc-som-v15 nxp/imx/imx6q-cubox-i-som-v15 nxp/imx/imx6q-hummingboard nxp/imx/imx6q-hummingboard-emmc-som-v15 nxp/imx/imx6q-hummingboard-som-v15"
diff --git a/configs/mx6sx_udoo_neo_defconfig b/configs/mx6sx_udoo_neo_defconfig
index 0c8c4d228c..ce983d79c6 100644
--- a/configs/mx6sx_udoo_neo_defconfig
+++ b/configs/mx6sx_udoo_neo_defconfig
@@ -9,8 +9,7 @@ BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/udoo/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.43"
+BR2_LINUX_KERNEL_LATEST_6_6=y
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6sx-udoo-neo-basic nxp/imx/imx6sx-udoo-neo-full nxp/imx/imx6sx-udoo-neo-extended"
diff --git a/configs/nexbox_a95x_defconfig b/configs/nexbox_a95x_defconfig
index 2c7ddd98b6..20442736d8 100644
--- a/configs/nexbox_a95x_defconfig
+++ b/configs/nexbox_a95x_defconfig
@@ -5,8 +5,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/nexbox/a95x/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/nexbox/a95x/post-image.sh"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.12"
+BR2_LINUX_KERNEL_LATEST_5_10=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="amlogic/meson-gxbb-nexbox-a95x amlogic/meson-gxl-s905x-nexbox-a95x"
diff --git a/configs/nezha_defconfig b/configs/nezha_defconfig
index c234b3e243..e63abbbfb1 100644
--- a/configs/nezha_defconfig
+++ b/configs/nezha_defconfig
@@ -8,8 +8,7 @@ BR2_ROOTFS_OVERLAY="board/nezha/overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/nezha/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.22"
+BR2_LINUX_KERNEL_LATEST_6_6=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/nezha/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/olimex_a10_olinuxino_lime_defconfig b/configs/olimex_a10_olinuxino_lime_defconfig
index 625491d69b..17244a1fbf 100644
--- a/configs/olimex_a10_olinuxino_lime_defconfig
+++ b/configs/olimex_a10_olinuxino_lime_defconfig
@@ -10,8 +10,7 @@ BR2_ROOTFS_OVERLAY="board/olimex/a10_olinuxino/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a10_olinuxino/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.8"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun4i-a10-olinuxino-lime"
diff --git a/configs/olimex_a13_olinuxino_defconfig b/configs/olimex_a13_olinuxino_defconfig
index 9ec20779ce..f092478a99 100644
--- a/configs/olimex_a13_olinuxino_defconfig
+++ b/configs/olimex_a13_olinuxino_defconfig
@@ -10,8 +10,7 @@ BR2_ROOTFS_OVERLAY="board/olimex/a13_olinuxino/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a13_olinuxino/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.8"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun5i-a13-olinuxino"
diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
index 4e8686615b..22b5d7aa23 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -13,8 +13,7 @@ BR2_ROOTFS_OVERLAY="board/olimex/a20_olinuxino/rootfs_overlay_mali"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.8"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index 7edbdcf369..25a29c3b96 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -13,8 +13,7 @@ BR2_ROOTFS_OVERLAY="board/olimex/a20_olinuxino/rootfs_overlay_mali"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.8"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/olimex_a20_olinuxino_micro_defconfig b/configs/olimex_a20_olinuxino_micro_defconfig
index cf1c23ef35..9a92cd8460 100644
--- a/configs/olimex_a20_olinuxino_micro_defconfig
+++ b/configs/olimex_a20_olinuxino_micro_defconfig
@@ -12,8 +12,7 @@ BR2_ROOTFS_OVERLAY="board/olimex/a20_olinuxino/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.8"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun7i-a20-olinuxino-micro"
diff --git a/configs/olimex_a33_olinuxino_defconfig b/configs/olimex_a33_olinuxino_defconfig
index 3606d49a41..995a75cfeb 100644
--- a/configs/olimex_a33_olinuxino_defconfig
+++ b/configs/olimex_a33_olinuxino_defconfig
@@ -10,8 +10,7 @@ BR2_ROOTFS_OVERLAY="board/olimex/a33_olinuxino/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a33_olinuxino/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.8"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun8i-a33-olinuxino"
diff --git a/configs/olimex_a64_olinuxino_defconfig b/configs/olimex_a64_olinuxino_defconfig
index 6173fc8c20..5e5f0a9897 100644
--- a/configs/olimex_a64_olinuxino_defconfig
+++ b/configs/olimex_a64_olinuxino_defconfig
@@ -8,8 +8,7 @@ BR2_ROOTFS_OVERLAY="board/olimex/a64-olinuxino/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a64-olinuxino/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.8"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-a64-olinuxino"
diff --git a/configs/olimex_imx233_olinuxino_defconfig b/configs/olimex_imx233_olinuxino_defconfig
index 7f3a039200..d7d7979252 100644
--- a/configs/olimex_imx233_olinuxino_defconfig
+++ b/configs/olimex_imx233_olinuxino_defconfig
@@ -7,8 +7,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/mxs/post-image.sh"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.83"
+BR2_LINUX_KERNEL_LATEST_6_1=y
 BR2_LINUX_KERNEL_DEFCONFIG="mxs"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/imx233_olinuxino/linux-wifi.fragment"
 BR2_LINUX_KERNEL_UIMAGE=y
diff --git a/configs/orangepi_5_plus_defconfig b/configs/orangepi_5_plus_defconfig
index 53a633f639..9bbbcf15e1 100644
--- a/configs/orangepi_5_plus_defconfig
+++ b/configs/orangepi_5_plus_defconfig
@@ -12,8 +12,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/orangepi-5-plus/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-5-plus/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.4"
+BR2_LINUX_KERNEL_LATEST_6_12=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-5-plus/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/orangepi_lite_defconfig b/configs/orangepi_lite_defconfig
index f1c63f9b1d..400425d191 100644
--- a/configs/orangepi_lite_defconfig
+++ b/configs/orangepi_lite_defconfig
@@ -10,8 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.16"
+BR2_LINUX_KERNEL_LATEST_6_6=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-lite/linux-extras.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/orangepi_one_defconfig b/configs/orangepi_one_defconfig
index aef7eb6c77..de276f468e 100644
--- a/configs/orangepi_one_defconfig
+++ b/configs/orangepi_one_defconfig
@@ -11,8 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.3"
+BR2_LINUX_KERNEL_LATEST_6_12=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun8i-h3-orangepi-one"
diff --git a/configs/orangepi_pc2_defconfig b/configs/orangepi_pc2_defconfig
index 180c744bae..0ece79d5d0 100644
--- a/configs/orangepi_pc2_defconfig
+++ b/configs/orangepi_pc2_defconfig
@@ -7,8 +7,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.45"
+BR2_LINUX_KERNEL_LATEST_6_1=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h5-orangepi-pc2"
diff --git a/configs/orangepi_pc_defconfig b/configs/orangepi_pc_defconfig
index 2b3099db7f..36ec41f49a 100644
--- a/configs/orangepi_pc_defconfig
+++ b/configs/orangepi_pc_defconfig
@@ -11,8 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.91"
+BR2_LINUX_KERNEL_LATEST_6_1=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-pc/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/orangepi_pc_plus_defconfig b/configs/orangepi_pc_plus_defconfig
index 878c7294de..7cba4ccffd 100644
--- a/configs/orangepi_pc_plus_defconfig
+++ b/configs/orangepi_pc_plus_defconfig
@@ -12,8 +12,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.3"
+BR2_LINUX_KERNEL_LATEST_6_12=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-pc-plus/linux-extras.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/orangepi_r1_defconfig b/configs/orangepi_r1_defconfig
index baf9788568..9e543628fb 100644
--- a/configs/orangepi_r1_defconfig
+++ b/configs/orangepi_r1_defconfig
@@ -10,8 +10,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-r1/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.31"
+BR2_LINUX_KERNEL_LATEST_6_6=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-r1/linux-extras.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/orangepi_zero2w_defconfig b/configs/orangepi_zero2w_defconfig
index c2030b05c2..b6978e3fd1 100644
--- a/configs/orangepi_zero2w_defconfig
+++ b/configs/orangepi_zero2w_defconfig
@@ -9,8 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.3"
+BR2_LINUX_KERNEL_LATEST_6_12=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h618-orangepi-zero2w"
diff --git a/configs/orangepi_zero3_defconfig b/configs/orangepi_zero3_defconfig
index c6aa9c991a..552ff2cac0 100644
--- a/configs/orangepi_zero3_defconfig
+++ b/configs/orangepi_zero3_defconfig
@@ -10,8 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.6"
+BR2_LINUX_KERNEL_LATEST_6_12=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h618-orangepi-zero3"
diff --git a/configs/orangepi_zero_defconfig b/configs/orangepi_zero_defconfig
index 6372564e72..f5b9a138f6 100644
--- a/configs/orangepi_zero_defconfig
+++ b/configs/orangepi_zero_defconfig
@@ -12,8 +12,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.3"
+BR2_LINUX_KERNEL_LATEST_6_12=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-zero/linux-extras.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/orangepi_zero_plus2_defconfig b/configs/orangepi_zero_plus2_defconfig
index 2b7ad2064d..155e9ea46a 100644
--- a/configs/orangepi_zero_plus2_defconfig
+++ b/configs/orangepi_zero_plus2_defconfig
@@ -10,8 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.3"
+BR2_LINUX_KERNEL_LATEST_6_12=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-zero-plus2/linux-extras.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/orangepi_zero_plus_defconfig b/configs/orangepi_zero_plus_defconfig
index 48c8e993f0..c028ee832e 100644
--- a/configs/orangepi_zero_plus_defconfig
+++ b/configs/orangepi_zero_plus_defconfig
@@ -8,8 +8,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.53"
+BR2_LINUX_KERNEL_LATEST_6_1=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h5-orangepi-zero-plus"
diff --git a/configs/pc_x86_64_bios_defconfig b/configs/pc_x86_64_bios_defconfig
index 3b3e4cc561..630839d5ae 100644
--- a/configs/pc_x86_64_bios_defconfig
+++ b/configs/pc_x86_64_bios_defconfig
@@ -8,8 +8,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pc/genimage-bios.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
+BR2_LINUX_KERNEL_LATEST_6_12=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
diff --git a/configs/pc_x86_64_efi_defconfig b/configs/pc_x86_64_efi_defconfig
index a126eb8338..a91d499170 100644
--- a/configs/pc_x86_64_efi_defconfig
+++ b/configs/pc_x86_64_efi_defconfig
@@ -7,8 +7,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image-efi.sh"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
+BR2_LINUX_KERNEL_LATEST_6_12=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
diff --git a/configs/pine64_defconfig b/configs/pine64_defconfig
index 9a77452a51..cc81c34ee9 100644
--- a/configs/pine64_defconfig
+++ b/configs/pine64_defconfig
@@ -9,8 +9,7 @@ BR2_TARGET_GENERIC_ISSUE="Welcome to PINE64"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pine64/pine64/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.32"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-a64-pine64"
diff --git a/configs/pine64_pinecube_defconfig b/configs/pine64_pinecube_defconfig
index 2a0c567d76..6a373056c2 100644
--- a/configs/pine64_pinecube_defconfig
+++ b/configs/pine64_pinecube_defconfig
@@ -13,8 +13,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/pine64/pinecube/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pine64/pinecube/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.33"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun8i-s3-pinecube"
diff --git a/configs/pine64_star64_defconfig b/configs/pine64_star64_defconfig
index a0356447d5..a843df1b54 100644
--- a/configs/pine64_star64_defconfig
+++ b/configs/pine64_star64_defconfig
@@ -6,8 +6,7 @@ BR2_ROOTFS_OVERLAY="board/pine64/star64/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pine64/star64/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.57"
+BR2_LINUX_KERNEL_LATEST_6_12=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="starfive/jh7110-pine64-star64"
diff --git a/configs/polyhex_debix_model_a_defconfig b/configs/polyhex_debix_model_a_defconfig
index 6f8ec49410..dfdce059f3 100644
--- a/configs/polyhex_debix_model_a_defconfig
+++ b/configs/polyhex_debix_model_a_defconfig
@@ -8,8 +8,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/polyhex/debix-model-a/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.14"
+BR2_LINUX_KERNEL_LATEST_6_12=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mp-debix-model-a"
diff --git a/configs/qemu_aarch64_ebbr_defconfig b/configs/qemu_aarch64_ebbr_defconfig
index 8d20813044..032fd80ab7 100644
--- a/configs/qemu_aarch64_ebbr_defconfig
+++ b/configs/qemu_aarch64_ebbr_defconfig
@@ -7,8 +7,7 @@ BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh board/qemu/aarch64-ebbr/post-image.sh support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG) -c board/qemu/aarch64-ebbr/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_LINUX_KERNEL_NEEDS_HOST_PYTHON3=y
diff --git a/configs/qemu_aarch64_sbsa_defconfig b/configs/qemu_aarch64_sbsa_defconfig
index 56c160c85a..e313d23988 100644
--- a/configs/qemu_aarch64_sbsa_defconfig
+++ b/configs/qemu_aarch64_sbsa_defconfig
@@ -10,8 +10,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh board/qemu/aarch64-sbsa/assemble-flash-images support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG) -c board/qemu/aarch64-sbsa/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_LINUX_KERNEL_NEEDS_HOST_PYTHON3=y
diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
index 19c8b86ae6..f153b80b4b 100644
--- a/configs/qemu_aarch64_virt_defconfig
+++ b/configs/qemu_aarch64_virt_defconfig
@@ -6,8 +6,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
diff --git a/configs/qemu_arm_ebbr_defconfig b/configs/qemu_arm_ebbr_defconfig
index eae560590e..97066fc0f8 100644
--- a/configs/qemu_arm_ebbr_defconfig
+++ b/configs/qemu_arm_ebbr_defconfig
@@ -8,8 +8,7 @@ BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh board/qemu/arm-ebbr/post-image.sh support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG) -c board/qemu/arm-ebbr/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-ebbr/linux.fragment"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index 7677e5fd05..24dadbce2e 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -7,8 +7,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_DEFCONFIG="versatile"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-versatile/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
index 6dc116c1e7..d86a40cefa 100644
--- a/configs/qemu_arm_vexpress_defconfig
+++ b/configs/qemu_arm_vexpress_defconfig
@@ -10,8 +10,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="arm/vexpress-v2p-ca9"
diff --git a/configs/qemu_arm_vexpress_tz_defconfig b/configs/qemu_arm_vexpress_tz_defconfig
index 84dca264da..33e4438f9d 100644
--- a/configs/qemu_arm_vexpress_tz_defconfig
+++ b/configs/qemu_arm_vexpress_tz_defconfig
@@ -11,8 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/qemu/arm-vexpress-tz/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-vexpress-tz/linux.fragment"
 BR2_PACKAGE_OPENSSL=y
diff --git a/configs/qemu_hppa_b160l_defconfig b/configs/qemu_hppa_b160l_defconfig
index 7e3e561e3f..c94fecd096 100644
--- a/configs/qemu_hppa_b160l_defconfig
+++ b/configs/qemu_hppa_b160l_defconfig
@@ -7,8 +7,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/qemu_loongarch64_virt_efi_defconfig b/configs/qemu_loongarch64_virt_efi_defconfig
index 0c1d046892..516d66d2c3 100644
--- a/configs/qemu_loongarch64_virt_efi_defconfig
+++ b/configs/qemu_loongarch64_virt_efi_defconfig
@@ -7,8 +7,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/loongarch64-virt-efi/post-image.sh board/qemu/post-image.sh support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG) -c board/qemu/loongarch64-virt-efi/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
diff --git a/configs/qemu_m68k_mcf5208_defconfig b/configs/qemu_m68k_mcf5208_defconfig
index ac3df22579..7b132be470 100644
--- a/configs/qemu_m68k_mcf5208_defconfig
+++ b/configs/qemu_m68k_mcf5208_defconfig
@@ -8,8 +8,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-mcf5208/linux.config"
 BR2_TARGET_ROOTFS_INITRAMFS=y
diff --git a/configs/qemu_m68k_q800_defconfig b/configs/qemu_m68k_q800_defconfig
index 87b9629921..04099ec426 100644
--- a/configs/qemu_m68k_q800_defconfig
+++ b/configs/qemu_m68k_q800_defconfig
@@ -7,8 +7,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-q800/linux.config"
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index cc6871e212..245bbc6aa9 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -7,8 +7,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index 8945a775d0..4de88685be 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -7,8 +7,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
diff --git a/configs/qemu_mips32r2_malta_defconfig b/configs/qemu_mips32r2_malta_defconfig
index 832d9f2242..b4c7955646 100644
--- a/configs/qemu_mips32r2_malta_defconfig
+++ b/configs/qemu_mips32r2_malta_defconfig
@@ -8,8 +8,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips32r2el_malta_defconfig b/configs/qemu_mips32r2el_malta_defconfig
index b714a7fc6c..157498efbf 100644
--- a/configs/qemu_mips32r2el_malta_defconfig
+++ b/configs/qemu_mips32r2el_malta_defconfig
@@ -8,8 +8,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2el-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips32r6_malta_defconfig b/configs/qemu_mips32r6_malta_defconfig
index 9cebeeaf45..c3f6e73cdd 100644
--- a/configs/qemu_mips32r6_malta_defconfig
+++ b/configs/qemu_mips32r6_malta_defconfig
@@ -8,8 +8,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips32r6el_malta_defconfig b/configs/qemu_mips32r6el_malta_defconfig
index d54ab1f15e..181c8b780a 100644
--- a/configs/qemu_mips32r6el_malta_defconfig
+++ b/configs/qemu_mips32r6el_malta_defconfig
@@ -8,8 +8,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6el-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
index 62dba0e369..ffc4717aa9 100644
--- a/configs/qemu_mips64_malta_defconfig
+++ b/configs/qemu_mips64_malta_defconfig
@@ -8,8 +8,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips64el_malta_defconfig b/configs/qemu_mips64el_malta_defconfig
index 0714a8e70c..e2a2f76666 100644
--- a/configs/qemu_mips64el_malta_defconfig
+++ b/configs/qemu_mips64el_malta_defconfig
@@ -8,8 +8,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64el-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips64r6_malta_defconfig b/configs/qemu_mips64r6_malta_defconfig
index c7eac226ea..6f98dc8e6d 100644
--- a/configs/qemu_mips64r6_malta_defconfig
+++ b/configs/qemu_mips64r6_malta_defconfig
@@ -9,8 +9,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips64r6el_malta_defconfig b/configs/qemu_mips64r6el_malta_defconfig
index 606bb61a39..c69d139d4f 100644
--- a/configs/qemu_mips64r6el_malta_defconfig
+++ b/configs/qemu_mips64r6el_malta_defconfig
@@ -9,8 +9,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6el-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_or1k_defconfig b/configs/qemu_or1k_defconfig
index 19abf1efb7..853bd66a79 100644
--- a/configs/qemu_or1k_defconfig
+++ b/configs/qemu_or1k_defconfig
@@ -6,8 +6,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/or1k/linux.config"
 BR2_TARGET_ROOTFS_INITRAMFS=y
diff --git a/configs/qemu_ppc64_e5500_defconfig b/configs/qemu_ppc64_e5500_defconfig
index 3d37656bf5..ef2ab4c7dc 100644
--- a/configs/qemu_ppc64_e5500_defconfig
+++ b/configs/qemu_ppc64_e5500_defconfig
@@ -8,8 +8,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_DEFCONFIG="corenet64_smp"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc64-e5500/linux.fragment"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
diff --git a/configs/qemu_ppc64_pseries_defconfig b/configs/qemu_ppc64_pseries_defconfig
index a46cedbb1f..0ebac413e0 100644
--- a/configs/qemu_ppc64_pseries_defconfig
+++ b/configs/qemu_ppc64_pseries_defconfig
@@ -8,8 +8,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_DEFCONFIG="pseries"
 BR2_LINUX_KERNEL_VMLINUX=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
diff --git a/configs/qemu_ppc64le_powernv10_defconfig b/configs/qemu_ppc64le_powernv10_defconfig
index 41765c2f17..d62ac44b25 100644
--- a/configs/qemu_ppc64le_powernv10_defconfig
+++ b/configs/qemu_ppc64le_powernv10_defconfig
@@ -8,8 +8,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_DEFCONFIG="powernv"
 BR2_LINUX_KERNEL_VMLINUX=y
 BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
diff --git a/configs/qemu_ppc64le_powernv11_defconfig b/configs/qemu_ppc64le_powernv11_defconfig
index 94266a22d5..40224ef595 100644
--- a/configs/qemu_ppc64le_powernv11_defconfig
+++ b/configs/qemu_ppc64le_powernv11_defconfig
@@ -8,8 +8,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_DEFCONFIG="powernv"
 BR2_LINUX_KERNEL_VMLINUX=y
 BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
diff --git a/configs/qemu_ppc64le_powernv8_defconfig b/configs/qemu_ppc64le_powernv8_defconfig
index 5f1d7b78d9..0207a3e4b3 100644
--- a/configs/qemu_ppc64le_powernv8_defconfig
+++ b/configs/qemu_ppc64le_powernv8_defconfig
@@ -7,8 +7,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_DEFCONFIG="powernv"
 BR2_LINUX_KERNEL_VMLINUX=y
 BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
diff --git a/configs/qemu_ppc64le_pseries_defconfig b/configs/qemu_ppc64le_pseries_defconfig
index 4596d43682..0c732167c5 100644
--- a/configs/qemu_ppc64le_pseries_defconfig
+++ b/configs/qemu_ppc64le_pseries_defconfig
@@ -7,8 +7,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_DEFCONFIG="pseries_le"
 BR2_LINUX_KERNEL_VMLINUX=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
diff --git a/configs/qemu_ppc_bamboo_defconfig b/configs/qemu_ppc_bamboo_defconfig
index 6e12047f85..03bb74f5e9 100644
--- a/configs/qemu_ppc_bamboo_defconfig
+++ b/configs/qemu_ppc_bamboo_defconfig
@@ -8,8 +8,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_DEFCONFIG="44x/bamboo"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc-bamboo/linux.fragment"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_ppc_e500mc_defconfig b/configs/qemu_ppc_e500mc_defconfig
index 6ac6e1c135..b6f39d9228 100644
--- a/configs/qemu_ppc_e500mc_defconfig
+++ b/configs/qemu_ppc_e500mc_defconfig
@@ -8,8 +8,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_DEFCONFIG="corenet32_smp"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc-e500mc/linux.fragment"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index a8e9c379ba..217ca4612c 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -8,8 +8,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-g3beige/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_ppc_mac99_defconfig b/configs/qemu_ppc_mac99_defconfig
index 55d201bdb9..f83515bdda 100644
--- a/configs/qemu_ppc_mac99_defconfig
+++ b/configs/qemu_ppc_mac99_defconfig
@@ -8,8 +8,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_DEFCONFIG="pmac32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc-mac99/linux.fragment"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
index 3e5a9a84fe..f75dbb725d 100644
--- a/configs/qemu_ppc_mpc8544ds_defconfig
+++ b/configs/qemu_ppc_mpc8544ds_defconfig
@@ -8,8 +8,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-mpc8544ds/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_riscv32_nommu_virt_defconfig b/configs/qemu_riscv32_nommu_virt_defconfig
index 0f9ac77e41..3ac597dbc1 100644
--- a/configs/qemu_riscv32_nommu_virt_defconfig
+++ b/configs/qemu_riscv32_nommu_virt_defconfig
@@ -8,8 +8,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/riscv32-virt/linux-nommu.config"
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/qemu_riscv32_virt_defconfig b/configs/qemu_riscv32_virt_defconfig
index a57c94910c..cc87497303 100644
--- a/configs/qemu_riscv32_virt_defconfig
+++ b/configs/qemu_riscv32_virt_defconfig
@@ -7,8 +7,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_DEFCONFIG="rv32"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_OPENSBI=y
diff --git a/configs/qemu_riscv64_nommu_virt_defconfig b/configs/qemu_riscv64_nommu_virt_defconfig
index 58d89eae5f..953f4cc971 100644
--- a/configs/qemu_riscv64_nommu_virt_defconfig
+++ b/configs/qemu_riscv64_nommu_virt_defconfig
@@ -7,8 +7,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/riscv64-virt/linux-nommu.config"
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/qemu_riscv64_virt_defconfig b/configs/qemu_riscv64_virt_defconfig
index 0d91971d1c..b92f2b541e 100644
--- a/configs/qemu_riscv64_virt_defconfig
+++ b/configs/qemu_riscv64_virt_defconfig
@@ -6,8 +6,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_OPENSBI=y
diff --git a/configs/qemu_riscv64_virt_efi_defconfig b/configs/qemu_riscv64_virt_efi_defconfig
index c279e159af..c1c22618b5 100644
--- a/configs/qemu_riscv64_virt_efi_defconfig
+++ b/configs/qemu_riscv64_virt_efi_defconfig
@@ -8,8 +8,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh board/qemu/riscv64-virt-efi/assemble-flash-images support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG) -c board/qemu/riscv64-virt-efi/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/qemu_s390x_defconfig b/configs/qemu_s390x_defconfig
index 5efc048c89..d52145cba5 100644
--- a/configs/qemu_s390x_defconfig
+++ b/configs/qemu_s390x_defconfig
@@ -7,8 +7,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index 2311f7e06c..66627592e4 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -7,8 +7,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_sh4eb_r2d_defconfig b/configs/qemu_sh4eb_r2d_defconfig
index 083c25ddb8..b375f3a3c9 100644
--- a/configs/qemu_sh4eb_r2d_defconfig
+++ b/configs/qemu_sh4eb_r2d_defconfig
@@ -7,8 +7,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttySC1"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4eb-r2d/linux.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_sparc64_sun4u_defconfig b/configs/qemu_sparc64_sun4u_defconfig
index 2a6d28aa42..914cb437da 100644
--- a/configs/qemu_sparc64_sun4u_defconfig
+++ b/configs/qemu_sparc64_sun4u_defconfig
@@ -6,8 +6,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc64-sun4u/linux.config"
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
index fb039e5523..98ab0fcfc7 100644
--- a/configs/qemu_sparc_ss10_defconfig
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -6,8 +6,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc-ss10/linux.config"
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
index ccaac0d0b9..86c833ddd6 100644
--- a/configs/qemu_x86_64_defconfig
+++ b/configs/qemu_x86_64_defconfig
@@ -7,8 +7,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/qemu/x86_64/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
 BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
diff --git a/configs/qemu_x86_64_efi_defconfig b/configs/qemu_x86_64_efi_defconfig
index 60790857b5..54a93d0ce3 100644
--- a/configs/qemu_x86_64_efi_defconfig
+++ b/configs/qemu_x86_64_efi_defconfig
@@ -9,8 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/qemu/x86_64-efi/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh board/qemu/x86_64-efi/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64-efi/linux.config"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index 21e3d7657e..fbf0aea4fd 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -7,8 +7,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/qemu/x86/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux.config"
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_lx60_defconfig
index a84395a344..a1e3537587 100644
--- a/configs/qemu_xtensa_lx60_defconfig
+++ b/configs/qemu_xtensa_lx60_defconfig
@@ -9,8 +9,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
diff --git a/configs/qemu_xtensa_lx60_nommu_defconfig b/configs/qemu_xtensa_lx60_nommu_defconfig
index a937112a9e..152aeb35c2 100644
--- a/configs/qemu_xtensa_lx60_nommu_defconfig
+++ b/configs/qemu_xtensa_lx60_nommu_defconfig
@@ -10,8 +10,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-nommu.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
diff --git a/configs/roc_pc_rk3399_defconfig b/configs/roc_pc_rk3399_defconfig
index c5c6771bdf..7ad5b386f4 100644
--- a/configs/roc_pc_rk3399_defconfig
+++ b/configs/roc_pc_rk3399_defconfig
@@ -9,8 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/firefly/roc-rk3399-pc/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/firefly/roc-rk3399-pc/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.18"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3399-roc-pc"
diff --git a/configs/rock4se_defconfig b/configs/rock4se_defconfig
index c4e13f6a39..521a4f8779 100644
--- a/configs/rock4se_defconfig
+++ b/configs/rock4se_defconfig
@@ -11,8 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/radxa/rock4se/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/radxa/rock4se/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.8"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3399-rock-4se"
diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
index bef12adaa4..737ef7bd6e 100644
--- a/configs/rock5b_defconfig
+++ b/configs/rock5b_defconfig
@@ -11,8 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/radxa/rock5b/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/radxa/rock5b/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.4"
+BR2_LINUX_KERNEL_LATEST_6_12=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/radxa/rock5b/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/rockpro64_defconfig b/configs/rockpro64_defconfig
index c31365ca6b..31a4ff74fe 100644
--- a/configs/rockpro64_defconfig
+++ b/configs/rockpro64_defconfig
@@ -11,8 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/pine64/rockpro64/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pine64/rockpro64/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.4"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/pine64/rockpro64/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/rockpro64_ebbr_defconfig b/configs/rockpro64_ebbr_defconfig
index 0a8fc46e58..4e0f0a359f 100644
--- a/configs/rockpro64_ebbr_defconfig
+++ b/configs/rockpro64_ebbr_defconfig
@@ -10,8 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/pine64/rockpro64-ebbr/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pine64/rockpro64-ebbr/post-image.sh support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pine64/rockpro64-ebbr/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.4"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/pine64/rockpro64-ebbr/linux.fragment"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
diff --git a/configs/sipeed_licheepi_4a_defconfig b/configs/sipeed_licheepi_4a_defconfig
index c7867ed05d..7f6f5e4c35 100644
--- a/configs/sipeed_licheepi_4a_defconfig
+++ b/configs/sipeed_licheepi_4a_defconfig
@@ -10,8 +10,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/sipeed/licheepi_4a/post-image.sh"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.18"
+BR2_LINUX_KERNEL_LATEST_6_12=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="thead/th1520-lichee-pi-4a"
diff --git a/configs/sipeed_licheepi_zero_defconfig b/configs/sipeed_licheepi_zero_defconfig
index 0c60a5c763..b374711898 100644
--- a/configs/sipeed_licheepi_zero_defconfig
+++ b/configs/sipeed_licheepi_zero_defconfig
@@ -13,8 +13,7 @@ BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/sipeed/licheepi_zero/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.43"
+BR2_LINUX_KERNEL_LATEST_6_12=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun8i-v3s-licheepi-zero allwinner/sun8i-v3s-licheepi-zero-dock"
diff --git a/configs/solidrun_clearfog_defconfig b/configs/solidrun_clearfog_defconfig
index 32fbb930bf..8cc6101f5e 100644
--- a/configs/solidrun_clearfog_defconfig
+++ b/configs/solidrun_clearfog_defconfig
@@ -10,8 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/solidrun/clearfog/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/solidrun/clearfog/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.43"
+BR2_LINUX_KERNEL_LATEST_6_6=y
 BR2_LINUX_KERNEL_DEFCONFIG="mvebu_v7"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/solidrun/clearfog/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/solidrun_clearfog_gt_8k_defconfig b/configs/solidrun_clearfog_gt_8k_defconfig
index 4187f68c2b..f15764dbb6 100644
--- a/configs/solidrun_clearfog_gt_8k_defconfig
+++ b/configs/solidrun_clearfog_gt_8k_defconfig
@@ -7,8 +7,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/solidrun/clearfog_gt_8k/post-build-mainline.
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/solidrun/clearfog_gt_8k/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.5"
+BR2_LINUX_KERNEL_LATEST_5_10=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/solidrun/clearfog_gt_8k/linux-extras.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/solidrun_macchiatobin_defconfig b/configs/solidrun_macchiatobin_defconfig
index ed511bda99..d1c03f4ebc 100644
--- a/configs/solidrun_macchiatobin_defconfig
+++ b/configs/solidrun_macchiatobin_defconfig
@@ -6,8 +6,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/solidrun/macchiatobin/post-build-mainline.sh
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/solidrun/macchiatobin/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.5"
+BR2_LINUX_KERNEL_LATEST_5_10=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/solidrun/macchiatobin/linux-extras.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/spike_riscv32_defconfig b/configs/spike_riscv32_defconfig
index a73f335f34..1429a880ab 100644
--- a/configs/spike_riscv32_defconfig
+++ b/configs/spike_riscv32_defconfig
@@ -4,8 +4,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_GLOBAL_PATCH_DIR="board/spike/riscv32/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.35"
+BR2_LINUX_KERNEL_LATEST_6_6=y
 BR2_LINUX_KERNEL_DEFCONFIG="rv32"
 BR2_TARGET_ROOTFS_CPIO=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/spike_riscv64_defconfig b/configs/spike_riscv64_defconfig
index 7b698737e2..5c44b3d3a2 100644
--- a/configs/spike_riscv64_defconfig
+++ b/configs/spike_riscv64_defconfig
@@ -3,8 +3,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_GLOBAL_PATCH_DIR="board/spike/riscv64/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.35"
+BR2_LINUX_KERNEL_LATEST_6_6=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_TARGET_ROOTFS_CPIO=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/stm32f429_disco_xip_defconfig b/configs/stm32f429_disco_xip_defconfig
index 40577a21a5..b1aa193c60 100644
--- a/configs/stm32f429_disco_xip_defconfig
+++ b/configs/stm32f429_disco_xip_defconfig
@@ -7,8 +7,7 @@ BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f429-disco/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.177"
+BR2_LINUX_KERNEL_LATEST_6_1=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f429-disco/linux.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
diff --git a/configs/stm32f469_disco_sd_defconfig b/configs/stm32f469_disco_sd_defconfig
index 70a214a108..b5132bf396 100644
--- a/configs/stm32f469_disco_sd_defconfig
+++ b/configs/stm32f469_disco_sd_defconfig
@@ -7,8 +7,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-po
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f469-disco/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.211"
+BR2_LINUX_KERNEL_LATEST_5_15=y
 BR2_LINUX_KERNEL_DEFCONFIG="stm32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0x00000000.config board/stmicroelectronics/stm32f469-disco/linux-sd.fragment"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
diff --git a/configs/stm32f469_disco_xip_defconfig b/configs/stm32f469_disco_xip_defconfig
index 578cecadbe..727b1c1767 100644
--- a/configs/stm32f469_disco_xip_defconfig
+++ b/configs/stm32f469_disco_xip_defconfig
@@ -7,8 +7,7 @@ BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f469-disco/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.211"
+BR2_LINUX_KERNEL_LATEST_5_15=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f469-disco/linux-xip.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
diff --git a/configs/stm32f746_disco_sd_defconfig b/configs/stm32f746_disco_sd_defconfig
index e0c257787a..9625625c0b 100644
--- a/configs/stm32f746_disco_sd_defconfig
+++ b/configs/stm32f746_disco_sd_defconfig
@@ -9,8 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/stm32f746-disco/post-buil
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f746-disco/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.211"
+BR2_LINUX_KERNEL_LATEST_5_15=y
 BR2_LINUX_KERNEL_DEFCONFIG="stm32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/stm32f746-disco/linux.fragment"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
diff --git a/configs/stm32f769_disco_sd_defconfig b/configs/stm32f769_disco_sd_defconfig
index a025bd7802..1a401b69bc 100644
--- a/configs/stm32f769_disco_sd_defconfig
+++ b/configs/stm32f769_disco_sd_defconfig
@@ -7,8 +7,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/stm32f769-disco/post-buil
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f769-disco/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.211"
+BR2_LINUX_KERNEL_LATEST_5_15=y
 BR2_LINUX_KERNEL_DEFCONFIG="stm32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0xc0000000.config board/stmicroelectronics/stm32f769-disco/linux-sd.fragment"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
diff --git a/configs/stm32h747_disco_sd_defconfig b/configs/stm32h747_disco_sd_defconfig
index cd882aa5ac..2c871bce19 100644
--- a/configs/stm32h747_disco_sd_defconfig
+++ b/configs/stm32h747_disco_sd_defconfig
@@ -8,8 +8,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/stm32h747-disco/post-buil
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32h747-disco/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.39"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_DEFCONFIG="stm32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0xd0000000.config board/stmicroelectronics/stm32h747-disco/linux-sd.fragment"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
diff --git a/configs/stm32mp135f_dk_defconfig b/configs/stm32mp135f_dk_defconfig
index bd1c6ca00a..988683a153 100644
--- a/configs/stm32mp135f_dk_defconfig
+++ b/configs/stm32mp135f_dk_defconfig
@@ -9,8 +9,7 @@ BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp135f-dk/overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp1xx/post-image.sh"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.95"
+BR2_LINUX_KERNEL_LATEST_6_12=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp135f-dk/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/stm32mp157a_dk1_defconfig b/configs/stm32mp157a_dk1_defconfig
index 7f4143fa32..4c417db9b2 100644
--- a/configs/stm32mp157a_dk1_defconfig
+++ b/configs/stm32mp157a_dk1_defconfig
@@ -8,8 +8,7 @@ BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157a-dk1/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp1xx/post-image.sh"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.95"
+BR2_LINUX_KERNEL_LATEST_6_12=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157a-dk1/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_defconfig
index 10638f2260..7e3165209c 100644
--- a/configs/stm32mp157c_dk2_defconfig
+++ b/configs/stm32mp157c_dk2_defconfig
@@ -8,8 +8,7 @@ BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157c-dk2/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp1xx/post-image.sh"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.95"
+BR2_LINUX_KERNEL_LATEST_6_12=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157c-dk2/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/stm32mp157c_odyssey_defconfig b/configs/stm32mp157c_odyssey_defconfig
index 5cab460ab7..6ad9cf7baf 100644
--- a/configs/stm32mp157c_odyssey_defconfig
+++ b/configs/stm32mp157c_odyssey_defconfig
@@ -6,8 +6,7 @@ BR2_ROOTFS_OVERLAY="board/seeed/stm32mp157c-odyssey/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/seeed/stm32mp157c-odyssey/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.1"
+BR2_LINUX_KERNEL_LATEST_5_10=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/seeed/stm32mp157c-odyssey/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index ddabba238f..fc6977419b 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -9,8 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am625-sk.dtb -l am62x-sk-buildroot -r /dev/mmcblk1p2 -x earlycon=ns16550a,mmio32,0x02800000"
 BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/ti/am62x-sk/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.95"
+BR2_LINUX_KERNEL_LATEST_6_12=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am625-sk"
diff --git a/configs/ti_tda4vm_sk_defconfig b/configs/ti_tda4vm_sk_defconfig
index be2529fb37..4123c98f08 100644
--- a/configs/ti_tda4vm_sk_defconfig
+++ b/configs/ti_tda4vm_sk_defconfig
@@ -10,8 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/tda4vm-sk/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/ti/tda4vm-sk/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.16"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-j721e-sk"
diff --git a/configs/visionfive2_defconfig b/configs/visionfive2_defconfig
index 7ce605b84b..abf723e3e8 100644
--- a/configs/visionfive2_defconfig
+++ b/configs/visionfive2_defconfig
@@ -6,8 +6,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_OVERLAY="board/visionfive2/overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/visionfive2/post-image.sh"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.51"
+BR2_LINUX_KERNEL_LATEST_6_18=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/visionfive2/linux_defconfig"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/wandboard_defconfig b/configs/wandboard_defconfig
index 1bd00c5780..33361a0928 100644
--- a/configs/wandboard_defconfig
+++ b/configs/wandboard_defconfig
@@ -8,8 +8,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_OVERLAY="board/wandboard/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.47"
+BR2_LINUX_KERNEL_LATEST_6_6=y
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6q-wandboard nxp/imx/imx6dl-wandboard nxp/imx/imx6q-wandboard-revb1 nxp/imx/imx6dl-wandboard-revb1 nxp/imx/imx6q-wandboard-revd1 nxp/imx/imx6dl-wandboard-revd1 nxp/imx/imx6qp-wandboard-revd1"
diff --git a/configs/warp7_defconfig b/configs/warp7_defconfig
index 5fec15d4ba..8769ad3eda 100644
--- a/configs/warp7_defconfig
+++ b/configs/warp7_defconfig
@@ -7,8 +7,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_OVERLAY="board/warp7/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.24"
+BR2_LINUX_KERNEL_LATEST_6_12=y
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx7s-warp"
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
