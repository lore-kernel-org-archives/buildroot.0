Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21154C25B74
	for <buildroot@archiver.kernel.org>; Mon, 27 May 2024 06:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C482F81E3D;
	Mon, 27 May 2024 06:48:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FE0dVmHUvGSI; Mon, 27 May 2024 06:48:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC62081E43
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC62081E43;
	Mon, 27 May 2024 06:48:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 767521D1912
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 06:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6EE2C402A9
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 06:48:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2JnoKobx9kGe for <buildroot@lists.busybox.net>;
 Mon, 27 May 2024 06:48:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1F100402E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F100402E5
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1F100402E5
 for <buildroot@buildroot.org>; Mon, 27 May 2024 06:48:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BCEA620002;
 Mon, 27 May 2024 06:48:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sBU9R-00519X-0i;
 Mon, 27 May 2024 08:48:09 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
References: <20240526164346.564204-1-ju.o@free.fr>
Date: Mon, 27 May 2024 08:48:09 +0200
In-Reply-To: <20240526164346.564204-1-ju.o@free.fr> (Julien Olivain's message
 of "Sun, 26 May 2024 18:43:46 +0200")
Message-ID: <87jzjfda3a.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/mx51evk: bump kernel to
 5.10.218 to fix build
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
Cc: Fabio Estevam <festevam@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > Since commit dc0f721 "package/gcc: switch to 13.x as default",
 > mx51evk_defconfig is failing to build in Kernel (see [1]),
 > with output:

 >     drivers/ata/libahci.c: In function 'ahci_led_store':
 >     ././include/linux/compiler_types.h:315:45: error: call to '__compiletime_assert_328' declared with attribute error: BUILD_BUG_ON failed: sizeof(_s) > sizeof(long)
 >       315 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
 >           |                                             ^

 > This commit fixes the issue by bumping the Kernel to 5.10.218.

 > The kernel commit fixing the build failure is [2], first included in
 > v5.10.184. There is also many other gcc-13 fixes.

 > While bumping the Kernel, this commit also enables
 > BR2_DOWNLOAD_FORCE_CHECK_HASHES=y, add the relevant archive hash files,
 > and removes the defconfig entry in ".checkpackageignore".

 > Fixes: [1]

 > [1] https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688967
 > [2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=4c3ddc06cedb62f2904e58fd95170bf206bee149

 > Signed-off-by: Julien Olivain <ju.o@free.fr>
 > ---
 > Note: I did not tested the generated image on an actual board
 > (I don't have access to it).

 > Changes v1 -> v2:
 > - Bump only the kernel to 5.10.218 (instead of 6.6.31).
 > - No longer bump uboot

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
