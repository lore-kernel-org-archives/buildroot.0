Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A51C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 22:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96B0940A88;
	Tue,  2 Jan 2024 22:21:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96B0940A88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RDVOkxpy1-77; Tue,  2 Jan 2024 22:21:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF2E240A98;
	Tue,  2 Jan 2024 22:21:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF2E240A98
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 276941BF276
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:20:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00AE160E17
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:20:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00AE160E17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kh_X4y0rW-Rd for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 22:20:14 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E317060B8B
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 22:20:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E317060B8B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4EB1BFF809;
 Tue,  2 Jan 2024 22:20:12 +0000 (UTC)
Date: Tue, 2 Jan 2024 23:20:11 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240102232011.5fdc0384@windsurf>
In-Reply-To: <20240102210751.1676704-1-fontaine.fabrice@gmail.com>
References: <20240102210751.1676704-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704234012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+LcXOZyTMFWP2ARJdM9BXpavY8sEJqA2sYDdubW/qhA=;
 b=Zw9hTxg5gdGYG8/0t6yARnkdBUs4szTWp5pD2TijvHZHijGO105MeZSoHc2z6lPyvhjKWN
 X5auAncvBpyF0EsAnmgCDtCDiIUD5wpFeoGawC7mQJfE3GCwbhL4sETa5sq4QQExXN72/n
 HtTLGXga3pNK3wbSHLktNxMBtPI5o8wGiobea6n3E5eKH9kz1InO0Ly+JUEoUVEWzuawGD
 oZVoK9fOqUz+wpf0ZYE+0QEsAc+9Uxs24AgGbaOulNP5ao4DOdUA+6Dz95P20o49s3/twF
 DGtnDPHuQe1LXyNXjWPjSiNT53JQXUaiUZWWNJMEVz7//98P0gsDRQ/KKnwLIQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Zw9hTxg5
Subject: Re: [Buildroot] [PATCH 1/1] package/libcgroup: needs threads
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

On Tue,  2 Jan 2024 22:07:51 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> threads are mandatory since the addition of the package in commit and
> https://github.com/libcgroup/libcgroup/commit/99ccdf671e9df5b13f646e1487393d562aa7fa62
> resulting in the following build failure since commit
> 9d58b525fcfd0d92fcdd3c66d7858213c4b139c6 which enables build on uclibc
> and musl:
> 
> In file included from config.c:30:
> ./libcgroup-internal.h:29:10: fatal error: pthread.h: No such file or directory
>    29 | #include <pthread.h>
>       |          ^~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/87c4454aee97b6955f461651c41c4186a8838c4d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libcgroup/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
