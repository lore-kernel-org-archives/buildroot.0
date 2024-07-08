Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDAB4C3DA41
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 20:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF52F60B24;
	Mon,  8 Jul 2024 20:22:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ESV6cPLrM1Tv; Mon,  8 Jul 2024 20:22:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6972460B2B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6972460B2B;
	Mon,  8 Jul 2024 20:22:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 141921BF390
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DEA3810DA
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:22:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oOOvTXorIfpV for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 20:22:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DE0BB8109E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE0BB8109E
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DE0BB8109E
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 20:22:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 32C661BF209;
 Mon,  8 Jul 2024 20:22:19 +0000 (UTC)
Date: Mon, 8 Jul 2024 22:21:41 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240708222141.493a658f@windsurf>
In-Reply-To: <20240707094428.3947165-1-dario.binacchi@amarulasolutions.com>
References: <20240707094428.3947165-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720470139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w8T9EZi39OdoZZ6TSb106VyGtkXtO0uIk9KZylvlecc=;
 b=C806l05AZIdP+5mRe0Zb4WNYCuWD1sVKgMkZu8gzQg3pqlKEvsxX8ocpZga6CH1uUXg2hn
 5EXgEOKVqZPO2FzqerdDzpqyY48uuu1EYivUpceCI7e1MSRcNyGH5pJqSe+VUT0Wnh8Yhd
 v7OWAykzmB63xdxdtI5SIkPT+nH7U4vEhhHZD+Q95qhdOyKns3FDFcABWAb7ropHFLMWDP
 W+LdMV/84gTbinjk83mlUWaFJNtY94UBD8klbumspb6SHIbLB4oC/nsih1kkmI/7hmNPrp
 mxzRxCzY+p8sAWGRuCnQQZbgcSZhmy2e58utUUmi06zXEkFUkCJHxEuE7EYsNA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=C806l05A
Subject: Re: [Buildroot] [PATCH 1/1] package/mongrel2: update the patches to
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
Cc: Lionel Orry <lionel.orry@gmail.com>, linux-amarula@amarulasolutions.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  7 Jul 2024 11:44:28 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
> fuzz factor to 0") reduced the fuzz factor.
> 
> Due to this change, mongrel2 fails to build with output:
> 
>     Applying 0001-Do-not-run-tests.patch using patch:
>     patching file Makefile
>     Hunk #1 FAILED at 16.
>     1 out of 1 hunk FAILED -- saving rejects to file Makefile.rej
>     patching file tools/m2sh/Makefile
>     Hunk #1 FAILED at 9.
>     1 out of 1 hunk FAILED -- saving rejects to file tools/m2sh/Makefile.rej
> 
>     Applying 0003-fix-build-with-gcc-4.8.patch using patch:
>     patching file Makefile
>     patching file tools/m2sh/Makefile
>     Hunk #1 FAILED at 10.
>     1 out of 2 hunks FAILED -- saving rejects to file tools/m2sh/Makefile.rej
> 
> This commit refreshes the package patches on the current package version.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  .checkpackageignore                              |  1 -
>  package/mongrel2/0001-Do-not-run-tests.patch     | 16 +++++++++-------
>  .../mongrel2/0003-fix-build-with-gcc-4.8.patch   | 10 ++++++----
>  3 files changed, 15 insertions(+), 12 deletions(-)

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
