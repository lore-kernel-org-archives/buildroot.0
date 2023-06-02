Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2ACCC7EE24
	for <buildroot@archiver.kernel.org>; Fri,  2 Jun 2023 19:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5703041690;
	Fri,  2 Jun 2023 19:25:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5703041690
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UVBjoQTuhm6b; Fri,  2 Jun 2023 19:25:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94A7C41883;
	Fri,  2 Jun 2023 19:25:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94A7C41883
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4778E1BF255
 for <buildroot@lists.busybox.net>; Fri,  2 Jun 2023 19:25:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20EAB41883
 for <buildroot@lists.busybox.net>; Fri,  2 Jun 2023 19:25:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20EAB41883
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id we7iDJFaYQNi for <buildroot@lists.busybox.net>;
 Fri,  2 Jun 2023 19:25:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B87941690
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B87941690
 for <buildroot@buildroot.org>; Fri,  2 Jun 2023 19:25:15 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4C673FF804;
 Fri,  2 Jun 2023 19:25:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q5AOe-00Bs4v-Cw; Fri, 02 Jun 2023 21:25:12 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Sergey Bobrenok via buildroot <buildroot@buildroot.org>
References: <20230529134320.1961326-1-SIBobrenok@sberdevices.ru>
Date: Fri, 02 Jun 2023 21:25:12 +0200
In-Reply-To: <20230529134320.1961326-1-SIBobrenok@sberdevices.ru> (Sergey
 Bobrenok via buildroot's message of "Mon, 29 May 2023 13:43:56 +0000")
Message-ID: <87leh1ekfb.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/3] package/earlyoom: fix daemon executable
 path in the init script
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Sergey Bobrenok <sibobrenok@sberdevices.ru>,
 sdfw_system_team <sdfw_system_team@sberdevices.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Sergey" == Sergey Bobrenok via buildroot <buildroot@buildroot.org> writes:

 > earlyoom.mk file explicitly sets 'PREFIX=/usr', and the init script
 > fails to start earlyoom because of a nonexistent executable path:

 >   # /etc/init.d/S02earlyoom start
 >   start-stop-daemon: unable to stat /bin/earlyoom (No such file or directory)
 >   FAIL

 > Signed-off-by: Sergey Bobrenok <SIBobrenok@sberdevices.ru>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
