Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2487AC25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 19:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA5984177F;
	Fri, 10 May 2024 19:54:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8GW3MJfhBu0u; Fri, 10 May 2024 19:54:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B67D4213F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B67D4213F;
	Fri, 10 May 2024 19:54:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CB16F1BF390
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 19:54:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4C4E6164D
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 19:54:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kaKyTVDHT6xk for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 19:54:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7E4646062C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E4646062C
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E4646062C
 for <buildroot@buildroot.org>; Fri, 10 May 2024 19:54:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4E64D1BF203;
 Fri, 10 May 2024 19:54:43 +0000 (UTC)
Date: Fri, 10 May 2024 21:54:42 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240510215442.3475120a@windsurf>
In-Reply-To: <20240421095353.208034-2-dario.binacchi@amarulasolutions.com>
References: <20240421095353.208034-1-dario.binacchi@amarulasolutions.com>
 <20240421095353.208034-2-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715370884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5pqPjGWmvSqijsQLBXEjyLyRiJfFBhwNZop0h+jueaY=;
 b=oXgb2Ir7JJ+RntMOSkqPwStjGqrjZPCXgDuFmNyAIWOQVUvrIXBDpK7AtKpbTvDYN6DbTa
 nC05d3GXx2jiRJsP0xl9s8mSLAwFwzb5rTw95zB+bQ3P5cmoHfojHEhU53UX5TIMS9YJL/
 +73bNGjk1FOrOcQTMhhgTBTIX99tfEayjs1VTPgiK38v+DojF6+3mi8lYxu6MucU5kp3cD
 kltUewTXYf+PshqVW34BPSTXHzvpsg4wpcyXNXHrfUtkit/hmLbzNnNiCiI+kYsIHvl8Gz
 rJ3rKkpy/7L7MQG8coQgNB49rjCsvTKd/BfiiDUBXWNpNC4YR6BrYQjPiEjB6w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oXgb2Ir7
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
Cc: Xuanhao Shi <X15000177@gmail.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@smile.fr>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, "Yann E.
 MORIN" <yann.morin.1998@free.fr>, Anand Gadiyar <gadiyar@ti.com>
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

Thanks for this proposal! Actually, I very much like the idea of
extending the usage of bmap-tools in Buildroot. I think it's a great
tool, and it makes a lot of sense to encourage more of its use.

Now the question is how to do this. To me your proposal looks
reasonable, though some people had the feedback that bmap-tools will
not work in all cases (should we then gracefully handle this failure
case?).

Arnout, Yann, Peter, Romain, what do you think? Do you see other
approaches to easily allow generating bmap-compatible images?

Another question, perhaps for Dario, or other people familiar with
genimage: if the rootfs.ext4 generated by Buildroot is sparse, is
genimage able to preserve the "holes" when generating the sdcard.img
that includes the rootfs.ext4 ?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
