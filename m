Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C9A2C433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 07:33:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D3F961019
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 07:33:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8D3F961019
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36B7E404B5;
	Sat, 18 Sep 2021 07:33:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VACvLa3oT8tO; Sat, 18 Sep 2021 07:33:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68AFA4048C;
	Sat, 18 Sep 2021 07:33:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 59A531BF866
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 07:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4771084321
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 07:33:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fVqZupJMoKI3 for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 07:33:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E87648431C
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 07:33:40 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed4a:2560:2180:38b6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 9DACFB00563;
 Sat, 18 Sep 2021 09:33:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631950417;
 bh=b+y4cx+3nm9KGkkpz7t8oqQNHPHd2GA8naa7CJK8VSg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K9L9v9HfxNF1yjWsoYOKWGAtAhlv3piEBLO4xRXfV/Da+Xmu/WjC1bv7/A6vyUxzO
 g4eLpx1o3Spv8yWKUGJJTBzLEJTfH6gVnUhzf7z1M9zFgPtOe8T5hj0teYwFosavfL
 C39VEHB/YsIrnHncEkOaads7sITY5QTA1roA+rnbLAHqx9V5zJBUVGKVpznj1BShB4
 HON76qZ8PYQQG8gh9PIKoVXFont/o3gyltist7FSPi6rIs/AwENEGHWK46hEN8wyjw
 O2WdMX5X6RW4ZNfdncv8bcTC+Xx1hWlRlgZztdGoDsCArn4GAe+RJ1mvcalXFIfc5m
 d8MRp5CdFQ/4A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Sep 2021 09:33:33 +0200
Date: Sat, 18 Sep 2021 09:33:33 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Hanspeter Portner <dev@open-music-kontrollers.ch>
Message-ID: <20210918073333.GE1053080@scaer>
References: <20210917131851.31717-1-dev@open-music-kontrollers.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210917131851.31717-1-dev@open-music-kontrollers.ch>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] linux: add compressions for appended
 initramfs
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hanspeter, All,

On 2021-09-17 15:18 +0200, Hanspeter Portner spake thusly:
> This changes take effect in the case of BR2_TARGET_ROOTFS_INITRAMFS=y
> and one of BR2_LINUX_KERNEL_{GZIP,LZ4,LZMA,LZO,XZ}=y.
> 
> Instead of using the kernel's default compression (gzip) for appended initramfs,
> this changes set initramfs compression explicitely to the same compression as
> the kernel itself, which seems a sensible thing to do, imho.

Hmmm... But isn't the initranfs compressed as part of the kernel
already? See help for CONFIG_INITRAMFS_COMPRESSION_NONE:

    Do not compress the built-in initramfs at all. This may sound
    wasteful in space, but, you should be aware that the built-in
    initramfs will be compressed at a later stage anyways along
    with the rest of the kernel, on those architectures that support
    this. However, not compressing the initramfs may lead to slightly
    higher memory consumption during a short time at boot, while both
    the cpio image and the unpacked filesystem image will be present
    in memory simultaneously

Additionally, compressing the initramfs separately, means that it will
be copmopressed twice at build time, thus increasing the build time (but
who cares? ;-) ), but also means it will be decompressed twice, thus
increasing the boot time, every time the device boots.

So, forcibly setting the compression to that of the kernel seems totally
superfluous, _as kernel image size matters_; indeed, simply disabling
initramfs compression (actually, cpio compression) would seem like the
only correct thing to do.

The only reason when we would want to actually compress the initramfs,
as hinted in the help text I quoted above, is for machines that are
tight on RAM, so tight indeed that they can't easily fit the whole
uncompressed cpio and the extracted initramfs at the same time at boot
(the uncompressed cpio is eventually garbage-collected once the
initramfs is fully populated).

Nowadays, that probably means machine with less than a very few MiB of
RAM, something around 4MiB. Those kind of machines do exist, but they
are often better served without using an initramfs (i.e. a root on a
flash or something), or are going to require a very tiny initramfs
anyway.

So, I wonder if we should not simply disable compression of the
initramfs altogether...

Could look into that, and look at actual numbers for the resulting
kernel image when the initramfs is compressed or not?

Regards,
Yann E. MORIN.

> Apart from these kernel config parameters ...
> 
> * CONFIG_KERNEL_GZIP
> * CONFIG_KERNEL_LZ4
> * CONFIG_KERNEL_LZMA
> * CONFIG_KERNEL_LZO
> * CONFIG_KERNEL_XZ
> * CONFIG_KERNEL_ZSTD
> * CONFIG_KERNEL_UNCOMPRESSED
> 
> ... we now also set these new kernel config parameters, as without those,
> the appended initramfs seems to always be compressed with gzip:
> 
> * CONFIG_INITRAMFS_COMPRESSION_GZIP
> * CONFIG_INITRAMFS_COMPRESSION_LZ4
> * CONFIG_INITRAMFS_COMPRESSION_LZMA
> * CONFIG_INITRAMFS_COMPRESSION_LZO
> * CONFIG_INITRAMFS_COMPRESSION_XZ
> * CONFIG_INITRAMFS_COMPRESSION_NONE
> 
> The former are automatically set depending on whether one of the
> following buildroot config parameters is set analogously to how it is done
> for CONFIG_KERNEL_{GZIP,LZ4,LZMA,LZO,XZ,ZSTD,UNCOMPRESSED}:
> 
> * BR2_LINUX_KERNEL_GZIP
> * BR2_LINUX_KERNEL_LZ4
> * BR2_LINUX_KERNEL_LZMA
> * BR2_LINUX_KERNEL_LZO
> * BR2_LINUX_KERNEL_XZ
> * BR2_LINUX_KERNEL_UNCOMPRESSED
> 
> Signed-off-by: Hanspeter Portner <dev@open-music-kontrollers.ch>
> ---
>  linux/linux.mk | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 61fdc0c76c..f192341a32 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -106,6 +106,15 @@ LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_XZ) += CONFIG_KERNEL_XZ
>  LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_ZSTD) += CONFIG_KERNEL_ZSTD
>  LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_UNCOMPRESSED) += CONFIG_KERNEL_UNCOMPRESSED
>  
> +INITRAMFS_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_GZIP) += CONFIG_INITRAMFS_COMPRESSION_GZIP
> +INITRAMFS_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_LZ4) += CONFIG_INITRAMFS_COMPRESSION_LZ4
> +INITRAMFS_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_LZMA) += CONFIG_INITRAMFS_COMPRESSION_LZMA
> +INITRAMFS_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_LZO) += CONFIG_INITRAMFS_COMPRESSION_LZO
> +INITRAMFS_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_XZ) += CONFIG_INITRAMFS_COMPRESSION_XZ
> +# zstd compression seems not supported, yet
> +#INITRAMFS_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_ZSTD) += CONFIG_INITRAMFS_COMPRESSION_ZSTD
> +INITRAMFS_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_UNCOMPRESSED) += CONFIG_INITRAMFS_COMPRESSION_NONE
> +
>  ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL),y)
>  LINUX_DEPENDENCIES += host-openssl
>  endif
> @@ -352,6 +361,10 @@ define LINUX_KCONFIG_FIXUP_CMDS
>  		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,"$${BR_BINARIES_DIR}/rootfs.cpio")
>  		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_UID,0)
>  		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_GID,0))
> +		$(call KCONFIG_ENABLE_OPT,$(strip $(INITRAMFS_COMPRESSION_OPT_y)))
> +		$(foreach opt, $(INITRAMFS_COMPRESSION_OPT_),
> +			$(call KCONFIG_DISABLE_OPT,$(opt))
> +		)
>  	$(if $(BR2_ROOTFS_DEVICE_CREATION_STATIC),,
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS)
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT))
> -- 
> 2.33.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
