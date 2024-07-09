Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F022C2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 16:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B25CC40D67;
	Tue,  9 Jul 2024 16:50:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mNSEEv3P5AQt; Tue,  9 Jul 2024 16:50:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C03D41264
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C03D41264;
	Tue,  9 Jul 2024 16:50:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3A1FE1BF348
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 16:50:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2725741264
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 16:50:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZmP0s4ta2qd6 for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 16:50:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5BCEF40D67
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BCEF40D67
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5BCEF40D67
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 16:50:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E84EB20009;
 Tue,  9 Jul 2024 16:50:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sRE2w-006nYG-05;
 Tue, 09 Jul 2024 18:50:30 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Joachim Wiberg <troglobit@gmail.com>
References: <20240705060905.3670541-1-troglobit@gmail.com>
 <20240705060905.3670541-2-troglobit@gmail.com>
Date: Tue, 09 Jul 2024 18:50:29 +0200
In-Reply-To: <20240705060905.3670541-2-troglobit@gmail.com> (Joachim Wiberg's
 message of "Fri, 5 Jul 2024 08:09:05 +0200")
Message-ID: <871q42ldbe.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/openssh: disable
 async-signal-unsafe code in sshsigdie()
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
Cc: Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Joachim" == Joachim Wiberg <troglobit@gmail.com> writes:

 > Import Debian patch[1] for CVE-2024-6387[2].  This disables the unsafe
 > syslog code path triggered by SIGALARM.

 > [1]
 > https://salsa.debian.org/ssh-team/openssh/-/blob/master/debian/patches/sshsigdie-async-signal-unsafe.patch
 > [2] https://marc.info/?l=oss-security&m=171982335024767

 > Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Committed to 2024.02.x and 2024.05.x after renaming to 0002- and adding
an Upstream: tag, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
