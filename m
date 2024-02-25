Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97713C54798
	for <buildroot@archiver.kernel.org>; Sun, 25 Feb 2024 07:49:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12CC340688;
	Sun, 25 Feb 2024 07:49:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FE8qh0gfC3Fx; Sun, 25 Feb 2024 07:49:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2545240699
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2545240699;
	Sun, 25 Feb 2024 07:49:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 316C91BF20D
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 07:49:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E5E781F4D
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 07:49:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GuWwxg0-G0Q4 for <buildroot@lists.busybox.net>;
 Sun, 25 Feb 2024 07:49:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3FB2081F47
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FB2081F47
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3FB2081F47
 for <buildroot@buildroot.org>; Sun, 25 Feb 2024 07:49:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 20D5F60002;
 Sun, 25 Feb 2024 07:48:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1re9Fl-00E1zo-0q;
 Sun, 25 Feb 2024 08:48:53 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
References: <20240219210628.407423-1-a.fatoum@pengutronix.de>
Date: Sun, 25 Feb 2024 08:48:53 +0100
In-Reply-To: <20240219210628.407423-1-a.fatoum@pengutronix.de> (Ahmad Fatoum's
 message of "Mon, 19 Feb 2024 22:06:28 +0100")
Message-ID: <871q91t256.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] boot/barebox: install all barebox images if
 none were specified
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
Cc: barebox@lists.infradead.org, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Ahmad" == Ahmad Fatoum <a.fatoum@pengutronix.de> writes:

 > When selecting barebox in menuconfig, BR2_TARGET_BAREBOX_IMAGE_FILE will
 > be empty by default, which causes Buildroot to install whatever the
 > barebox-flash-image symlink points at for barebox versions >= v2012.10.0.

 > This is an outdated fallback, because barebox-flash-image is only valid
 > when the barebox build produces a single binary. Virtually all new
 > defconfigs added in the last couple of years are multiconfig
 > (CONFIG_PBL_IMAGE=y) however, meaning that a single imx_v7_defconfig
 > or multi_v8_defconfig will produce many images that support different
 > boards or even platforms.

 > As there is no single valid target for barebox-flash-image to point at
 > in this case, this symlink will point at a non-existing
 > 'multi-image-build' to alert the user to this fact.

 > As replacement for barebox-flash-image, barebox commit 550cf79c216a
 > ("Make list of flash images and fix link all single image cases") first
 > released with v2015.12.0 creates a barebox-flash-images file with a list
 > of all images built by barebox.

 > Have buildroot use that file as a fallback before trying
 > barebox-flash-image to have a fallback that works for any recent barebox
 > defconfig as well.

 > Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
