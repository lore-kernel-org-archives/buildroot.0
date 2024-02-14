Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B0DC48BEB
	for <buildroot@archiver.kernel.org>; Wed, 14 Feb 2024 23:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 002F140816;
	Wed, 14 Feb 2024 23:03:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UxfRqRxWA4Uf; Wed, 14 Feb 2024 23:03:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F027D4081B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F027D4081B;
	Wed, 14 Feb 2024 23:03:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 17CA21BF57B
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 23:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 047D74081B
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 23:03:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3JfQ89Sjd9v9 for <buildroot@lists.busybox.net>;
 Wed, 14 Feb 2024 23:03:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::216; helo=shout01.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E2A6540816
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2A6540816
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E2A6540816
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 23:03:12 +0000 (UTC)
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout01.mail.de (Postfix) with ESMTP id 01B9724113B;
 Thu, 15 Feb 2024 00:03:11 +0100 (CET)
Received: from smtp01.mail.de (smtp02.bt.mail.de [10.0.121.212])
 by postfix01.mail.de (Postfix) with ESMTP id D7BC4801CB;
 Thu, 15 Feb 2024 00:03:10 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 9C7A0240A1B;
 Thu, 15 Feb 2024 00:03:09 +0100 (CET)
To: Kilian Zinnecker <kilian.zinnecker@mail.de>, buildroot@buildroot.org
Date: Thu, 15 Feb 2024 00:03:08 +0100
Message-ID: <4868466.GXAFRqVoOG@laptop>
In-Reply-To: <bf30e91f-1061-4aab-8670-c1ef9f7d895d@benettiengineering.com>
References: <20240211120857.6622-1-kilian.zinnecker@mail.de>
 <20240211120857.6622-3-kilian.zinnecker@mail.de>
 <bf30e91f-1061-4aab-8670-c1ef9f7d895d@benettiengineering.com>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 3096
X-purgate-ID: 154282::1707951790-19D2D878-9D5E7C5D/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1707951790;
 bh=2qgp+EOcWID4I4TALQ+ZRzHnwVBxWA78UORVxK55DsE=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=GTgU56kL9Z3DvPS9uaYYqolHl4PNBS44QgB6U4kioYWgwJ2Ot5pg1IygZIwVLddQj
 6VLHCt3h4rz6mO+YVT3H0yK84OWstrNVrgxFxCQeWeFt4EqDshT6sw+9lFIrE162d5
 b70LRH5SpTrTpSq74XDDMocus49VhqtT1GEvliuXSXAhLrvYFrFCXJ7XkoyWUReVIL
 68ZHVTHvMGE6V/LFUPiuKh1uoquqVipn2gnRkbaOE9Upsod2WJaMNNNJFzLpv6AC9z
 rWcmlcpLliJtYgd7uY+ELW78rAL8VbKuVJ5CX+wDnsLWdxfdFigBQzoOXV5vyEp5fK
 VnHPBQeXhYHFA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=GTgU56kL
Subject: Re: [Buildroot] [PATCH v3 2/2] configs/beaglev_ahead: new defconfig
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
From: "kilian.zinnecker--- via buildroot" <buildroot@buildroot.org>
Reply-To: kilian.zinnecker@mail.de
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Robert Nelson <robertcnelson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Giulio, all,

[--SNIP--]

> > a/board/beaglev-ahead/patches/uboot/0001-Overwrite-bootcmd-by-force.patch
> > b/board/beaglev-ahead/patches/uboot/0001-Overwrite-bootcmd-by-force.patch
> > new file mode 100644
> > index 0000000000..bcf5b965ce
> > --- /dev/null
> > +++
> > b/board/beaglev-ahead/patches/uboot/0001-Overwrite-bootcmd-by-force.patch
> > @@ -0,0 +1,30 @@
> > +From 81db2d155db74192e127ae1d98dd4ec415f53dd3 Mon Sep 17 00:00:00 2001
> > +From: Kilian Zinnecker <kilian.zinnecker@mail.de>
> > +Date: Mon, 21 Aug 2023 23:51:59 +0200
> > +Subject: [PATCH] Overwrite bootcmd by force
> > +
> > +This patch is a dirty hack: Trying to overwrite the bootcmd via the
> > +usual BOOT_COMMAND had no effect: Upon boot the bootcmd defaulted
> > +to some preset value and could not be changed easily. Therefore a
> > +hook is used to force the bootcmd to be overwritten.
> 
> This is strange because if so also the bootcmd content of uEnv.txt below
> should be skipped, or maybe there is a bug in this u-boot that evaluates
> bootcmd too early without taking into account environment variables.
> But I'm also noticing that you have your Environment variables in Fat,
> but it depends how u-boot deals with environment variables. Usually
> you have to specificy an offset in memory where environment variables
> live.
> 
> But I see in your "make uboot-menuconfig" that CONFIG_ENV_IS_IN_FAT is
> not enabled, but only CONFIG_ENV_IS_IN_MMC is and you have to specify:
> CONFIG_ENV_OFFSET
> CONFIG_ENV_SIZE
> 
> So if you want to go with vfat way you need to enable
> CONFIG_ENV_IS_IN_FAT and specify:
> CONFIG_ENV_FAT_INTERFACE
> CONFIG_ENV_FAT_DEVICE_AND_PART
> and most of all:
> CONFIG_ENV_FAT_FILE=uEnv.txt
> in uboot.fragment below
> 
> I would go with this last way instead of adding such dirty hack, can you
> work on that?

I tried, but so far I am not successful, maybe due to my lack of experience 
with uboot or maybe due to the customization of this particular uboot. I 
removed my custom-uboot patch and added the following configs to the 
uboot.fragment file, but it did not work yet:

# CONFIG_ENV_IS_IN_MMC is not set
CONFIG_ENV_IS_IN_FAT=y
CONFIG_ENV_FAT_INTERFACE="mmc"
CONFIG_ENV_FAT_DEVICE_AND_PART="1:1"
CONFIG_ENV_FAT_FILE="uEnv.txt"

I also tried to use mainline uboot v2024.01, which features the Lichee Pi 4A, 
which features the same SoC, but this didn't work either. I had a look at the 
custom uboot source and it defines a lot of configs inside this header file:

https://openbeagle.org/beaglev-ahead/beaglev-ahead-u-boot/-/blob/beaglev-v2020.01-1.1.2-ubuntu/include/configs/light-c910.h?ref_type=heads#L363-388

I tried to remove the hard-coded bootcmd from this header, but that also 
didn't work. I don't understand the inner workings of uboot well enough yet to 
get it properly working, so I appreciate all hints and any help here.

However, I will already send a v4 of the patches, in which I try to address 
all the other issues.

Thanks again for reviewing and best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
