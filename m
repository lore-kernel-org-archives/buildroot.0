Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 111EAC433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 10:52:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E26B161B40
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 10:52:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E26B161B40
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 675F6426F0;
	Sun,  3 Oct 2021 10:52:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0W3QgyEsBEWc; Sun,  3 Oct 2021 10:52:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A299F426F2;
	Sun,  3 Oct 2021 10:52:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8A7E41BF59F
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 10:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 785884020C
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 10:52:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gzR_drEzurdz for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 10:52:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DD680400D8
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 10:52:46 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id v10so53237008edj.10
 for <buildroot@buildroot.org>; Sun, 03 Oct 2021 03:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7z+m9bQQqZ1sn+ShGtNaskgGZH2g1d2lprM4KxLvpDw=;
 b=LYTO8j78Ceqyn31mENRb5ALMao/X1cQEbG2Ju9h25ZXOcS6TRTGN+ZRuGYhB1wCOVs
 irnrUg/hA0i6dxDdFmtihn84FwDU6Ue1x+w8qup04HUpmdmY7rwZaHJ+FgjIkS3ZLoRX
 TUaNAVOW7Y/mGlUUwlw9GULLk4lQuJON51vpHpK/9TBxMpbu6GN/iIuTSLT+WLgnnR4f
 sbf3syuUO9bLv16o/8AK7tV9rkJMsQN4JsWyHxefh0f6MucMO6/9L1MNPPWnyUAGmODB
 eWsXQVc6CZQU+4hQDA1rMjkLnNr/EabkWlpcvZNSWbvAfOs2myIs7fa4zoHIw5RVcvMz
 fXzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7z+m9bQQqZ1sn+ShGtNaskgGZH2g1d2lprM4KxLvpDw=;
 b=2ua5GErOv+F+torls0Sfbbq2AwT39bFBdSoR8Oa3n9hctMAR2lEAE9aRCfgH6Wl129
 x6TrAreDuCQgPw3Eia6mf9gusfBrcJjWrNq9SjZMME0AVsx7DNA53UPjf2McooGyPKZT
 HBKlKs8PlGH1OKa1gILui7wBE1jaxTkJHmzz4rXCBV96I6PJ6ZRUzNhaEYix2CO+44oE
 OsIpRmBXPo9pP02yUsQ0ZpVRoKmk8g1eBSPN+xzgPM7OmdvYrm8UBwu873fnsdIAyIcA
 MB4J+ti0wtb8K7KxKfsGvefRJMc+SvNLTS7dae/kcv8z+YhyqScO8kgu95XuHiUV2+ZL
 s4HA==
X-Gm-Message-State: AOAM532KAubZeh6uvMPGsdnZvV0X3hjduBLr+Qjg6BoSR5lwAC2SHA0b
 ZxFwSdvaOpKYUHKYyRvVYvcX2g==
X-Google-Smtp-Source: ABdhPJyV2ZjqO/imhu6KY+rWcjRzfeA2Jmm/3GaQvDS/yaDm11NGxKGObxDbSgl6B0dZykFpmOLPqg==
X-Received: by 2002:a17:906:165a:: with SMTP id
 n26mr9514700ejd.236.1633258364684; 
 Sun, 03 Oct 2021 03:52:44 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id k19sm2497210ejg.13.2021.10.03.03.52.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Oct 2021 03:52:44 -0700 (PDT)
Message-ID: <2439f331-726c-4192-b821-addce6518bfc@mind.be>
Date: Sun, 3 Oct 2021 12:52:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Tim Harvey <tharvey@gateworks.com>, Fabio Estevam <festevam@gmail.com>
References: <CAJ+vNU0DmMfBTdmnrD9UYxCqEJq6gbut6WJv3Nr5QKDe_UL3UQ@mail.gmail.com>
 <CAOMZO5DZxRFKF=tnkHRk5wKzoRW2_F9py8onUk_5ppzz0S2nuw@mail.gmail.com>
 <CAJ+vNU16uqMnCDBmOMnVyLtLHzU=K61YU2Rtx_3BWYzLzMBaPQ@mail.gmail.com>
 <CAJ+vNU3qyPwoSy2YfH7yjTSkX6A=mWV6iqk8difayO0MFU42VQ@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CAJ+vNU3qyPwoSy2YfH7yjTSkX6A=mWV6iqk8difayO0MFU42VQ@mail.gmail.com>
Subject: Re: [Buildroot] buildroot config for installing kernel and dtbs to
 rootfs?
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
Cc: buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/10/2021 16:38, Tim Harvey wrote:
> On Thu, Sep 30, 2021 at 8:21 AM Tim Harvey <tharvey@gateworks.com> wrote:
>>
>> On Wed, Sep 29, 2021 at 7:13 PM Fabio Estevam <festevam@gmail.com> wrote:
>>>
>>> Hi Tim,
>>>
>>> On Wed, Sep 29, 2021 at 10:52 PM Tim Harvey <tharvey@gateworks.com> wrote:
>>>>
>>>> Greetings,
>>>>
>>>> I see the buildroot has the ability to build dtb's from the kernel
>>>> source (BR2_LINUX_KENREL_DTS*) but I haven't seen any configs that
>>>> instruct buildroot to copy the dtb's or kernel image to the root
>>>> filesystem.
>>>>
>>>> Is there a config for this and if not what do people usually do for this?
>>>
>>> It is BR2_LINUX_KERNEL_INSTALL_TARGET=y.
>>>
>>> configs/wandboard_defconfig is an example that selects
>>> BR2_LINUX_KERNEL_INSTALL_TARGET=y
>>> and install zImage and dtbs into the rootfs.
>>>
>>
>> Thanks Fabio, I didn't see it because I had BR2_TARGET_ROOTFS_INITRAMFS=y.
>>
>> BR2_LINUX_KERNEL_INSTALL_TARGET only installs the kernel image. It
>> looks like perhaps to install dtbs you need
>> BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh".
>> It seems to me installing of the dtbs to the rootfs should be moved
>> into a defconfig like the kernel image for those who are trying to
>> simply generate a tarball but not an image?
>>
> 
> Fabio,
> 
> Digging into the image creation used for freescale_imx8mmevk_defconfig
> things seem flawed to me or at least limited.
> 
> I'm still trying to wrap my head around what
> BR2_LINUX_KERNEL_INTREE_DTS_NAME is trying to accomplish

  Very simple: to use a dts that is in the kernel source.

> but one thing
> I see is that board/freescale/common/imx/imx8-bootloader-prepare.sh
> and board/freescale/common/imx/post-image.sh are creating images
> assuming the U-Boot dtb and the Linux kernel dtb are one and the same
> which is wrong.

  Saying that it is wrong is a bit exaggerated. You can say that they're not 
necessarily the same. The intention is that device trees are OS-independent, so 
the *intention* is that the same device tree works for both U-Boot and the 
kernel. That said, indeed, in practice it is sometimes not the case. That said, 
the parts that are actually used by U-Boot usually don't change any more, so 
usually it's fine to use the kernel's dtb for U-Boot as well. In particular, for 
the imx8mm EVK, this is the case.


> There are specific details that differ between the two
> especially if you are trying to boot different kernels with differing
> support.

  If you're going to boot two different kernels, you're going to need two 
different Buildroot configurations anyway. So you're also going to have two 
different dtbs. Which one of those you're going to use for U-Boot, or maybe you 
use the dts that comes with U-Boot.


> It's always best to decouple these.

  They are decoupled by default. Normally you'd generate a U-Boot binary that 
has the dtb (as specified in the U-Boot config) linked in. I'm not sure why for 
imx8mmevk it's done differently.


> The other thing I'm
> noticing is that these scripts assume one dtb per image which is
> limiting.

  I think you're not entirely up to speed with what the configs/ and board/ 
directories are meant to be. They are just minimal example configurations to get 
a minimal working system on a specific board. The idea is that you start from 
such a config, boot it on the board to be sure you have a working baseline, and 
then start customising. In particular, it is not the intention to use the 
scripts in board/ as-is. You'd make a copy and adapt them to your specific needs.


> It looks like imx8mm-venice is the only U-Boot board that
> supports multiple dtbs for imx8mm but for imx6 there are many.
> 
> So I think we need a way to make linux.mk copy desired kernel dtbs to
> BINARIES_DIR separate from desired u-boot dtbs.

  This is already the case - cfr. BR2_TARGET_UBOOT_CUSTOM_DTS_PATH.

  What is maybe missing is to copy the U-Boot dtbs to BINARIES_DIR. Currently, 
it's assumed to be linked in with the U-Boot binary and not copied explicitly.


> This means we probably
> need different DTB defines for each.
> 
> I also don't see any bootscript creation facility in buildroot which
> seems to be something that may be desirable as well.

  Do you mean calling mkimage on a U-Boot script? That is done in e.g. 
board/boundarydevices/common/post-build.sh

  We don't have support in the Buildroot config for it, because there's just too 
many different ways that you want to generate boot scripts. It's much more 
flexible to do in a post-image script.


> For example the
> freescale_imx8mmevk_defconfig only boots because it's U-Boot default
> environment tries distro-config first which requires a bootscript then
> falls back to a hard-coded loading of the kernel/fdt from the
> filesystem thus no bootscript is needed. I'm not sure how many boards
> in U-Boot have a hard coded fallback like that?

  For most new boards we prefer to use the extlinux.conf approach. But in the 
end, it's mostly up to the person contributing the defconfig to use what they 
prefer.

  Regards,
  Arnout

> 
> Best regards,
> 
> Tim
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
