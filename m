Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37FEDC4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 22:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9DEA4186D;
	Thu,  3 Nov 2022 22:23:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9DEA4186D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E_Fdcs1T5jGB; Thu,  3 Nov 2022 22:23:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34D8C41869;
	Thu,  3 Nov 2022 22:23:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34D8C41869
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 50E6B1BF331
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 22:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 198CC61048
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 22:23:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 198CC61048
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A5r-YaWeQvgA for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 22:23:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C76A66103B
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C76A66103B
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 22:23:33 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 01740FF805;
 Thu,  3 Nov 2022 22:23:31 +0000 (UTC)
Date: Thu, 3 Nov 2022 23:23:30 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221103232330.11e41109@windsurf>
In-Reply-To: <20220925152452.353907-1-fontaine.fabrice@gmail.com>
References: <20220925152452.353907-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667514212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p9TTTfrHNaml63BgoVCzWPNlxYAPfYrdfFT/Yx7I4DE=;
 b=p17KHwoitcymVz/HnP+NNKX+T9TaNCwmntCI6T9vEsdtWEg4TDCN3E70u5qjypYFbZWp0y
 jNv6xZaQBmvdlBlYRBVXiL8ZWDvQS2FwpQd9zLfgGV+ePeB1kuN0U9gkcIwOF9HgrFgaf/
 DkNOKczNu7mO8LjpJYUCZ5D2j4TtufLVy8qgkpeZRmMJAu3sAZl5r/zgncoGs0zstqc1BH
 D9Vx+M1V5thktjDD3/EmK6vJf0qRqiox+AGeiRQkH1gaAkkY4yP9qIGLzkhBSddRnyvSFk
 wQY1ZtN32fXPtvmm5fIDTIPV1WtLSwxihmP07Li960hch/EG3DkYggZ76evTSw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=p17KHwoi
Subject: Re: [Buildroot] [PATCH 1/1] package/vdr: fix build with gcc >= 11
 and uclibc < 1.0.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 25 Sep 2022 17:24:52 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop static from first patch to fix the following build failure with
> gcc >= 11 and uclibc < 1.0.0 (prior to
> https://github.com/wbx-github/uclibc-ng/commit/5c484467f718a25e94a88b11bdbb670ddb1c0d0f):

This explanation can't be correct, because the build failure does not
occur with uclibc < 1.0.0. The build failure you're pointing to is
recent, so it was with a recent version of uclibc, as the build failure
configuration is using an internal toolchain. Or I'm missing something?

> 
> skinlcars.c:1105:12: error: 'int getloadavg(double*, int)' was declared 'extern' and later 'static' [-fpermissive]
>  1105 | static int getloadavg (double loadavg[], int nelem)
>       |            ^~~~~~~~~~
> In file included from /home/buildroot/autobuild/run/instance-3/output-1/host/xtensa-buildroot-linux-uclibc/include/c++/11.3.0/cstdlib:75,
>                  from /home/buildroot/autobuild/run/instance-3/output-1/host/xtensa-buildroot-linux-uclibc/include/c++/11.3.0/stdlib.h:36,
>                  from config.h:15,
>                  from channels.h:13,
>                  from skins.h:13,
>                  from skinlcars.h:13,
>                  from skinlcars.c:26:
> /home/buildroot/autobuild/run/instance-3/output-1/host/xtensa-buildroot-linux-uclibc/sysroot/usr/include/stdlib.h:920:12: note: previous declaration of 'int getloadavg(double*, int)'
>   920 | extern int getloadavg (double __loadavg[], int __nelem)
>       |            ^~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/2d9fe8548ccbbcad3f86051509bf811fedb1d8e9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Also, Yann came up with some feedback. Have you had the chance to look
into it?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
