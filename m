Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2756DC3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 20:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7BF8608D8;
	Mon,  8 Jul 2024 20:22:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wL4XDQLgH_Ue; Mon,  8 Jul 2024 20:22:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD6A3608F5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD6A3608F5;
	Mon,  8 Jul 2024 20:22:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B1FF21BF390
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB321404E1
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:22:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HNLgsSaFnZeG for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 20:22:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 196C9404D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 196C9404D1
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 196C9404D1
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 20:22:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 367DA1BF203;
 Mon,  8 Jul 2024 20:22:11 +0000 (UTC)
Date: Mon, 8 Jul 2024 22:21:34 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240708222134.1cb3398b@windsurf>
In-Reply-To: <20240707090629.3855178-1-dario.binacchi@amarulasolutions.com>
References: <20240707090629.3855178-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720470131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c+C6fQrNrRfu3OobX176/rLTSgrMlF8b8KzFwCsl5d8=;
 b=Tw18blNeIsxkY8MnOdN6bbTI92xorkv59/O3TlpLSzXAEqtflb66VFKU7ggEFk/DE90ban
 486rf5odt5WgTavQeDBq5oOIBmO+1oJgMsk9Wg7QWttmDRYC3KDM2iX4+JVj2z84ykrfJY
 j96aKh8M4cQ1zxj8pCRIoHm2wjw7Mme6U4l6r2u1pcgKNq3ee99V74/fXsjwS/EHlswZW/
 H+1yp5rVhwvobOuQ3rDp8nWuog03/pSkUxPsP8MTVBZwdwP7ZtaCsFUgpsJ+L9zDZQd2Hw
 /1cjwSrvX3H0fVyrqcrBUWB5TvA7PS42yh0+Pa5mGO2FnW/cC+nn/1ciV8IhoA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Tw18blNe
Subject: Re: [Buildroot] [PATCH 1/1] package/haserl: update the patches to
 be applied with fuzz 0
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

On Sun,  7 Jul 2024 11:06:29 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
> fuzz factor to 0") reduced the fuzz factor.
> 
> Due to this change, haserl fails to build with output:
> 
>     Applying 0001-add-haserl_lualib.inc.patch using patch:
>     patching file src/haserl_lualib.inc
>     patching file src/Makefile.in
>     Hunk #1 succeeded at 86 (offset 54 lines).
>     Hunk #2 FAILED at 514.
>     1 out of 2 hunks FAILED -- saving rejects to file src/Makefile.in.rej
> 
> This commit refreshes the package patch on the current package version.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  package/haserl/0001-add-haserl_lualib.inc.patch | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

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
