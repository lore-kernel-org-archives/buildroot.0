Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C29C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 14:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06B39419C8;
	Fri, 12 Jul 2024 14:50:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W6r5GizDCikR; Fri, 12 Jul 2024 14:50:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4657419C7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4657419C7;
	Fri, 12 Jul 2024 14:50:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D3F691BF424
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BFC4082118
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:50:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kqhl8c1ZGhQm for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 14:50:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EAE3581DCA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAE3581DCA
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EAE3581DCA
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 14:50:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 27A26C0004;
 Fri, 12 Jul 2024 14:50:39 +0000 (UTC)
Date: Fri, 12 Jul 2024 16:50:38 +0200
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Message-ID: <20240712165038.45bc18ce@windsurf>
In-Reply-To: <20240328110058.2037303-1-buildroot@bubu1.eu>
References: <20240328110058.2037303-1-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720795839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F2uAR+5WUAO6jaMCXkrdJjofaz4UXbVCVEn9MUVp+IE=;
 b=BMyYzMxitdgjeNc2BXHdyftczNuuW5O7BeFrbZ4GnOtVKW0MEp48eFwDgkhIgFOK1O7D14
 SetNq5+TWN/DGp1U4FUCe3uqWBxi/K1qwzaUWXMGnqJ6ttBEV3XpKQiTFCqnxiG/MoKb4M
 lqtfhUQUEKamlmvXenSbrUhJ3pVVD1Oqu2vaEXd5bwj5GHWi1XgY7eBcAaN1uLs8LDPUnq
 Bl3J4Mhz6iM/KCkmoG2IB8GsGLOFDpWPBvqJlmLGqk73TwTkQ5wkW6N+pfoGT+0qlLh1DW
 hrc4NzedsSsHNC+Mk8dWRAdmycBAqRmGwiKTCMAgU/d+LvRK+uKp5rUSUKCTZg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BMyYzMxi
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
> ---
>  package/nodejs/nodejs.hash | 14 +++++++-------
>  package/nodejs/nodejs.mk   |  2 +-
>  2 files changed, 8 insertions(+), 8 deletions(-)

Since I had no feedback from you regarding running the NodeJS tests, I
ran them locally, they all passed successfully, so I applied your patch
to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
