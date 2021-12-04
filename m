Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1BD1C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 22:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C78D831C1;
	Sat,  4 Dec 2021 22:38:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wm11mIxNwfOY; Sat,  4 Dec 2021 22:38:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7B6782D75;
	Sat,  4 Dec 2021 22:38:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 378501BF3F7
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 343F360A7A
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:38:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QK4DokJAU9IV for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 22:38:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 44BE36077A
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 22:38:09 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 5F127200002;
 Sat,  4 Dec 2021 22:38:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mtdfS-00064A-FO; Sat, 04 Dec 2021 23:38:06 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <cover.1638573387.git.yann.morin.1998@free.fr>
 <82bf2ffa3ad531e8e93cf4b2f65193438b8b7199.1638573387.git.yann.morin.1998@free.fr>
 <87h7boatgn.fsf@dell.be.48ers.dk>
Date: Sat, 04 Dec 2021 23:38:06 +0100
In-Reply-To: <87h7boatgn.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Sat, 04 Dec 2021 23:36:08 +0100")
Message-ID: <87czmcatdd.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/3] package/mender-grubenv: fix grub module
 checks
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
Cc: =?utf-8?Q?K=C3=B6ry?= Maincent <kory.maincent@bootlin.com>,
 Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
 > Hi,

 >> From: Adam Duskett <aduskett@gmail.com>
 >> Commit b68810e70cbd (boot/grub2: add support to build multiple Grub2
 >> configurations in the same build) broke mender-grubenv by splititng up
 >> BR2_TARGET_GRUB2_BUILTIN_MODULES into two separate symbols, one for
 >> legacy boot and one for EFI boot.

 > ..

 >> +++ b/package/mender-grubenv/mender-grubenv.mk
 >> @@ -13,7 +13,7 @@ MENDER_GRUBENV_LICENSE_FILES = LICENSE
 >> MENDER_GRUBENV_DEPENDENCIES = grub2
 >> MENDER_GRUBENV_INSTALL_IMAGES = YES
 
 >> -ifeq ($(BR2_TARGET_GRUB2_I386_PC)$(BR2_TARGET_GRUB2_ARM_UBOOT),y)
 >> +ifeq ($(BR2_TARGET_GRUB_LEGACY)$(BR2_TARGET_GRUB2_ARM_UBOOT),y)
 >> MENDER_GRUBENV_ENV_DIR = /boot/grub

 > Should this not be BR2_TARGET_GRUB2_HAS_LEGACY_BOOT?

In fact, what seems to have been committed is:

ifeq ($(BR2_TARGET_GRUB_LEGACY),y)

What happened to the _ARM_UBOOT part?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
