Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6314CC636CD
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 14:13:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 036CB401F5;
	Fri, 10 Feb 2023 14:13:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 036CB401F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 63yoeug8Y09T; Fri, 10 Feb 2023 14:13:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BBA5401B6;
	Fri, 10 Feb 2023 14:13:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BBA5401B6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 388CB1BF2C9
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 14:13:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1278160A70
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 14:13:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1278160A70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UP9TXT6W4Dvy for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 14:13:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1F65606EC
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C1F65606EC
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 14:13:08 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 294DD24000E;
 Fri, 10 Feb 2023 14:13:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pQU9A-00HaLZ-3c; Fri, 10 Feb 2023 15:13:04 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20230208181933.3925279-1-peter@korsgaard.com>
 <20230208181933.3925279-4-peter@korsgaard.com>
Date: Fri, 10 Feb 2023 15:13:04 +0100
In-Reply-To: <20230208181933.3925279-4-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 8 Feb 2023 19:19:31 +0100")
Message-ID: <87ttztehhr.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 4/5] package/jack2: fix build with python >=
 3.11
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
Cc: "Wojciech M. Zabolotny" <wzab01@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/5ce/5ce5ebd20e0e509b31b51d2ec1aed56fdb8f45aa/

 > The bundled waf script is too old (2.0.12) for python >= 3.11 as it uses the
 > 'U' modifier to open (universal newlines), which have been deprecated since
 > python 3.3 and finally removed in 3.11.

 > Jack unfortunately uses a modified waf, so we cannot just set
 > JACK2_NEEDS_EXTERNAL_WAF, so instead backport an upstream patch fixing the
 > compatibility issue:

 > https://github.com/jackaudio/jack2/pull/884

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

I've tweaked the commit message to make it clear that this is about
host-python3 and commmitted, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
