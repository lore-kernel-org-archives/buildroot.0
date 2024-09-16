Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52645C3ABA2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 18:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94D5840CA1;
	Mon, 16 Sep 2024 18:05:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NifIvupdJBwd; Mon, 16 Sep 2024 18:05:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3C2340C58
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C3C2340C58;
	Mon, 16 Sep 2024 18:05:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B1A7F1BF370
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 18:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F3AF81190
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 18:05:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xgCS8t0Qc-_3 for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 18:05:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EDC1381182
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDC1381182
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EDC1381182
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 18:05:05 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-42cd74c0d16so47079485e9.1
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 11:05:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726509903; x=1727114703;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8qMC61HJydWj0y149MFl+wJPlbFs9K7Tl5Q924HMOCY=;
 b=njMAvg0SccNXWZrOMG/ojr4HmYXZN/fucRcdX4u5MgbuX7tSRt7qhS3ulcQ/88SyJg
 k0oKZA6xrhayl9Gls8/ixr5VGaSaxA+7ft1A4yU6Sg+gTp2z1dgDLnbZ/dbvWyBpIF/D
 dDXy/elCnW9MuL8BfQqytIacdKJPDf2z9WaTrIVKpvuUbb96t6uhGwrCYMvOXqLGEcOX
 aqwT/pEgXP0YoMRUcnfzKceoKg4YFY2v4y/S+qQmj8u50XEOrVbbYwT7Y47ye0nW/0BT
 CweSjScylxDgnT3lOjof6sAWAuI7013PJeCdRI2uMClGOmS5G5umi1+LLTMiAWZQ5Xki
 nQhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtsWR9Mml3RAX7Ka9A4rMyuSwWpri6cQBNqEwFbphmRBY7KPHst90E9K1kdFjBB6ic4QrmRl8dIdo=@buildroot.org
X-Gm-Message-State: AOJu0Ywk+SMF0d+FnxHqf/KwpDjBucDBXo1EyBzuwNmC6C/LUrikjZ7j
 DUkFm3Uw1IQYK4LBBOrmBrggBotmXX3ruA1J/qH2M2iqak/2vqYL+d3gm8+FF0o=
X-Google-Smtp-Source: AGHT+IECtOtckha8CTcTRsQ4BJeZEgPsokxAbcwsb7/A2iENOEsIWmUGwaN6bPLLjtm2YrOojkpeXw==
X-Received: by 2002:a05:600c:4707:b0:428:10d7:a4b1 with SMTP id
 5b1f17b1804b1-42cdb56dfa6mr130854505e9.25.1726509903339; 
 Mon, 16 Sep 2024 11:05:03 -0700 (PDT)
Received: from [192.168.0.189] (91-119-60-140.dsl.dynamic.surfer.at.
 [91.119.60.140]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378e71f054asm7752451f8f.10.2024.09.16.11.05.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Sep 2024 11:05:02 -0700 (PDT)
Message-ID: <95b2beb7-69f5-476e-a65f-50055bddf46a@mind.be>
Date: Mon, 16 Sep 2024 20:05:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Frager, Neal" <neal.frager@amd.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <20240812051058.2911075-1-neal.frager@amd.com>
 <642f92fa-bfb7-411c-aeb3-b49504059912@mind.be>
 <CH2PR12MB500452FC45040BC9B78A4E75F0602@CH2PR12MB5004.namprd12.prod.outlook.com>
Content-Language: en-GB
In-Reply-To: <CH2PR12MB500452FC45040BC9B78A4E75F0602@CH2PR12MB5004.namprd12.prod.outlook.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1726509903; x=1727114703; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8qMC61HJydWj0y149MFl+wJPlbFs9K7Tl5Q924HMOCY=;
 b=I2pWI20JHcyGBErOfMTZ5cKX8qvY788UGxivdOTnf7gvMGKf885/l8t3iotE0lovFn
 si9zNVtybfXv5zNV10v7grwF0uG0kl7G35mB9Qsq0DNr1Roa/SWz+9OdsLJbzdXRrq72
 bCBzgthPmKf0TpSRqw6dlIKiFi7UUB8vsqIosl0PbtBkZoPHaiLAAMlF6rGvDaQc5Xzq
 woJsUuAEd2jYDPdVUUGMiaudKHFAY/jhaiBkjtCT1VEJyCcUUZ22hP05YFwx1Gek3bBL
 poekLp8ww2wt3/AYTHM80XLpExnnYkYR3XL2zqNydXDYeE8m8wO0R0IY3xzYgsVs0gQM
 Ow5A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=I2pWI20J
Subject: Re: [Buildroot] [PATCH v3 1/1] board/xilinx: bump to linux 6.6.40
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
Cc: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/09/2024 16:22, Frager, Neal wrote:
> Hi Arnout,
> 
>> This patch bumps all Xilinx board defconfigs to Linux 6.6.40.
>>
>> Xilinx Evaluation Boards:
>> configs/versal_vck190_defconfig
>> configs/versal_vpk180_defconfig
>> configs/zynq_microzed_defconfig
>> configs/zynq_zc702_defconfig
>> configs/zynq_zc706_defconfig
>> configs/zynq_zed_defconfig
>> configs/zynqmp_kria_kd240_defconfig
>> configs/zynqmp_kria_kr260_defconfig
>> configs/zynqmp_kria_kv260_defconfig
>> configs/zynqmp_zcu102_defconfig
>> configs/zynqmp_zcu104_defconfig
>> configs/zynqmp_zcu106_defconfig
>>
>> Signed-off-by: Neal Frager <neal.frager@amd.com>
> 
>>   Applied to master, thanks.
> 
>>   Regards,
>>   Arnout
> 
> Has this patch been applied to master?
> 
> I do not see the commit.

  Indeed, I forgot to push. Thanks for noticing!

  Regards,
  Arnout

> 
> Thanks!
> Neal Frager
> AMD
> 
>> ---
>> V1->V2:
>> - Squashed bump of all Xilinx board defconfigs to single patch
>> - Removed linux patch which is no longer necessary
>> V2->V3:
>> - Removed linux.hash for 2024.1
>> ---
>>    board/xilinx/patches/linux/linux.hash | 2 +-
>>    configs/versal_vck190_defconfig       | 2 +-
>>    configs/versal_vpk180_defconfig       | 2 +-
>>    configs/zynq_microzed_defconfig       | 2 +-
>>    configs/zynq_zc702_defconfig          | 2 +-
>>    configs/zynq_zc706_defconfig          | 2 +-
>>    configs/zynq_zed_defconfig            | 2 +-
>>    configs/zynqmp_kria_kd240_defconfig   | 2 +-
>>    configs/zynqmp_kria_kr260_defconfig   | 2 +-
>>    configs/zynqmp_kria_kv260_defconfig   | 2 +-
>>    configs/zynqmp_zcu102_defconfig       | 2 +-
>>    configs/zynqmp_zcu104_defconfig       | 2 +-
>>    configs/zynqmp_zcu106_defconfig       | 2 +-
>>    13 files changed, 13 insertions(+), 13 deletions(-)
>>
>> diff --git a/board/xilinx/patches/linux/linux.hash b/board/xilinx/patches/linux/linux.hash
>> index d85f773478..b007db4303 100644
>> --- a/board/xilinx/patches/linux/linux.hash
>> +++ b/board/xilinx/patches/linux/linux.hash
>> @@ -1,2 +1,2 @@
>>    # Locally calculated
>> -sha256  ea85988e66b9a2e19ccd76d0f5f5e657988a873fed292160917712f45605a805  xlnx_rebase_v6.6_LTS_2024.1.tar.gz
>> +sha256  6415cfcfd74e943d6ae44f6c1edcae09bf6cd89410b03c4290bf1464a8368f84  xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz
>> diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
>> index 21dfe2577a..58479c9f2d 100644
>> --- a/configs/versal_vck190_defconfig
>> +++ b/configs/versal_vck190_defconfig
>> @@ -6,7 +6,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
>>    BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
>>    BR2_LINUX_KERNEL=y
>>    BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
>> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
>> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
>>    BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
>>    BR2_LINUX_KERNEL_DTS_SUPPORT=y
>>    BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vck190-rev1.1"
>> diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
>> index 253a6d2cff..4d3afc0e98 100644
>> --- a/configs/versal_vpk180_defconfig
>> +++ b/configs/versal_vpk180_defconfig
>> @@ -6,7 +6,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
>>    BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
>>    BR2_LINUX_KERNEL=y
>>    BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
>> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
>> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
>>    BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
>>    BR2_LINUX_KERNEL_DTS_SUPPORT=y
>>    BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vpk180-revA"
>> diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
>> index f955a0c4ad..71a5d880b3 100644
>> --- a/configs/zynq_microzed_defconfig
>> +++ b/configs/zynq_microzed_defconfig
>> @@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
>>    BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
>>    BR2_LINUX_KERNEL=y
>>    BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
>> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
>> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
>>    BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
>>    BR2_LINUX_KERNEL_UIMAGE=y
>>    BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
>> diff --git a/configs/zynq_zc702_defconfig b/configs/zynq_zc702_defconfig
>> index 75ebc2a3ba..f3fc32145b 100644
>> --- a/configs/zynq_zc702_defconfig
>> +++ b/configs/zynq_zc702_defconfig
>> @@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
>>    BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
>>    BR2_LINUX_KERNEL=y
>>    BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
>> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
>> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
>>    BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
>>    BR2_LINUX_KERNEL_UIMAGE=y
>>    BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
>> diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
>> index ce539eefaf..f1c9bd6622 100644
>> --- a/configs/zynq_zc706_defconfig
>> +++ b/configs/zynq_zc706_defconfig
>> @@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
>>    BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
>>    BR2_LINUX_KERNEL=y
>>    BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
>> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
>> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
>>    BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
>>    BR2_LINUX_KERNEL_UIMAGE=y
>>    BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
>> diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
>> index 925faeac8e..cada3bbd47 100644
>> --- a/configs/zynq_zed_defconfig
>> +++ b/configs/zynq_zed_defconfig
>> @@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
>>    BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
>>    BR2_LINUX_KERNEL=y
>>    BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
>> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
>> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
>>    BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
>>    BR2_LINUX_KERNEL_UIMAGE=y
>>    BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
>> diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
>> index dff49b9837..262e80a145 100644
>> --- a/configs/zynqmp_kria_kd240_defconfig
>> +++ b/configs/zynqmp_kria_kd240_defconfig
>> @@ -5,7 +5,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
>>    BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 sda2 ${UBOOT_DIR}"
>>    BR2_LINUX_KERNEL=y
>>    BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
>> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
>> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
>>    BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
>>    BR2_LINUX_KERNEL_DTS_SUPPORT=y
>>    BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k24-revA-sck-kd-g-revA"
>> diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
>> index 24fdea9c30..65bba693a0 100644
>> --- a/configs/zynqmp_kria_kr260_defconfig
>> +++ b/configs/zynqmp_kria_kr260_defconfig
>> @@ -5,7 +5,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
>>    BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 sda2 ${UBOOT_DIR}"
>>    BR2_LINUX_KERNEL=y
>>    BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
>> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
>> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
>>    BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
>>    BR2_LINUX_KERNEL_DTS_SUPPORT=y
>>    BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k26-revA-sck-kr-g-revB"
>> diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
>> index a16da66e38..22df2a4112 100644
>> --- a/configs/zynqmp_kria_kv260_defconfig
>> +++ b/configs/zynqmp_kria_kv260_defconfig
>> @@ -5,7 +5,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
>>    BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 mmcblk1p2 ${UBOOT_DIR}"
>>    BR2_LINUX_KERNEL=y
>>    BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
>> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
>> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
>>    BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
>>    BR2_LINUX_KERNEL_DTS_SUPPORT=y
>>    BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k26-revA-sck-kv-g-revB"
>> diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
>> index 3f1726a13f..c2feb393de 100644
>> --- a/configs/zynqmp_zcu102_defconfig
>> +++ b/configs/zynqmp_zcu102_defconfig
>> @@ -5,7 +5,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
>>    BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
>>    BR2_LINUX_KERNEL=y
>>    BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
>> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
>> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
>>    BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
>>    BR2_LINUX_KERNEL_DTS_SUPPORT=y
>>    BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu102-rev1.0"
>> diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
>> index b6d943333f..c26210b49c 100644
>> --- a/configs/zynqmp_zcu104_defconfig
>> +++ b/configs/zynqmp_zcu104_defconfig
>> @@ -5,7 +5,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
>>    BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
>>    BR2_LINUX_KERNEL=y
>>    BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
>> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
>> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
>>    BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
>>    BR2_LINUX_KERNEL_DTS_SUPPORT=y
>>    BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu104-revC"
>> diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
>> index c10ec70ed8..737a8454bb 100644
>> --- a/configs/zynqmp_zcu106_defconfig
>> +++ b/configs/zynqmp_zcu106_defconfig
>> @@ -5,7 +5,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
>>    BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
>>    BR2_LINUX_KERNEL=y
>>    BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
>> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
>> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
>>    BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
>>    BR2_LINUX_KERNEL_DTS_SUPPORT=y
>>    BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu106-revA"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
