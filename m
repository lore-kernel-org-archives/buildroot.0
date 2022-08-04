Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9611C19F2D
	for <buildroot@archiver.kernel.org>; Thu,  4 Aug 2022 13:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CA57823CF;
	Thu,  4 Aug 2022 13:12:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CA57823CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id po_sF_JEzUbH; Thu,  4 Aug 2022 13:12:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D23781DCA;
	Thu,  4 Aug 2022 13:12:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D23781DCA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 035B61BF421
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 13:12:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D1FE60EAA
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 13:12:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D1FE60EAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AkXHPzMUAma9 for <buildroot@lists.busybox.net>;
 Thu,  4 Aug 2022 13:12:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A94560E7D
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1A94560E7D
 for <buildroot@buildroot.org>; Thu,  4 Aug 2022 13:12:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id ACD611BF211;
 Thu,  4 Aug 2022 13:12:08 +0000 (UTC)
Date: Thu, 4 Aug 2022 15:12:07 +0200
To: Stefan Agner <stefan@agner.ch>
Message-ID: <20220804151207.3ad0fbe1@windsurf>
In-Reply-To: <32cdca079efa80b745bb60af23ad9e99f3cabbf4.1659613508.git.stefan@agner.ch>
References: <32cdca079efa80b745bb60af23ad9e99f3cabbf4.1659613508.git.stefan@agner.ch>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659618729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UFjHp1X+wTMBvvgAhEwP3OphszitKV+dv5FYHMSsQHo=;
 b=HKSbpiZTLrCwERuMB18Bs7RqMUpuL/+gmUcMb2tLmj70f66QPxHbGLsay6660AyGOX5vrZ
 fpJphalm872duRjbGu6o8w2TzdgZ9AjYEMDZxSHqiYZdIkBxTHKnLif+neGjxVG5AD0Ogf
 SMMcvVjPquDVyrMVUvpfH6Fz7uNRESn0jGcuOg/2evZh2wnVMvCrmNCAOUccGSGah0zbr8
 XgQqdtHCxOfzZMr6/54Kw6tp34QuL/gVorVS3KmdiLKuJS3TQpsJ7REuRdV543wsF5pzya
 yrmqZI19SFU8YI36mKRZ4MULbt99LqEu36TMnMVUaDAb0OEP34u/xw6P1q1tsw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HKSbpiZT
Subject: Re: [Buildroot] [PATCH] [master] boot/grub2: fix build race
 condition
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
Cc: yann.morin.1998@free.fr, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Stefan,

On Thu,  4 Aug 2022 13:45:27 +0200
Stefan Agner <stefan@agner.ch> wrote:

> Sometimes buildroot fails with:
> ../grub-core/kern/emu/hostfs.c:20:10: fatal error: config-util.h: No such file or directory
>    20 | #include <config-util.h>
>       |          ^~~~~~~~~~~~~~~
> 
> Add a patch which fixes the Makefile to correctly generate config-util.h
> first.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>

Thanks for this patch.

> ---
>  ...ub_fstest.pp-depend-on-config-util.h.patch | 24 +++++++++++++++++++
>  boot/grub2/grub2.mk                           |  6 +++++
>  2 files changed, 30 insertions(+)
>  create mode 100644 boot/grub2/0001-Makefile-Make-grub_fstest.pp-depend-on-config-util.h.patch
> 
> diff --git a/boot/grub2/0001-Makefile-Make-grub_fstest.pp-depend-on-config-util.h.patch b/boot/grub2/0001-Makefile-Make-grub_fstest.pp-depend-on-config-util.h.patch
> new file mode 100644
> index 0000000000..96e6852e86
> --- /dev/null
> +++ b/boot/grub2/0001-Makefile-Make-grub_fstest.pp-depend-on-config-util.h.patch

We require all patches to have a proper commit log, with commit title +
description, and a Signed-off-by line. Also, we need to have the
upstream status of the patch, i.e where it has been submitted (or taken
from).

Could you rework your patch accordingly?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
