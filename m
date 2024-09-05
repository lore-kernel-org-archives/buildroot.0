Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9544ACE7A99
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 20:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5744E400AE;
	Thu,  5 Sep 2024 20:17:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PyPOfTVOot5q; Thu,  5 Sep 2024 20:17:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F4CF400E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F4CF400E4;
	Thu,  5 Sep 2024 20:17:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 60D781BF41B
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 20:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E4FC400E4
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 20:17:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xPgnHlMPJpSe for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 20:17:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ECAFF400AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECAFF400AE
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ECAFF400AE
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 20:17:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F131D20003;
 Thu,  5 Sep 2024 20:17:03 +0000 (UTC)
Date: Thu, 5 Sep 2024 22:17:03 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240905221703.2c85a70e@windsurf>
In-Reply-To: <ZtoM6k0EaDsZa4mV@landeda>
References: <20240904205354.504964-1-yann.morin.1998@free.fr>
 <20240905213522.2a476624@windsurf> <ZtoM6k0EaDsZa4mV@landeda>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725567424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7aJ9irbnsVhH9Twa5mMjWr7r0cMspg8i1qjL5jPEY5Q=;
 b=N5n8/WnEGswVN9ADFX7D1LFPCsnscMZ1s8dQC2UZmyn9CS+lnWPG3DL56No9oWXS6PJ/A6
 EigMZu3tX0KWw75FEq6UJLtNKshwJ3YUTxPMTwCx1GiPaNmhBCQ96FmtoA7qoBkufLKZw1
 YAkGePyKYmKWJ0jVFYninlWkR+gVQBp4PrJIGGX8wi1hQVRcBMCwqYgwRQnnHLffTGOEEo
 JjEpxmSDnMMYteqdu6n1xdhJY+vnK+mtQjF5XHTDkjjVpMLDmgQ6nv/ILsd628wAGcx76D
 P8bSzYllhAO2DkskoGg5qXbBOs4qgydNIXPhZJK+xrmNUn325AfaGu7xAqBTlg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=N5n8/WnE
Subject: Re: [Buildroot] [PATCH v3] docs/manual: use space-separated list
 for BR2_EXTERNAL
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
Cc: "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>,
 Brandon Maier <Brandon.Maier@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 5 Sep 2024 21:56:26 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> The thing is that all the other lists are space-separated:
>     BR2_ROOTFS_DEVICE_TABLE
>     BR2_ROOTFS_STATIC_DEVICE_TABLE
>     BR2_TARGET_TZ_ZONELIST
>     BR2_ROOTFS_USERS_TABLES
>     BR2_ROOTFS_OVERLAY
>     BR2_ROOTFS_PRE_BUILD_SCRIPT
>     BR2_ROOTFS_POST_BUILD_SCRIPT
>     BR2_ROOTFS_POST_FAKEROOT_SCRIPT
>     BR2_ROOTFS_POST_IMAGE_SCRIPT
> 
> The list goes on and on, notably the options to specify the lists of
> .config fragments for the kernel, uclibc, uboot etc...

I agree, but these are Buildroot menuconfig options, not something
passed on the command line.

That being said, it's a matter of taste, so I will not oppose to the
change.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
