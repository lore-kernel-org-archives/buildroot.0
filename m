Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F550C3DA42
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 20:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15B5F60A5C;
	Mon,  8 Jul 2024 20:22:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fxKeZhArc7lX; Mon,  8 Jul 2024 20:22:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 659EA60A81
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 659EA60A81;
	Mon,  8 Jul 2024 20:22:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8E24A1BF390
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:22:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 77267810DA
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:22:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j9aKCChEu_98 for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 20:22:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 627DB8109E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 627DB8109E
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 627DB8109E
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 20:22:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9AA2B1BF208;
 Mon,  8 Jul 2024 20:22:14 +0000 (UTC)
Date: Mon, 8 Jul 2024 22:21:09 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240708222109.56a0ea44@windsurf>
In-Reply-To: <20240706135731.3598621-1-dario.binacchi@amarulasolutions.com>
References: <20240706135731.3598621-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720470134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZasXr5ZgNBfs5GWMunLZ6E1T/3ijuaGR7d6J8w8uolU=;
 b=QRpIqSf6GqSFd4Mo1nEwsNVHn5OYovrTajeb3a9WvBGxfLwJPqvx8ymhtW5FOp3Ao81TQT
 6gXTVIMmK7TDMAxiJM1FbLijs3auJ5suj6/VY2Hq/0GMmW9rNqRhNxFggDO3BbZqU6lpca
 YpXsAZKxHr2iBYnR2u/1WF23jeDTHvHtxJXRNOin+Vrz76CIn0jm3HQLoldQviYLQt7/fL
 mz04712/QaNxrVIJWy57rLEM0REOPkBRWnpGdIXL2JaoujQIdynxsjk2vX27CJISlV+eaY
 UJZPpzkyLr4kYkXE20MhNou+3urvrWG6INdxLxMWkjQT7aGs+hhLGmdfvrKUeA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QRpIqSf6
Subject: Re: [Buildroot] [PATCH 1/1] package/dahdi-tools: update the patches
 to be applied with fuzz 0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  6 Jul 2024 15:57:31 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
> fuzz factor to 0") reduced the fuzz factor.
> 
> Due to this change, dahdi-tools fails to build with output:
> 
>     Applying 0002-no-perl-manpages.patch using patch:
>     patching file xpp/Makefile.am
>     Hunk #2 FAILED at 58.
>     Hunk #3 succeeded at 149 (offset 3 lines).
>     1 out of 3 hunks FAILED -- saving rejects to file xpp/Makefile.am.rej
> 
> This commit refreshes the package patch on the current package version.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  package/dahdi-tools/0002-no-perl-manpages.patch | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

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
