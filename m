Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD07C02182
	for <buildroot@archiver.kernel.org>; Mon, 20 Jan 2025 21:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B133F40682;
	Mon, 20 Jan 2025 21:00:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mo1pVMypBYpo; Mon, 20 Jan 2025 21:00:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A9C341231
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A9C341231;
	Mon, 20 Jan 2025 21:00:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 59F13959
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 21:00:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3AEAA40663
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 21:00:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ewHkcUYMsnA for <buildroot@buildroot.org>;
 Mon, 20 Jan 2025 21:00:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E9AB340682
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9AB340682
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E9AB340682
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 20:59:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7EDC640002;
 Mon, 20 Jan 2025 20:59:57 +0000 (UTC)
Date: Mon, 20 Jan 2025 21:59:56 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20250120215956.5c4c2540@booty>
In-Reply-To: <20250117080009.774814-5-neal.frager@amd.com>
References: <20250117080009.774814-1-neal.frager@amd.com>
 <20250117080009.774814-5-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1737406798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a0ULoMEZAf0leegEIFgOvu/IEQQCgoC0JBxD7ALTWlE=;
 b=Hc907zCh7CV5j+xfF8dtdXU6yYPus5TJsQKyHLQJ5MUNSMTIAYnX1lhY6EctLrjnCRn0+a
 o0b7L8W6oSWUTnSFsdYOQyzG7KxZFG3bosDxZ6lvFzJYDrBDdh3CO6nxJv96/usM4o4hpL
 /MNH8lUYbbUYwXSnqCY2mYp/ZhVmmYN8drhYtJwte5feoc1oAM5d+PuUPdB5NBlboi0QuH
 JapIyPHSemL6ePA/wkLZ9HEnRFH5K7C96qvDUXjWjT9uADJ1WvEtS3MTC+61MUC9JAj60N
 exBbK5HefLZTG9GxcX1ZXTqsisiYXSmPWK2cdXKhZWcYv9spy9+4rBlM/vt7Hw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Hc907zCh
Subject: Re: [Buildroot] [PATCH v5 5/6] board/zynqmp: add new qspi.bin
 binary to images
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
Cc: ibai.erkiaga-elorza@amd.com, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org, romain.naour@smile.fr,
 michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 17 Jan 2025 08:00:08 +0000
Neal Frager <neal.frager@amd.com> wrote:

> This patch adds the new qspi.bin file to the zynqmp sdcard.img.
> 
> For SD card booting, the qspi.bin file is unnecessary and can just be ignored.
> For QSPI booting, only the qspi.bin file needs to be written to the flash.
> 
> This patch enables the Kria BIRT tool for Kria SOM reflashing using qspi.bin
> as either "ImageA" or "ImageB".
> 
> Kria BIRT (Boot Image Recovery Tool):
> https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1641152513/Kria+SOMs+Starter+Kits#Boot-FW-Update-Process
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

[Tested on Kria KV260 starter kit]
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
