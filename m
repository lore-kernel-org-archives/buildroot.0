Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B541C52D7F
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 21:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAD01608F7;
	Wed, 14 Aug 2024 21:48:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xv3DWQ35dXtk; Wed, 14 Aug 2024 21:48:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74CD0608CD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74CD0608CD;
	Wed, 14 Aug 2024 21:48:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 387E91BF4DB
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 21:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24D5D80D24
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 21:48:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Smdhk4MQAZNm for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 21:48:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EE505808A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE505808A4
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE505808A4
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 21:48:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E44CB40004;
 Wed, 14 Aug 2024 21:48:07 +0000 (UTC)
Date: Wed, 14 Aug 2024 23:48:06 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240814234806.59de8028@windsurf>
In-Reply-To: <Zrrin+t5g/czHuKA@waldemar-brodkorb.de>
References: <Zrrin+t5g/czHuKA@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723672088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tGZ+cddQE+I0uFhk3U4f1eMGqvAv7plaOycoNjlALFA=;
 b=jQ9vk6MnVtW8aWzvnrbu4cZJE8aAJZUZgQikJ2Hf/tz24JUXwK9DW9QTPpwF+8UidVHkZk
 Mv2973CgQHylC6yFPCBtp0KGxBAyXTnWKIT/EI5puL9tSTr6JD6v7WQkRO7nm4mRAIdVBZ
 Gmn8Nr8YSt490p+8IRAVvqXSW1eAC9l8Ln+H31kTudGdYw3nviuFe24LjU0TZ4qzI/Jic5
 /TGHHuvdQkLAc0o3133/h4+SONreoa9snlyqiom9cth27gdPvbp20lS7pD8PQgd5cSbBQf
 B723bsJVmlF36+DNEupYGCNBkNNI6i5E/T5Ry/pBFX3uImfjzQLky1BrWJ9pag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jQ9vk6Mn
Subject: Re: [Buildroot] [PATCH v2] package/atop: update to 2.11.0
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

On Tue, 13 Aug 2024 06:35:43 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> See here for a changelog:
> https://atoptool.nl/downloadatop.php
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/4f2/4f256c96c8b7c34c1f1be378ad3a535d3150e44d
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v1->v2:
>  - use $(TARGET_MAKE_ENV) to let atop find pkg-config, suggested by
>    Thomas P.
> ---
>  ...he-user-to-pass-additional-CFLAGS-an.patch | 21 +++++++++----------
>  package/atop/atop.hash                        |  2 +-
>  package/atop/atop.mk                          |  4 ++--
>  3 files changed, 13 insertions(+), 14 deletions(-)

I usually don't like applying bumps to master at this point, but atop
was added in this release cycle, so it cannot get more "broken", and
therefore: applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
