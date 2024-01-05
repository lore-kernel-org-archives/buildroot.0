Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB300C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 10:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6290C42176;
	Fri,  5 Jan 2024 10:41:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6290C42176
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3V08LL8nMWrx; Fri,  5 Jan 2024 10:41:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96EEB42169;
	Fri,  5 Jan 2024 10:41:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96EEB42169
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 18C3F1BF378
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 10:41:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19A8642169
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 10:41:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19A8642169
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wvc8Ga18XnqJ for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 10:41:20 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A37EF42168
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 10:41:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A37EF42168
Received: by mail.gandi.net (Postfix) with ESMTPSA id 96248C000A;
 Fri,  5 Jan 2024 10:41:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rLhdb-005cp2-2w;
 Fri, 05 Jan 2024 11:41:15 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@smile.fr>
References: <20231206224422.16063-1-romain.naour@smile.fr>
Date: Fri, 05 Jan 2024 11:41:15 +0100
In-Reply-To: <20231206224422.16063-1-romain.naour@smile.fr> (Romain Naour's
 message of "Wed, 6 Dec 2023 23:44:20 +0100")
Message-ID: <87r0iw3vw4.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/3] support/testing: bump prebuilt kernel
 to 5.10.202
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

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > As reported on the mailing list [1], TestPolkitSystemd and
 > TestPolkitInitd are failing since we bumped the Bootlin toolchain
 > 2023.08 [2].

 > The issue is caused by expat (XML library) package detecting
 > arc4random_buf() introduced by glibc 2.36 [3].

 > With arc4random_buf() support enabled, expat hang Polkit while reading
 > its policy files (XML files) due to a lack of entropy on the system.

 > Upgrading the kernel allows to avoid such issue thanks to
 > random_get_entropy_fallback() introduced in 5.10.119 (backpored) [4].

 > Build the vexpress-v2p-ca9 (armv7) 5.10.202 using the kernel
 > configuration file found in /proc/config.gz but with additional kernel
 > options provided by SYSTEMD_LINUX_CONFIG_FIXUPS. Indeed some kernel
 > options requested by systemd were missing in 5.10.7 kernel.

 > Build the versatile-pb (armv5) kernel using the same kernel
 > configuration as qemu_arm_versatile_defconfig but with additional
 > kernel options like for vexpress-v2p-ca9. While at it, enable
 > IKCONFIG_PROC option to provide the kernel configuration at runtime
 > in /proc/config.gz.

 > Runtime tested:
 > https://gitlab.com/kubu93/buildroot/-/pipelines/1097887826 (tests.package.test_polkit.TestPolkit*)
 > https://gitlab.com/kubu93/buildroot/-/pipelines/1097705399 (tests.init.*)

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/5689309948 (TestPolkitSystemd)
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/5689309947 (TestPolkitInitd)

 > [1] http://lists.busybox.net/pipermail/buildroot/2023-December/680445.html
 > [2] 452365a385ef35e808eb2eb669d1e3227c7399dd
 > [3] https://sourceware.org/git/?p=glibc.git;a=commit;h=6f4e0fcfa2d2b0915816a3a3a1d48b4763a7dee2
 > [4] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=fdca775081527364621857957655207d83035376

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>

Committed to 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
