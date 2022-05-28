Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99684C433F5
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 11:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08B666119C;
	Sat, 28 May 2022 11:01:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wi4xFyt8exyj; Sat, 28 May 2022 11:01:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0692C612D5;
	Sat, 28 May 2022 11:01:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5C0861BF4D7
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 11:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A191418E9
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 11:01:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pa8c4Q-JEqgm for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 11:01:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB07B418E5
 for <buildroot@buildroot.org>; Sat, 28 May 2022 11:01:10 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 072D520007;
 Sat, 28 May 2022 11:01:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nuuBu-003sWE-3M; Sat, 28 May 2022 13:01:06 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20220512204944.94312-1-romain.naour@gmail.com>
Date: Sat, 28 May 2022 13:01:06 +0200
In-Reply-To: <20220512204944.94312-1-romain.naour@gmail.com> (Romain Naour's
 message of "Thu, 12 May 2022 22:49:44 +0200")
Message-ID: <87k0a5apl9.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] support/testing: test_lxc: bump kernel
 version to 5.15.38 for complete pidfds support
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > As reported by [1], the lxc test is broken since lxc >= 4.0.11.
 > A patch was added to lxc 4.0.11 to use the new mount api for devpts
 > setup [2] but the fall back code doesn't work when this new mount
 > API is not supported. This API was added in kernel 5.6.

 > (kernel 5.5)
 > DEBUG conf - conf.c:lxc_setup_devpts_child:1682 - No new devpts instance will be
 > mounted since no pts devices are required
 > lxc-start lxc_iperf3  DEBUG conf - conf.c:lxc_setup_dev_console:1966 - Cleared
 > all (0) mounts from "/dev/console"
 > lxc-start lxc_iperf3  ERROR mount_utils - mount_utils.c:mount_at:661 - No such
 > file or directory - Failed to mount "/proc/self/fd/44" to "/proc/self/fd/43"
 > lxc-start lxc_iperf3  ERROR conf - conf.c:lxc_setup_dev_console:1988 - No such
 > file or directory - Failed to mount "10(/dev/pts/0)" on "43"
 > lxc-start lxc_iperf3  ERROR conf - conf.c:lxc_setup_console:2143 - No such file
 > or directory - Failed to setup console

 > (kernel 5.6)
 > lxc-start lxc_iperf3  TRACE mount_utils - mount_utils.c:can_use_mount_api:582 -
 > Kernel supports mount api
 > lxc-start lxc_iperf3  TRACE mount_utils - mount_utils.c:move_detached_mount:328
 > - Attach detached mount 45 to filesystem at 43
 > lxc-start lxc_iperf3  TRACE conf - conf.c:lxc_setup_dev_console:1990 - Setup
 > console "/dev/pts/0"

 > Bump the kernel to the current LTS 5.15.38 version that fully support the
 > mount API needed by lxc.

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/2429013708

 > [1] http://lists.busybox.net/pipermail/buildroot/2022-January/635251.html
 > [2] https://github.com/lxc/lxc/commit/be606e16fd0fa967219d890745a425625eafe251

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
