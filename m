Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF9AC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 07:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA1BC411E2;
	Fri, 12 Jul 2024 07:06:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dPFEXWgYnjsh; Fri, 12 Jul 2024 07:06:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2233411ED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2233411ED;
	Fri, 12 Jul 2024 07:06:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0CE2A1BF48C
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 07:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06A91411ED
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 07:06:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XVRkXyHRBmha for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 07:06:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C7FFA411E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7FFA411E2
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C7FFA411E2
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 07:06:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BD307FF804;
 Fri, 12 Jul 2024 07:06:13 +0000 (UTC)
Date: Fri, 12 Jul 2024 09:06:13 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240712090613.160b6532@windsurf>
In-Reply-To: <20240711210151.986453-1-ju.o@free.fr>
References: <20240711210151.986453-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720767974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eMUFurZjQzu2oJg9ZQhpEpNS8BgLWMhSKByfruJHBII=;
 b=jPnqGytdA4bBXRfoY0LTsPo8fbov+f7BVY2etXHObREZLwL0IzoLVCwv6GRL96oGD7AqpP
 Z/ZJorlicBQLXjL27zQxJ9xhBKRgZSnve5C5PPa0zLxJkljGRkKVqZffNXdfQBjKOtxjIo
 UfX6Iuf+FzPlqAZcbKcNvW/jsWoF4asix3w0z6A1mYnnpg6noFm1MjJ2rnYLJ2FGhDPDAw
 fdaXvnvjKWednSbYHEyo3xa+8aDubx9riJaDtPjUhfm2rai66UXygrHcqSGAPAFNmCrL2/
 bG+OMncfYu5yswfEHmDGDT7eCSgzRTjPuN+61QBh4SZ71yMJDfPbRthIjlXctA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jPnqGytd
Subject: Re: [Buildroot] [PATCH 1/1] package/opencsd: bump to version 1.5.3
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

On Thu, 11 Jul 2024 23:01:51 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For change log, see:
> https://github.com/Linaro/OpenCSD/blob/v1.5.3/README.md?plain=1#L329
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/opencsd/opencsd.hash | 2 +-
>  package/opencsd/opencsd.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
