Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E597EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Dec 2021 22:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 873E840963;
	Sun, 26 Dec 2021 22:39:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xN9rYLHpbVRZ; Sun, 26 Dec 2021 22:39:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5A4040441;
	Sun, 26 Dec 2021 22:39:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C53221BF2B9
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 22:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7D5B8148A
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 22:39:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Go6U319NDOQ for <buildroot@lists.busybox.net>;
 Sun, 26 Dec 2021 22:39:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE07181471
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 22:39:23 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 8910B240006;
 Sun, 26 Dec 2021 22:39:21 +0000 (UTC)
Date: Sun, 26 Dec 2021 23:39:20 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Message-ID: <20211226233920.53e17619@windsurf>
In-Reply-To: <20211115235336.3814968-1-ricardo.martincoski@gmail.com>
References: <20211115235336.3814968-1-ricardo.martincoski@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] utils/checkpackagelib/lib_mk.py: fix check
 for overridden variable
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
Cc: Titouan Christophe <titouan.christophe@railnova.eu>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Ricardo,

On Mon, 15 Nov 2021 20:53:36 -0300
Ricardo Martincoski <ricardo.martincoski@gmail.com> wrote:

> Currently this .mk snippet results in unexpected behavior from
> check-package:
> |VAR_1 = VALUE1
> |ifeq (condition)
> |VAR_1 := $(VAR_1), VALUE2
> |endif

There is apparently still a problem with this check. Indeed, I just
committed 1118f2c51c357d968e2d08e31ad3c741f5fa7df8 which adds an
unconditional:

+# https://www.mail-archive.com/lttng-dev@lists.lttng.org/msg12950.html
+LTTNG_LIBUST_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -DUATOMIC_NO_LINK_ERROR"

but even though it is outside of any condition, check-package complains:

package/lttng-libust/lttng-libust.mk:30: conditional override of variable LTTNG_LIBUST_CONF_ENV

I have not investigated further this issue for now.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
