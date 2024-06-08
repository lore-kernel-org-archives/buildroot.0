Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9748C25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 13:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73E8E8355F;
	Sat,  8 Jun 2024 13:50:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PeZv9ixk3Qb3; Sat,  8 Jun 2024 13:50:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 904ED83A83
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 904ED83A83;
	Sat,  8 Jun 2024 13:50:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1E2D91BF41A
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 13:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17BC283A83
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 13:50:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UHEJfcaY8yYG for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 13:50:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E46BE8355F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E46BE8355F
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E46BE8355F
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 13:50:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0163AC0003;
 Sat,  8 Jun 2024 13:50:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sFwSo-001oS8-1Q;
 Sat, 08 Jun 2024 15:50:34 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
References: <20240521194441.102448-1-ju.o@free.fr>
Date: Sat, 08 Jun 2024 15:50:34 +0200
In-Reply-To: <20240521194441.102448-1-ju.o@free.fr> (Julien Olivain's message
 of "Tue, 21 May 2024 21:44:41 +0200")
Message-ID: <8734pn4k7p.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: improve
 python-magic-wormhole test reliability
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

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > The python-magic-wormhole runtime test can randomly fail on slow
 > runners, see [1].

 > The issue is that the sending command is started first in background
 > _without_ redirecting its output to /dev/null. The receiving command
 > is started after, expecting the message to be printed on the first
 > standard output line. On slower systems, the sending command still
 > print messages while the test controller expect output from the
 > receiving command. The expected string finally appear, but not on the
 > first line. This makes the test fail.

 > This commit fixes the issue by redirecting all outputs (stdout, stderr)
 > of the sending command to /dev/null. To help even more, the sleep time
 > is moved from the emulator to the test controller. The sleep time is
 > also multiplied by the timeout_multiplier.

 > Fixes: [1]

 > [1] https://gitlab.com/buildroot.org/buildroot/-/jobs/6888691508

 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
