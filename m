Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A381C531DC
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 15:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A0EE84101;
	Fri, 23 Aug 2024 15:53:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 14RUa4fY_7Qj; Fri, 23 Aug 2024 15:53:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F59A84106
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F59A84106;
	Fri, 23 Aug 2024 15:53:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 54EA11BF313
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 15:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41CA940359
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 15:53:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xDGcVY1CEhFu for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 15:53:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0A6E84034E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A6E84034E
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A6E84034E
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 15:53:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EF4A0E0002;
 Fri, 23 Aug 2024 15:53:18 +0000 (UTC)
Date: Fri, 23 Aug 2024 17:53:17 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20240823175317.7e58f2c6@windsurf>
In-Reply-To: <20240823075600.1440000-1-peter@korsgaard.com>
References: <20240823075600.1440000-1-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724428399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yqjNZZDdHnRI7+tmTadEAw9H9yFw7wOV7w9z8LcuwkA=;
 b=drxhUBhy/QyZuT1TN0Qj664AtSyiH0DPL/D0edkXvxyAvQqgNH8lpWE/qWoHR//kdpDRWe
 SwuCjE8zaJH+Gok0roHdf9qUzleOZzuHVMfpQcQoMPeaxiXnZnxITJBuiy+BCDuwXttFEg
 nPjLV9pK8LFKIT6wzltFZamXAPcUjIRDv3vkSPTE7AvuxrQ3LS2heAgilsMe1tDoX5vxr5
 QHP4bbxdF3e7sgcNSwKMUag8zcOz8ubJIZdcWppn7aXBLS6yUD0sUxCF1lvlS863o9Jenw
 uvA8ctJM2K4SV2iAtP4FYApulFRfYsO6Yquv0GkptKbn2cwbNusYUV1CpqmFWw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=drxhUBhy
Subject: Re: [Buildroot] [PATCH] board/qemu/patches/arm-trusted-firmware:
 add v2.10 hash
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 23 Aug 2024 09:56:00 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes https://gitlab.com/buildroot.org/buildroot/-/jobs/7644930127
> ERROR: No hash found for arm-trusted-firmware-v2.10-git4.tar.gz
> 
> Commit d037d9c2d63e9cd47b (configs/qemu: Update defconfigs to Linux 6.6.32)
> enabled BR2_DOWNLOAD_FORCE_CHECK_HASHES, but forgot to take into
> consideration that qemu_aarch64_ebbr_defconfig uses arm-trusted-firmware
> v2.10 since commit 73813c56c8bb (configs/qemu_{arm, aarch64}_ebbr: bump
> Linux, U-Boot and TF-A).
> 
> Add the hash to fix the build.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  .../qemu/patches/arm-trusted-firmware/arm-trusted-firmware.hash  | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
