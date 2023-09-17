Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CFBACD37B4
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 06:31:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0FB5610B4;
	Sun, 17 Sep 2023 06:31:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0FB5610B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aCnkT_O3WEpA; Sun, 17 Sep 2023 06:31:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0903B60A98;
	Sun, 17 Sep 2023 06:31:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0903B60A98
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 41AD81BF424
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 06:31:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BC3C610A2
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 06:31:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BC3C610A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zmwfC6qsdNcE for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 06:31:01 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ACF6A60A98
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 06:31:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACF6A60A98
Received: by mail.gandi.net (Postfix) with ESMTPSA id 750421C0003;
 Sun, 17 Sep 2023 06:30:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qhlJ2-00B0VT-L0; Sun, 17 Sep 2023 08:30:56 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Waldemar Brodkorb <wbx@openadk.org>
References: <ZPQ2zZ1dgo6K2mdO@waldemar-brodkorb.de>
Date: Sun, 17 Sep 2023 08:30:56 +0200
In-Reply-To: <ZPQ2zZ1dgo6K2mdO@waldemar-brodkorb.de> (Waldemar Brodkorb's
 message of "Sun, 3 Sep 2023 09:33:33 +0200")
Message-ID: <87v8c9tiov.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/gcc: fix missing .note.GNU-stack
 section
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

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > Shellinabox configure fails to detect ptsname_r, because of the following warning
 > binutils 2.39+ emits:
 > ld: warning: crtend.o: missing .note.GNU-stack section implies executable stack
 > ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker

 > Then the build errors out with:
 > shellinabox/launcher.c:772:12: error: static declaration of 'ptsname_r' follows non-static declaration

 > The same issue exist for cairo 1.16.0 and the detection of pthreads.

 > Fixes:
 >  - http://autobuild.buildroot.net/results/3e4/3e478d22e820703ddfd11d1491e631ef8ed6b29b
 >  - http://autobuild.buildroot.net/results/f60/f602ea17d5938a5beb81d07e13de75ba41d5f6a1

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Committed to 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
