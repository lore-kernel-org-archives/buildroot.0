Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B7C6CA0ED3
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 15:07:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1811980EB9;
	Mon,  2 Sep 2024 15:07:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VagHLoTGbo8X; Mon,  2 Sep 2024 15:07:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4344F80E97
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4344F80E97;
	Mon,  2 Sep 2024 15:07:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1E0A01BF292
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 15:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17A3E40208
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 15:07:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3fmCS485_dw7 for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 15:07:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=159.69.201.130;
 helo=mail.3ffe.de; envelope-from=michael@walle.cc; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 41277401FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41277401FD
Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 41277401FD
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 15:07:23 +0000 (UTC)
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.3ffe.de (Postfix) with ESMTPSA id 7DD836D;
 Mon,  2 Sep 2024 17:07:20 +0200 (CEST)
MIME-Version: 1.0
Date: Mon, 02 Sep 2024 17:07:20 +0200
To: Niklas Cassel <Niklas.Cassel@wdc.com>
In-Reply-To: <ZtWx2nqI0YTpwb-P@ryzen.lan>
References: <20240902112735.728574-1-michael@walle.cc>
 <ZtWx2nqI0YTpwb-P@ryzen.lan>
Message-ID: <feb35dcc410e1808d220a272ae6cdc96@walle.cc>
X-Sender: michael@walle.cc
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=walle.cc; s=mail2022082101; t=1725289640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N13ItO4c9rr9j5ZuLcvJ2/1TfY3y3pg2e3QsksgTLmo=;
 b=V5X+f0T+pcdX2SetEueRP48c0Niif17jPmmZl9+1ZwtlAv7SIM468w9V14INDTxHmjOkOd
 r0h+HOTSVLMcEOW0d5GlHBiWjHEj1Vkz6zoinQ7DBcT8vMETrrgW7WzWk9L6I1Wg2Q+p7O
 J3Rfog6ibwU86JD/MbIpp+U0T7JreRE7LoepbvVKelqWgI4Zc3sULH+/+U871tMAMxX0jX
 DNXKrCudOWGlBsZfcm7+elUKTxzJmPDFnL3p2Wu6jpvOGg4n2gCpfV5NoMSEBrtLs5oOoW
 6uol3TnoacGPWn4FnxGZAN7ciCGmh8LrIxjp+VEhAbBn9XjC1lXbVEJiy6Tctg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=walle.cc
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256
 header.s=mail2022082101 header.b=V5X+f0T+
Subject: Re: [Buildroot] [PATCH v2] linux: add support for device tree
 overlays
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
From: Michael Walle via buildroot <buildroot@buildroot.org>
Reply-To: Michael Walle <michael@walle.cc>
Cc: =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay@rtone.fr>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Damien Le Moal <dlemoal@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Martin Bark <martin@barkynet.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

>> The linux kernel can build device tree overlays (.dtbo) itself. Add
>> support to build and copy them along with the actual device trees.
>> These can either be in-tree device tree overlays
>> (BR2_LINUX_KERNEL_INTREE_DTSO_NAMES) or they can be provided outside 
>> of
>> the kernel (BR2_LINUX_KERNEL_CUSTOM_DTS_PATH). In the latter case, the
>> overlay source files will be copied into the kernel tree first.
>> 
>> Signed-off-by: Michael Walle <michael@walle.cc>
>> ---
>> Regarding using the .dtso suffix (or the lack of here) in the
>> config symbol: I guess BR2_LINUX_KERNEL_INTREE_DTS_NAME used to
>> just a name in the good old days (and for arm32). But nowadays that
>> "name" also need a path prefix which makes it kind of a mix between
>> name and filename, i.e. freescale/imx8mm-evk. IMHO that looks a bit
>> odd, but I don't care too much and for the sake of consistency the
>> new config option also just use the "name" variant.
> 
> Well, like you say, the need to specify a "machine arch" prefix is how
> it currently works for BR2_LINUX_KERNEL_INTREE_DTS_NAME, see e.g.:
> configs/pine64_star64_defconfig:BR2_LINUX_KERNEL_INTREE_DTS_NAME="starfive/jh7110-pine64-star64"
> configs/qemu_arm_vexpress_defconfig:BR2_LINUX_KERNEL_INTREE_DTS_NAME="arm/vexpress-v2p-ca9"
> configs/raspberrypi0_defconfig:BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2708-rpi-zero"
> configs/roc_pc_rk3399_defconfig:BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3399-roc-pc"
> 
> So this is nothing new, so I don't think it is anything to worry about.

Just because it was always this way doesn't make it correct :) In fact,
as explained in v1, if the extension would have been carried along, one 
could
have used that to add the .dtso support (by distiguishing between .dts 
and .dtso)

>> v2:
>>  - don't use the ".dtso" suffix, just use the name
>>  - renamed BR2_LINUX_KERNEL_INTREE_DTBOS to
>>    BR2_LINUX_KERNEL_INTREE_DTSO_NAMES
>>  - remove leftover $(error debug)
>>  - rebased to latest next
>> 
>>  linux/Config.in | 14 +++++++++++---
>>  linux/linux.mk  |  7 +++++--
>>  2 files changed, 16 insertions(+), 5 deletions(-)
>> 
>> diff --git a/linux/Config.in b/linux/Config.in
>> index 429a7eabef..e2432dadd0 100644
>> --- a/linux/Config.in
>> +++ b/linux/Config.in
>> @@ -417,12 +417,20 @@ config BR2_LINUX_KERNEL_INTREE_DTS_NAME
>>  	  the trailing .dts. You can provide a list of
>>  	  dts files to build, separated by spaces.
>> 
>> +config BR2_LINUX_KERNEL_INTREE_DTSO_NAMES
> 
> Hm... the config for DTS is called:
> BR2_LINUX_KERNEL_INTREE_DTS_NAME
> and supports multiple names separated by spaces.
> 
> This new option also supports multiple names supported by spaces,
> but is called:
> BR2_LINUX_KERNEL_INTREE_DTSO_NAMES
> 
> For consistency, should this new option perhaps be called
> BR2_LINUX_KERNEL_INTREE_DTSO_NAME ?

Same as above, I'd say the DTS_NAME is a legacy naming, thus I don't
think we should use the singular here. We already know this will support
multiple names.

> Either way:
> Reviewed-by: Niklas Cassel <niklas.cassel@wdc.com>

Thanks!

-michael
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
