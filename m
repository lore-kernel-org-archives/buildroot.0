Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B9AACDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 10:15:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0D0260BCA;
	Fri, 13 Oct 2023 10:15:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0D0260BCA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 53KlKEN5lexk; Fri, 13 Oct 2023 10:15:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F1E760E35;
	Fri, 13 Oct 2023 10:15:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F1E760E35
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BCC8E1BF995
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 10:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 957B281F7F
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 10:15:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 957B281F7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id veah_ldgcpGy for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 10:15:46 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C351481F02
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 10:15:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C351481F02
Received: by mail.gandi.net (Postfix) with ESMTPSA id DCBCC1C0002
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 10:15:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1qrFCi-00736n-AC
 for buildroot@buildroot.org; Fri, 13 Oct 2023 12:15:36 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20230930134234.3567570-1-peter@korsgaard.com>
Date: Fri, 13 Oct 2023 12:15:36 +0200
In-Reply-To: <20230930134234.3567570-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 30 Sep 2023 15:42:34 +0200")
Message-ID: <87zg0m6d6f.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/urandom-scripts: move seedrng init
 script to S01
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > We want to initialize the kernel random number generator as soon as
 > possible, as early init scripts may also need random numbers (E.G.
 > syslog-ng in S01syslog-ng does).

 > Seedrng was presumably only using S20 because the previos urandom script
 > used S20, which (after som moves) dates all the way back to:

 > commit 8262508fc4456b5230216473ea14c897268ba791
 > Author: Eric Andersen <andersen@codepoet.org>
 > Date:   Fri Apr 26 22:01:43 2002 +0000

 >     With this update, everything now works as expected.
 >      -Erik

 > Seedrng needs persistent storage, but mount -a is run before executing the
 > init scripts, so S01 should be as good as S20 - Atleast with the scripts in
 > upstream Buildroot.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2023.02.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
