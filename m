Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F428C25B10
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 20:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BEC181A6A;
	Mon,  6 May 2024 20:09:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5wJfW3-yde30; Mon,  6 May 2024 20:09:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B6B381E80
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B6B381E80;
	Mon,  6 May 2024 20:09:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A54FD1BF33C
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90B6A814C1
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:09:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fN5cEE0Myc2U for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 20:09:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8711D81E80
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8711D81E80
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8711D81E80
 for <buildroot@buildroot.org>; Mon,  6 May 2024 20:09:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D44CC0002;
 Mon,  6 May 2024 20:09:49 +0000 (UTC)
Date: Mon, 6 May 2024 22:09:48 +0200
To: Andreas Dannenberg via buildroot <buildroot@buildroot.org>
Message-ID: <20240506220948.7baeea19@windsurf>
In-Reply-To: <20240506085315.lb4frefetaffps6i@dasso>
References: <20240430-optee-update-v2-0-5bdc2f940db1@ti.com>
 <20240430-optee-update-v2-2-5bdc2f940db1@ti.com>
 <20240506085315.lb4frefetaffps6i@dasso>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715026190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lUbwx2F5EHGES00Nxytg+4WNx94wz7kF7eQ9yB6l3jY=;
 b=PkipBBfK4nXn+6F+DjoV7c9ZZ1g1WDPKDiS5RxW2PBAq6ZgKJYT+FHDrYy5CtXK4gkQjw2
 hcqtcvJxMpV/fzUHAE1K1CMP3WK44jf5JTQ2PJu1jadF4QjLE4Uqk+Nib+MDr/fXevfUdr
 sBsKQEYorQzQOibG613Z7lcn+Z88kYz746rva/dQnDsgIYWlDLU5jvXR7Lvxd6bmqzEZoi
 /1lx7DRr4ybU5a/iAZ0T8GWaXqcg5l0HDrQCPRK3OjQQdxH/inQO55MqPwaS9+ppFd3iCz
 mfokQjqNnd15LzThOVFm2jR5ropbF1ydpCg4TFIZ+IRjrM8OTk0ZbMRYOzhDtg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PkipBBfK
Subject: Re: [Buildroot] [PATCH RESEND v2 02/11] boot/uboot: bump to version
 v2024.04
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
 Romain Naour <romain.naour@smile.fr>, Andreas Dannenberg <dannenberg@ti.com>,
 Etienne Carriere <etienne.carriere@foss.st.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Andreas,

On Mon, 6 May 2024 03:53:15 -0500
Andreas Dannenberg via buildroot <buildroot@buildroot.org> wrote:

> Similar to your other patch ("boot/optee-os: bump to release v4.2.0")
> changing the global default will affect other platforms so there's some
> risk for breakage I suppose. Why not keeping those specific changes to
> the AM62/AM64 platforms?

What Bryan did is totally fine and in line with how we handle things in
Buildroot. For packages that are close the hardware (OP-TEE, TF-A,
U-Boot, Linux), Buildroot offers:

- Using a "latest" version, which is regularly updated to the latest
  upstream version, which means that if you change Buildroot version,
  this version changes, like for any other package.

- Using a "custom" version, which is provided as an URL to a custom
  tarball, a tag/commit in a Git repo, etc. In this case, the version
  is explicitly specified in the user's .config file, and doesn't
  change when Buildroot is updated.

So, what Bryan did is update the "latest" version, and this is
perfectly correct.

All our defconfigs use a "custom" version for all of Linux, U-Boot,
OP-TEE, TF-A, specifically to ensure that despite the update in
Buildroot, our defconfig keep on using the versions that were tested by
the developer who submitted the defconfig.

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
