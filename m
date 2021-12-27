Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 910CEC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 11:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F7AC60D78;
	Mon, 27 Dec 2021 11:05:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aLaf3Q1yEt_e; Mon, 27 Dec 2021 11:05:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9ACDC60598;
	Mon, 27 Dec 2021 11:05:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E9CC31BF4DA
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 11:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8C02408FA
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 11:05:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o7X2qwXWLlyO for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 11:05:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A1A77408E1
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 11:05:17 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 6991E2000C;
 Mon, 27 Dec 2021 11:05:14 +0000 (UTC)
Date: Mon, 27 Dec 2021 12:05:13 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: ricardo.martincoski@gmail.com
Message-ID: <20211227120513.6f834122@windsurf>
In-Reply-To: <61c9992c2d979_7a709ec608a0@xultri.mail>
References: <20211226233920.53e17619@windsurf>
 <61c9992c2d979_7a709ec608a0@xultri.mail>
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
Cc: titouan.christophe@railnova.eu, fontaine.fabrice@gmail.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Ricardo,

On Mon, 27 Dec 2021 07:45:00 -0300
ricardo.martincoski@gmail.com wrote:

> 20 |# https://www.mail-archive.com/lttng-dev@lists.lttng.org/msg12950.html
> 21 |LTTNG_LIBUST_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -DUATOMIC_NO_LINK_ERROR"
> 22 |
> 23 |ifeq ($(BR2_PACKAGE_PYTHON),y)
> 24 |LTTNG_LIBUST_DEPENDENCIES += python
> 25 |LTTNG_LIBUST_CONF_OPTS += --enable-python-agent
> 26 |else ifeq ($(BR2_PACKAGE_PYTHON3),y)
> 27 |LTTNG_LIBUST_DEPENDENCIES += python3
> 28 |LTTNG_LIBUST_CONF_OPTS += --enable-python-agent
> 29 |else
> 30 |LTTNG_LIBUST_CONF_ENV = am_cv_pathless_PYTHON="none"
> 31 |LTTNG_LIBUST_CONF_OPTS += --disable-python-agent
> 32 |endif
> 
> Well, it seems that line 30 is indeed overriding line 21 when python is not
> enabled.
>
> As check-package is today, except for _DEPENDENCIES, all other variables can
> have either:
> 
> |ifeq (condition)
> |VAR_1 = value
> |endif
> 
> or:
> 
> |ifeq (condition)
> |VAR_1 += value
> |endif
> 
> check-package will only complain when there is an actual override:
> 
> |VAR_1 = value
> |ifeq (condition)
> |VAR_1 = value
> |endif

Aah, that is the part that I missed!

> We could, for instance, change it to always expect:
> 
> |ifeq (condition)
> |VAR_1 += value
> |endif
> 
> ... catching potential overrides.

Well, I just merged code that does this:

ifeq ($(BR2_ENDIAN),"BIG")
BENTO4_BYTE_ORDER = 0
else
BENTO4_BYTE_ORDER = 1
endif

and here we don't want to force a +=.

So I guess the current behavior of check-package is correct!

Thanks for the clarification!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
