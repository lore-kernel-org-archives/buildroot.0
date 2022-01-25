Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D24C433EF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 21:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6629C40319;
	Tue, 25 Jan 2022 21:08:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 57SLu3Pi7X9H; Tue, 25 Jan 2022 21:08:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6BFB402B1;
	Tue, 25 Jan 2022 21:08:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 292CE1BF599
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 21:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1589C402B1
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 21:07:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 02a8gAIzWhio for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 21:07:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F05C340272
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 21:07:56 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 84C12200006;
 Tue, 25 Jan 2022 21:07:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nCT2e-0004Ky-MB; Tue, 25 Jan 2022 22:07:52 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20211229090605.B5B8182A06@busybox.osuosl.org>
Date: Tue, 25 Jan 2022 22:07:52 +0100
In-Reply-To: <20211229090605.B5B8182A06@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Wed, 29 Dec 2021 10:11:27 +0100")
Message-ID: <87o83zjzh3.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] Makefile: set HOST*_NOCCACHE variables
 only if unset
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

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=c5912e7db37cc0a04696cf081410ec007f8f0be9
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Set HOSTCC_NOCCACHE and HOSTCXX_NOCCACHE only if they are not
 > set. This allows recursive calls to "make" to work as intended in the
 > presence of ccache. Such recursive calls to "make" can for example
 > happen if one calls "make legal-info" from within a post-build script,
 > to integrate some results of the legal-info output into the root
 > filesystem.

 > Without guarding these variables, a recursive invocation of make would
 > re-define
 >     HOSTCC_NOCCACHE := $(HOSTCC)
 > and
 >     HOSTCXX_NOCCACHE := $(HOSTCXX)
 > at a point in time when HOSTCC and HOSTCXX already point to ccache.

 > It used to work by "accident" until
 > ca6a2907c27c8171336643d1ab41bd5c34ee3794 ("make: support: use `command
 > -v' instead of `which'"), due to how "which" was behaving when invoked
 > with multiple arguments. After switching to "command -v", which
 > behaves different with multiple arguments, this HOSTCC_NOCCACHE
 > redefinition problem surfaced. Even though
 > ca6a2907c27c8171336643d1ab41bd5c34ee3794 has since then been reverted
 > for other reasons, it does make sense to guard the definition of
 > HOSTCC_NOCCACHE and HOSTCXX_NOCCACHE to not rely on a side-effect of
 > using "which".

 > Signed-off-by: Markus Mayer <mmayer@broadcom.com>
 > Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
