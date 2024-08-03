Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9AFBC3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 18:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD6AE403A7;
	Sat,  3 Aug 2024 18:29:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1izhbvvl1Al9; Sat,  3 Aug 2024 18:29:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79502403B8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79502403B8;
	Sat,  3 Aug 2024 18:29:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E19F31BF364
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 18:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDB0681441
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 18:29:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ozhQ-DbecFL for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 18:29:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CCE6B8143C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCE6B8143C
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CCE6B8143C
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 18:29:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C0D54E0002;
 Sat,  3 Aug 2024 18:29:18 +0000 (UTC)
Date: Sat, 3 Aug 2024 20:29:17 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240803202917.4261ba06@windsurf>
In-Reply-To: <20240803104634.2574205-1-bernd@kuhls.net>
References: <20240803104634.2574205-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722709759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EOxJGQj5WW88E7PGdEf+S3jLztsljuezLf44SccKKlQ=;
 b=Rmcj4LOY1Ee6PK4Anv3WM2Y7zLsUlVOMIwjrPL5M0lc02i1dVK0Vgyh+EnDjW91r+DgyOo
 P5oRH8oIwikttOfBPtllgrsJAoihGoFCyk2Ey5QSCNlqlRrpnbsyWUeqyUVwai3QYUDjDh
 qTyyoNSTdYWmQf/DgMR6E7JhbvP47WUqXH5imahH3iL6YfHvL675ag7uNx5jFyDG6MnzLq
 4Aqb1qYOqm56oHNNG4VqI8ZtfZJfjla+LbNsUdKHWlyckNpOjm808yVnvqrDMAe+2Sr0xh
 OBybUjBGx613Kuno6hYJNLbhCj1aiybSciBudyyBpIMyQhbGi5eSGnXqnAhtCQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Rmcj4LOY
Subject: Re: [Buildroot] [PATCH 1/2] {linux, linux-headers}: bump 6.{1, 6,
 10}.x series
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

On Sat,  3 Aug 2024 12:46:33 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  linux/Config.in                      | 2 +-
>  linux/linux.hash                     | 6 +++---
>  package/linux-headers/Config.in.host | 6 +++---
>  3 files changed, 7 insertions(+), 7 deletions(-)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
