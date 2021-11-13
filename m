Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F0FC433F5
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 15:51:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AC9F60F6B
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 15:51:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5AC9F60F6B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FBC660651;
	Sat, 13 Nov 2021 15:51:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pji1hzqfp9aG; Sat, 13 Nov 2021 15:51:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87C3F6062C;
	Sat, 13 Nov 2021 15:51:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B5E121BF306
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 15:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4D5540123
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 15:51:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uIv6LV-amxTw for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 15:51:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 776034010F
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 15:51:14 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 4583E240004;
 Sat, 13 Nov 2021 15:51:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mlvJ8-0005YV-Gp; Sat, 13 Nov 2021 16:51:10 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20211111230455.11470-1-peter@korsgaard.com>
 <20211113152457.129243a9@windsurf>
Date: Sat, 13 Nov 2021 16:51:10 +0100
In-Reply-To: <20211113152457.129243a9@windsurf> (Thomas Petazzoni's message of
 "Sat, 13 Nov 2021 15:24:57 +0100")
Message-ID: <87r1bkxde9.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] configs/sheevaplug_defconfig: backport
 gcc >= 10 u-boot patch
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Fri, 12 Nov 2021 00:04:52 +0100
 > Peter Korsgaard <peter@korsgaard.com> wrote:

 >> Fixes https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966307
 >> 
 >> The old U-Boot version used does not build with hostcc >= 10.  Backport a
 >> patch fixing that issue.
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> ---
 >> ...e-redundant-YYLOC-global-declaration.patch | 28 +++++++++++++++++++
 >> configs/sheevaplug_defconfig                  |  1 +
 >> 2 files changed, 29 insertions(+)
 >> create mode 100644 board/sheevaplug/patches/uboot/0001-Remove-redundant-YYLOC-global-declaration.patch

 > I've applied both to master.

Thanks!

 > It would however be nicer to update to a newer U-Boot release if
 > possible.

Yes, I'll send patches for next doing that, I just wanted something
safer/smaller for master/LTS.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
