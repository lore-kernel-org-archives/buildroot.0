Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48F0C2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 20:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35DAF81EB2;
	Tue,  9 Jul 2024 20:51:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bxmAYjrLiCyl; Tue,  9 Jul 2024 20:51:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35FAF81EDB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35FAF81EDB;
	Tue,  9 Jul 2024 20:51:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 493A41BF5DD
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 20:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3580140BD3
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 20:51:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SupVJCFKC69B for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 20:51:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 47B9F40BC3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47B9F40BC3
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 47B9F40BC3
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 20:51:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5F931FF802;
 Tue,  9 Jul 2024 20:51:12 +0000 (UTC)
Date: Tue, 9 Jul 2024 22:51:11 +0200
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Message-ID: <20240709225111.10f5f98b@windsurf>
In-Reply-To: <20240426213551.1106068-1-fiona.klute@gmx.de>
References: <20240426213551.1106068-1-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720558272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ebposi4TfPLOoGeaqtgJvIWiWT/kmD5GEnRTPnrJNg8=;
 b=LBxIgOP5D8cz4rG0hQkbAgh/mjbfGt7exxX2cwB2YEtxDoZZKOXMigNhuCR49Jm8fhOYi7
 /eqZ6Gydy0IB3Hq9T48PTWuLSptgq413TUqJ3/KVwTmJhCoEvje0tYKzN9rNAtj+zyGrxe
 pvo03aEAefZ5SSy6jGvE9uXOgsfwGzCwWnQQRlrCqWb/6xNdn2nRhmyWaeXxITUhbJISV8
 sg7i8kn4NIzTQj50qyx0dfkBQKIYaoVX9/1f3K/8MFy2TnKmnTbjRIhW+b6Vd7OC4W4BFG
 CQnqFYkzCEAdYy62sUaYyhNEX1jri0rjQ//EKvVPVf+0G8mYwNW61rUaLKy/WQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LBxIgOP5
Subject: Re: [Buildroot] [PATCH 1/1] package/raspberrypi-usbboot: bump
 version to 20221215-105525
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
Cc: Fiona Klute <fiona.klute+wiwa@gmx.de>, fiona.klute@gmx.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 26 Apr 2024 23:35:51 +0200
Fiona Klute via buildroot <buildroot@buildroot.org> wrote:

> From: Fiona Klute <fiona.klute+wiwa@gmx.de>
> 
> The "msd" (mass storage device) firmware files in 2021.07.01 don't
> work with some newer CM4 based devices, the one I had issues with is a
> RevPi Connect 4. Updating fixes the issue. Mass storage device mode is
> required to flash the eMMC of CM4 devices.
> 
> Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>
> ---
>  ...001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch | 14 +++++++++-----
>  .../raspberrypi-usbboot/raspberrypi-usbboot.hash   |  2 +-
>  package/raspberrypi-usbboot/raspberrypi-usbboot.mk |  4 ++--
>  3 files changed, 12 insertions(+), 8 deletions(-)

For some reason, your changes on the patch 0001 did not apply, so I
fixed that up manually when applying. Patch is now applied. Thanks and
sorry for the delay!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
