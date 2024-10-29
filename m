Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C95DD3A697
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 20:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0A9E80A9F;
	Tue, 29 Oct 2024 20:22:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5msCbI70UscS; Tue, 29 Oct 2024 20:22:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF0EB80AC3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF0EB80AC3;
	Tue, 29 Oct 2024 20:22:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 402784EC0
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 20:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2EE3940251
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 20:22:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 22UaseYhAHB7 for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 20:22:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E35BE40213
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E35BE40213
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E35BE40213
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 20:22:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 30BE81C0004;
 Tue, 29 Oct 2024 20:22:07 +0000 (UTC)
Date: Tue, 29 Oct 2024 21:22:05 +0100
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Cc: Marcus Hoffmann <buildroot@bubu1.eu>
Message-ID: <20241029212205.0a5025a2@windsurf>
In-Reply-To: <20241029154911.3268784-1-buildroot@bubu1.eu>
References: <20241029154911.3268784-1-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730233327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J0jFzBbtqMtL9mQNbI9P1YhQDtR6giS5ZhsFJZyw0Ss=;
 b=eX9PV2gBW6Lyz+Z6sCabH7PDD5WqlqtjfMwJHqkErUQSxFpizJTd3CslN+fR/KvBU5VboI
 H55LboFrZwOOe7ZDFLJ5+hD4TKR2SGSI2WhdZq+t3+DloqIYhPeprRq99EiaaplDQurkGd
 +1rrCFUY1oY4qVvOq85groOBGOpmjiFNLK7MLTuEDmFhCJtpYnBRr738N6ZDvarOWd9vjC
 +cmfGzHM7YEQpMwVhFgUx7MQ+QhRxCJDBUAr0jP5mT5bpsHAQJ/bycID9UdFsj6jK/0vxm
 hQ5dMtEsVMTjLEufB7o3BS3L/8fjGhXt/Q/y67ZTSieyJXszQHCzyyZ/naOzoA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eX9PV2gB
Subject: Re: [Buildroot] [PATCH] package/nghttp2: bump to 1.64.0
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

On Tue, 29 Oct 2024 16:49:10 +0100
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> Changelog:
> * https://github.com/nghttp2/nghttp2/releases/tag/v1.59.0
> * https://github.com/nghttp2/nghttp2/releases/tag/v1.60.0
> * https://github.com/nghttp2/nghttp2/releases/tag/v1.61.0
> * https://github.com/nghttp2/nghttp2/releases/tag/v1.62.0
> * https://github.com/nghttp2/nghttp2/releases/tag/v1.63.0
> * https://github.com/nghttp2/nghttp2/releases/tag/v1.64.0
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  package/nghttp2/nghttp2.hash | 2 +-
>  package/nghttp2/nghttp2.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master after updating the commit title and log to indicate
that it's a security bump. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
