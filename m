Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD44EC04AB7
	for <buildroot@archiver.kernel.org>; Wed, 20 Sep 2023 20:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4736183B98;
	Wed, 20 Sep 2023 20:21:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4736183B98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9rY7hZhUPi1g; Wed, 20 Sep 2023 20:21:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9397D83B85;
	Wed, 20 Sep 2023 20:21:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9397D83B85
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0639A1BF392
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 20:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D337183B85
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 20:21:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D337183B85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tzu1vAZnE28d for <buildroot@lists.busybox.net>;
 Wed, 20 Sep 2023 20:21:08 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8947683B64
 for <buildroot@buildroot.org>; Wed, 20 Sep 2023 20:21:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8947683B64
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6445BC0009;
 Wed, 20 Sep 2023 20:20:45 +0000 (UTC)
Date: Wed, 20 Sep 2023 22:20:44 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230920222044.2cebba47@windsurf>
In-Reply-To: <20230918203711.2650666-1-fontaine.fabrice@gmail.com>
References: <20230918203711.2650666-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1695241264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=slZPuE2iQ5Puk0momym6eWURrjDxTRGdTnpe7vsfa2s=;
 b=YZylbvMBHTQGxGM+GmN/UaTbouCLn3LJ6F+T+nK4OivlnV/LJ85/MnKiryAPksP2jjHgTS
 v7W1I5+aIs8djnQO3ogjNH4Pb4mvGDU5vxbEpJOSogSVKgLXgnccW58UhWAsrwWJIaRgwz
 15HXt9JHoEHvbv6fZPJNitnn/pAgFwIqBzFsRD/vVh/RlzVvryIw94oX7g9HElPwTOefxh
 tjqE2wVjrDuGmr39SZDSyjva3k3zczUAl6gTE7I4gLgUn+vNEp/pFrZ7OgJ8JVaqcd4UL4
 HacdO9PwGzNNC3MMBpfn5AimpKRjmbvUNW3pWyTlYvhLE/Gd4i3mrNV5hyGSVg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YZylbvMB
Subject: Re: [Buildroot] [PATCH 1/1] package/util-linux: fix build with
 uclibc-ng < 1.0.42
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 18 Sep 2023 22:37:11 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> index 73eda5c171..72126adb00 100644
> --- a/package/util-linux/util-linux.mk
> +++ b/package/util-linux/util-linux.mk
> @@ -96,6 +96,9 @@ endif
>  UTIL_LINUX_CONF_OPTS += --without-ncursesw --without-ncurses
>  endif
>  
> +# workaround for static_assert on uclibc-ng < 1.0.42
> +UTIL_LINUX_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -Dstatic_assert=_Static_assert"

This should have been UTIL_LINUX_LIBS_CONF_ENV. make check-package is
smart enough to detect this:

WARNING: package/util-linux/util-linux-libs/util-linux-libs.mk:56: possible typo: UTIL_LINUX_CONF_ENV -> *UTIL_LINUX_LIBS*

I fixed that when applying.

However, overall, I think we should probably stop using those older
toolchains. Practically speaking for uClibc, we only support a
reasonably recent uClibc variant in Buildroot.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
