Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35B3C3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 12:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C42883FB7;
	Sat, 13 Jul 2024 12:15:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j8h4So_Qt7fB; Sat, 13 Jul 2024 12:15:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85D6583FBF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85D6583FBF;
	Sat, 13 Jul 2024 12:15:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 39EE81BF5AE
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 12:15:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32B91408F0
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 12:15:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xVgHkrEKwCQ6 for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 12:15:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 799644086C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 799644086C
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 799644086C
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 12:15:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0256340003;
 Sat, 13 Jul 2024 12:15:39 +0000 (UTC)
Date: Sat, 13 Jul 2024 14:15:29 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240713141529.66e77cea@windsurf>
In-Reply-To: <20240712201943.457747-1-james.hilliard1@gmail.com>
References: <20240712201943.457747-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720872943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qps2ymDRNY8i+jSJebkUL+UYIh3RW9nAtLeH0xOJBjA=;
 b=Hcjxcd/qXRf2g6qfPQ5ve+rQd10jw8doNxEfDGRW6M2wbQU3PFD7v8omlI4ZhmnS4WfoAd
 Zy4AzubqrgibuOeF4yQUGQp1v6Sawf4weLVodvRKOKOrlfXs3aRpENoQEpN8LpOjVGGOex
 K2FHCJOHvnCCE5Cu4hMbLUOQBP6cfUXXbTYgFbALdJTi09qWEHuWrbMd99QR1Na/ttGXQN
 vRnI/cefCDMBWFIONoGHPhEzdn0Zp7GEZBnts00TzYB7nxBUIT36MweQj2C+wk3p9h3/pg
 5BNq0bDwMqcRKLR3GmTX1ZfUNaYqDZnCemCKx9cCGpxxdq/3rVSzHyvinAQ/PA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Hcjxcd/q
Subject: Re: [Buildroot] [PATCH 1/1] package/prelink-cross: bump to version
 ff2561c02ade96c5d4d56ddd4e27ff064840a176
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

Hello James,

On Fri, 12 Jul 2024 14:19:43 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

It would have been *really* nice if you could have pointed out that
this commit fixes a build issue that was occurring in the autobuilder.
The only commit brought by your version bump is an upstream commit of
you to fix the build issue, but you did not even mention it here.

This fixes:

  http://autobuild.buildroot.net/results/e0f46983dafdc7d309e6cdfdeda268c582a03156/build-end.log

which was occurring with version
440c0059a21f06b5577499a80b55482cb99d6d1c.

But also fixes:

  http://autobuild.buildroot.net/results/a9de4890fd2499842a26abc8f595f43206e4bdc1/build-end.log

which was occurring with the previous version,
a853a5d715d84eec93aa68e8f2df26b7d860f5b2.

Peter: it means this version bump is actually fixing an issue that
occurs on 2024.02, so this version bump should be backported to our LTS
branch.

James: this is why we ask for more explanations, so that we can figure
out whether a certain commit is relevant or not for our LTS branch.

Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
