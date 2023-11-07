Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D274C4332F
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 19:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 442E0415EF;
	Tue,  7 Nov 2023 19:38:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 442E0415EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nboZyleXzYOz; Tue,  7 Nov 2023 19:38:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84B53415E5;
	Tue,  7 Nov 2023 19:38:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84B53415E5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B5B961BF429
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 19:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99DAF402F6
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 19:38:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99DAF402F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l3bLPcc3WHNW for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 19:38:22 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0083E40004
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 19:38:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0083E40004
Received: by mail.gandi.net (Postfix) with ESMTPSA id 091EBE0004;
 Tue,  7 Nov 2023 19:38:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r0Rty-00HSDO-0h;
 Tue, 07 Nov 2023 20:38:18 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20231030085054.31859-1-fontaine.fabrice@gmail.com>
 <20231101105253.GA114892@scaer>
Date: Tue, 07 Nov 2023 20:38:18 +0100
In-Reply-To: <20231101105253.GA114892@scaer> (Yann E. MORIN's message of "Wed, 
 1 Nov 2023 11:52:53 +0100")
Message-ID: <87bkc5wdzp.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/sedutil: fix build with gcc >=
 13
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Fabrice, All,
 > On 2023-10-30 09:50 +0100, Fabrice Fontaine spake thusly:
 >> Fix the following build failure with gcc >= 13:
 >> 
 >> In file included from ./Common/log.h:45,
 >> from LinuxPBA/LinuxPBA.cpp:25:
 >> ./Common/DtaOptions.h:33:5: error: 'uint8_t' does not name a type
 >> 33 |     uint8_t password;   /**< password supplied */
 >> |     ^~~~~~~
 >> ./Common/DtaOptions.h:1:1: note: 'uint8_t' is defined in header '<cstdint>'; did you forget to '#include <cstdint>'?
 >> 
 >> Fixes:
 >> - http://autobuild.buildroot.org/results/b6feb4fb33d595414b61174deb9867e8c30cd186
 >> 
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 > Applied to master, thanks.

Committed to 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
