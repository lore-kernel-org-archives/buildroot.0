Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C74C25B10
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 16:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E61341E60;
	Thu,  9 May 2024 16:31:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CpONOqBYLgGc; Thu,  9 May 2024 16:31:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF41841E65
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF41841E65;
	Thu,  9 May 2024 16:31:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DE2541BF337
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6AF941E61
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:31:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wHMCjb40lD_6 for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 16:31:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2E0F041734
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E0F041734
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E0F041734
 for <buildroot@buildroot.org>; Thu,  9 May 2024 16:31:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3F964FF808;
 Thu,  9 May 2024 16:31:15 +0000 (UTC)
Date: Thu, 9 May 2024 18:31:14 +0200
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Message-ID: <20240509183114.37dde90e@windsurf>
In-Reply-To: <20240423172653.349839-1-angelo.compagnucci@gmail.com>
References: <20240423172653.349839-1-angelo.compagnucci@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715272275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mwl8i7NA/yE8OlKJRKHkekwrBc7J0GZuRJTRKtrPglM=;
 b=VJuC+3rVgyoFVvBt4tIlt0poLv6xhpB/Norw12PneGs+mb7oll0GIYoYViwKFxdKULFIQ1
 eSxtAxaDFpQJVm9RwFYyhQXf7lfe6Q25HoNYKZTLkIPIQLQQzaUjhLO0YeG9Ivis+aIDFN
 65mTJh7PQiVO77k5lO4ncyeAWiruuDRn5fgx0+QOrJAnbK0er4NzJ6P4aaWCUsCnqhUHVJ
 Ltaqrxjbpn9bHbB8yUnTtgXnSvMPHIt6B4wex3293ajC9wiXmQErTD9VBHh3aUMNOuueRX
 JYUKw/BXt3+lRVqrYXNYWjSVuoml99oSCbArsBpSXVV6aCfKQVZbqyProEMQ3Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VJuC+3rV
Subject: Re: [Buildroot] [PATCH] package/libapparmor: bump to version 3.1.7
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

On Tue, 23 Apr 2024 19:26:53 +0200
Angelo Compagnucci <angelo.compagnucci@gmail.com> wrote:

> Bump also apparmor relative package.
> Change also the download URL to gitlab where the development
> activities were moved.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
>  package/apparmor/apparmor.hash       | 4 ++--
>  package/apparmor/apparmor.mk         | 5 +++--
>  package/libapparmor/libapparmor.hash | 4 ++--
>  package/libapparmor/libapparmor.mk   | 6 +++---
>  4 files changed, 10 insertions(+), 9 deletions(-)

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
