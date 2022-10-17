Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709D1C4332F
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 08:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E45E44091C;
	Mon, 17 Oct 2022 08:20:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E45E44091C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8I70H7Tue-YU; Mon, 17 Oct 2022 08:20:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7CC54090E;
	Mon, 17 Oct 2022 08:20:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7CC54090E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E55A61BF38A
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 08:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5EFD60BCF
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 08:20:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5EFD60BCF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kOV-zC04Pb4D for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 08:20:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C4B860BC0
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C4B860BC0
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 08:20:46 +0000 (UTC)
Received: from webmail.serv15.avernis.de (ip6-localhost [IPv6:::1])
 by serv15.avernis.de (Postfix) with ESMTPSA id D498DBDE56BF;
 Mon, 17 Oct 2022 10:20:42 +0200 (CEST)
MIME-Version: 1.0
Date: Mon, 17 Oct 2022 08:20:41 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: samuel ammonius <sfammonius@gmail.com>
In-Reply-To: <mailman.12392.1665991612.43027.buildroot@buildroot.org>
References: <mailman.12392.1665991612.43027.buildroot@buildroot.org>
Message-ID: <001c74b1a3b54786f3d62bc18d53af5a@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 0.103.7 at serv15.avernis.de
X-Virus-Status: Clean
Subject: Re: [Buildroot] Help with isolinux: "No DEFAULT or UI configuration
 directive found!"
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
Cc: buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Sam,

On 2022-10-17 18:15, samuel ammonius wrote:
> Hello everybody,
> 
> I don't know anything about embedded systems or bootloaders or most of 
> the
> stuff involved with buildroot. I wanted to make an installer that could 
> be
> burned to a USB to run a graphical app that depends on Qt. I have the
> dependencies and filesystem all set up, but booting the generated 
> iso9660
> image gives me this message:
> 
> Booting from DVD/CD...
> 
> ISOLINUX 6.03  ETCD Copyright (C) 1994-2014 H. Peter Anvin et al
> 
> No DFEAULT or UI configuration directive found!

Check if you have a syslinux.cfg file where isolinux can find it. The 
root of the ISO image would be a possible location. This file contains 
the boot configuration:

  DEFAULT linux
   SAY Booting from DVD/CD...
  LABEL linux
   KERNEL bzImage
   APPEND quiet

See [1] for detailed information.

This config file is system specific and not supplied by Buildroot. It 
would be part of your BR2_ROOTFS_OVERLAY or generated from a 
BR2_ROOTFS_POST_BUILD_SCRIPT.

You may also need the ldlinux.c32 module (BR2_TARGET_SYSLINUX_C32).

> boot: _
> 
> 
> Typing anything into the "boot" prompt just repeats the same error 
> message.
> Does anyone know how this problem could be fixed?

Try entering 'KERNEL <image_name>' (relative to root of boot device) 
here.

> ---
> Thanks,
> Sam

Kind regards,
Andreas

[1] https://wiki.syslinux.org/wiki/index.php?title=Config
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
