Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B7AAC48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 13:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 341AF60B4E;
	Tue,  6 Feb 2024 13:24:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 341AF60B4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4W-oJNRU8IOz; Tue,  6 Feb 2024 13:24:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 861506120F;
	Tue,  6 Feb 2024 13:24:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 861506120F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E3E721BF5AD
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 13:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D14B28232A
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 13:23:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p5e6UiSbCLrG for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 13:23:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B402082306
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B402082306
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B402082306
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 13:23:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D5483E0003;
 Tue,  6 Feb 2024 13:23:46 +0000 (UTC)
Date: Tue, 6 Feb 2024 14:23:45 +0100
To: Marleen Vos via buildroot <buildroot@buildroot.org>
Message-ID: <20240206142345.0f064063@windsurf>
In-Reply-To: <20231219121508.1695768-4-marleen.vos@mind.be>
References: <20231219121508.1695768-1-marleen.vos@mind.be>
 <20231219121508.1695768-4-marleen.vos@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707225827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zc8SgzKylh1QDieTC5SB6hvBFyZOhInbgOJQV9QzUGg=;
 b=QlMxRRV+NphJdj5xOO+90me0gxnL5mGpfu2OVRUxRZTiqEMT0cz4vTFxRXD8PenIj2r7N9
 HQhAROGIb0qPjYwtHVLV7CHYWuuocPxwOdqNnxk2SNF/usEMFLJSrAdmzHBe+AUgxSAith
 /ESDWyWLTgxu/RXrVbO/3GskW9VGqgnu7q8XLvA/INvcguthpN70i/HSuQ0E0e3cvnZYCK
 fhKp/9kvuDorY5td54fvrOFTvVwFCkVSMdh0l5NA+iZFIMC9uu3yhZHtLJdY3YZNdkG+kQ
 K5R3VAnXpgKgu23KhErTXlASMIaN5J6inakKuZpX92DMV/SYt0yjDUDeehLQ8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QlMxRRV+
Subject: Re: [Buildroot] [PATCH 3/7] configs/stm32mp157*: bump ATF to v2.6
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
Cc: Marleen Vos <marleen.vos@mind.be>, marleen.vos@essensium.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 19 Dec 2023 13:15:04 +0100
Marleen Vos via buildroot <buildroot@buildroot.org> wrote:

> From: Marleen Vos <marleen.vos@mind.be>
> 
> - v2.6 changes to FIP instead of SSBL boot.
> - This requires switching to u-boot.bin in U-Boot, and using that
>   instead of .stm32 in ATF.
> - fiptool expects dtb to be split off from u-boot.bin, so need custom
>   u-boot-nodtb.bin in addition to u-boot.dtb.
>   Caveat: this is perhaps not really obligatory, but the ATF
>           documentation explains it like that.
> - The partition must be named fip (while it must be named ssbl for
>   SSBL boot).
> - Since the partition name is set in the common template, all
>   defconfigs using that template must be bumped in a single commit
> - ATF now produces both fip.bin and <boardname>.stm32, so fip.bin has
>   been added to the configs
> - While we're at it, add the structuring comments to
>   avenger96_defconfig similar like the other defconfigs
> 
> Signed-off-by: Marleen Vos <marleen.vos@mind.be>
> ---
>  .../common/stm32mp157/genimage.cfg.template   |  4 +--
>  configs/avenger96_defconfig                   | 28 +++++++++++++++----
>  configs/stm32mp157a_dk1_defconfig             | 14 +++++++---
>  configs/stm32mp157c_dk2_defconfig             | 14 +++++++---
>  4 files changed, 45 insertions(+), 15 deletions(-)

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
