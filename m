Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 396B3C4332F
	for <buildroot@archiver.kernel.org>; Tue,  8 Nov 2022 19:49:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFAD581E80;
	Tue,  8 Nov 2022 19:49:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFAD581E80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RoTgwqqDNrAB; Tue,  8 Nov 2022 19:49:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F6A981E74;
	Tue,  8 Nov 2022 19:49:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F6A981E74
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7F9F31BF422
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 19:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6674B81E79
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 19:48:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6674B81E79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qF_ckHrdDBAl for <buildroot@lists.busybox.net>;
 Tue,  8 Nov 2022 19:48:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EE7581350
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5EE7581350
 for <buildroot@busybox.net>; Tue,  8 Nov 2022 19:48:58 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B36EF20004;
 Tue,  8 Nov 2022 19:48:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1osUac-000SC2-ON; Tue, 08 Nov 2022 20:48:54 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Baruch Siach via buildroot <buildroot@buildroot.org>
References: <7568ca93d2d360efc2c6096406b8d9af533dec86.1667154015.git.baruch@tkos.co.il>
Date: Tue, 08 Nov 2022 20:48:54 +0100
In-Reply-To: <7568ca93d2d360efc2c6096406b8d9af533dec86.1667154015.git.baruch@tkos.co.il>
 (Baruch Siach via buildroot's message of "Sun, 30 Oct 2022 20:20:15
 +0200")
Message-ID: <87iljpi5w9.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/libcurl: fix crypto backend
 selection
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
Cc: buildroot@busybox.net, Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Baruch" == Baruch Siach via buildroot <buildroot@buildroot.org> writes:

 > Since version 7.77 --with-ssl that used to select OpenSSL renamed to
 > --with-openssl. --without-ssl changed to mean no crypto backend.

 > Only in version 7.86 setting both --without-ssl and some other crypto
 > parameter became a hard configure error.

 > Update OpenSSL selection parameter, and add --without-ssl explicitly for
 > the case of no selected crypto backend.

 > Fixes:
 > http://autobuild.buildroot.net/results/05e9cb71619e640849c27b2984d0df671a9f86c5/
 > http://autobuild.buildroot.net/results/5a4a905de2a232a38916f03278d0a3cbd8a29711/
 > http://autobuild.buildroot.net/results/4432314aa13d4acc8fce27f79177f82298ae0626/

 > Cc: Matt Weber <matthew.weber@collins.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2022.08.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
