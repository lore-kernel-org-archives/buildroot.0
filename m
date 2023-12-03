Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4300CC4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 16:44:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E056C4150E;
	Sun,  3 Dec 2023 16:44:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E056C4150E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A77duqun5q-w; Sun,  3 Dec 2023 16:44:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4589640910;
	Sun,  3 Dec 2023 16:44:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4589640910
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5368D1BF471
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 16:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 299D781A65
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 16:44:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 299D781A65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rixCuSDPYCqr for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 16:44:06 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 968C281B70
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 16:44:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 968C281B70
Received: by mail.gandi.net (Postfix) with ESMTPSA id AAE74FF803;
 Sun,  3 Dec 2023 16:44:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r9pZa-0096CF-39;
 Sun, 03 Dec 2023 17:44:02 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20231201210645.781257-1-fontaine.fabrice@gmail.com>
Date: Sun, 03 Dec 2023 17:44:02 +0100
In-Reply-To: <20231201210645.781257-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 1 Dec 2023 22:06:45 +0100")
Message-ID: <875y1f1bjh.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/monit: fix openssl static build
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > --with-ssl-dir will exclusively search for dynamic library so use
 > --with-ssl-static to fix the following openssl static build failure
 > raised since bump to version 5.33.0 in commit
 > 8cedb39764f70f9d467bf0cc1acc99a8bbb963d6:

 > checking for static SSL support... disabled
 > checking for SSL support... enabled
 > checking for SSL include directory... /home/buildroot/autobuild/instance-2/output-1/host/mipsel-buildroot-linux-uclibc/sysroot/usr/include
 > checking for SSL library directory... /lib64

 > [...]

 > mipsel-buildroot-linux-uclibc-gcc: ERROR: unsafe header/library path used in cross-compilation: '-L/lib64'

 > Fixes:
 >  - http://autobuild.buildroot.org/results/4189decbafb5d28c11d89ddac792b4610abeaff1

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Yann E. Morin):
 >  - Only pass --with-ssl when building dynamically as this flag is
 >    ignored when building --with-ssl-static

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
