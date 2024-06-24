Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610F7C2BD05
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 09:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E86281B26;
	Mon, 24 Jun 2024 09:16:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gin4z7KXPOdp; Mon, 24 Jun 2024 09:16:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2468A81B35
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2468A81B35;
	Mon, 24 Jun 2024 09:16:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9875F1BF48B
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 09:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84C31405D4
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 09:16:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j886xUSQA1SF for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 09:16:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CF579405C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF579405C6
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF579405C6
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 09:16:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AC4FDE0004;
 Mon, 24 Jun 2024 09:16:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sLfoX-00EiY4-0Y;
 Mon, 24 Jun 2024 11:16:41 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240615182023.2963494-1-fontaine.fabrice@gmail.com>
Date: Mon, 24 Jun 2024 11:16:41 +0200
In-Reply-To: <20240615182023.2963494-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 15 Jun 2024 20:20:23 +0200")
Message-ID: <87pls6og3q.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/nut: needs threads
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
Cc: Bernd Kuhls <bernd@kuhls.net>, "Yann E .
 MORIN" <yann.morin.1998@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > threads are mandantory since bump to version 2.8.2 in commit
 > 4edd837ac0193db83202030ee2997ac811e6bc45 and
 > https://github.com/networkupstools/nut/commit/ff401e538bcbead62a3532887135518ef9e779df:

 > In file included from nutipc.cpp:38:
 > ../include/nutipc.hpp:455:3: error: 'pthread_t' does not name a type
 >   455 |   pthread_t m_impl;
 >       |   ^~~~~~~~~

 > Fixes: 4edd837ac0193db83202030ee2997ac811e6bc45
 >  - http://autobuild.buildroot.org/results/d16a24d60b298d7616a516ec0c6c30696ed93a58

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
