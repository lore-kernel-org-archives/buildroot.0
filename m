Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F7ED33990
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 14:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE8EB40111;
	Mon, 28 Oct 2024 14:42:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lXNUjpRo8yhd; Mon, 28 Oct 2024 14:42:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85B0B403A5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85B0B403A5;
	Mon, 28 Oct 2024 14:42:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BE6A5AEE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B977B4042F
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:42:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id teLEzPKrwlXe for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 14:42:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 52F58400D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52F58400D8
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 52F58400D8
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:42:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4ADBEC000D;
 Mon, 28 Oct 2024 14:42:27 +0000 (UTC)
Date: Mon, 28 Oct 2024 15:42:20 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Asaf Kahlon <asafka7@gmail.com>
Message-ID: <20241028154220.18443ff3@windsurf>
In-Reply-To: <20241027224335.3863453-1-james.hilliard1@gmail.com>
References: <20241027224335.3863453-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730126547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k7BVIdEIL7VkdYKZxfdUVm7piWGjzcSCDl/TCLqZBSE=;
 b=V+DYBHbSfJ1IMjgCLKPtKX7JtZMOPLSWZnvcfSTOjUKKN0WEvK3WtEVaJisZHkzlqEqMWu
 ummC57h7yKYUVKc3opuvRUQzr2CDIUKF5WPt/5lcj/7x99jmFeJBeZzdkKFvwQ6970ERLn
 S07tmSgLHCLndy8H/oZUVaT7aVawvYfGGZ8IvhHBvoP1kVbwLR4FziK7qkRSoMondjJM/r
 32ZhQAI00ii7crooDEZ6q3O7FyM3I1M3DtPWTX8xMO/Y6L5BAX3A/Z5GoH8tv/MofT/opF
 SHee8uVutE33Ud/PSVHkLLi9qj/AnK9wYfcrLevTxQuBhM6pgkFVB6SH9owYLw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=V+DYBHbS
Subject: Re: [Buildroot] [PATCH 1/1] package/python-asyncssh: bump to
 version 2.18.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 27 Oct 2024 16:43:35 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-asyncssh/python-asyncssh.hash | 4 ++--
>  package/python-asyncssh/python-asyncssh.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

I applied your whole series of Python updates from python-asyncssh to
python-zope-interface.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
