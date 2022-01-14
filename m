Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD4CC433F5
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 16:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8876560B3C;
	Fri, 14 Jan 2022 16:05:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eSm1dquPubjv; Fri, 14 Jan 2022 16:05:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D273860806;
	Fri, 14 Jan 2022 16:05:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 569041BF362
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 16:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40CE660806
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 16:05:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I3PNNtkNkGny for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 16:05:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 79D94607EC
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 16:05:22 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 4F9A8100009;
 Fri, 14 Jan 2022 16:05:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1n8P4p-00009J-Jh; Fri, 14 Jan 2022 17:05:19 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>
References: <20211115235336.3814968-1-ricardo.martincoski@gmail.com>
Date: Fri, 14 Jan 2022 17:05:19 +0100
In-Reply-To: <20211115235336.3814968-1-ricardo.martincoski@gmail.com> (Ricardo
 Martincoski's message of "Mon, 15 Nov 2021 20:53:36 -0300")
Message-ID: <87pmou716o.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] utils/checkpackagelib/lib_mk.py: fix check
 for overridden variable
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
Cc: Titouan Christophe <titouan.christophe@railnova.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Ricardo" == Ricardo Martincoski <ricardo.martincoski@gmail.com> writes:

 > Currently this .mk snippet results in unexpected behavior from
 > check-package:
 > |VAR_1 = VALUE1
 > |ifeq (condition)
 > |VAR_1 := $(VAR_1), VALUE2
 > |endif

 > Fix commit "163f160a8e utils/{check-package, checkpackagelib}:
 > consistently use raw strings for re.compile" that ended up doing this:
 > -    CONCATENATING = re.compile("^([A-Z0-9_]+)\s*(\+|:|)=\s*\$\(\\1\)")
 > +    CONCATENATING = re.compile(r"^([A-Z0-9_]+)\s*(\+|:|)=\s*\$\(\\1\)")

 > But raw strings do not expect escaping when referencing \1 and the
 > pattern ends up searching for a raw '\\1' instead of an occurrence of
 > the first pattern inside parenthesis.

 > |$ python3
 > |Python 3.8.10 (default, Sep 28 2021, 16:10:42)
 > |[GCC 9.3.0] on linux
 > |Type "help", "copyright", "credits" or "license" for more information.
 > |>>> import re
 > |>>> p1 = re.compile('(foo)bar\\1')
 > |>>> p2 = re.compile(r'(foo)bar\\1')
 > |>>> p3 = re.compile(r'(foo)bar\1')
 > |>>> s1 = 'foobarfoo'
 > |>>> s2 = 'foobar\\1'
 > |>>> print(p1.search(s1))
 > |<re.Match object; span=(0, 9), match='foobarfoo'>
 > |>>> print(p2.search(s1))
 > |None
 > |>>> print(p3.search(s1))
 > |<re.Match object; span=(0, 9), match='foobarfoo'>
 > |>>> print(p1.search(s2))
 > |None
 > |>>> print(p2.search(s2))
 > |<re.Match object; span=(0, 8), match='foobar\\1'>
 > |>>> print(p3.search(s2))
 > |None
 > |>>>

 > So use '\1' instead of '\\1' in the raw string.

 > Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Titouan Christophe <titouan.christophe@railnova.eu>

Committed to 2021.02.x and 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
