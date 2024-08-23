Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D886DC52D7C
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 17:14:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3601412D0;
	Fri, 23 Aug 2024 17:14:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yVv4gcBqNw_R; Fri, 23 Aug 2024 17:14:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B71241310
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B71241310;
	Fri, 23 Aug 2024 17:14:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C1A31BF339
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:14:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7ECE6401EB
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:14:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D_53iFkxHi2s for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 17:14:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 134004015E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 134004015E
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 134004015E
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 17:14:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2CAC3FF802;
 Fri, 23 Aug 2024 17:13:59 +0000 (UTC)
Date: Fri, 23 Aug 2024 19:13:58 +0200
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Message-ID: <20240823191358.75142d5f@windsurf>
In-Reply-To: <20240822124539.728107-1-buildroot@bubu1.eu>
References: <20240822124539.728107-1-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724433239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hAFvqMnOAHyi/1gOq4i7CZU9LbGexSuArQVPJ2oB8+k=;
 b=IzKcBAMbJMHLxVieJGBLSLRSWm2fY3AoxqYaIWsjweDYGdvhVDBO+1JJqNhLz8VTaHbHkm
 6JHhxG6IPvM4jOGO+CHhwunCvYsy9V8Onoex/yS1bVlnlDB8asoEE0Q4XelYZJICtiSRxO
 Ad4+F6vX+rPtMcxua2oCywIeTy/B8oG2vY5HuHEGBaUrweFBfVqxRvjgyMLRCkKHdzaXWi
 /if4qILzu+zyACfNbnh8HDpwY6DQsPhsF6yJiT7fMiV2HoZnoXWa464/rbTO8Roz/6W+um
 8yE+yo3OGOPhX/+qzUFdmF0YGjfM6JnablpSMjGEJjFqIDnw2Fv7yBwFokykrg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IzKcBAMb
Subject: Re: [Buildroot] [PATCH v2] package/python-wrapt: bump to 1.16.0
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

On Thu, 22 Aug 2024 14:45:38 +0200
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> Changelog:
> * https://wrapt.readthedocs.io/en/latest/changes.html#version-1-15-0
> * https://wrapt.readthedocs.io/en/latest/changes.html#version-1-16-0
> 
> LICENSE hash changed due to updated copyright year [1].
> 
> [1] https://github.com/GrahamDumpleton/wrapt/commit/dc5afd39533ce0daf933507f8a90c095448a5cbc
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
> Changes v1 -> v2:
>   - update license hash
> ---
>  package/python-wrapt/python-wrapt.hash | 6 +++---
>  package/python-wrapt/python-wrapt.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
