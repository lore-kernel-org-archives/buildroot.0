Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBD3C25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 20:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8495242445;
	Fri, 10 May 2024 20:09:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id elf8PynIt4iQ; Fri, 10 May 2024 20:09:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 681CD42446
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 681CD42446;
	Fri, 10 May 2024 20:09:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 14C201BF995
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 20:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA08642144
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 20:09:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n3xDn75a5KeX for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 20:09:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8F81542437
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F81542437
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F81542437
 for <buildroot@buildroot.org>; Fri, 10 May 2024 20:09:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5F74920002;
 Fri, 10 May 2024 20:09:10 +0000 (UTC)
Date: Fri, 10 May 2024 22:09:09 +0200
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Message-ID: <20240510220909.7a91dd95@windsurf>
In-Reply-To: <20240325121700.145815-1-buildroot@bubu1.eu>
References: <20240325121700.145815-1-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715371750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nxcmlcb4R/0bVKZpOP1pkRl+DCIU0eGRjL8xz8ddNcY=;
 b=g78x8ZWAbdenxFsVoBm1w1Y7xp1fmEMJgYXwSIYJoAMFAne3cnftbQGRfkifnnKqXVPkXL
 qstHRDmmgIVsSpwSnee/QfizbCsvwe0QSuuIK2W2aJkEnJTv9QWf7/vm13wsLNtuwoRu0p
 +1CyJiUK9LXUPV4NHNnxbxHQwIxdY1ftnFr22bPgDy1f/dwtxEDLxSBas7QkG3+9xggHHV
 BXwfBqh7FC++F5bBVxOCTOVuYYtoiXQgy+N7V5DWggVxbFFmjk01lFWQf/eJcITtve3wNL
 UgJ+wj73TBZCgiFdU4stOP2/nkHyHjv9C5bmcqcYm1n/rQTiN3NujZ7Gw08+8g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=g78x8ZWA
Subject: Re: [Buildroot] [PATCH 1/3] package/python-trove-classifiers: bump
 to version 2024.3.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 25 Mar 2024 13:16:57 +0100
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  .../python-trove-classifiers/python-trove-classifiers.hash    | 4 ++--
>  package/python-trove-classifiers/python-trove-classifiers.mk  | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Series applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
