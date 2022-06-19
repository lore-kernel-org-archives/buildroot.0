Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A271C43334
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 13:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A759882438;
	Sun, 19 Jun 2022 13:47:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A759882438
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d4Tc5c-h-1Rn; Sun, 19 Jun 2022 13:47:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2C3682660;
	Sun, 19 Jun 2022 13:47:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2C3682660
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8BE521BF852
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 13:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6705D82444
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 13:46:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6705D82444
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EwCSviI4lopV for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 13:46:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4861F8244D
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4861F8244D
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 13:46:41 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 24E95100003;
 Sun, 19 Jun 2022 13:46:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1o2vG9-006HWm-Ay; Sun, 19 Jun 2022 15:46:37 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220609212510.2942019-1-fontaine.fabrice@gmail.com>
Date: Sun, 19 Jun 2022 15:46:37 +0200
In-Reply-To: <20220609212510.2942019-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 9 Jun 2022 23:25:10 +0200")
Message-ID: <87a6a8rcjm.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2,1/1] package/noip: fix static build
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

 > Pass TARGET_LDFLAGS (which will contain -static) through LIBS (as
 > LDFLAGS is not supported) to fix the following static build failure
 > (e.g. with musl):

 > /home/autobuild/autobuild/instance-15/output-1/host/lib/gcc/microblazeel-buildroot-linux-musl/10.3.0/../../../../microblazeel-buildroot-linux-musl/bin/ld:
 > /home/autobuild/autobuild/instance-15/output-1/host/lib/gcc/microblazeel-buildroot-linux-musl/10.3.0/libgcc.a(unwind-dw2.o):
 > in function `__gthread_once':
 > /home/autobuild/autobuild/instance-15/output-1/build/host-gcc-final-10.3.0/build/microblazeel-buildroot-linux-musl/libgcc/gthr-default.h:700:
 > undefined reference to `pthread_once'

 > While at it, alsp pass TARGET_{C,CPP}FLAGS through LIBS as suggested by Thomas
 > Petazzoni

 > Fixes:
 >  - http://autobuild.buildroot.org/results/5ea9b1b976aecc401e0aff21eef3e31c8ed17181

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Thomas Petazzoni):
 >  - Pass TARGET_{C,CPP}FLAGS through LIBS

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
