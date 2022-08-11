Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E4FBC19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 19:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C17182A95;
	Thu, 11 Aug 2022 19:32:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C17182A95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kr77b1q0ll_D; Thu, 11 Aug 2022 19:32:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF999828D1;
	Thu, 11 Aug 2022 19:32:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF999828D1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 58CA51BF3AA
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 19:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2ADED41763
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 19:32:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2ADED41763
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CIYdHxgiktes for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 19:32:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AE9141747
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8AE9141747
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 19:32:52 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 58CEF240006;
 Thu, 11 Aug 2022 19:32:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oMDvF-0033OD-6y; Thu, 11 Aug 2022 21:32:49 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20220614161508.419275-1-ben.hutchings@mind.be>
 <20220722230504.407c743d@windsurf>
Date: Thu, 11 Aug 2022 21:32:49 +0200
In-Reply-To: <20220722230504.407c743d@windsurf> (Thomas Petazzoni via
 buildroot's message of "Fri, 22 Jul 2022 23:05:04 +0200")
Message-ID: <87y1vuinj2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/swupdate: Add upstream patch to fix
 build with uclibc
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
Cc: Ben Hutchings <ben.hutchings@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Tue, 14 Jun 2022 18:15:09 +0200
 > Ben Hutchings <ben.hutchings@mind.be> wrote:

 >> Fix the following build failure with uclibc:
 >> 
 >> core/bootloader.c: In function 'register_bootloader':
 >> core/bootloader.c:28:15: warning: implicit declaration of function 'reallocarray' [-Wimplicit-function-declaration]
 >> 28 |  entry *tmp = reallocarray(available, num_available + 1, sizeof(entry));
 >> |               ^~~~~~~~~~~~
 >> core/bootloader.c:28:15: warning: initialization of 'entry *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
 >> [...]
 >> .../arm-buildroot-linux-uclibcgnueabi/bin/ld: core/built-in.o: in function `register_bootloader':
 >> (.text.register_bootloader+0x2c): undefined reference to `reallocarray'
 >> 
 >> Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
 >> ---
 >> ...der.c-fix-build-without-reallocarray.patch | 35 +++++++++++++++++++
 >> 1 file changed, 35 insertions(+)
 >> create mode 100644 package/swupdate/0001-swupdate-core-bootloader.c-fix-build-without-reallocarray.patch

 > Thanks a lot, applied to master after adding a reference to an
 > autobuilder failure that this patch is fixing. Many thanks!

Committed to 2022.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
