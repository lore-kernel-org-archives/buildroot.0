Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E91A6C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 21:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 914E4400F9;
	Sun,  3 Dec 2023 21:36:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 914E4400F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TvUeVCKsDaB9; Sun,  3 Dec 2023 21:36:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3B334047D;
	Sun,  3 Dec 2023 21:36:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3B334047D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7618E1BF3EE
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 21:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E8AF40932
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 21:36:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E8AF40932
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tFTZQ09FX5aO for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 21:36:24 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 62B384092D
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 21:36:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62B384092D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 98753240005;
 Sun,  3 Dec 2023 21:36:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r9u8S-009hjQ-3B;
 Sun, 03 Dec 2023 22:36:21 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20231203084445.471234-1-fontaine.fabrice@gmail.com>
Date: Sun, 03 Dec 2023 22:36:20 +0100
In-Reply-To: <20231203084445.471234-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 3 Dec 2023 09:44:45 +0100")
Message-ID: <87v89fufxn.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/libmemcached: fix build with
 gcc 4.8
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure with gcc 4.8 raised since bump to
 > version 1.1.4 in commit 7205df8a4f3c729b11a5f0c34885e6cf592f24b9:

 > /home/buildroot/autobuild/run/instance-0/output-1/build/libmemcached-1.1.4/src/libmemcachedprotocol/ascii_handler.c: In function 'ascii_get_response_handler':
 > /home/buildroot/autobuild/run/instance-0/output-1/build/libmemcached-1.1.4/src/libmemcachedprotocol/ascii_handler.c:249:3: error: 'for' loop initial declarations are only allowed in C99 mode
 >    for (int x = 0; x < keylen; ++x) {
 >    ^

 > Fixes:
 >  - http://autobuild.buildroot.org/results/202aeec4dda822ac341d8882f84f968a303697c3

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
