Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17EDC3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 12:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74C0840217;
	Wed,  7 Aug 2024 12:20:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bk7yY6EWxQQA; Wed,  7 Aug 2024 12:20:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DDBC40224
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DDBC40224;
	Wed,  7 Aug 2024 12:20:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F00D01BF342
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 12:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB4DF80DBE
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 12:20:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ImIrLYDbjcdG for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 12:20:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 66A6880DBD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66A6880DBD
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 66A6880DBD
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 12:20:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 74281C0003;
 Wed,  7 Aug 2024 12:20:31 +0000 (UTC)
Date: Wed, 7 Aug 2024 14:20:29 +0200
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Message-ID: <20240807142029.52ffdc53@windsurf>
In-Reply-To: <20240807103900.125819-1-buildroot@bubu1.eu>
References: <20240807103900.125819-1-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723033231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1NQvuxRJqPmLtAyTIN6jG4UK/BRXncf4BlxZEW+7QLo=;
 b=iKFhFl+tHlETTsoLQZC9AhqJNFSshJTdUqgdZRtXXx+J+SqHS3lYTyjP/hlLuvXia+/U1o
 0GYYVaSZNHhlOi7Qf+AWpbWMVpGBXf+HJyGy8jMMtOhbAEatfKQXxfhgPx1Y55PFAj+Ixb
 H+MvSW2A13e82V8YNZzB0pWpAsSZz3Vq9uSiEfv/RD1OvdZRHg9Y2EKcXlVEI7UQMQuxP+
 SBYtyPCJpfxm/FNRRbVj/kI0/j+DCrYpYroIiBAJmRIDJvp6tN8qhWp/8sOOfuqqGbrjGB
 7FzzIW8aIntu8t0/aC+AEYxbemR2LGw8+wDGXwJ4PRcKjBF4r2psYCc9fuv0bQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iKFhFl+t
Subject: Re: [Buildroot] [PATCH] package/nethogs: needs toolchain with C++
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
Cc: Marcus Hoffmann <buildroot@bubu1.eu>, Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  7 Aug 2024 12:39:00 +0200
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  package/nethogs/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master with the reference to the autobuilder failures, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
