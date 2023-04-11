Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB6D5C77B6F
	for <buildroot@archiver.kernel.org>; Tue, 11 Apr 2023 13:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CED041D5F;
	Tue, 11 Apr 2023 13:07:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CED041D5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GYybQIp-2kvA; Tue, 11 Apr 2023 13:07:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 236424093F;
	Tue, 11 Apr 2023 13:07:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 236424093F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 39DC21BF4E6
 for <buildroot@lists.busybox.net>; Tue, 11 Apr 2023 13:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 209898208E
 for <buildroot@lists.busybox.net>; Tue, 11 Apr 2023 13:07:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 209898208E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gao0jcX7Scit for <buildroot@lists.busybox.net>;
 Tue, 11 Apr 2023 13:07:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE89E81F58
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE89E81F58
 for <buildroot@buildroot.org>; Tue, 11 Apr 2023 13:07:48 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DF17024000E;
 Tue, 11 Apr 2023 13:07:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pmDio-0068B9-V5; Tue, 11 Apr 2023 15:07:42 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <20230407141930.694756-1-ovlevin@sberdevices.ru>
 <3eff15aa-5790-604e-d6de-90ed5d2d3eb7@mind.be>
 <877cuisixk.fsf@dell.be.48ers.dk>
 <f45690e2-1ed1-5019-3bc9-da0704785a3c@mind.be>
Date: Tue, 11 Apr 2023 15:07:42 +0200
In-Reply-To: <f45690e2-1ed1-5019-3bc9-da0704785a3c@mind.be> (Arnout
 Vandecappelle's message of "Tue, 11 Apr 2023 15:01:40 +0200")
Message-ID: <87y1myr2ht.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/linux-headers: use host-make
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
Cc: olegartys@gmail.com, Oleg Lyovin <ovlevin@sberdevices.ru>,
 sdfw_system_team@sberdevices.ru, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 11/04/2023 14:27, Peter Korsgaard wrote:
 >>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
 >> > On 07/04/2023 16:19, Oleg Lyovin wrote:
 >> >> GNU make package from the host machine may be too old,
 >> >> so use the one built by buildroot.
 >> >> Signed-off-by: Oleg Lyovin <ovlevin@sberdevices.ru>
 >> >  Applied both to master, after reworking the commit messages to
 >> >  reflect that this was introduced in Linux 6.2.
 >> Thanks. Maybe time has come to also require make >= 3.82 globally in
 >> Buildroot?  It was released almost 10 years ago by now:
 >> https://lists.gnu.org/archive/html/info-gnu/2010-07/msg00023.html

 >  The only reason to do that is to avoid needing to make such changes
 >  in the future for packages that require make >= 3.82, right? That
 > would only help for Linux - u-boot and glibc require make >= 4.0. For
 > ti-k3-r5-loader the commit message doesn't specify what the minimum
 > version is, but I can imagine it's also 4.0. And I expect in the
 > future the minimum is going to be more likely to be 4.0 than 3.82.

Sure, I would just be a step towards requiring make 4.0 (which is also
10 years old by now:
https://lists.gnu.org/archive/html/make-w32/2013-10/msg00021.html), but
true - We can also just consider going straight from 3.81 to 4.0.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
