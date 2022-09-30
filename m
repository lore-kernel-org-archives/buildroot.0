Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF27C433FE
	for <buildroot@archiver.kernel.org>; Fri, 30 Sep 2022 15:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D0D3610F4;
	Fri, 30 Sep 2022 15:19:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D0D3610F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LXRjYIWEfCnq; Fri, 30 Sep 2022 15:19:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93E3E60D8E;
	Fri, 30 Sep 2022 15:19:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93E3E60D8E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 451AE1BF2F7
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 15:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E57F40DA0
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 15:19:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E57F40DA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eyDBBXe6LqVm for <buildroot@lists.busybox.net>;
 Fri, 30 Sep 2022 15:18:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 230F041081
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 230F041081
 for <buildroot@buildroot.org>; Fri, 30 Sep 2022 15:18:58 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 12BC0E0008;
 Fri, 30 Sep 2022 15:18:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oeHmy-00Bd1s-7V; Fri, 30 Sep 2022 17:18:56 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220813090014.2734188-1-yann.morin.1998@free.fr>
Date: Fri, 30 Sep 2022 17:18:56 +0200
In-Reply-To: <20220813090014.2734188-1-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sat, 13 Aug 2022 11:00:14 +0200")
Message-ID: <87bkqw51r3.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/pkg-generic: don't exclude virtual
 packages from packages list
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

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Currently, with a configuration with an internal toolchain, and no other
 > package is selected [0], especially when one wants to generate an SDK or
 > a pre-built, pre-installed toolchain, running 'make' will only build
 > glibc (and its dependencies), and not the full toolchain, as one would
 > have expected, so there would be no host-final-gcc.

 > The reason is that 'toolchain' is a virtual package, so it is excluded
 > from PACKAGES, the list of packages enabled in the configuration. so it
 > is not a dependency of target-finalize, and so nothing pulls it in the
 > build.

 > The reason for excluding virtual packages from that list is not obvious.

 > When virtual packages were introduced in 743982441201 (packages: add
 > infrastructure for virtual packages), there was no BR2_PACKAGE_FOO
 > symbol for virtual packages (but there was BR2_PACKAGE_HAS_FOO), so
 > there was no telling that the virtual package was enabled, like we had
 > for the other kinds of packages (normal, bootloader, toolchain, or linux
 > kernel).

 > That caused issues, so in f674c428c2ef (core/pkg-virtual: do not check
 > they are neabled [sic]), and then 3e1b33a5349b (pkg-generic: improve
 > incorrectly used package detection), we explicitly excluded the virtual
 > packages from causing a build failure when something depended on them,
 > as we could not yet now whether a virtual package was actually enabled
 > or not.

 > Then, in 842ba7eceffb (pkg-generic: fix rdepends and phony targets of
 > virtual packages), we eventually associated a virtual package to is
 > BR2_PACKAGE_HAS_FOO, which allows treating virtual packages like the
 > other kinds of packages. There, we explicitly kept virtual packages out
 > of the list, though (the reasoning was that virtual packages install
 > nothing in host/ or target/, so they do not directly contribute to the
 > final content, so we do not need to rsync them, so this was an
 > optimisation).

 > However, virtual packages are in fact actual generic packages, and it is
 > possible for virtual packages to actually provide content for the final
 > image. Even though we do not have any virtual package that has actual
 > _INSTALL_CMDS, we still have udev that provides a user for example;
 > virtual packages in br2-external trees may also very well provide
 > install commands (e.g. to install files common to their various
 > implementations).

 > So, there is currently no technical reason to exclude virtual packages
 > from PACKAGES, the list of packages enabled in the configuration.

 > Drop the excluding condition, and always add enabled package, whatever
 > their kind, to the list of enabled packages.

 > [0] defconfig to reproduce the issue:
 >     BR2_INIT_NONE=y
 >     BR2_SYSTEM_BIN_SH_NONE=y
 >     # BR2_PACKAGE_BUSYBOX is not set
 >     # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 >     # BR2_TARGET_ROOTFS_TAR is not set

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2022.02.x, 2022.05.x and 2022.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
