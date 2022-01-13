Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEFCEC433EF
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 20:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60B45408BE;
	Thu, 13 Jan 2022 20:38:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b__K5FBPiuUF; Thu, 13 Jan 2022 20:38:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B05C1415BB;
	Thu, 13 Jan 2022 20:38:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 084BB1BF3ED
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 20:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D84334011B
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 20:38:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bmVsNC5pH2sL for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 20:38:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5842D4010C
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 20:38:35 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 0C4AAC0003;
 Thu, 13 Jan 2022 20:38:31 +0000 (UTC)
Date: Thu, 13 Jan 2022 21:38:31 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20220113213831.4b7c5a8a@windsurf>
In-Reply-To: <20220104200904.1422985-1-aduskett@gmail.com>
References: <20220104200904.1422985-1-aduskett@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/gdb: remove python2 support
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

Hello,

On Tue,  4 Jan 2022 12:09:04 -0800
Adam Duskett <aduskett@gmail.com> wrote:

> According to the GDB 9.2 changelog, python3 has been supported since at least
> 2019.
> 
> - Remove BR2_PACKAGE_HOST_GDB_PYTHON in package/gdb/Config.in.host
> 
> - Add BR2_PACKAGE_HOST_GDB_PYTHON to Config.in.legacy
> 
> - Change depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3 to
>   depends on BR2_PACKAGE_PYTHON3 in package/gdb/Config.in
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

I have applied your patch, after some changes. See below.

> diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
> index a6e1d7f53c..2c6c78f20a 100644
> --- a/package/gdb/Config.in.host
> +++ b/package/gdb/Config.in.host
> @@ -41,11 +41,6 @@ config BR2_PACKAGE_HOST_GDB_NOPYTHON
>  	help
>  	  This option disables Python support in the cross gdb.
>  
> -config BR2_PACKAGE_HOST_GDB_PYTHON
> -	bool "Python 2"
> -	help
> -	  This option enables the Python 2 support in the cross gdb.
> -
>  config BR2_PACKAGE_HOST_GDB_PYTHON3
>  	bool "Python 3"
>  	help

The choice ... endchoice here was no longer needed, so I have only kept
BR2_PACKAGE_HOST_GDB_PYTHON3 as an option.

> diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
> index 4ff498230a..2929eaf058 100644
> --- a/package/gdb/gdb.mk
> +++ b/package/gdb/gdb.mk
> @@ -206,11 +206,6 @@ ifeq ($(BR2_PACKAGE_PYTHON3),y)

This ifeq ($(BR2_PACKAGE_PYTHON3),y) was no longer needed: we know it's
always going to be python3.

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
