Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8CA9C3DA4B
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 14:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E72080BC7;
	Mon, 15 Jul 2024 14:06:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lv2TLVC_8dF1; Mon, 15 Jul 2024 14:06:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EAC98128F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EAC98128F;
	Mon, 15 Jul 2024 14:06:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 719561BF3AD
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5ED3C60822
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:06:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lOKqq49SIXqr for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 14:05:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F134E60815
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F134E60815
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F134E60815
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 14:05:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BD5541BF20F;
 Mon, 15 Jul 2024 14:05:56 +0000 (UTC)
Date: Mon, 15 Jul 2024 16:05:55 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240715160555.6e88961e@windsurf>
In-Reply-To: <20240421095353.208034-2-dario.binacchi@amarulasolutions.com>
References: <20240421095353.208034-1-dario.binacchi@amarulasolutions.com>
 <20240421095353.208034-2-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721052357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bew21MNoNyf3RLARzags4YNaeGDgN/wkGb7G3JrOHYk=;
 b=C3Ven2W3vijV9VSOBQlC3CYybVGTqREADMbEvt9V1l7QFgvemTDSAJhScNYnRqCaPZKCjD
 44xGA3SPLNb9btkznz4WdaZ+P+bH19aZsBMXfn3kqgjYPzmKPIAakjD/4HyBUvgSjFW3su
 zF6UG1CR12p4eA1l0q/jqD2gUrzfrRUBRo83nucSzBM06vEhyy/dpHdvmJWrc7XsvhpceY
 5IAUtSR9gbJMzX+MkYGxFEHLW/2p7APz65NWihjzesKUKOvWnmH7wL5rQJF5JpRnztMkHG
 ZfXW2YUjb2MYZzYp5ePnI/IsaMK8f3RgrUfExpFgfA0sK/B6NEjc58rukP88iQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=C3Ven2W3
Subject: Re: [Buildroot] [RFC PATCH 1/2] support/scripts/genimage.sh:
 support creating a bmap image
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
Cc: Xuanhao Shi <X15000177@gmail.com>, Anand Gadiyar <gadiyar@ti.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Dario,

On Sun, 21 Apr 2024 11:53:52 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> The patch adds an option to create, in addition to the usual image, an
> image of type bmap that drastically reduces the amount of data that
> needs to be written to an SD card, resulting in time savings.
> 
> This makes it possible to activate this option easily and maintain
> backward compatibility for all configurations already using the genimage
> tool for creating the image to be written to the SD card:
> 
> BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/<manufacturer>/<boardname>/genimage.cfg -b"
> +BR2_PACKAGE_HOST_BMAP_TOOLS=y
> 
> It follows that the script now assumes a broader functionality that
> extends beyond just being an interface for the genimage tool.
> 
> An alternative implementation could have been to create another script,
> such as support/scripts/bmap.sh, capable of creating the bmap image
> using the same parameters passed to support/scripts/genimage.sh (i. e.
> -c board/<manufacturer>/<boardname>/genimage.cfg). However, in this case,
> the script would also need to know that the image is located in the
> ${BINARIES} directory. This could be achieved by adding an additional
> parameter, but it might cause genimage.sh to fail due to an unrecognized
> parameter.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

We took advantage of the on-going Buildroot hackathon to discuss live,
and we pushed your patch, but with some changes:

(1) We don't add an option to script, but rather we look in the
Buildroot .config file is host-bmap-tools has been enabled. If it is
enabled, we assume the user wants bmap images

(2) We generate bmap images for all images, as long as they exist in
$(BINARIES_DIR). Indeed your trick of counting how many times the name
of the image was referenced in the genimage.cfg to try to guess what is
the "final" image (like sdcard.img) would fail badly if the final image
was:

image a {

}

because the image name "a" is probably found more than once in the
genimage.cfg.

However, with that, we are not going to apply your PATCH 2/2, because
we don't want to force everyone to build host-bmap-tools. Now everyone
only has to enable BR2_PACKAGE_HOST_BMAP_TOOLS=y in their configuration
to automagically get bmap-capable images generated. Perhaps what should
be done now is to document this somewhere in the manual. The question
is of course where to document it, and on that I'm not sure.

Note: it might be relevant to also adjust the filesystem generation
code in fs/common.mk to also generate a bmap-capable image of the
rootfs image itself, also based on the availability of host-bmap-tools.

Thanks for your work!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
