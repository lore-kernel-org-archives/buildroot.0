Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 647BCC433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 22:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7B18405B4;
	Sat,  4 Dec 2021 22:36:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id shivyqP2kiTO; Sat,  4 Dec 2021 22:36:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55F6840589;
	Sat,  4 Dec 2021 22:36:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 679C41BF3F7
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 55867401AF
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:36:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kQm5_Y77wavW for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 22:36:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D8453400E9
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 22:36:11 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 9072C40008;
 Sat,  4 Dec 2021 22:36:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mtddY-00060q-5q; Sat, 04 Dec 2021 23:36:08 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <cover.1638573387.git.yann.morin.1998@free.fr>
 <82bf2ffa3ad531e8e93cf4b2f65193438b8b7199.1638573387.git.yann.morin.1998@free.fr>
Date: Sat, 04 Dec 2021 23:36:08 +0100
In-Reply-To: <82bf2ffa3ad531e8e93cf4b2f65193438b8b7199.1638573387.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sat, 4 Dec 2021 00:17:20 +0100")
Message-ID: <87h7boatgn.fsf@dell.be.48ers.dk>
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

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 > From: Adam Duskett <aduskett@gmail.com>
 > Commit b68810e70cbd (boot/grub2: add support to build multiple Grub2
 > configurations in the same build) broke mender-grubenv by splititng up
 > BR2_TARGET_GRUB2_BUILTIN_MODULES into two separate symbols, one for
 > legacy boot and one for EFI boot.

..

 > +++ b/package/mender-grubenv/mender-grubenv.mk
 > @@ -13,7 +13,7 @@ MENDER_GRUBENV_LICENSE_FILES = LICENSE
 >  MENDER_GRUBENV_DEPENDENCIES = grub2
 >  MENDER_GRUBENV_INSTALL_IMAGES = YES
 
 > -ifeq ($(BR2_TARGET_GRUB2_I386_PC)$(BR2_TARGET_GRUB2_ARM_UBOOT),y)
 > +ifeq ($(BR2_TARGET_GRUB_LEGACY)$(BR2_TARGET_GRUB2_ARM_UBOOT),y)
 >  MENDER_GRUBENV_ENV_DIR = /boot/grub

Should this not be BR2_TARGET_GRUB2_HAS_LEGACY_BOOT?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
