Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45EBBC54EE9
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 11:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C256C40399;
	Sat, 17 Sep 2022 11:06:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C256C40399
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GBcBg8Lo7-Ef; Sat, 17 Sep 2022 11:06:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5A19402FE;
	Sat, 17 Sep 2022 11:06:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5A19402FE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 71B591BF5A3
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 11:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49FE2402FE
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 11:06:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49FE2402FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lzP4EsBXmj8D for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 11:06:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23AB740133
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 23AB740133
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 11:06:05 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3F5FB1C0003;
 Sat, 17 Sep 2022 11:06:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oZVe6-009FOq-BY; Sat, 17 Sep 2022 13:06:02 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <cover.1661071280.git.yann.morin.1998@free.fr>
 <97a9cde33a41915b3b4a9cb4f66ca891873ca767.1661071280.git.yann.morin.1998@free.fr>
Date: Sat, 17 Sep 2022 13:06:02 +0200
In-Reply-To: <97a9cde33a41915b3b4a9cb4f66ca891873ca767.1661071280.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 21 Aug 2022 10:41:27 +0200")
Message-ID: <87tu562rc5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] utils/genrandconfig: fix checking host
 glibc version
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

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Unless explicitly told otherwise, subprocess.check_output() returns
 > bytes objects [0].

 > When we try to check the C library version (to check the Linaro
 > toolchain is usable), genrandconfig currently fails with:
 >     TypeError: cannot use a string pattern on a bytes-like object

 > So, as suggested in the python documentation, decocde() the output of
 > subprocess.check_output() before we can use it.

 > [0] https://docs.python.org/3/library/subprocess.html#subprocess.check_output

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
