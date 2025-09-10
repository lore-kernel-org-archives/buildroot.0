Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A2FCAC58C
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 07:58:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9ED1A60B8C;
	Wed, 10 Sep 2025 07:58:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NTZSFKyZtqMI; Wed, 10 Sep 2025 07:58:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A459960D5E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A459960D5E;
	Wed, 10 Sep 2025 07:58:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 329C910E
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 07:58:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24A79404ED
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 07:58:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sDqbkh3kd9g6 for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 07:58:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 139A84048A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 139A84048A
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 139A84048A
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 07:58:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id E49054E40BBC;
 Wed, 10 Sep 2025 07:49:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AE03F606D4;
 Wed, 10 Sep 2025 07:49:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F04BB102F28B7; 
 Wed, 10 Sep 2025 09:49:00 +0200 (CEST)
Date: Wed, 10 Sep 2025 09:48:59 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20250910094859.29267e77@booty>
In-Reply-To: <20250904211239.1928818-3-neal.frager@amd.com>
References: <20250904211239.1928818-1-neal.frager@amd.com>
 <20250904211239.1928818-3-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757490545; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=F65KNtKlksiT/atZD/7UH4zgrD7UjBAxotqh2FxrtP4=;
 b=QsNWkWaAQz0mAU4SbZT/OMlIPkBQpHZIo7WETYyJrazq96RPF2Y7vqhLXtWGloBrDfY46q
 qcm5wvk92dEhNSYYqwOANN7Bis6xOzJRT5vlnnEaw3xAc+8U6Ykvp3UNWEY7+bmTQuJ7gM
 6znksazNxbwGNmLX9woceGtaz67BleGBLZlEPsAWrP8vDiY6HOoV/lIM+CUwSZkVjculgj
 e7OLn+H0k+SAs0XRKRsk3KRRpJnm7ytrdJ2/Rpf7kEkjPPnJlI+ikqhPjfaJDuvFsMWrYk
 WF2yiJ30zdkbkkMQ+FnZu7l1z4zrtpgxPS49iyJnBFzDSEqdTDvBXPdNsMLarg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=QsNWkWaA
Subject: Re: [Buildroot] [PATCH v4 3/4] configs/versal_vek280: bump
 xilinx-prebuilt to xilinx_v2025.1_update1
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
Cc: yann.morin@orange.com, ibai.erkiaga-elorza@amd.com, buildroot@buildroot.org,
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 4 Sep 2025 22:12:38 +0100
Neal Frager <neal.frager@amd.com> wrote:

> Bump the versal_vek280_defconfig to use version xilinx_v2025.1_update1 of the
> xilinx-prebuilt boot pacakge.
> 
> As part of this update, the vek280 pdi file has been updated and the memory
> map has been corrected to match the Linux intree dts memory node, so the
> vek280 dts memory node patch is no longer required.
> 
> https://github.com/Xilinx/soc-prebuilt-firmware/commit/f755d022cd9bd2e6a09eed0f80078bca3345279e
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
