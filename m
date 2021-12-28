Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 369D0C433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 14:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A26B060804;
	Tue, 28 Dec 2021 14:21:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eFWsrEiMfVyV; Tue, 28 Dec 2021 14:21:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE6856070A;
	Tue, 28 Dec 2021 14:21:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1F6B11BF46A
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 14:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E55781771
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 14:21:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CG8E8QjGEYKH for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 14:21:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 00F8681398
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 14:21:03 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id B2FDF40003;
 Tue, 28 Dec 2021 14:21:00 +0000 (UTC)
Date: Tue, 28 Dec 2021 15:20:59 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211228152059.78f64362@windsurf>
In-Reply-To: <20211105201257.2589008-1-fontaine.fabrice@gmail.com>
References: <20211105201257.2589008-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/bird: fix build with autoconf
 >= 2.70
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
Cc: Adrien =?UTF-8?B?R2FsbG91w6t0?= <adrien@gallouet.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Fri,  5 Nov 2021 21:12:57 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> +++ b/package/bird/0001-configure.ac-fix-build-with-autoconf-2.70.patch
> @@ -0,0 +1,43 @@
> +From aa5bc6d2e59c5257d777a45ee4a0e0a784c44244 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Fri, 5 Nov 2021 20:58:41 +0100
> +Subject: [PATCH] configure.ac: fix build with autoconf >= 2.70
> +
> +On some embedded toolchains, glob.h detection fails because -g is
> +wrongly added (even when CFLAGS is overwritten):

I fail to understand why adding -g would cause that build failure.
There is already -g0 in the command line, then -g, which enables
debugging symbols, this shouldn't cause any build failure.

Perhaps the issue is more related to the addition of -flto=4, which
enables link-time optimization?

But even then, I don't quite understand this ac_test_CFLAGS stuff. Do
you understand why their configure.ac script is doing:

# Store this value because ac_test_CFLAGS is overwritten by AC_PROG_CC
if test "$ac_test_CFLAGS" != set ; then
  bird_cflags_default=yes
fi

in the first place?

Could you help me connect the dots here ?

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
