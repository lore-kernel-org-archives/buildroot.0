Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA78C43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 12:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B983340AED;
	Mon, 25 Jul 2022 12:37:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B983340AED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YFUAYd5AL6yQ; Mon, 25 Jul 2022 12:37:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71F47404C9;
	Mon, 25 Jul 2022 12:37:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71F47404C9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8BA121BF215
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 12:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64C7C404C9
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 12:37:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64C7C404C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pug3F8oRgqV2 for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 12:37:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17A63404C2
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 17A63404C2
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 12:37:23 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id v5so6729476wmj.0
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 05:37:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=u1sCtWexgZi30odqIcjspkFaUuEoLnpeAELrkWUxB4s=;
 b=tHYWBYNr/ZrYSSiYkEfLfZe3462Z017PPlQVvi7fXVTVavS15/0mwF2ay4ldwYlXdQ
 OcrWYf1Q19GQebYkvVXnDZORAt7sWLoMCVhLAqkBAPHR5ms69FlzrK/3tDgcr6mz2wB6
 YVB681GT9dUfjV4oGYX8qcRJbUkZ5aYX8lHX/ZnMQHkGBxgxfh96U/WytzlS9bjTNfbJ
 99GBjQ7+swTRXXCSWHQCyzV0fCdrqghZP/kYEBxWEuJWlKR11kZuXTWnN1ZrUYtE6ged
 tEm0kHs2+m4xl4K0GamuyA2kGouCZPDpv5Pjd4cNTAK7gKT91Wom/b89hTMNYxFJZr2C
 jyPA==
X-Gm-Message-State: AJIora+sIjU/oeBgoQBD47GfjQP8kn1H8keRPGGVLPFPKT3C469cX8Te
 NcAXOOKdzil3fvtRDiWWQG2CjXVfWyFHgA==
X-Google-Smtp-Source: AGRyM1tqro5jpfeZuVYFSbjMbh2Vo+yNrCU8yqeA5kq3whJDgiGCP5RxVoKta6SwTU803KSDs9QG3A==
X-Received: by 2002:a7b:c415:0:b0:3a3:1d20:a4d with SMTP id
 k21-20020a7bc415000000b003a31d200a4dmr21957936wmi.137.1658752641992; 
 Mon, 25 Jul 2022 05:37:21 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 e8-20020a05600c218800b003a319bd3278sm17701974wme.40.2022.07.25.05.37.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 05:37:21 -0700 (PDT)
Message-ID: <1b81c8e0-22a4-65bd-7fbd-cc420965b9fd@mind.be>
Date: Mon, 25 Jul 2022 14:37:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Hanspeter Portner <dev@open-music-kontrollers.ch>
References: <20210917131851.31717-1-dev@open-music-kontrollers.ch>
 <20210918073333.GE1053080@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210918073333.GE1053080@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=u1sCtWexgZi30odqIcjspkFaUuEoLnpeAELrkWUxB4s=;
 b=eBsbB+wsxzIyYPszym31zUhubHKaKw5T7nISU/xXEx0kpoURm/IGwxeFNnMXHkK3mE
 h9ZifgTKiHrDoOGqPq3WR4H9Mi/cXZvexAwNBJSi8WZk3U/h/l6ROTboxXmbJuMaNgJI
 HBAY9C7dmygTsRNb0napVS6Dvmwm1doPFHCGc6SwLTP2tgHVDOyy2cne5i1PF/XsVAyE
 ILi7SikAZMka5TWl5PKEp2Tr2yk+fb8sAs3TH/facToYNPex1YlgiGwPI1Vyr6BhS1Er
 BnRtj6FFLM8H0cim+ARtQ29Ax1lNKRJKqZACsswKodLLsEHyMzTQSfGB1nSdWpeSSbox
 K3Ng==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=eBsbB+ws
Subject: Re: [Buildroot] [PATCH 1/1] linux: add compressions for appended
 initramfs
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 18/09/2021 09:33, Yann E. MORIN wrote:
> Hanspeter, All,
> 
> On 2021-09-17 15:18 +0200, Hanspeter Portner spake thusly:
>> This changes take effect in the case of BR2_TARGET_ROOTFS_INITRAMFS=y
>> and one of BR2_LINUX_KERNEL_{GZIP,LZ4,LZMA,LZO,XZ}=y.
>>
>> Instead of using the kernel's default compression (gzip) for appended initramfs,
>> this changes set initramfs compression explicitely to the same compression as
>> the kernel itself, which seems a sensible thing to do, imho.
> 
> Hmmm... But isn't the initranfs compressed as part of the kernel
> already? See help for CONFIG_INITRAMFS_COMPRESSION_NONE:
> 
>      Do not compress the built-in initramfs at all. This may sound
>      wasteful in space, but, you should be aware that the built-in
>      initramfs will be compressed at a later stage anyways along
>      with the rest of the kernel, on those architectures that support
>      this. However, not compressing the initramfs may lead to slightly
>      higher memory consumption during a short time at boot, while both
>      the cpio image and the unpacked filesystem image will be present
>      in memory simultaneously
> 
> Additionally, compressing the initramfs separately, means that it will
> be copmopressed twice at build time, thus increasing the build time (but
> who cares? ;-) ), but also means it will be decompressed twice, thus
> increasing the boot time, every time the device boots.
> 
> So, forcibly setting the compression to that of the kernel seems totally
> superfluous, _as kernel image size matters_; indeed, simply disabling
> initramfs compression (actually, cpio compression) would seem like the
> only correct thing to do.
> 
> The only reason when we would want to actually compress the initramfs,
> as hinted in the help text I quoted above, is for machines that are
> tight on RAM, so tight indeed that they can't easily fit the whole
> uncompressed cpio and the extracted initramfs at the same time at boot
> (the uncompressed cpio is eventually garbage-collected once the
> initramfs is fully populated).
> 
> Nowadays, that probably means machine with less than a very few MiB of
> RAM, something around 4MiB. Those kind of machines do exist, but they
> are often better served without using an initramfs (i.e. a root on a
> flash or something), or are going to require a very tiny initramfs
> anyway.
> 
> So, I wonder if we should not simply disable compression of the
> initramfs altogether...

  The current situation allows the user to choose through the kernel config, so 
sounds like the optimal approach. Unfortunately, the kernel apparently does 
default to gzip instead of uncompressed, so there's something to be said for 
forcing it to uncompressed...

  Anyway, setting it to the same as the kernel compression is useless I think. 
Therefore, I marked this patch as Rejected.

  Regards,
  Arnout

> 
> Could look into that, and look at actual numbers for the resulting
> kernel image when the initramfs is compressed or not?
> 
> Regards,
> Yann E. MORIN.
> 
>> Apart from these kernel config parameters ...
>>
>> * CONFIG_KERNEL_GZIP
>> * CONFIG_KERNEL_LZ4
>> * CONFIG_KERNEL_LZMA
>> * CONFIG_KERNEL_LZO
>> * CONFIG_KERNEL_XZ
>> * CONFIG_KERNEL_ZSTD
>> * CONFIG_KERNEL_UNCOMPRESSED
>>
>> ... we now also set these new kernel config parameters, as without those,
>> the appended initramfs seems to always be compressed with gzip:
>>
>> * CONFIG_INITRAMFS_COMPRESSION_GZIP
>> * CONFIG_INITRAMFS_COMPRESSION_LZ4
>> * CONFIG_INITRAMFS_COMPRESSION_LZMA
>> * CONFIG_INITRAMFS_COMPRESSION_LZO
>> * CONFIG_INITRAMFS_COMPRESSION_XZ
>> * CONFIG_INITRAMFS_COMPRESSION_NONE
>>
>> The former are automatically set depending on whether one of the
>> following buildroot config parameters is set analogously to how it is done
>> for CONFIG_KERNEL_{GZIP,LZ4,LZMA,LZO,XZ,ZSTD,UNCOMPRESSED}:
>>
>> * BR2_LINUX_KERNEL_GZIP
>> * BR2_LINUX_KERNEL_LZ4
>> * BR2_LINUX_KERNEL_LZMA
>> * BR2_LINUX_KERNEL_LZO
>> * BR2_LINUX_KERNEL_XZ
>> * BR2_LINUX_KERNEL_UNCOMPRESSED
>>
>> Signed-off-by: Hanspeter Portner <dev@open-music-kontrollers.ch>
>> ---
>>   linux/linux.mk | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/linux/linux.mk b/linux/linux.mk
>> index 61fdc0c76c..f192341a32 100644
>> --- a/linux/linux.mk
>> +++ b/linux/linux.mk
>> @@ -106,6 +106,15 @@ LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_XZ) += CONFIG_KERNEL_XZ
>>   LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_ZSTD) += CONFIG_KERNEL_ZSTD
>>   LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_UNCOMPRESSED) += CONFIG_KERNEL_UNCOMPRESSED
>>   
>> +INITRAMFS_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_GZIP) += CONFIG_INITRAMFS_COMPRESSION_GZIP
>> +INITRAMFS_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_LZ4) += CONFIG_INITRAMFS_COMPRESSION_LZ4
>> +INITRAMFS_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_LZMA) += CONFIG_INITRAMFS_COMPRESSION_LZMA
>> +INITRAMFS_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_LZO) += CONFIG_INITRAMFS_COMPRESSION_LZO
>> +INITRAMFS_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_XZ) += CONFIG_INITRAMFS_COMPRESSION_XZ
>> +# zstd compression seems not supported, yet
>> +#INITRAMFS_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_ZSTD) += CONFIG_INITRAMFS_COMPRESSION_ZSTD
>> +INITRAMFS_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_UNCOMPRESSED) += CONFIG_INITRAMFS_COMPRESSION_NONE
>> +
>>   ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL),y)
>>   LINUX_DEPENDENCIES += host-openssl
>>   endif
>> @@ -352,6 +361,10 @@ define LINUX_KCONFIG_FIXUP_CMDS
>>   		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,"$${BR_BINARIES_DIR}/rootfs.cpio")
>>   		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_UID,0)
>>   		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_GID,0))
>> +		$(call KCONFIG_ENABLE_OPT,$(strip $(INITRAMFS_COMPRESSION_OPT_y)))
>> +		$(foreach opt, $(INITRAMFS_COMPRESSION_OPT_),
>> +			$(call KCONFIG_DISABLE_OPT,$(opt))
>> +		)
>>   	$(if $(BR2_ROOTFS_DEVICE_CREATION_STATIC),,
>>   		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS)
>>   		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT))
>> -- 
>> 2.33.0
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@lists.buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
