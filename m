Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A73AC3DA42
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 07:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1623F81F24;
	Wed, 10 Jul 2024 07:55:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oYrS4YPajDC8; Wed, 10 Jul 2024 07:55:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDB7A81CC3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDB7A81CC3;
	Wed, 10 Jul 2024 07:55:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 81CC91BF5EA
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 07:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D9A9413E7
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 07:55:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FdDEih90soIW for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 07:55:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7F4D8413E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F4D8413E6
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7F4D8413E6
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 07:55:50 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2ee77db6f97so83899291fa.2
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 00:55:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720598148; x=1721202948;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KHWZXFSz7p+r1hXoJ8eWpTbl4T2RD7GzwBsYf91r6Bo=;
 b=w2EF2H+wPMEnL104AFlGcDDV5RNBSa7XgPUU7+I9yCqq8U5gClVPzTb/l73Zf0KcJv
 HrHCv+CP9EmiVwlb6u4QhF6rCfxw6cpw1+YVIrN559okNrzvUcQsdsawV0WzuqD30ako
 ADH2brkEC3xtZeIzidEkLheeYYC8O9b9BLDJfGuWbO2h78+wr/PLOQAK21lY8HudLW0m
 cYXatd7XHKzaVGPlEDvK1W/U0EJFfU29AuKJicGBFv5CfV11cPctWa6MZqTgNp4kPAwZ
 o2iu/hQ7TF+hBwWo90++JXkLof+o9oxytC9kBmMUcfql6SYCfz1g2e3zTxXoa8DAxhoT
 uhWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7m7qDoMR14VheDK7FhFuqT+PGu9tcX2kamdYcDXTvaKH5Itl34axeKfdKHNccf5FEvnrXogO8wAz8/9c5PgigoVjIbfq6xQ==
X-Gm-Message-State: AOJu0YxLms1yifVCpPTfkCB36irt0jgBsKIUS1KIMGVa+E/8GSb4A/6I
 ASdbFKGrA2Js8eSqLgMRyP/Kl5uHofSmIPdnQ7gzNzkp0/r9/Jg6Ng6fKB2XW88=
X-Google-Smtp-Source: AGHT+IFBqEvttSHZB2ZVayzfm1jE9fXfoPL1LfbxLNAN8F5Gsy7u4eorOqAQ/ACHtCiB1ulTImNvgg==
X-Received: by 2002:a2e:7a0e:0:b0:2ec:4093:ec7 with SMTP id
 38308e7fff4ca-2eeb31026aamr36542411fa.30.1720598147544; 
 Wed, 10 Jul 2024 00:55:47 -0700 (PDT)
Received: from [10.1.0.155] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4266f6e07e1sm71024085e9.7.2024.07.10.00.55.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jul 2024 00:55:47 -0700 (PDT)
Message-ID: <efe068e2-2721-4986-a514-c848b8fb4442@mind.be>
Date: Wed, 10 Jul 2024 09:55:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Paresh Bhagat via buildroot <buildroot@buildroot.org>
References: <20240429092326.3247116-1-p-bhagat@ti.com>
 <20240709225840.3f852ad5@windsurf>
Content-Language: en-GB
In-Reply-To: <20240709225840.3f852ad5@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720598148; x=1721202948; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KHWZXFSz7p+r1hXoJ8eWpTbl4T2RD7GzwBsYf91r6Bo=;
 b=A20YS0Z+X0b/oXJKcBiifW4CNDkxK2WrVIsjSdrMAmqgbtWNCQLILvWfNkgpUtxO7G
 H7BYj97FRSyqaEYf3i5yXn7qg5G0Uf/5+kxrLrvxS2lMfoE5WX2tvji91mZW5PeN96AM
 h+lLzOGTM006ELp7OWe+cDnJr2RR4qc1eLr/UWTpeK7QCZyXjbIjtGysaswRgjYj3QmC
 aq98BSrxSiFjBzWG9gtf7yvEatMXi+ZOMIBlwwS/m6JnQKTDiRMNX+sK3GQgGobFI8bR
 hvCILqbFc1+UMiMyqLQr1KZj8PsHnOSFwVmYMtroLpcFC0pFg2TwlIvHY/HKg1rdXg+G
 jRzw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=A20YS0Z+
Subject: Re: [Buildroot] [RFC,
 1/1] configs/am62x-sk: Add fragment for TI tree integration
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
Cc: Bryan Brattlof <bb@ti.com>, Xuanhao Shi <X15000177@gmail.com>,
 Gyan Gupta <g-gupta@ti.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Chirag Shilwant <c-shilwant@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
 Syed Mohammed Khasim <khasim@ti.com>, Andreas Dannenberg <dannenberg@ti.com>,
 Sai Sree Kartheek Adivi <s-adivi@ti.com>, Romain Naour <romain.naour@smile.fr>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/07/2024 22:58, Thomas Petazzoni wrote:
> Hello Paresh,
> 
> On Mon, 29 Apr 2024 14:53:26 +0530
> Paresh Bhagat via buildroot <buildroot@buildroot.org> wrote:
> 
>> This commit introduces a new fragment config aimed at integration of TI trees
>> into the existing configuration for am62x-sk. The fragment config is designed
>> to be merged with the current ti_am62x_sk_defconfig, enabling transition from
>> mainline to TI versions for U-boot and kernel.
>>
>> The fragment config will be merged with existing ti_my_am62x_sk_defconfig
>> using merge-config.sh script present in support/kconfig using following
>> command.
>>
>> ./support/kconfig/merge-config.sh configs/ti_am62x_sk_defconfig configs/ti_am62x_sk.config
>>
>> It effectively changes uboot and kernel source from mainline version to TI
>> version hosted here
>>
>> https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/?h=ti-linux-6.1.y
>> https://git.ti.com/cgit/ti-u-boot/ti-u-boot/?h=ti-u-boot-2023.04
>>
>> Furthermore, as ti-uboot 2023.04 is used, kernel Image and dtb is expected
>> in rootfs/boot/ and rootfs/boot/dtb/ti respectively. So add a new post-build
>> script to copy these files to desired location.
>>
>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> 
> Thanks for the patch. What you're proposing here is something we don't
> do for any other platform, at least in this form. I believe if we want
> to do this, we probably wouldn't want a fragment, but rather a complete
> separate defconfig instead.
> 
> We do have something somewhat similar though in the NXP world:
> 
> - freescale_imx6ullevk_defconfig is a defconfig for the i.MX6ULL EVK
>    platform that uses the vendor-provided U-Boot/kernel
> 
> - imx6ullevk_defconfig is a defconfig for the same eval board, but that
>    uses mainline U-Boot/kernel
> 
> So we could potentially do something similar if we wanted to.
> 
> Alternatively, for some ST platforms, we have a defconfig in Buildroot
> mainline that use upstream TF-A/U-Boot/Linux, and a separate
> buildroot-external-st BR2_EXTERNAL with defconfigs that use the ST
> provided BSP. I'm not saying we should always do like this as I also
> believe defconfigs using vendor-provided BSP might make sense in
> upstream Buildroot.
> 
> I'm not sure how we want to standardize things here. Arnout, Peter,
> Yann, Romain, any opinion?

  I think it only makes sense to have both a vendor and an upstream defconfig 
in-tree if the vendor defconfig adds some value. For the ST platforms, for 
example, I don't know if this is actually the case... ST is doing upstreaming 
too well :-) Actually for imx6ull I'm also not sure if the vendor config still 
makes sense, AFAIK everything works with upstream kernel...

  For the TI platforms there historically always usually was a big difference 
(feature wise) between vendor and upstream kernels, so I do think it makes a lot 
of sense to offer both. At least, if this is still the case :-)

  Just one thing about the naming: I think it should be 
imx6ullevk_upstream_defconfig and imx6ullevk_vendor_defconfig to make the 
distinction clearer. I haven't looked at this TI series to evaluate its naming 
scheme, but you get the idea I guess.

  Regards,
  Arnout

>> diff --git a/board/ti/common/am6xx/ti_arm64_prune.config b/board/ti/common/am6xx/ti_arm64_prune.config
>> new file mode 100644
>> index 0000000000..ad41cda81c
>> --- /dev/null
>> +++ b/board/ti/common/am6xx/ti_arm64_prune.config
>> @@ -0,0 +1,485 @@
>> +# Add config flags here that appear in the multi_v7_defconfig but are not
> 
> I'm confused by this comment. multi_v7_defconfig is an ARM32 kernel
> config, and here we're targeting an ARM64 platform.
> 
> 
>> diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
>> index fbe5d21540..3baa2f5e2e 100644
>> --- a/boot/uboot/uboot.hash
>> +++ b/boot/uboot/uboot.hash
>> @@ -1,3 +1,4 @@
>>   # Locally computed:
>>   sha256  b99611f1ed237bf3541bdc8434b68c96a6e05967061f992443cb30aabebef5b3  u-boot-2024.01.tar.bz2
>>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
>> +sha256  5c3ce409901b8b16204b02d538833dcb6c66729c0316b53848d0f15642a49266  uboot-ti-u-boot-2023.04-br1.tar.gz
> 
> We clearly wouldn't want the hash of the TI-specific U-Boot in
> boot/uboot/uboot.hash. Use the BR2_GLOBAL_PATCH_DIR feature to provide
> your own hash files, specific to this defconfig.
> 
>> diff --git a/linux/linux.hash b/linux/linux.hash
>> index 4fa9f701cd..9c0d26aa71 100644
>> --- a/linux/linux.hash
>> +++ b/linux/linux.hash
>> @@ -17,3 +17,4 @@ sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-
>>   sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
>>   sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/preferred/GPL-2.0
>>   sha256  8e378ab93586eb55135d3bc119cce787f7324f48394777d00c34fa3d0be3303f  LICENSES/exceptions/Linux-syscall-note
>> +sha256  3256bbd9eb9b3ffec10e8e013ed433e79adf83cf731677be7fcdd53e25d1db98  linux-ti-linux-6.1.y-br1.tar.gz
> 
> Same comment here for the Linux kernel.
> 
> Best regards,
> 
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
