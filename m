Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19987C4345F
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 08:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C48EF40714;
	Mon,  6 May 2024 08:48:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PsruIzJT4FeL; Mon,  6 May 2024 08:48:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 280F240664
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 280F240664;
	Mon,  6 May 2024 08:48:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 251B21BF38A
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 08:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19CB240664
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 08:48:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U_O2PSXCLqCb for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 08:48:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.141;
 helo=fllv0015.ext.ti.com; envelope-from=dannenberg@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5906F405FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5906F405FF
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5906F405FF
 for <buildroot@buildroot.org>; Mon,  6 May 2024 08:48:04 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4468m3eg111145;
 Mon, 6 May 2024 03:48:03 -0500
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4468m3bH013755
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 6 May 2024 03:48:03 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 6
 May 2024 03:48:03 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 6 May 2024 03:48:03 -0500
Received: from dasso (dasso.dhcp.ti.com [128.247.79.182])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4468m3Ja046632;
 Mon, 6 May 2024 03:48:03 -0500
Date: Mon, 6 May 2024 03:48:03 -0500
To: Bryan Brattlof <bb@ti.com>
Message-ID: <20240506084803.fptbvohnqawmz7fd@dasso>
References: <20240430-optee-update-v2-0-5bdc2f940db1@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240430-optee-update-v2-0-5bdc2f940db1@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1714985283;
 bh=ykNC9vvmqFSVtqDJg9FtrvdaPKCeItvB1imwpO4mUs0=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=JPk/VkhCJpb2WooJE0z9tl7LIkU/j4CjZ3kVscWtQQxcuNkWQoISq+OtwbjBTLEeu
 RjmZh3jBmuiYRXorElBNiekry0eli30h4NvoCIvsB+XVYqKYWLo+GS5IqAc79mcN9K
 oSoblE01bN6j84wmQkxUcW+jJNrrTdIYpxlqb9kE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=JPk/VkhC
Subject: Re: [Buildroot] [PATCH RESEND v2 00/11] update bsp binaries for TI
 SoCs
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
Cc: Xuanhao Shi <X15000177@gmail.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@smile.fr>, Heiko Thiery <heiko.thiery@gmail.com>,
 Etienne Carriere <etienne.carriere@foss.st.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bryan,

On Thu, May 02, 2024 at 11:26:50AM -0500, Bryan Brattlof wrote:
> Hello everyone!
> 
> My apologies to everyone I just spammed with the first v2. I dropped the 
> mailing list (still setting up my b4 configs) :/
> 
> This series updates all the boot binaries (U-Boot, OP-TEE, TF-A, and 
> Linux) to their latest versions to pull in all bug fixes and new 
> features additions in these projects.
> 
> This also includes a patch I send out a while ago just to keep things 
> organized. 
> 
>   https://lore.kernel.org/buildroot/20240402153328.1859642-1-bb@ti.com/
> 
> and finally some proof I didn't completely break something ;)
> 
>   https://paste.sr.ht/~bryanb/b666adef7da412de76efb5e4a68e68e0651f7928

I tested the series applied on top of today's HEAD commit...

66ebbebdb4 ("package/stress-ng: fix uclibc-ng build")

...and was able to boot successfully on both SK-AM62B and SK-AM64B EVMs
(for record, both are HS-FS production-silicon EVMs). U-Boot, Kernel,
ATF, OP-TEE, and TIFS/DM FW versions are all as advertised. I also
tested networking to make sure it works. Boot logs look clean, except
the TISCK clock related issues that are also visible in the log you
shared...

<snip>
[    2.673148] ti-sci-clk 44043000.system-controller:clock-controller: is_prepared failed for dev=40, clk=9, ret=-19
[    2.683736] ti-sci-clk 44043000.system-controller:clock-controller: is_prepared failed for dev=39, clk=18, ret=-19
[    2.694116] ti-sci-clk 44043000.system-controller:clock-controller: is_prepared failed for dev=39, clk=17, ret=-19
[    2.704494] ti-sci-clk 44043000.system-controller:clock-controller: is_prepared failed for dev=39, clk=16, ret=-19
<snip>

As per earlier discussion I know it needs a patch [1] that's not yet available
in the Kernel tree we are using. But I think it would be nice if we could add
this a patch, this would help to clean up the boot logs qute a bit. A lot of
"failed" messages will be concerning to users.

For the series:

Tested-by: Andreas Dannenberg <dannenberg@ti.com>

[1] https://github.com/torvalds/linux/commit/ad3ac13c6ec318b43e769cc9ffde67528e58e555

> 
> Thanks for reviewing
> ~Bryan
> 
> Signed-off-by: Bryan Brattlof <bb@ti.com>
> ---
> Changes in v2:
> - most emails never made it to the mailing list
> - updated commit messages to be more explicit about versions picked
> - Link to v1: https://lore.kernel.org/r/20240430-optee-update-v1-0-6f73c4903ec3@ti.com
> 
> ---
> Bryan Brattlof (11):
>       boot/optee-os: bump to release v4.2.0
>       boot/uboot: bump to version v2024.04
>       boot/ti-k3-r5-loader: bump to version v2024.04
>       boot/ti-k3-boot-firmware: bump to version 09.02.00.009
>       configs/ti_am62x_sk_defconfig: update TFA to v2.10
>       configs/ti_am64x_sk_defconfig: update TFA to v2.10
>       configs/ti_am62x_sk_defconfig: update U-Boot to v2024.04
>       configs/ti_am64x_sk_defconfig: update U-Boot to v2024.04
>       configs/ti_am62x_sk_defconfig: bump kernel to v6.8.8
>       configs/ti_am64x_sk_defconfig: update kernel to v6.8.8
>       DEVELOPERS: add myself to TI's packages and reference boards
> 
>  DEVELOPERS                                                       | 7 +++++++
>  .../patches/arm-trusted-firmware/arm-trusted-firmware.hash       | 2 +-
>  board/ti/am62x-sk/patches/linux/linux.hash                       | 2 +-
>  .../patches/arm-trusted-firmware/arm-trusted-firmware.hash       | 2 +-
>  board/ti/am64x-sk/patches/linux/linux.hash                       | 2 +-
>  boot/optee-os/Config.in                                          | 4 ++--
>  boot/optee-os/optee-os.hash                                      | 4 ++--
>  boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash                | 2 +-
>  boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk                  | 4 +---
>  boot/ti-k3-r5-loader/Config.in                                   | 4 ++--
>  boot/ti-k3-r5-loader/ti-k3-r5-loader.hash                        | 2 +-
>  boot/ti-k3-r5-loader/ti-k3-r5-loader.mk                          | 1 +
>  boot/uboot/Config.in                                             | 6 +++---
>  boot/uboot/uboot.hash                                            | 2 +-
>  configs/ti_am62x_sk_defconfig                                    | 9 ++++-----
>  configs/ti_am64x_sk_defconfig                                    | 9 ++++-----
>  16 files changed, 33 insertions(+), 29 deletions(-)
> ---
> base-commit: 929bffbf4bf8fcb91bda446777f907f32c782656
> change-id: 20240430-optee-update-b9c1bc4e9f29
> 
> Best regards,
> -- 
> Bryan Brattlof <bb@ti.com>
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
