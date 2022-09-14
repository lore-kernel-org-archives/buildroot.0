Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25DC5ECAAD3
	for <buildroot@archiver.kernel.org>; Wed, 14 Sep 2022 21:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6E6B41827;
	Wed, 14 Sep 2022 21:25:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6E6B41827
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wg_G-QE-8NzD; Wed, 14 Sep 2022 21:25:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5590A4181F;
	Wed, 14 Sep 2022 21:25:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5590A4181F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 700831BF5EA
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 21:24:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B88560BF1
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 21:24:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B88560BF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HSOsohySOed1 for <buildroot@lists.busybox.net>;
 Wed, 14 Sep 2022 21:24:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2526B60BEC
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2526B60BEC
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 21:24:57 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E487640002;
 Wed, 14 Sep 2022 21:24:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oYZsN-007otb-0i; Wed, 14 Sep 2022 23:24:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20220804024438.1118030-1-christian@paral.in>
 <20220807154601.45a325c2@windsurf>
Date: Wed, 14 Sep 2022 23:24:54 +0200
In-Reply-To: <20220807154601.45a325c2@windsurf> (Thomas Petazzoni via
 buildroot's message of "Sun, 7 Aug 2022 15:46:01 +0200")
Message-ID: <874jx9ps2h.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/1] package/go: fix go on riscv64 in
 sv57 mode
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Wed,  3 Aug 2022 19:44:38 -0700
 > Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

 >> On machines supporting Riscv SV57 mode like Qemu, Go programs currently crash
 >> with the following type of error:
 >> 
 >> runtime: lfstack.push invalid packing: node=0xffffff5908a940 cnt=0x1
 >> packed=0xffff5908a9400001 -> node=0xffff5908a940
 >> 
 >> The upstream PR fixes this error, but has not yet been merged.
 >> 
 >> Upstream: https://go-review.googlesource.com/c/go/+/409055/4
 >> 
 >> Signed-off-by: Christian Stewart <christian@paral.in>
 >> 
 >> ---

 > Applied to master after renumbering the patch to have only one 0002
 > patch. Thanks!

Committed to 2022.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
