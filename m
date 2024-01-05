Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3586C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 12:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60233436EB;
	Fri,  5 Jan 2024 12:47:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60233436EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EaoIyOlL0xEy; Fri,  5 Jan 2024 12:47:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 445A6401ED;
	Fri,  5 Jan 2024 12:47:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 445A6401ED
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 57D6D1BF422
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 12:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3192A42159
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 12:47:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3192A42159
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id elgWPFZB1LyM for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 12:47:00 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C3E642141
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 12:46:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C3E642141
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2698F1C0008;
 Fri,  5 Jan 2024 12:46:57 +0000 (UTC)
Date: Fri, 5 Jan 2024 13:46:56 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240105134656.100fbdc8@windsurf>
In-Reply-To: <20240105123519.90929-1-fontaine.fabrice@gmail.com>
References: <20240105123519.90929-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704458817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D+RyrlGRscknbQnBA2wqalDwVPD6K35ssMLwDdk6Bcw=;
 b=FiMtMolYsFZfKS1VwSNmlmifr5QMAs1n4K+3UiY/xb6MRZPM9/yDIzOOzw4VW12llSo423
 XtPNKskj7KL309oXf11zp9hIWiMd/3sDuqMgxVIvatDcc4L5KzTbPXCSbMgPIxxcfEj6he
 xUI4GFiifICtffkPXz0okGCurTefvBvRm/FVZksuVStOQaklocT5oa28bl0DywYBG9xuYd
 QG/aHTOK8nit7DpQBuPPdAPfBxe6fOUatK7VMMw40LSu4l2Ft8sUIvg+2XLsikswceEXTD
 gkZ6Ax0n4G/pbkGWGJfr9tGgUcjmqqf4VeNi5/V622QZnvbMvz7fwIImOLQAuw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FiMtMolY
Subject: Re: [Buildroot] [PATCH 1/1] package/cups: fix build without gnutls
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Fri,  5 Jan 2024 13:35:19 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure without gnutls raised since bump to
> version 2.4.7 in commit 55c80fdfb379c74c7f7e8c260dea02e0150d7614 and
> https://github.com/OpenPrinting/cups/commit/b5b1418da7bfb9f81384c7c47cc59890b4d3ff5d
> 
> hash.c:16:12: fatal error: gnutls/crypto.h: No such file or directory
>    16 | #  include <gnutls/crypto.h>
>       |            ^~~~~~~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/888e9e252821bda1e051400d4aa850cd082e8e76
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Thanks for working on this!

I don't immediately see the relationship between the failure without
gnutls and the patches, which are about "put support for MacOS/Win SSL
libs back".

> diff --git a/package/cups/0005-cups-hash.c-Put-support-for-MacOS-Win-SSL-libs-back.patch b/package/cups/0005-cups-hash.c-Put-support-for-MacOS-Win-SSL-libs-back.patch
> new file mode 100644
> index 0000000000..70e6975caa
> --- /dev/null
> +++ b/package/cups/0005-cups-hash.c-Put-support-for-MacOS-Win-SSL-libs-back.patch
> @@ -0,0 +1,379 @@
> +From c6cd5e9c10edc68caf6936a3d3274f758e9cd03d Mon Sep 17 00:00:00 2001
> +From: Zdenek Dohnal <zdohnal@redhat.com>
> +Date: Tue, 3 Oct 2023 13:59:40 +0200
> +Subject: [PATCH 1/2] cups/hash.c: Put support for MacOS/Win SSL libs back

Patches should be generated with git format-patch -N.

> +From 0dd97fcaeeb16ed836e8542d75e2396fb1d129d9 Mon Sep 17 00:00:00 2001
> +From: Zdenek Dohnal <zdohnal@redhat.com>
> +Date: Tue, 3 Oct 2023 14:39:33 +0200
> +Subject: [PATCH 2/2] cups/hash.c: LibreSSL version does not support several
> + hashes

Huh, there is a second patch in the same patch? Is it related to our
issue? If so, how?

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
