Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9758AC001B0
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 14:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDE49410A6;
	Sun,  6 Aug 2023 14:28:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDE49410A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pAQlUYjac3xS; Sun,  6 Aug 2023 14:28:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 740D9410B8;
	Sun,  6 Aug 2023 14:28:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 740D9410B8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1FE6F1BF340
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B63460E61
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:27:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B63460E61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CsVxWoA8hFYm for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 14:27:45 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A95A960593
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 14:27:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A95A960593
Received: by mail.gandi.net (Postfix) with ESMTPSA id 965FE1C0007;
 Sun,  6 Aug 2023 14:27:42 +0000 (UTC)
Date: Sun, 6 Aug 2023 16:27:41 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230806162741.0e4d071f@windsurf>
In-Reply-To: <20230731204947.2275706-1-bernd@kuhls.net>
References: <20230731204947.2275706-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691332062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LWRSPuvY8BhdaMP1dHzyGBc98m4XTC0NzxrFQ5i6POw=;
 b=IctmTab9+E+wp/qmEXJK+Li/EEFk9RM4TJaVpeGUypiiZs6E2NxBnEZXfmCI7+twJbmV1M
 kzQvnnMv6eXnkpvZ/tO1CUz6qpWsyosFvyMhUNV0MD5feeOyJ9GXK+uSrq3I/7N/OT5tFN
 Lw0kscruWMOepTYhts1koLjNRcNxO70N5sP1pMRHO3QmAEUoRxuYqBPpZ9xgcExQOc7UYV
 5mifbS8GyIv83J0LoqSq5SUrBeGxeXvz3+gwan6TAXU4wqjNjl5whK1vU3rvRJMxmLXtmj
 kKcTbMVLg1/2zNMWAbVFjyLrEUREk1J65PtKv1Ymo/xr0+SK+V4iwu14xFij3g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IctmTab9
Subject: Re: [Buildroot] [PATCH 1/2] package/sentry-cli: fix build with
 OpenSSL 3.x
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 31 Jul 2023 22:49:46 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/4e2/4e24cb67402bad35ab57833d72e6c857b3eb4e07/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  ...able-SSL-support-for-the-curl-module.patch | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 package/sentry-cli/0001-Disable-SSL-support-for-the-curl-module.patch

Applied to both master and next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
