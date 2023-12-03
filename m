Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B206EC4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 18:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 498FD415EA;
	Sun,  3 Dec 2023 18:11:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 498FD415EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VMN5QAWyQzWf; Sun,  3 Dec 2023 18:11:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 996994155F;
	Sun,  3 Dec 2023 18:11:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 996994155F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6C7AE1BF408
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 18:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43E0240438
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 18:11:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43E0240438
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nS52vEsvyIHD for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 18:11:49 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B4BB2400D8
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 18:11:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4BB2400D8
Received: by mail.gandi.net (Postfix) with ESMTPSA id ED55C1BF206;
 Sun,  3 Dec 2023 18:11:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r9qwU-009BLq-15;
 Sun, 03 Dec 2023 19:11:46 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20231203174204.6577-1-fontaine.fabrice@gmail.com>
Date: Sun, 03 Dec 2023 19:11:46 +0100
In-Reply-To: <20231203174204.6577-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 3 Dec 2023 18:42:04 +0100")
Message-ID: <87o7f7xijh.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/libmemcached: fix static build
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

 > Fix the following static build failure raised since bump to version
 > 1.1.4 in commit 7205df8a4f3c729b11a5f0c34885e6cf592f24b9:

 > CMake Error at /home/autobuild/autobuild/instance-13/output-1/build/libmemcached-1.1.4/src/bin/cmake_install.cmake:60 (file):
 >   file RPATH_CHANGE could not write new RPATH:

 >     $ORIGIN/../lib

 >   to the file:

 >     /home/autobuild/autobuild/instance-13/output-1/host/arc-buildroot-linux-uclibc/sysroot/usr/bin/memcapable

 >   No valid ELF RPATH or RUNPATH entry exists in the file;
 > Call Stack (most recent call first):
 >   /home/autobuild/autobuild/instance-13/output-1/build/libmemcached-1.1.4/src/cmake_install.cmake:52 (include)
 >   /home/autobuild/autobuild/instance-13/output-1/build/libmemcached-1.1.4/cmake_install.cmake:52 (include)

 > Fixes:
 >  - http://autobuild.buildroot.org/results/778ff517d465896f54a3cd5316a66c54f66fd4cb

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
