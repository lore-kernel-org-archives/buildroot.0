Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F23CD11C2
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 10:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 793306082D;
	Wed, 10 Apr 2024 10:50:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3cG651Fg-mSX; Wed, 10 Apr 2024 10:50:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47E146083D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47E146083D;
	Wed, 10 Apr 2024 10:50:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ACBA31BF315
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 10:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99B79404A6
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 10:50:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kctIcY1DqlWX for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 10:50:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.249;
 helo=lelv0142.ext.ti.com; envelope-from=dannenberg@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 322F24015F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 322F24015F
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 322F24015F
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 10:50:36 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43AAoaNn076175;
 Wed, 10 Apr 2024 05:50:36 -0500
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43AAoaFe114209
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 10 Apr 2024 05:50:36 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 10
 Apr 2024 05:50:35 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 10 Apr 2024 05:50:35 -0500
Received: from dasso (dasso.dhcp.ti.com [128.247.79.182])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43AAoZRh119638;
 Wed, 10 Apr 2024 05:50:35 -0500
Date: Wed, 10 Apr 2024 05:50:35 -0500
To: Bryan Brattlof <bb@ti.com>
Message-ID: <20240410105035.phl3xamt7bdb3jhk@dasso>
References: <20240402153328.1859642-1-bb@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240402153328.1859642-1-bb@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1712746236;
 bh=wvgmEmNR0a+NSexetQWmgkVKcnxE3IxUKEyY6RSMSn8=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=K2Z9h/QJbWdLVBlJLggSpnt1JeJxIveSGLigOBPkhDjhSaT13Uha2vMoiRcQCwIy2
 Rx3akM4u/zTXuMVA6Vg84wgfLsNEwUHLUx0jYngJiCMeLiKl4IlHJa8KBz7ZP68PWZ
 tUy63ATBmEINlm4Iha7YPDpusyzIIPLhb+pMgKro=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=K2Z9h/QJ
Subject: Re: [Buildroot] [PATCH] boot/ti-k3-boot-firmware: bump to latest
 version
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
From: Andreas Dannenberg via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Dannenberg <dannenberg@ti.com>
Cc: Xuanhao Shi <X15000177@gmail.com>, Anand Gadiyar <gadiyar@ti.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bryan, All,

On Tue, Apr 02, 2024 at 10:33:28AM -0500, Bryan Brattlof via buildroot wrote:
> The 09.02.00.009 release of ti-linux-firmware has the latest updates to
> TI's TIFS, DM and DMSC firmware needed for the K3 generation of
> processors. Update to pull in these latest updates.
> 
> Signed-off-by: Bryan Brattlof <bb@ti.com>

I just tested this patch to enable latest TIFS/SYSFW device firmwares on
top of....

d01e13c4d4 ("package/python3: fix cross builds when host and target use the same SOABI")

...and can confirm the following 4 platforms booted without any serious
issues(*) in both U-Boot and Linux Kernel.

1) SK-AM62 (with GP silicon)
2) SK-AM62B (production board, with HS-FS silicon) 
3) SK-AM64 (with GP silicon)
4) SK-AM62B (production board, with HS-FS silicon) 

With this...

Tested-by: Andreas Dannenberg <dannenberg@ti.com>


(*) I did see some extra Kernel warnings related to what Bryan pointed
to on this thread on AM62 GP. I wouldn't care about too much except that
is the device BeaglePlay is using. So something to keep an eye out for
to fix when adding BeaglePlay support to Buildroot. These warnings where
NOT there when booting AM62 GP with TIFS/SYSFW v8.6, I just went back to
my earlier log to confirm.

<snip>
[    2.447524] ti-sci-clk 44043000.system-controller:clock-controller: is_prepared failed for dev=40, clk=9, ret=-19
[    2.474423] ti-sci-clk 44043000.system-controller:clock-controller: is_prepared failed for dev=39, clk=18, ret=-19
[    2.484806] ti-sci-clk 44043000.system-controller:clock-controller: is_prepared failed for dev=39, clk=17, ret=-19
[    2.495185] ti-sci-clk 44043000.system-controller:clock-controller: is_prepared failed for dev=39, clk=16, ret=-19
[    2.505570] ti-sci-clk 44043000.system-controller:clock-controller: is_prepared failed for dev=39, clk=15, ret=-19
[    2.516161] ti-sci-clk 44043000.system-controller:clock-controller: is_prepared failed for dev=39, clk=9, ret=-19
[    2.526765] ti-sci-clk 44043000.system-controller:clock-controller: is_prepared failed for dev=38, clk=18, ret=-19
[    2.537148] ti-sci-clk 44043000.system-controller:clock-controller: is_prepared failed for dev=38, clk=17, ret=-19
<snip>


Also for reference, here are the three places in the boot log that show
the new FW version (9.2.7):

U-Boot SPL 2024.01 (Apr 10 2024 - 04:49:11 -0500)
SYSFW ABI: 3.1 (firmware rev 0x0009 '9.2.7--v09.02.07 (Kool Koala)')
<...snip...>
NOTICE:  BL31: v2.7(release):v2.7
NOTICE:  BL31: Built : 04:39:08, Apr 10 2024
I/TC:
I/TC: OP-TEE version: Unknown_4.0 (gcc version 12.3.0 (Buildroot 024.02-417-g2adb5a690c)) #1 Wed Apr 10 09:39:07 UTC 2024 aarch64
I/TC: WARNING: This OP-TEE configuration might be insecure!
I/TC: WARNING: Please check ttps://optee.readthedocs.io/en/latest/architecture/porting_guidelines.html
I/TC: Primary CPU initializing
I/TC: SYSFW ABI: 3.1 (firmware rev 0x0009 '9.2.7--v09.02.07 (Kool oala)')
<...snip...>
[    1.311403] ti-sci 44043000.system-controller: ABI: 3.1 (firmware rev 0x0009 '9.2.7--v09.02.07 (Kool Koala)')
<...snip...>
Welcome to Buildroot
buildroot login:


> ---
>  boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash | 2 +-
>  boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk   | 4 +---
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
> index 95131180ef400..2398d02da258a 100644
> --- a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
> +++ b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
>  sha256  ab20ffbe7bba7e94be246b3417d33a914b3f07c16c47ef5a7f7602349a666a61  LICENSE.ti
> -sha256  6032a258ce731d987576115f5de44c677a6b0cf8bddcd61a9a2852928bdfff92  ti-linux-firmware-08.06.00.006.tar.xz
> +sha256  ae888a0a22f8c5b8fe841236d6e40bb2f821d9a4161dab6924fd989e1467ef0e  ti-linux-firmware-09.02.00.009.tar.xz
> diff --git a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
> index 1f8ade207c13a..9332732ad4a32 100644
> --- a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
> +++ b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
> @@ -4,9 +4,7 @@
>  #
>  ################################################################################
>  
> -# The hash 340194800a581baf976360386dfc7b5acab8d948 defined in the
> -# Makefile of ti-k3-image-gen corresponds to the tag 08.06.00.006.
> -TI_K3_BOOT_FIRMWARE_VERSION = 08.06.00.006
> +TI_K3_BOOT_FIRMWARE_VERSION = 09.02.00.009
>  TI_K3_BOOT_FIRMWARE_SITE = https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/snapshot
>  TI_K3_BOOT_FIRMWARE_SOURCE = ti-linux-firmware-$(TI_K3_BOOT_FIRMWARE_VERSION).tar.xz
>  TI_K3_BOOT_FIRMWARE_INSTALL_IMAGES = YES
> 
> base-commit: d69e13b0e965961019b4aab38e187267af3cab78
> -- 
> 2.43.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
