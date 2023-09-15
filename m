Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E99EED61A
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 17:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3B3060B7C;
	Fri, 15 Sep 2023 17:41:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3B3060B7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uG6Irz5-1zJY; Fri, 15 Sep 2023 17:41:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C3C160B12;
	Fri, 15 Sep 2023 17:41:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C3C160B12
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E4B5B1BF995
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 17:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE916404EB
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 17:41:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE916404EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DeO3aplFcDw0 for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 17:41:22 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8D03D4012E
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 17:41:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D03D4012E
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2F77060004;
 Fri, 15 Sep 2023 17:41:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qhCog-009RkV-93; Fri, 15 Sep 2023 19:41:18 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
References: <20230910142739.555507-1-ju.o@free.fr>
Date: Fri, 15 Sep 2023 19:41:18 +0200
In-Reply-To: <20230910142739.555507-1-ju.o@free.fr> (Julien Olivain's message
 of "Sun, 10 Sep 2023 16:27:39 +0200")
Message-ID: <875y4buyf5.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 1/1] package/zynaddsubfx: fix build with
 gcc 13
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

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > When compiling with gcc 13, build fails with errors, such as:
 >     In file included from /build/zynaddsubfx-3.0.6/src/Nio/NulEngine.h:21,
 >                      from /build/zynaddsubfx-3.0.6/src/Nio/NulEngine.cpp:14:
 >     /build/zynaddsubfx-3.0.6/src/Nio/MidiIn.h:37:9: error: 'uint8_t' does not name a type
 >        37 |         uint8_t midiSysEx(unsigned char data);
 >           |         ^~~~~~~

 > Those gcc 13 changes were announced at:
 > https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes

 > This commit fixes the issue by adding upstream patches, not yet
 > included in a release.

 > Fixes:
 > http://autobuild.buildroot.net/results/97b5a30c7be820ac91e745cf60f9b759e962aa5c

 > Signed-off-by: Julien Olivain <ju.o@free.fr>
 > ---
 > Changes v1 -> v2:
 > - Reworded the commit log to correct the root cause of the issue
 >   (v1 was mentioning uclibc. it is in fact gcc-13)

Committed to 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
