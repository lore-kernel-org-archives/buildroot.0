Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D70E1C3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 21:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9483740384;
	Mon,  8 Jul 2024 21:09:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b3uJSJrSxu0e; Mon,  8 Jul 2024 21:09:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05E05403E5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05E05403E5;
	Mon,  8 Jul 2024 21:09:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ECFA11BF3BD
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 21:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D86D080BAF
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 21:09:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sVvE07x1PNyZ for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 21:09:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8DEE180B50
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DEE180B50
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8DEE180B50
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 21:09:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 45473E0003;
 Mon,  8 Jul 2024 21:09:41 +0000 (UTC)
Date: Mon, 8 Jul 2024 23:09:40 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240708230940.3823fa8c@windsurf>
In-Reply-To: <20240707134840.4130434-1-dario.binacchi@amarulasolutions.com>
References: <20240707134840.4130434-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720472981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v0MT7WahEAMTkkFrQ9HXss3QRQj+9F7EQotkB7MH9Is=;
 b=ZUbI6qyOepqAsybqTchpY77eeOA3/bGA23GMxApM6R5lZluxDdOM9kRi2eabx6n9WHP4Rf
 FspCqAHri6T3aokrpW6WATjASi3MsC0pFdWMo9wxJzq6uRwHLNx7TCn+uHoqupXHNYeVVQ
 yLPw9ClBmx9BurdnRM/f90NG8QIEvDREwUHqpCiTavXcLu0lrLuh06lLtN0KdzTehn3AYg
 sPpS9q1GZ/On7UPjqrpIgegsLkT87OQUZnIrbfY28H+6Tx8qI+g9ESOuWDFUXSd6r2j0Um
 Vh9oUHgn1Eq7H53im4DKlXOi+NK2cPKz9AmzDMcTf67irGfu5CPveVnkP08/mQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZUbI6qyO
Subject: Re: [Buildroot] [PATCH 1/1] package/shairport-sync: fix patch fuzz
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
Cc: linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  7 Jul 2024 15:48:40 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
> fuzz factor to 0") reduced the fuzz factor.
> 
> Due to this change, shairport-sync fails to build with output:
> 
>     Applying 0001-configure.ac-find-sndfile-through-pkg-config.patch using patch:
>     patching file configure.ac
>     Hunk #1 FAILED at 304.
>     1 out of 1 hunk FAILED -- saving rejects to file configure.ac.rej
> 
> This commit refreshes the package patch on the current package version.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  .checkpackageignore                                       | 1 -
>  ...001-configure.ac-find-sndfile-through-pkg-config.patch | 8 +++++---
>  2 files changed, 5 insertions(+), 4 deletions(-)

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
