Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85EE7C433EF
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 14:44:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AEDC4166B;
	Fri, 14 Jan 2022 14:44:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YbOjxrfajSu3; Fri, 14 Jan 2022 14:44:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4960741653;
	Fri, 14 Jan 2022 14:44:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7F4B51BF3E5
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 14:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7157141653
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 14:44:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DmJCwgpwqJu7 for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 14:44:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3AD75414C8
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 14:44:35 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::227])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id AB851CC938
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 14:36:06 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id B769120008;
 Fri, 14 Jan 2022 14:35:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1n8NgM-0005P6-O2; Fri, 14 Jan 2022 15:35:58 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <20211125213707.2050547-1-james.hilliard1@gmail.com>
 <593f64b6-cbd0-4777-595f-f24541d27867@mind.be>
Date: Fri, 14 Jan 2022 15:35:58 +0100
In-Reply-To: <593f64b6-cbd0-4777-595f-f24541d27867@mind.be> (Arnout
 Vandecappelle's message of "Mon, 6 Dec 2021 22:17:22 +0100")
Message-ID: <87bl0e8jw1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] utils/scanpypi: fix buildutils check in
 python3
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 25/11/2021 22:37, James Hilliard wrote:
 >> The message attribute does not exist in python3, see PEP-0352:
 >> https://www.python.org/dev/peps/pep-0352/
 >> 
 >> Fixes:
 >> Traceback (most recent call last):
 >> File "utils/scanpypi", line 743, in <module>
 >> main()
 >> File "utils/scanpypi", line 693, in main
 >> if 'buildutils' in err.message:
 >> AttributeError: 'ImportError' object has no attribute 'message'
 >> 
 >> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

 >  Applied to master, thanks.

Committed to 2021.02.x and 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
