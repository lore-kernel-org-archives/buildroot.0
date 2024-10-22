Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 116CECDD0F4
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 20:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF4DE60604;
	Tue, 22 Oct 2024 20:49:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ktl-C--eEgKD; Tue, 22 Oct 2024 20:49:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D243260640
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D243260640;
	Tue, 22 Oct 2024 20:49:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 716CF59F4
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5144C60640
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:49:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tbgriS18lOpT for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 20:49:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F3BE160604
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3BE160604
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F3BE160604
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:49:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8078A60003;
 Tue, 22 Oct 2024 20:49:47 +0000 (UTC)
Date: Tue, 22 Oct 2024 22:49:45 +0200
To: Niklas Cassel via buildroot <buildroot@buildroot.org>
Cc: Niklas Cassel <niklas.cassel@wdc.com>, Niklas Cassel
 <cassel@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, Kilian Zinnecker
 <kilian.zinnecker@mail.de>
Message-ID: <20241022224945.4dc67b89@windsurf>
In-Reply-To: <20241016132443.3859149-4-niklas.cassel@wdc.com>
References: <20241016132443.3859149-1-niklas.cassel@wdc.com>
 <20241016132443.3859149-4-niklas.cassel@wdc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729630188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qxKltaQL1Rvv6riGrPQD+fucA/RBTbAQKaFlqU75bCw=;
 b=XE4uAjXarupPGNddU2XrCr9kyuW1XCPQq845pcpGBz8N05FqYd9i9p0JhYZWe40+jHBTR8
 DBNTKrOUUT/zG9lB0cYzYvRoDu6HciRBP/5MP6vpvSwPJSx9LKXxy6qxAj/FjeGHhu5/Je
 NkyfAVuKjI6JppfPhSWr3bnud70jgsrve9NnjKq/w2FygoZpsRZ6YCeo/ODQ7lZn9LZHBr
 eeGdVb2qi41hns6nRD2tgG5yUUH3ak0wcmzV6Db2ZyB2ls5pN19C7wlVo8HDnMSTD2p+16
 lcdxkxO+Q5Spse+WJPNHPJq/+W7IyGg0+q9ppT/4Jvzs5wdsABDIIrVJGK40RQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XE4uAjXa
Subject: Re: [Buildroot] [PATCH v3 3/4] configs/rock5b: use the arm64 rootfs
 partition-type-uuid
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Niklas,

On Wed, 16 Oct 2024 15:24:42 +0200
Niklas Cassel via buildroot <buildroot@buildroot.org> wrote:

> diff --git a/board/radxa/rock5b/genimage.cfg b/board/radxa/rock5b/genimage.cfg
> index 43bb65bdd9..8c56251135 100644
> --- a/board/radxa/rock5b/genimage.cfg
> +++ b/board/radxa/rock5b/genimage.cfg
> @@ -12,7 +12,7 @@ image sdcard.img {
>  	}
>  
>  	partition rootfs {
> -		partition-type-uuid = L
> +		partition-type-uuid = root-arm64

In principle, this looks fine, but this "breaks" the pattern that we
have document in the Buildroot manual at
https://buildroot.org/downloads/manual/manual.html#writing-genimage-cfg:

   For GPT partitions, the partition-type-uuid value must be U for the
   EFI System Partition (expanded to
   c12a7328-f81f-11d2-ba4b-00a0c93ec93b by genimage), F for a FAT
   partition (expanded to ebd0a0a2-b9e5-4433-87c0-68b6b72699c7 by
   genimage) or L for the root filesystem or other filesystems
   (expanded to 0fc63daf-8483-4772-8e79-3d69d8477de4 by genimage). Even
   though L is the default value of genimage, we prefer to have it
   explicitly specified in our genimage.cfg files. Finally, these
   shortcuts should be used without double quotes, e.g
   partition-type-uuid = U. If an explicit GUID is specified,
   lower-case letters should be used. 

That being said, we already have a few genimage.cfg files that use
b921b045-1df0-41c3-af44-4c6f280d3fae which is root-arm64:

board/aarch64-efi/genimage-efi.cfg:             partition-type-uuid = b921b045-1df0-41c3-af44-4c6f280d3fae
board/arm/fvp-ebbr/genimage.cfg:                partition-type-uuid = b921b045-1df0-41c3-af44-4c6f280d3fae
board/pine64/rockpro64/genimage.cfg:            partition-type-uuid = b921b045-1df0-41c3-af44-4c6f280d3fae
board/qemu/aarch64-ebbr/genimage.cfg:           partition-type-uuid = b921b045-1df0-41c3-af44-4c6f280d3fae
board/qemu/aarch64-sbsa/genimage.cfg:           partition-type-uuid = b921b045-1df0-41c3-af44-4c6f280d3fae

My point is that we want *consistency*. So either we use "L" for all
rootfs partitions. Or we use root-${ARCH} for all rootfs partitions.
But we don't use "L" for some, "root-${ARCH}" for some others, and a
complete UUID in the matching a known root-${ARCH} for yet some others.
I don't have a strong opinion either way between L or root-${ARCH}, all
I'm expecting is consistency, between the defconfigs, and with the
manual.

Do you want to tackle this? :-)

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
