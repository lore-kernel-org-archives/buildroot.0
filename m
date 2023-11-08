Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 849EDC4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 06:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B68440642;
	Wed,  8 Nov 2023 06:59:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B68440642
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XO1wjZLH6MDW; Wed,  8 Nov 2023 06:59:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BCBF54071B;
	Wed,  8 Nov 2023 06:59:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCBF54071B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DA0401BF215
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 06:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B36CF60B9A
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 06:59:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B36CF60B9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ExAITGc6i4Wv for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 06:59:48 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 65F1960B7C
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 06:59:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65F1960B7C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 472A520005;
 Wed,  8 Nov 2023 06:59:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r0cXQ-0006gS-24;
 Wed, 08 Nov 2023 07:59:44 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20231022202433.33149-1-fontaine.fabrice@gmail.com>
Date: Wed, 08 Nov 2023 07:59:44 +0100
In-Reply-To: <20231022202433.33149-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 22 Oct 2023 22:24:33 +0200")
Message-ID: <87h6lwvifz.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/reproc: fix build with gcc >= 13
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
Cc: TIAN Yuanhao <tianyuanhao3@163.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure with gcc >= 13:
 > In file included from /home/buildroot/autobuild/instance-1/output-1/build/reproc-14.2.4/reproc++/src/reproc.cpp:1:
 > /home/buildroot/autobuild/instance-1/output-1/build/reproc-14.2.4/reproc++/include/reproc++/reproc.hpp:95:5:
 > error: declaration of 'reproc::options::<unnamed struct>
 > reproc::options::env' changes meaning of 'env' [-Wchanges-meaning]
 >    95 |   } env = {};
 >       |     ^~~
 > /home/buildroot/autobuild/instance-1/output-1/build/reproc-14.2.4/reproc++/include/reproc++/reproc.hpp:91:5:
 > note: used here to mean 'class reproc::env'
 >    91 |     env::type behavior;
 >       |     ^~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/11feca3698154c255938ab3b25a34429135c31f8

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
