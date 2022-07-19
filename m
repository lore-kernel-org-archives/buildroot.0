Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5411C43334
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 16:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 570D4813AE;
	Tue, 19 Jul 2022 16:27:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 570D4813AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vDID0c_acrQR; Tue, 19 Jul 2022 16:27:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A711813A2;
	Tue, 19 Jul 2022 16:27:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A711813A2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5FAE81BF417
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 16:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47D2E415B0
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 16:27:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47D2E415B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pQkOZkOtFOQU for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 16:27:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA5D44154F
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EA5D44154F
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 16:27:14 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CC136200007;
 Tue, 19 Jul 2022 16:27:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oDq3z-002tKb-Ez; Tue, 19 Jul 2022 18:27:11 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <20220613195559.291427-1-fontaine.fabrice@gmail.com>
 <a4318d9e-79c5-86af-a4bf-a0722d39f1be@mind.be>
Date: Tue, 19 Jul 2022 18:27:11 +0200
In-Reply-To: <a4318d9e-79c5-86af-a4bf-a0722d39f1be@mind.be> (Arnout
 Vandecappelle's message of "Sun, 19 Jun 2022 17:44:06 +0200")
Message-ID: <87a6952hls.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/procrank_linux: fix static build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 13/06/2022 21:55, Fabrice Fontaine wrote:
 >> Pass TARGET_CFLAGS which will contain -static to fix the following
 >> static build failure:
 >> /home/buildroot/autobuild/instance-0/output-1/host/bin/sh4a-buildroot-linux-musl-gcc
 >> -Wall procrank.c -Ilibpagemap/include -Llibpagemap -lpagemap -o
 >> procrank
 >> /home/buildroot/autobuild/instance-0/output-1/host/lib/gcc/sh4a-buildroot-linux-musl/10.3.0/../../../../sh4a-buildroot-linux-musl/bin/ld:
 >> /home/buildroot/autobuild/instance-0/output-1/host/lib/gcc/sh4a-buildroot-linux-musl/10.3.0/libgcc.a(unwind-dw2.o):
 >> in function `size_of_encoded_value':
 >> /home/buildroot/autobuild/instance-0/output-1/build/host-gcc-final-10.3.0/build/sh4a-buildroot-linux-musl/libgcc/../../../libgcc/unwind-pe.h:89:
 >> undefined reference to `abort'
 >> Fixes:
 >> - http://autobuild.buildroot.org/results/8eccc34c99a75501179fe93a80646cc684261ff4
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 >  Applied to master, thanks.

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
