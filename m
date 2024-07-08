Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51005C3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 20:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 265D7608D8;
	Mon,  8 Jul 2024 20:22:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 43omF3mxwl9q; Mon,  8 Jul 2024 20:22:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BB43608E9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BB43608E9;
	Mon,  8 Jul 2024 20:22:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EF6921BF390
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC16A404E1
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:22:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ftZcCtaLx28R for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 20:22:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9CC32404D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CC32404D4
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9CC32404D4
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 20:22:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E1C9B1BF207;
 Mon,  8 Jul 2024 20:22:13 +0000 (UTC)
Date: Mon, 8 Jul 2024 22:22:06 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240708222206.0e50eba4@windsurf>
In-Reply-To: <20240707141758.126043-1-dario.binacchi@amarulasolutions.com>
References: <20240707141758.126043-1-dario.binacchi@amarulasolutions.com>
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
 bh=1EirSXJOAHUIoeqRAol5C2VF8UD0a0yv6yogb9BzFlM=;
 b=gGyXYIqb6hpeqicOT1WDM38ldTMMmFCEitjAHOSABhUeP0wGrPMyynS+tM90nStVTfx6R5
 zs5uwcIh4hec4VJ4gTKVH+G7fbmassTxXyouwwoZfgNLB4oG0dHlfYX9KVlWZKXiru4xrP
 C7Wbrs18xc5kqyuyuGBED6hXoNHY7NC+NNWmUIOhQ6bc5n7bbB6VKIMf/me9sPOM+MINmW
 ucsHAyufjPF+YidMUkUS/eFFFSUD5a9+iN8u5KwNULbx1uXmhu79M4YMkVOglShchpSzgp
 azvCGMx1iAp1e2rc52fdFdndIUQi6dXm3zArMsB5qJVmTBXVl0gZn5GAZyESjw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gGyXYIqb
Subject: Re: [Buildroot] [PATCH 1/1] package/openvmtools: update the patches
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
Cc: Karoly Kasza <kaszak@gmail.com>, linux-amarula@amarulasolutions.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  7 Jul 2024 16:17:58 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
> fuzz factor to 0") reduced the fuzz factor.
> 
> Due to this change, openvmtools fails to build with output:
> 
>     Applying 0007-Use-configure-to-test-for-feature-instead-of-platfor.patch using patch:
>     patching file configure.ac
>     Hunk #1 succeeded at 940 (offset 142 lines).
>     Hunk #2 succeeded at 1150 (offset 86 lines).
>     patching file lib/misc/idLinux.c
>     Hunk #2 succeeded at 1022 (offset 28 lines).
>     patching file lib/nicInfo/nicInfoPosix.c
>     Hunk #1 FAILED at 34.
>     1 out of 1 hunk FAILED -- saving rejects to file lib/nicInfo/nicInfoPosix.c.rej
> 
> This commit refreshes the package patch on the current package version.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  ...ure-to-test-for-feature-instead-of-platfor.patch | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)

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
