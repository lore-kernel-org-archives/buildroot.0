Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E51FC3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 20:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F064B60B18;
	Mon,  8 Jul 2024 20:23:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VxPgx8G3Aglb; Mon,  8 Jul 2024 20:23:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E022B60BA1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E022B60BA1;
	Mon,  8 Jul 2024 20:23:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1FC051BF390
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E426B810DA
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:22:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OzRFxxtmLSAk for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 20:22:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B1C5A812A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1C5A812A7
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B1C5A812A7
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 20:22:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 320E01BF20A;
 Mon,  8 Jul 2024 20:22:21 +0000 (UTC)
Date: Mon, 8 Jul 2024 22:21:05 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240708222105.0dc7270f@windsurf>
In-Reply-To: <20240706103111.3489071-1-dario.binacchi@amarulasolutions.com>
References: <20240706103111.3489071-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720470141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KN5L9kl3qORK2rZ0+peeW9exd0JrHFFu4n/6AdH9+6Q=;
 b=Nwx88bQZ5zYCIVc3Si6U5VE+zQ9ypvhrACusMG+bhVD1P0ewN4Ka0op5Jj4Nta18Gae7+Y
 ySeDr06u2GUGXWmW/uZd2yuchG18pAuwLP6WM/gX9tpTgyzwtUii6/2FWvtLxuRkPV4CTi
 ZuZ3HamZSuGGT59UjgnbtxAKAIGCrNcaXdMRtMej5SYz/BzwHuUZQLmzF9/OXsnOmEnb8x
 Pz0QtYPPziBpWw58oe8tNdbsSDW2ZgiFrgEg5/BZRZpXAymfLDQJDyt7xFoOjJLTWRJjUF
 hYKhy+nFPAjsS6BfZADM2kzJm+XNG0ijH8SCL57aZsnuK5aszkPYeP0Lyp7HcQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Nwx88bQZ
Subject: Re: [Buildroot] [PATCH 1/1] package/janus-gateway: update the
 patches to be applied with fuzz 0
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
Cc: Gregory Dymarek <gregd72002@gmail.com>, linux-amarula@amarulasolutions.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  6 Jul 2024 12:31:11 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
> fuzz factor to 0") reduced the fuzz factor.
> 
> Due to this change, janus-gateway fails to build with output:
> 
>     Applying 0002-Add-test-for-Wunused-but-set-variable.patch using patch:
>     patching file src/Makefile.am
>     Hunk #1 succeeded at 132 (offset -19 lines).
>     patching file configure.ac
>     Hunk #1 succeeded at 12 (offset -1 lines).
>     Hunk #2 FAILED at 67.
>     1 out of 2 hunks FAILED -- saving rejects to file configure.ac.rej
> 
> This commit refreshes the package patch on the current package version.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  .checkpackageignore                            |  1 -
>  ...Add-test-for-Wunused-but-set-variable.patch | 18 ++++++++++--------
>  2 files changed, 10 insertions(+), 9 deletions(-)

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
