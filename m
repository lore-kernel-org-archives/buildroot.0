Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB3EC4167B
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 21:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C35A860C2B;
	Tue,  7 Nov 2023 21:48:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C35A860C2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iJ3oadfme50i; Tue,  7 Nov 2023 21:48:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 234D660C0F;
	Tue,  7 Nov 2023 21:48:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 234D660C0F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1816C1BF5A8
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 21:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E54554176A
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 21:48:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E54554176A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FXfmU-qHfjLi for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 21:48:33 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A263D4169E
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 21:48:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A263D4169E
Received: by mail.gandi.net (Postfix) with ESMTPSA id 92B3CC0005;
 Tue,  7 Nov 2023 21:48:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r0Tvw-00HWPP-2W;
 Tue, 07 Nov 2023 22:48:28 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20231101112613.2C68686320@busybox.osuosl.org>
Date: Tue, 07 Nov 2023 22:48:28 +0100
In-Reply-To: <20231101112613.2C68686320@busybox.osuosl.org> (Thomas Petazzoni
 via buildroot's message of "Wed, 1 Nov 2023 12:25:54 +0100")
Message-ID: <87ttpxuteb.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [git commit] package/nettle: add missing dependency
 on host-m4
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

 > commit: https://git.buildroot.net/buildroot/commit/?id=d4ca1b03c0d6f34d10d10cab06ca28c24a7d296d
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > nettle uses m4 during its build process. Without it, the build fails
 > with:

 > m4 ./m4-utils.m4 ./asm.m4 config.m4 machine.m4 aes-decrypt-internal.asm >aes-decrypt-internal.s
 > /bin/sh: 1: m4: not found

 > For the target package this is not visible, as the existing gmp
 > dependency pulls in host-m4. But technically speaking, nettle needs
 > host-m4 directly, so it makes sense to have this dependency.

 > For the host package, it clearly fails to build, but probably isn't
 > very visible as most systems have m4 installed system-wide: this was
 > noticed when building inside Buildroot's minimal Docker
 > container. There are no recorded autobuilder failures for this issue.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2023.02.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
