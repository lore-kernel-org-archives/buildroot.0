Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE8BC7EE23
	for <buildroot@archiver.kernel.org>; Mon, 27 Feb 2023 16:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DD3B605A2;
	Mon, 27 Feb 2023 16:03:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DD3B605A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kBuxEEQX4kOm; Mon, 27 Feb 2023 16:03:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C97160E2E;
	Mon, 27 Feb 2023 16:03:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C97160E2E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 35DE91BF31B
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 16:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1002040A60
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 16:03:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1002040A60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KM1iwIKC-inB for <buildroot@lists.busybox.net>;
 Mon, 27 Feb 2023 16:03:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B059C40A64
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B059C40A64
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 16:03:46 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A4404240006;
 Mon, 27 Feb 2023 16:03:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pWfyY-009IaA-Pp; Mon, 27 Feb 2023 17:03:42 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230225231419.22342-1-fontaine.fabrice@gmail.com>
Date: Mon, 27 Feb 2023 17:03:42 +0100
In-Reply-To: <20230225231419.22342-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 26 Feb 2023 00:14:19 +0100")
Message-ID: <87sferksdd.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] boot/mxs-bootlets: fix build without
 any bootstream
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

 > Fix the following build failure raised since the addition of the package
 > in commit 2a636d15217cd326b4546e7017538c7a9e9d399c:

 > sed -i 's,[^
 > *]power_prep.*;,\tpower_prep="/home/autobuild/autobuild/instance-9/output-1/build/mxs-bootlets-10.12.01/power_prep/power_prep";,'
 > /home/autobuild/autobuild/instance-9/output-1/build/mxs-bootlets-10.12.01/
 > sed: couldn't edit /home/autobuild/autobuild/instance-9/output-1/build/mxs-bootlets-10.12.01/: not a regular file

 > Fixes:
 >  - http://autobuild.buildroot.org/results/b4b26f6b02fd1991f46eba5db240e5050b96d333

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
