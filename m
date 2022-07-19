Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B64C43334
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 17:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF9714109D;
	Tue, 19 Jul 2022 17:03:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF9714109D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id czVOzDhZMlPp; Tue, 19 Jul 2022 17:03:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A51F4032B;
	Tue, 19 Jul 2022 17:03:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A51F4032B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 961811BF417
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 17:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FED440574
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 17:03:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FED440574
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i8pkMGxBtSKQ for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 17:03:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3030E4051C
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3030E4051C
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 17:03:47 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AA471240002;
 Tue, 19 Jul 2022 17:03:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oDqdK-002ub3-Hd; Tue, 19 Jul 2022 19:03:42 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <20220613202855.293980-1-fontaine.fabrice@gmail.com>
 <3330fcee-9e10-ee5e-181a-65b577f15e3e@mind.be>
Date: Tue, 19 Jul 2022 19:03:42 +0200
In-Reply-To: <3330fcee-9e10-ee5e-181a-65b577f15e3e@mind.be> (Arnout
 Vandecappelle's message of "Sun, 19 Jun 2022 17:55:45 +0200")
Message-ID: <87wnc911ch.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/fxload: fix static build
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
Cc: Jeremy Rosen <jeremy.rosen@openwide.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 13/06/2022 22:28, Fabrice Fontaine wrote:
 >> Fix the following static build failure:
 >> /home/buildroot/autobuild/instance-3/output-1/host/bin/sh4-buildroot-linux-musl-gcc
 >> -o fxload ezusb.o main.o
 >> /home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/sh4-buildroot-linux-musl/10.3.0/../../../../sh4-buildroot-linux-musl/bin/ld:
 >> /home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/sh4-buildroot-linux-musl/10.3.0/libgcc.a(unwind-dw2.o):
 >> in function `size_of_encoded_value':
 >> /home/buildroot/autobuild/instance-3/output-1/build/host-gcc-final-10.3.0/build/sh4-buildroot-linux-musl/libgcc/../../../libgcc/unwind-pe.h:89:
 >> undefined reference to `abort'
 >> Fixes:
 >> - http://autobuild.buildroot.org/results/bca28d7a6d2b324fb61fe99b8af4b86caa2350ee
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 >  Applied to master, thanks.

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
