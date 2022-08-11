Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D054C19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 19:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A292160BBD;
	Thu, 11 Aug 2022 19:30:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A292160BBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fKDkAwTcRUcT; Thu, 11 Aug 2022 19:30:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D960160A79;
	Thu, 11 Aug 2022 19:29:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D960160A79
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 94E421BF3AA
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 19:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 697DA40382
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 19:29:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 697DA40382
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 46EzwVBkzVbu for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 19:29:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3380140341
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3380140341
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 19:29:54 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9E123240002;
 Thu, 11 Aug 2022 19:29:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oMDsM-0032ou-9S; Thu, 11 Aug 2022 21:29:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <Yqim4TOtcyKtFHJj@cephalopod> <20220722230033.673ee11e@windsurf>
Date: Thu, 11 Aug 2022 21:29:50 +0200
In-Reply-To: <20220722230033.673ee11e@windsurf> (Thomas Petazzoni via
 buildroot's message of "Fri, 22 Jul 2022 23:00:33 +0200")
Message-ID: <8735e2k28h.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/zlib-ng: Add upstream patch to fix
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

 > On Tue, 14 Jun 2022 17:18:57 +0200
 > Ben Hutchings <ben.hutchings@mind.be> wrote:

 >> Fix the following build failure with uclibc on arm architectures (and
 >> similar on powerpc):
 >> 
 >> /home/buildroot/autobuild/instance-2/output-1/build/zlib-ng-2.0.6/arch/arm/armfeature.c:4:12: fatal error: sys/auxv.h: No such file or directory
 >> 4 | #  include <sys/auxv.h>
 >> |            ^~~~~~~~~~~~
 >> compilation terminated.
 >> 
 >> Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
 >> ---
 >> ...-sys-auxv.h-exists-at-configure-time.patch | 90 +++++++++++++++++++
 >> 1 file changed, 90 insertions(+)
 >> create mode 100644 package/zlib-ng/0003-zlib-ng-check-that-sys-auxv.h-exists-at-configure-time.patch

 > Applied to master after adding a reference to an autobuilder failure
 > that this is fixing.

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
