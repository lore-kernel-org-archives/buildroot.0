Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8170C00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 14:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A64F60E67;
	Mon,  8 Aug 2022 14:37:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A64F60E67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fV0eK4cwJB2c; Mon,  8 Aug 2022 14:37:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B737360E48;
	Mon,  8 Aug 2022 14:37:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B737360E48
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 022D81BF2A5
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 14:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D08F5409DE
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 14:37:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D08F5409DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jgVw5jMYINO3 for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 14:37:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 678D740222
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 678D740222
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 14:37:05 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F01021C0014;
 Mon,  8 Aug 2022 14:37:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oL3sL-0009KU-EH; Mon, 08 Aug 2022 16:37:01 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220716211605.1650338-1-fontaine.fabrice@gmail.com>
 <20220716211605.1650338-2-fontaine.fabrice@gmail.com>
Date: Mon, 08 Aug 2022 16:37:01 +0200
In-Reply-To: <20220716211605.1650338-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 16 Jul 2022 23:16:05 +0200")
Message-ID: <87h72mssxe.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/libwebsockets: fix openssl
 build without threads
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

 > Fix the following openssl build failure without threads raised since
 > bump to version 4.3.1 in commit 3a9cf51ab38b6a3a095241b8e87eab7e5b5bd617 and
 > https://github.com/warmcat/libwebsockets/commit/471dbf5280b2d0770cdf2803642586cee37a335d:

 > In file included from /home/buildroot/autobuild/instance-0/output-1/build/libwebsockets-4.3.1/include/libwebsockets.h:661,
 >                  from /home/buildroot/autobuild/instance-0/output-1/build/libwebsockets-4.3.1/lib/core/./private-lib-core.h:140,
 >                  from /home/buildroot/autobuild/instance-0/output-1/build/libwebsockets-4.3.1/lib/plat/unix/unix-misc.c:28:
 > /home/buildroot/autobuild/instance-0/output-1/build/libwebsockets-4.3.1/include/libwebsockets/lws-genhash.h:85:18: error: field 'ctx' has incomplete type
 >    85 |         HMAC_CTX ctx;
 >       |                  ^~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/2ae9e3249b6fcc9e6c30e7783e264fc6599e61df

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
