Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 711DAECAAD3
	for <buildroot@archiver.kernel.org>; Thu, 15 Sep 2022 07:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6BED832E7;
	Thu, 15 Sep 2022 07:27:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6BED832E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HBjXktHIz5yR; Thu, 15 Sep 2022 07:27:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D46182E14;
	Thu, 15 Sep 2022 07:27:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D46182E14
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 122191BF344
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 07:27:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1AE7408C4
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 07:27:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1AE7408C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A9zF-sQdaAKN for <buildroot@lists.busybox.net>;
 Thu, 15 Sep 2022 07:27:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD9B34039D
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AD9B34039D
 for <buildroot@buildroot.org>; Thu, 15 Sep 2022 07:27:38 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7A7811C000A;
 Thu, 15 Sep 2022 07:27:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oYjHa-0089r1-Db; Thu, 15 Sep 2022 09:27:34 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220809215915.2740950-1-fontaine.fabrice@gmail.com>
Date: Thu, 15 Sep 2022 09:27:34 +0200
In-Reply-To: <20220809215915.2740950-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 9 Aug 2022 23:59:15 +0200")
Message-ID: <87h719m715.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/ficl: fix musl static build
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Pass LDFLAGS to avoid the following musl static build failure raised
 > since the addition of the package in commit
 > 814911aecb6d49bb603c34dbfcc0d86614516b41:

 > /home/autobuild/autobuild/instance-5/output-1/host/lib/gcc/sh4eb-buildroot-linux-musl/11.3.0/../../../../sh4eb-buildroot-linux-musl/bin/ld:
 > /home/autobuild/autobuild/instance-5/output-1/host/lib/gcc/sh4eb-buildroot-linux-musl/11.3.0/libgcc.a(unwind-dw2.o):
 > in function `size_of_encoded_value':
 > /home/autobuild/autobuild/instance-5/output-1/build/host-gcc-final-11.3.0/build/sh4eb-buildroot-linux-musl/libgcc/../../../libgcc/unwind-pe.h:89:
 > undefined reference to `abort'

 > Fixes:
 >  - http://autobuild.buildroot.org/results/bf041723ed813746c61892262630a3ac2bc43b14

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
