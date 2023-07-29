Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D0FAC04A6A
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 22:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F69B81FF7;
	Sat, 29 Jul 2023 22:15:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F69B81FF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KLR_xqjBSs5c; Sat, 29 Jul 2023 22:15:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8518D81DEB;
	Sat, 29 Jul 2023 22:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8518D81DEB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5D4261BF40A
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 22:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3712D81DEB
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 22:15:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3712D81DEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5dyBKA8nkQfK for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 22:15:08 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0550581B17
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 22:15:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0550581B17
Received: by mail.gandi.net (Postfix) with ESMTPSA id A2A3D20003;
 Sat, 29 Jul 2023 22:14:58 +0000 (UTC)
Date: Sun, 30 Jul 2023 00:14:55 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230730001455.3be052c5@windsurf>
In-Reply-To: <20230709091622.1022345-1-bernd@kuhls.net>
References: <20230709091622.1022345-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690668905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MZ0F+350J7PEROBzCWbLbpZz/uTDWgIA1pvDQpckMxU=;
 b=o7OIHcvRma5GYm0M4Hj3xYs6hGT+A8Gws+eKM38iAO6a1bYOTTP2I9C0CKi1Iukmr1glLZ
 qRLR0gyPegYIQDBSjvHy7QPDn1OsHDBUvfOvUmNbqgJF71vNWBcWIXnF/C/3eUUrPKON7T
 ZqD8m77e15KKPS5sWTDUKISuY2HnKS9Fnw/54mrwVIj9R66WGxA72ZhFTxpqxssNpEEmEY
 0zXVAa2iYJf7uuqU2LuyVXyEn+5UEcqJBhWbAtSGP54M9SVDOdQcbCrMhq5S27KJWVR56E
 ifwc7Tx0yJxAYjmXxYdRrawlnTTbKpuj4xwfrLxf75ZBtvG0DOhPlVWxEbSnxQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=o7OIHcvR
Subject: Re: [Buildroot] [PATCH 1/1] package/shadow: Fix yescrypt-only build
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
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  9 Jul 2023 11:16:22 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/afd/afd5d59f94986593cd697148f4cce2bf70e4d81b/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .../shadow/0001-Fix-yescrypt-support.patch    | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/shadow/0001-Fix-yescrypt-support.patch

Applied to master after updating the Upstream: tag to point to the
final upstream commit, as it has been merged. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
