Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED661EEB596
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 07:00:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 760FB41933;
	Wed, 13 Sep 2023 07:00:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 760FB41933
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 62FXccpnGP4y; Wed, 13 Sep 2023 07:00:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8369841AE0;
	Wed, 13 Sep 2023 07:00:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8369841AE0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 384791BF20B
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 06:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F58D81A58
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 06:59:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F58D81A58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p2f_1DOEa8nr for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 06:59:58 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B506881916
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 06:59:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B506881916
Received: by mail.gandi.net (Postfix) with ESMTPSA id A8357240007;
 Wed, 13 Sep 2023 06:59:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qgJqs-004oR1-Mn; Wed, 13 Sep 2023 08:59:54 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20230820214028.01C8B85EF4@busybox.osuosl.org>
Date: Wed, 13 Sep 2023 08:59:54 +0200
In-Reply-To: <20230820214028.01C8B85EF4@busybox.osuosl.org> (Thomas Petazzoni
 via buildroot's message of "Sun, 20 Aug 2023 23:38:44 +0200")
Message-ID: <871qf25zit.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [git commit] configs/pc_x86_64_{bios,
 efi}_defconfig: add midding libelf kernel dependency
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=b661f635b5cc08ded6ab14c19f2370c9f478e52e
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > objtool built by the kernel requires libelf

 > ldd output/build/linux-6.1.24/tools/objtool/objtool
 >   linux-vdso.so.1
 >   libelf.so.1 => output/host/lib/libelf.so.1

 > While updating the kernel [1] we forgot to select
 > BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF to provide Buildroot's host-libelf.
 > Using host-libelf avoid linking with libelf installed on the host or
 > failing to build objtool if libelf is not installed.

 > [1] d45538f2e7acc1b330b191d559a81e8c1a961648

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/4889436869
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/4889436872

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
