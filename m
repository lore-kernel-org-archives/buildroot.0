Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C1DC2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 20:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8380181ECB;
	Tue,  9 Jul 2024 20:58:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F2eMGmdx9RuH; Tue,  9 Jul 2024 20:58:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 689C381EBD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 689C381EBD;
	Tue,  9 Jul 2024 20:58:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DC01B1BF5DD
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 20:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C76E281EBD
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 20:58:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BS48OUq_Opag for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 20:58:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6AD4C81EB2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AD4C81EB2
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6AD4C81EB2
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 20:58:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0B7C41BF203;
 Tue,  9 Jul 2024 20:58:40 +0000 (UTC)
Date: Tue, 9 Jul 2024 22:58:40 +0200
To: Paresh Bhagat via buildroot <buildroot@buildroot.org>
Message-ID: <20240709225840.3f852ad5@windsurf>
In-Reply-To: <20240429092326.3247116-1-p-bhagat@ti.com>
References: <20240429092326.3247116-1-p-bhagat@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720558723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wIDUSErIqzBbRkvOM5chc6H7bQLzrAdB59sb1BLl3Dw=;
 b=GxA4JrbDcQ+wyp6NkPVIXXvRWdS0C9p7YbH2xOZOWiFWC4dA/M7qijwcoTMewEF9DqjzBJ
 49cr8+z2uf53g+LoYuW9agqrgAt7sO4B8VGUmkKDCzfP3lKx9RIcaIUuPMlaYWPJFrWF7w
 Jb78hDdmN/uwLiyiGxzsywLIkcECghZUvMWJmOunSTjxUdZp7BRiQpVEl08mw7nNJ8iLwX
 CUOmO1rgbs/SvwlMUsIj4BAeGZx5QLTRoapNak3XAEgFj2NNNxRS4vUuURlyNKPA0mNlCR
 8dw22o24Vp/feAWP7gyhieU8xaP2l3iTkyFJqDJqNv5LQWafKVe0ggtJbXCvBg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GxA4JrbD
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Bryan Brattlof <bb@ti.com>, Xuanhao Shi <X15000177@gmail.com>,
 Gyan Gupta <g-gupta@ti.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Chirag Shilwant <c-shilwant@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
 Syed Mohammed Khasim <khasim@ti.com>, Andreas Dannenberg <dannenberg@ti.com>,
 Sai Sree Kartheek Adivi <s-adivi@ti.com>, Romain Naour <romain.naour@smile.fr>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Paresh,

On Mon, 29 Apr 2024 14:53:26 +0530
Paresh Bhagat via buildroot <buildroot@buildroot.org> wrote:

> This commit introduces a new fragment config aimed at integration of TI trees
> into the existing configuration for am62x-sk. The fragment config is designed 
> to be merged with the current ti_am62x_sk_defconfig, enabling transition from 
> mainline to TI versions for U-boot and kernel.
> 
> The fragment config will be merged with existing ti_my_am62x_sk_defconfig
> using merge-config.sh script present in support/kconfig using following
> command.
> 
> ./support/kconfig/merge-config.sh configs/ti_am62x_sk_defconfig configs/ti_am62x_sk.config
> 
> It effectively changes uboot and kernel source from mainline version to TI 
> version hosted here
> 
> https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/?h=ti-linux-6.1.y
> https://git.ti.com/cgit/ti-u-boot/ti-u-boot/?h=ti-u-boot-2023.04
> 
> Furthermore, as ti-uboot 2023.04 is used, kernel Image and dtb is expected 
> in rootfs/boot/ and rootfs/boot/dtb/ti respectively. So add a new post-build
> script to copy these files to desired location. 
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>

Thanks for the patch. What you're proposing here is something we don't
do for any other platform, at least in this form. I believe if we want
to do this, we probably wouldn't want a fragment, but rather a complete
separate defconfig instead.

We do have something somewhat similar though in the NXP world:

- freescale_imx6ullevk_defconfig is a defconfig for the i.MX6ULL EVK
  platform that uses the vendor-provided U-Boot/kernel

- imx6ullevk_defconfig is a defconfig for the same eval board, but that
  uses mainline U-Boot/kernel

So we could potentially do something similar if we wanted to.

Alternatively, for some ST platforms, we have a defconfig in Buildroot
mainline that use upstream TF-A/U-Boot/Linux, and a separate
buildroot-external-st BR2_EXTERNAL with defconfigs that use the ST
provided BSP. I'm not saying we should always do like this as I also
believe defconfigs using vendor-provided BSP might make sense in
upstream Buildroot.

I'm not sure how we want to standardize things here. Arnout, Peter,
Yann, Romain, any opinion?

> diff --git a/board/ti/common/am6xx/ti_arm64_prune.config b/board/ti/common/am6xx/ti_arm64_prune.config
> new file mode 100644
> index 0000000000..ad41cda81c
> --- /dev/null
> +++ b/board/ti/common/am6xx/ti_arm64_prune.config
> @@ -0,0 +1,485 @@
> +# Add config flags here that appear in the multi_v7_defconfig but are not

I'm confused by this comment. multi_v7_defconfig is an ARM32 kernel
config, and here we're targeting an ARM64 platform.


> diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
> index fbe5d21540..3baa2f5e2e 100644
> --- a/boot/uboot/uboot.hash
> +++ b/boot/uboot/uboot.hash
> @@ -1,3 +1,4 @@
>  # Locally computed:
>  sha256  b99611f1ed237bf3541bdc8434b68c96a6e05967061f992443cb30aabebef5b3  u-boot-2024.01.tar.bz2
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
> +sha256  5c3ce409901b8b16204b02d538833dcb6c66729c0316b53848d0f15642a49266  uboot-ti-u-boot-2023.04-br1.tar.gz

We clearly wouldn't want the hash of the TI-specific U-Boot in
boot/uboot/uboot.hash. Use the BR2_GLOBAL_PATCH_DIR feature to provide
your own hash files, specific to this defconfig.

> diff --git a/linux/linux.hash b/linux/linux.hash
> index 4fa9f701cd..9c0d26aa71 100644
> --- a/linux/linux.hash
> +++ b/linux/linux.hash
> @@ -17,3 +17,4 @@ sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-
>  sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
>  sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/preferred/GPL-2.0
>  sha256  8e378ab93586eb55135d3bc119cce787f7324f48394777d00c34fa3d0be3303f  LICENSES/exceptions/Linux-syscall-note
> +sha256  3256bbd9eb9b3ffec10e8e013ed433e79adf83cf731677be7fcdd53e25d1db98  linux-ti-linux-6.1.y-br1.tar.gz

Same comment here for the Linux kernel.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
