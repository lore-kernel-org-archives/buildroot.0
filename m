Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6923CD11C2
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 21:25:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6652F60E7F;
	Wed, 10 Apr 2024 21:25:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AmAZhFjuhQVz; Wed, 10 Apr 2024 21:25:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C07960E8D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C07960E8D;
	Wed, 10 Apr 2024 21:25:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B53F01BF4D6
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1AFD4109E
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:25:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0VANR5R9mIsN for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 21:25:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 36D5D40694
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36D5D40694
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 36D5D40694
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 21:25:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2A12C60004;
 Wed, 10 Apr 2024 21:25:21 +0000 (UTC)
Date: Wed, 10 Apr 2024 23:25:20 +0200
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Message-ID: <20240410232520.20172e60@windsurf>
In-Reply-To: <20240328110058.2037303-1-buildroot@bubu1.eu>
References: <20240328110058.2037303-1-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712784321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WlcOdeL2xqzSSajNCV+oTcf1mRXxlCPUvDUeWh0MH9w=;
 b=DX4HAvGOcU7vJ5alvVZHvvqGGryLGe2O2tPflcjWrnHjw32XDSYj+gjZgEaFZPcBjcO6yJ
 paSYFnU2v1NQIeb5cjytLNi5a1zah7JQgsh/FG7vWp/tpoqpCSc7Bih4Q2TwFXCgUYvNZN
 DBWjKqWt+fkZolvLDl1b+PgZtGbAdqqdHnJKRyA/yTwPhGhvo8Zh5Fpw14LSnqoVp1h5DL
 FwWdIbROzgYpcp5ABA8CY5FlYdScLB9iyNA2/4MfSwJQoA3BtbHqcLYOh47OKn89LFLdvf
 y8/HOfi0Kh3ATOYqZpuudReS7Ufqpiqz9na5d/kwfioxGWh7OgfbtIS9nSFkQg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DX4HAvGO
Subject: Re: [Buildroot] [PATCH] package/nodejs: bump to 20.12.0
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
Cc: Daniel Price <daniel.price@gmail.com>, Marcus Hoffmann <buildroot@bubu1.eu>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Marcus,

On Thu, 28 Mar 2024 12:00:58 +0100
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> Release Notes: https://nodejs.org/en/blog/release/v20.12.0
> 
> LICENSE hash changed due to changes in vendored components:
> 
> * copyright year updates [1][2]
> * version name update [3]
> * change from "Unicode, Inc. License - Data Files and Software"
>   to the "Unicode License v3" [4]. This is in the icu vendored
>   dependency which is unused in buildroot.
> * new build tooling script [5] under BSD style license
> 
> [1] https://github.com/nodejs/node/commit/347e1dd06a5f927d9fd64ce72d776c56d5101910
> [2] https://github.com/nodejs/node/commit/b88170d602791fa62fc45ac80ca9953bc1bdd25b
> [3] https://github.com/nodejs/node/commit/c8233912e9fd7464898b549d6762130722bf0bf4
> [4] https://github.com/nodejs/node/commit/625fd69b76b5a8f59152f803b31941c8986d924b
> [5] https://github.com/nodejs/node/commit/b5bc597871ca701bab750c46d31ed626decd7f89
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Thanks for this bump. Did you run our NodeJS tests after this bump? In
particular one aspect about which we need to be careful is that we
offer two ways of installing NodeJS: install a pre-compiled binary, or
build entirely from source. Running our NodeJS tests ensures that both
situations have been verified after a bump.

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
