Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1277CC52D70
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 21:28:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD0BD60608;
	Tue,  6 Aug 2024 21:28:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vtiRYSYBkr1d; Tue,  6 Aug 2024 21:28:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1FB760612
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1FB760612;
	Tue,  6 Aug 2024 21:28:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 253E11BF30B
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 21:28:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 125D740373
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 21:28:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yWIdeQgCf-jj for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 21:28:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 669B540288
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 669B540288
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 669B540288
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 21:28:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0E96BE0002;
 Tue,  6 Aug 2024 21:28:43 +0000 (UTC)
Date: Tue, 6 Aug 2024 23:28:42 +0200
To: Dong Wang <wangdong115@foxmail.com>
Message-ID: <20240806232842.4a04d4ca@windsurf>
In-Reply-To: <tencent_7E39529BBE1BB50CB4AA2A429702629C0808@qq.com>
References: <tencent_7E39529BBE1BB50CB4AA2A429702629C0808@qq.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722979724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xHESXuwMew05At+dP+HE/c2+OAyqNcVjpniXkzYa28U=;
 b=Q3ZKH8dohi9FdZC+0omZtU+OTjtO/oKicgT4HI+e5OVANwxGLzHHcCkpoBzGbrRP9ujNQ2
 tgStd/ugtmtmcsmxYgAHS1gmnTDg5Mt/UvxvS5Yd/CDNWUoLMgr0jCZ/9wmiz6YlzpirxG
 Yt4AaXYin/sJdtFBv2tSxbxO9okz9Go+QSIzch53/2enYv3LBxDCjfjmNoeYU45xUrGK7G
 FyI65TYRyPq5lohkA2MiKrJ8RQ28gNdZ/ex21oDPJ7SCH4ESqx1YB3hSU6bzSrMRgQtEEQ
 7ocNsOldBbu42CdP2hMDvI1f9A3tu3RbCC/B2QOV7+Gnl1co01B8xpAMajSYPw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Q3ZKH8do
Subject: Re: [Buildroot] [PATCH] configs/friendlyarm_nanopi_neo_defconfig:
 new defconfig
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Dong,

First of all, thanks a lot for your contribution and patch submission,
and sorry for the delay with which we are getting back to you. I only
have a few comments below.

On Wed, 15 May 2024 08:52:31 +0800
Dong Wang <wangdong115@foxmail.com> wrote:

> This patch adds a new defconfig for the NanoPi NEO board made by
> FriendlyARM. This board is based on the Allwinner H3 SoC.
> 
> See: https://wiki.friendlyelec.com/wiki/index.php/NanoPi_NEO
> 
> .

This empty line with a dot seems quite useless, could you drop it?

> 
> This patch uses the mainline kernel and u-boot for the board.
> 
> The configurations are based on the previously dropped defconfig
> maintained by Yann E. MORIN <yann.morin.1998@free.fr>.
> 
> Signed-off-by: Dong Wang <wangdong115@foxmail.com>


> diff --git a/board/friendlyarm/nanopi-neo/boot.cmd b/board/friendlyarm/nanopi-neo/boot.cmd
> new file mode 100644
> index 0000000000..8c199ed480
> --- /dev/null
> +++ b/board/friendlyarm/nanopi-neo/boot.cmd
> @@ -0,0 +1,5 @@
> +setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait panic=10
> +
> +load mmc 0:1 ${fdt_addr_r} ${fdtfile}
> +load mmc 0:1 ${kernel_addr_r} zImage
> +bootz ${kernel_addr_r} - ${fdt_addr_r}

Could you drop this custom U-Boot script, and use extlinux.conf like we
try to do in most new defconfigs?

> diff --git a/board/friendlyarm/nanopi-neo/genimage.cfg b/board/friendlyarm/nanopi-neo/genimage.cfg
> new file mode 100644
> index 0000000000..4cfd8c8fc2
> --- /dev/null
> +++ b/board/friendlyarm/nanopi-neo/genimage.cfg
> @@ -0,0 +1,36 @@
> +# Minimal SD card image for the NanoPi NEO.
> +image boot.vfat {
> +	vfat {
> +		files = {
> +			"zImage",
> +			"sun8i-h3-nanopi-neo.dtb",
> +			"boot.scr"
> +		}
> +	}
> +
> +	size = 16M
> +}
> +
> +image sdcard.img {
> +	hdimage {
> +	}
> +
> +	partition u-boot {
> +		in-partition-table = false
> +		image = "u-boot-sunxi-with-spl.bin"
> +		offset = 8K
> +		size = 1000K # 1MB - 8KB(offset) - 16KB(GPT)
> +	}
> +
> +	partition boot {
> +		partition-type = 0xC
> +		bootable = "true"
> +		image = "boot.vfat"
> +	}

Could you drop entirely this VFAT partition, and have the kernel + DTB
+ extlinux.conf directly in the rootfs, and U-Boot directly load
extlinux.conf from this ext4 filesystem?

> +	partition rootfs {
> +		partition-type = 0x83
> +		image = "rootfs.ext4"
> +		size = 512M

Leave out the size = argument, it isn't very useful to have a larger
partition, but a filesystem that is smaller than that size.

All of the rest really looks good to me. Could you just address the
above comments, and submit a v2 ?

Thanks a lot for your contribution and effort!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
