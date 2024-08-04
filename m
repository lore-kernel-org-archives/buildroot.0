Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C65CEC3DA7F
	for <buildroot@archiver.kernel.org>; Sun,  4 Aug 2024 20:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9678F6064C;
	Sun,  4 Aug 2024 20:41:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xOiWdhIcvXpy; Sun,  4 Aug 2024 20:41:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A836F60658
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A836F60658;
	Sun,  4 Aug 2024 20:41:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9E0181BF4DD
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 20:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A8CB402DC
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 20:41:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i8ZXQqnW6-BJ for <buildroot@lists.busybox.net>;
 Sun,  4 Aug 2024 20:41:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 587E6402B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 587E6402B7
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 587E6402B7
 for <buildroot@buildroot.org>; Sun,  4 Aug 2024 20:41:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 45C4140003;
 Sun,  4 Aug 2024 20:41:24 +0000 (UTC)
Date: Sun, 4 Aug 2024 22:41:22 +0200
To: Xiang Lin <myd.xia@gmail.com>
Message-ID: <20240804224122.1967ed76@windsurf>
In-Reply-To: <20240804031232.5020-1-myd.xia@gmail.com>
References: <20240804031232.5020-1-myd.xia@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722804084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b4PeszFROSw0z3ud3voJS1uh6tkYNQjjfY1yeNb9t/Q=;
 b=NN94IBXgg709ygfy3zj15wXh+QoE98vn1xNxTB3lUSRFXwLCNJWpLV+5p7ol587SKPNZP0
 sxvMO7Kg43XK8EM/1pVawLp4AKstdkgU+Y+qNy92k+wWbXRYmdXljQzrczZ1+/GhVQRZ7l
 nhGf/j1WQ7qYVQ1U2azq+YrKNWT3c5DWtYKeuYxT7MN9mthTA0YyUfFL5kv0Bk02bDOd9Y
 BthwmEd11KiuSttndylUSIpSvEeFydk3mOqqEJpK6bBE86yD9aUgZHZRFiJ8xL0U4IAUv1
 5t0XxiKb8um63ixYmqKukZZwoVTSbZOIbnL7RR1EgEBnYu+hqFbV8HgvLFWfBQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NN94IBXg
Subject: Re: [Buildroot] [PATCH 1/1] procps-ng: option to original top layout
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

On Sun,  4 Aug 2024 11:12:32 +0800
Xiang Lin <myd.xia@gmail.com> wrote:

> New procps-ng use modern top layout by default which
> without detail cpu usage info, give a option for nostalgic
> one to return to original.
> 
> Signed-off-by: Xiang Lin <myd.xia@gmail.com>
> ---
>  package/procps-ng/Config.in    | 10 ++++++++++
>  package/procps-ng/procps-ng.mk |  4 ++++
>  2 files changed, 14 insertions(+)

Applied to master with a slightly improved commit log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
