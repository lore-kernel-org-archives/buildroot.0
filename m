Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFAFEC433F5
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 16:14:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6239611C0
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 16:14:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B6239611C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7292C40260;
	Fri,  5 Nov 2021 16:14:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ggVcMPAULmjy; Fri,  5 Nov 2021 16:14:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1F5C4023B;
	Fri,  5 Nov 2021 16:14:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 62EE41BF2A5
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 16:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51D606154A
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 16:14:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6paKWZjvY9pK for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 16:14:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C8A061681
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 16:14:36 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 22343240010;
 Fri,  5 Nov 2021 16:14:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mj1rO-000813-GC; Fri, 05 Nov 2021 17:14:34 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20211026164534.4014337-1-fontaine.fabrice@gmail.com>
Date: Fri, 05 Nov 2021 17:14:34 +0100
In-Reply-To: <20211026164534.4014337-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 26 Oct 2021 18:45:34 +0200")
Message-ID: <87bl2yful1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/lighttpd: fix build on musl
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure on musl raised since bump to version
 > 1.4.60 in commit d62b7f54f00291a50274409fb5510527fd725ffe:

 > In file included from buffer.h:404,
 >                  from array.h:5,
 >                  from array.c:3:
 > ck.h:24:14: error: expected ';' before 'typedef'
 >    24 | __BEGIN_DECLS
 >       |              ^
 >       |              ;
 > ......
 >    29 | typedef size_t rsize_t;
 >       | ~~~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/0d56a44449e89773499051b35f21ec83bfab4ca6

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I was going to apply this, but it seems like it is in 1.4.61 already, so I
have marked it as superseeded in patchwork.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
