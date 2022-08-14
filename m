Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 324F2C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 19:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA6AD60AC9;
	Sun, 14 Aug 2022 19:01:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA6AD60AC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NJUT5YkRovNj; Sun, 14 Aug 2022 19:01:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4F0B60A88;
	Sun, 14 Aug 2022 19:01:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4F0B60A88
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2832B1BF3F2
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 19:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10D0A830C0
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 19:01:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10D0A830C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pKLGKKfYpz4y for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 19:01:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13BD682BF4
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 13BD682BF4
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 19:01:50 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3A1AC1BF205;
 Sun, 14 Aug 2022 19:01:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oNIrp-000Pha-Mk; Sun, 14 Aug 2022 21:01:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
References: <20220723134249.268212-1-arnout@mind.be>
Date: Sun, 14 Aug 2022 21:01:45 +0200
In-Reply-To: <20220723134249.268212-1-arnout@mind.be> (Arnout Vandecappelle's
 message of "Sat, 23 Jul 2022 15:42:49 +0200")
Message-ID: <87k07ahco6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/zfs: fix pam support
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
Cc: Michael Zimmermann <sigmaepsilon92@gmail.com>,
 =?utf-8?Q?Jos=C3=A9?= Luis Salvador Rufo <salvador.joseluis@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > The --enable option was added to CONF_ENV instead of CONF_OPTS. For this
 > defconfig

 > BR2_arm=y
 > BR2_TOOLCHAIN_EXTERNAL=y
 > BR2_LINUX_KERNEL=y
 > BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 > BR2_PACKAGE_ZFS=y
 > BR2_PACKAGE_LINUX_PAM=y

 > this yields

 > /bin/sh: line 1: --enable-pam=yes: command not found

 > While we're at it, also remove the =yes which we usually don't add.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
