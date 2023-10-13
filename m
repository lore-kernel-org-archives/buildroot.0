Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA3BCCDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 14:42:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45DE4605B1;
	Fri, 13 Oct 2023 14:42:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45DE4605B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CzOdJeDImvDp; Fri, 13 Oct 2023 14:42:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97E7B60687;
	Fri, 13 Oct 2023 14:42:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97E7B60687
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 50C2F1BF33A
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 14:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34F73405A9
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 14:42:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34F73405A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lFOCD6Lav2kP for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 14:41:59 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C8B874049A
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 14:41:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8B874049A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 58DDE1C0007;
 Fri, 13 Oct 2023 14:41:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qrJMK-007Jfq-Rz; Fri, 13 Oct 2023 16:41:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <20221018034605.800593-1-james.hilliard1@gmail.com>
 <dfe9844e-5208-4d19-3af9-0faf8c0a5abf@mind.be>
Date: Fri, 13 Oct 2023 16:41:48 +0200
In-Reply-To: <dfe9844e-5208-4d19-3af9-0faf8c0a5abf@mind.be> (Arnout
 Vandecappelle via buildroot's message of "Sun, 1 Oct 2023 18:05:19
 +0200")
Message-ID: <87o7h24mab.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-generic.mk: fix rule order
 for re{install, build, configure}
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:

 >  Hi James,
 > On 18/10/2022 05:46, James Hilliard wrote:
 >> These command rely on the clean operations being first so that the
 >> stamp files being deleted will rebuild the targets.
 >> The execution ordering of the clean and rebuild operations may
 >> change, for example if --shuffle=reversed is set.
 >> To ensure the evaluation order is always correct use double colon
 >> rules to make the evaluation order explicit as per make docs:
 >> The double-colon rules for a target are executed in the order they
 >> appear in the makefile.

 >  As noted in earlier discussions, this feels a bit hackish and it's
 >  not clear if this behaviour is going to be kept in future versions of
 > make.

 >  Since make 4.4, however, there's a better solution: it introduced a
 >  .WAIT phony target that enforces the ordering of dependencies. So I
 > instead made a commit[1] that uses that approach.

Committed to 2023.02.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
