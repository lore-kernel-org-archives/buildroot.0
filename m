Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0455C433EF
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 21:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47ACF60AEB;
	Wed,  2 Feb 2022 21:09:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LUwc2gPvjIwC; Wed,  2 Feb 2022 21:09:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80B6A60A92;
	Wed,  2 Feb 2022 21:09:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B23991BF300
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 21:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A025440354
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 21:09:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 65IrsSgLDO2T for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 21:09:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4A694031F
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 21:09:25 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id FMsUnSa5Pkz4hFMsVnv1Oc; Wed, 02 Feb 2022 22:09:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643836163; bh=OCjAVtCjyI88e9TawqA+Bcf8TUmbu0Zv43/x+kJ6+FA=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=f3mCLJpLdssC1pY4xPBqeYHRbcGWhYGcoiGLzjhFhwBtONAbAnHkCsHZZ5m4jW2xI
 impNt46didww+g8W0CD70iireDTOEAinp2jhgN/IygNMUynQhkachGUgYmRL8YRsBF
 aJMPGIdw5SewGzNpbaVnZHWRDV5fm9iv0RQbJmOFDwGMd6v2xRDoW/dBBo0SjzgPmX
 wpZITKSive9qhQHRsTf249sX8DsIqL2cjpDjO2DBtUi55va0gOVFqEaXNMtIKXO3B6
 u7Q4vhc8HEO1zohtlGMjcJMtpK4RR/gILDZa5hdllv3VLoNIJy6btvhac64zeVkb2C
 nKXPx6Ut4firQ==
Message-ID: <48ab9669-d467-a394-12a2-fd229f6229f0@benettiengineering.com>
Date: Wed, 2 Feb 2022 22:09:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Peter Seiderer <ps.report@gmx.net>, Arnout Vandecappelle <arnout@mind.be>
References: <20220201232203.333403-1-giulio.benetti@benettiengineering.com>
 <20220201232203.333403-2-giulio.benetti@benettiengineering.com>
 <d6ff992c-a84c-d335-3ddb-2122f7c744dd@mind.be>
 <20220202214210.0a2483e6@gmx.net>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220202214210.0a2483e6@gmx.net>
X-CMAE-Envelope: MS4wfAS5lwW3UgEf6yjKnCsEtKo+weH2DYDt5yJbAzhCTxDX7R0Ct9M9C/KeifE5T8n+i2UANEgO78Tmgr4G20c0LsaVd4Kaf6KT0oLTrLzUjj5+0uDAbc2L
 wPkG9RpnQ+XmRiEEILoKxF/L5RwCJAwl5TqQDA6sWj7kQqtYSkDGzSIWhP9oGXF+GelEh/9SYgaybBoXc3pdPR45t3qPb/mVYjikAM+Zo3BpHiLGgC+Nbbnm
 bBty4goMDkNnSr1HGMlNCGVyEnyBm7UJKNbm1JgkZdONaMeVdMFrpL7ZgrDJF7q3c6Ek6iuWPu11aDHWXPyMvpFTQAIPnAxB40sMjy+i9FxhDBs/q3hmlQR+
 lzsTArFeyAhc0AhqXJYD9dT2m3eh1w==
Subject: Re: [Buildroot] [URGENT 1/1] package/util-linux: fix host build
 failure
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On 02/02/22 21:42, Peter Seiderer wrote:
> Hello Arnout, Giulio,
> 
> On Wed, 2 Feb 2022 08:41:34 +0100, Arnout Vandecappelle <arnout@mind.be> wrote:
> 
>> On 02/02/2022 00:22, Giulio Benetti wrote:
>>> The UTIL_LINUX_FIX_DISK_UTILS_COMPILE workaround is needed for host
>>> building too. So let's add it to HOST_UTIL_LINUX_POST_PATCH_HOOKS.
>>> host-util-linux is used a lot, so this patch fixes a lot of future
>>> builds.
>>
>>    Darn, I tested that, both with and without BR2_PACKAGE_HOST_UTIL_LINUX set. I
>> don't understand what went wrong in my test...
> 
> The raw support depends on the available toolchain headers, see e.g.
> package/util-linux/Config.in:
> 
> 	config BR2_PACKAGE_UTIL_LINUX_RAW
> 	        bool "raw"
> 	        depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14
> 	        help
> 	          Build a linux raw character device
> 
> Or according to [1] '--disable-raw' for the host build should do
> the trick too...

I was in hurry to produce the patch last night, so I went for the 
fastest way. Can you give a try with --disable-raw and eventually submit 
the patch? That would save some time while building. Also because 
host-util-linux is used a lot

Thank you!
Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> Regards,
> Peter
> 
> [1] https://github.com/util-linux/util-linux/issues/1577
> 
>>
>>    Anyway, applied to master, thanks.
>>
>>    Regards,
>>    Arnout
>>
>>
>>>
>>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>>> ---
>>>    package/util-linux/util-linux.mk | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
>>> index e59ef7dadc..5a4ff64d01 100644
>>> --- a/package/util-linux/util-linux.mk
>>> +++ b/package/util-linux/util-linux.mk
>>> @@ -41,6 +41,7 @@ define UTIL_LINUX_FIX_DISK_UTILS_COMPILE
>>>    	touch $(@D)/disk-utils/raw.8
>>>    endef
>>>    UTIL_LINUX_POST_PATCH_HOOKS += UTIL_LINUX_FIX_DISK_UTILS_COMPILE
>>> +HOST_UTIL_LINUX_POST_PATCH_HOOKS += UTIL_LINUX_FIX_DISK_UTILS_COMPILE
>>>
>>>    HOST_UTIL_LINUX_DEPENDENCIES = host-pkgconf
>>>
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
