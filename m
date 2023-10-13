Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF1E1CDB483
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 14:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5852260F6B;
	Fri, 13 Oct 2023 14:34:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5852260F6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zm-HirCG4wsz; Fri, 13 Oct 2023 14:34:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B484610D6;
	Fri, 13 Oct 2023 14:34:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B484610D6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3A4101BF2F8
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 14:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 131C941F3F
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 14:34:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 131C941F3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B4qFlGJk0vzR for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 14:34:15 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B176B41E99
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 14:34:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B176B41E99
Received: by mail.gandi.net (Postfix) with ESMTPSA id 56B3EC000D;
 Fri, 13 Oct 2023 14:34:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qrJEq-007Irr-U9; Fri, 13 Oct 2023 16:34:04 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Jens Maus via buildroot <buildroot@buildroot.org>
References: <20230923100035.1504933-1-mail@jens-maus.de>
 <87bkdi7jwp.fsf@48ers.dk>
Date: Fri, 13 Oct 2023 16:34:04 +0200
In-Reply-To: <87bkdi7jwp.fsf@48ers.dk> (Peter Korsgaard's message of "Sun, 01
 Oct 2023 11:48:38 +0200")
Message-ID: <87edhy617n.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/linux-tools: fix SysV init script
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, Jens Maus <mail@jens-maus.de>,
 Pascal de Bruijn <p.debruijn@unilogic.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Jens" == Jens Maus via buildroot <buildroot@buildroot.org> writes:
 >> This commit fixes the S10hyperv SysV init script which expects binaries
 >> to be locate in /sbin while they are installed in /usr/sbin. Please
 >> note, that the systemd init scripts correctly reference them.
 >> Furthermore, the SysV init script did not check for an actual HyperV
 >> environment to be present, which is also corrected. In addition, this
 >> commit also fixes check-package warnings regarding a missing DAEMON
 >> definition.

 >> Signed-off-by: Jens Maus <mail@jens-maus.de>
 >> ---
 >> package/linux-tools/S10hyperv | 8 ++++++--
 >> 1 file changed, 6 insertions(+), 2 deletions(-)

 > This means we can now drop the entry in .checkpackageignore. Committed
 > with that included, thanks.

Committed to 2023.02.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
