Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D40C433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Feb 2022 17:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14053814B7;
	Mon,  7 Feb 2022 17:36:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DVyWT-8MDiwM; Mon,  7 Feb 2022 17:36:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B31D81499;
	Mon,  7 Feb 2022 17:36:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5AEE41BF29C
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 17:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 497764033D
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 17:36:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TkB72Sj0SdPR for <buildroot@lists.busybox.net>;
 Mon,  7 Feb 2022 17:36:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6758540331
 for <buildroot@buildroot.org>; Mon,  7 Feb 2022 17:36:24 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id H7w6nEPtnvHpTH7w6nIoGf; Mon, 07 Feb 2022 18:36:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644255382; bh=coroOWktZfl3kpOGRMealNwXUjcaWPwmjyJftqFjZao=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=WX8xQkMMdLcY9eqDTOFhF6wkzHLgMLuEkC710sDzaCRoXHxZhIS+jYUP8fzQiagJf
 OfJT0TAAmjwKKEHeYcMUAK70LgWSVvEik6IDqzE6ZClT+hJz/NnbROgz1ILsbs4JeX
 BLgCZH41wAbbQ3eVupRh6ABqj3uGZAKAy50mBwqKZjOLRmSM8h5yoJiErc5vUrDAsB
 Hi+1Jk7PBuPEDBoIOrmsralLvWCEeH72Ccy9ckRiekRYFSl6ASDJQI5A9yCDPxGPqu
 LcrbYVXoASDxiUku3IOV88ujRCBRu7gIzvlN0oKYWr2YjYZkenY8yXfSHU1wOsYkF5
 qc54pGIIDd5AA==
Message-ID: <d2319e17-8500-f9af-56a4-1b4efe75fe9a@benettiengineering.com>
Date: Mon, 7 Feb 2022 18:36:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Neal Frager <nealf@xilinx.com>, Luca Ceresoli <luca@lucaceresoli.net>
References: <SJ0PR02MB7758F655ACB4D148D78E403BD72B9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <0a82d8c7-a0c6-06a5-6a0b-788fd5c4a935@benettiengineering.com>
 <8be136a0-1263-3b17-0b78-b7d34ef146c2@lucaceresoli.net>
 <SJ0PR02MB775843B513EA2CAFD0FEBD82D72C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <032d657b-eb9a-2dc9-f60b-8536f1fc6c57@lucaceresoli.net>
 <SJ0PR02MB7758A5DBC6DD4DA837E0F47FD72C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <SJ0PR02MB7758129FFD78D128D3393198D72C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <16f4b7bf-546b-3bf4-c6a3-b711c8cfcadb@lucaceresoli.net>
 <SJ0PR02MB77586A616AEE69FE18916F15D72C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <fb6fd9dc-7619-5768-a1b4-00324516b4d4@benettiengineering.com>
 <SJ0PR02MB7758884FD57FC4A53E3585EFD72C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <SJ0PR02MB7758884FD57FC4A53E3585EFD72C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
X-CMAE-Envelope: MS4wfPM2wp5xvdMy9Rr6otohIjMdUUV+rsEh0BMc4nkXGlFrI7ENR9M+zU1XeFixVGinEVy7vT/OLR0LXXV4/og3gZFSiUyaaxOM6cnZ/0wi9LqYrv/W3SPK
 SwWU4GG1rB4R02dnglaKMJDaiIrDwZDtyqu2qnBJBgLG4Hhz7tYhWdWgV/tit9AVshS3VAbNsTiIZB/MPBiTX6YEHTOWs5H3Y6BVzg8J1nieexcd6XXmu95Y
 v1O1Z0B0szAM4eKgOGwzPejRjksbf/Kv3JUWtXguPCE=
Subject: Re: [Buildroot] Xilinx zynqmp_zcu10x_defconfigs: two things left
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On 07/02/22 18:26, Neal Frager wrote:
> Hi Giulio,
> 
>> In the boards I've pointed you before:
>> https://github.com/buildroot/buildroot/tree/master/board/orangepi/orangepi-lite2
> 
>> there is everythyng you need, the post-build script:
>> https://github.com/buildroot/buildroot/blob/master/board/orangepi/orangepi-lite2/post-build.sh
>> that copies the extlinux.conf.
> 
>> And as explained before you have to point to it like this:
>> https://github.com/buildroot/buildroot/blob/master/configs/orangepi_lite2_defconfig#L48
> 
>> For creating the VFAT you can imitate this genimage.cfg file:
>> https://github.com/buildroot/buildroot/blob/master/board/orangepi/orangepi-lite2/genimage.cfg#L1-L11
> 
>> that must be pointed by:
>> https://github.com/buildroot/buildroot/blob/master/configs/orangepi_lite2_defconfig#L46-L47
> 
> Yes, the problem is that these steps put the extlinux.conf in the root directory of the vfat image, which does not work.  U-Boot only looks for the extlinux.conf in the extlinux.conf directory.  So what I was missing was figuring out how to build a vfat image with my extlinux.conf in the extlinux directory.  I finally figured it out with the following genimage.cfg.

Aah ok.
Usually /extlinux/extlinux.conf is found in ext4 /boot/ but it's ok even 
in vfat.

> 
> image boot.vfat {
> 	vfat {
> 		files = {
> 			"boot.bin",
> 			"u-boot.itb",
> 			"system.dtb",
> 			"Image"
> 		}
> 		file extlinux/extlinux.conf {
> 			image = extlinux.conf
> 		}
> 	}
> 
> 	size = 32M
> }
> 
> image sdcard.img {
> 	hdimage {
> 	}
> 
> 	partition boot {
> 		partition-type = 0xC
> 		bootable = "true"
> 		image = "boot.vfat"
> 	}
> 
> 	partition rootfs {
> 		partition-type = 0x83
> 		image = "rootfs.ext4"
> 	}
> }
> 
> Thanks for your help!
You're welcome

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
