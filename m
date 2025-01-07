Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED06CE77197
	for <buildroot@archiver.kernel.org>; Tue,  7 Jan 2025 17:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94EEA606F2;
	Tue,  7 Jan 2025 17:27:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3O2A9o-emtMp; Tue,  7 Jan 2025 17:27:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60FB760704
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60FB760704;
	Tue,  7 Jan 2025 17:27:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B47CBDB4
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 17:27:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1FB480F09
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 17:27:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5kdA315uQxfQ for <buildroot@buildroot.org>;
 Tue,  7 Jan 2025 17:27:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F23A580573
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F23A580573
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F23A580573
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 17:27:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5DE7BFF804;
 Tue,  7 Jan 2025 17:27:00 +0000 (UTC)
Date: Tue, 7 Jan 2025 18:26:59 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20250107182659.0a95c4e3@booty>
In-Reply-To: <20250107063136.787314-5-neal.frager@amd.com>
References: <20250107063136.787314-1-neal.frager@amd.com>
 <20250107063136.787314-5-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1736270820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rXBipzFk8vA3z06B5HlFsOzoN9MpWprJ9+k8KN+1MFk=;
 b=IVOQJFwxLA+vW3RuxoCd/bXRMOB9edslS3OqK4zoQ/kl4Ma46F/6edkVPhsf+dXf69OFgO
 WvacfeyBKTGWi7e3Oo24zYKnQO0n6I+r6wtibrCE6XYr48Ves20+KMLsrZw6E7pBLFzGcc
 EvMhSXlFjaGDL2c7YihloIcUObBBOmqF65C/vVR1llbNqfYws6/0dIXr091HPiWec44S5v
 zCZX2IG7+nvBPra8neAuUoFHWLiOUhlLCtSX1sFxu5jtJnFQ0chTo2N1MAiu+V4GztNIKa
 7a6Bsgb80OcD63TJtK78fr85Qf22rRvWD7NS5SZCUYtv9EmJWgF+02Pz+6+w3g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IVOQJFwx
Subject: Re: [Buildroot] [PATCH v4 5/6] board/zynqmp: add new qspi.bin
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org, romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 7 Jan 2025 06:31:35 +0000
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
