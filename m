Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250F3C0218B
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 09:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC4C1808A8;
	Sat, 14 Sep 2024 09:26:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XqEQFOEqSH53; Sat, 14 Sep 2024 09:26:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1818D808B1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1818D808B1;
	Sat, 14 Sep 2024 09:26:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 56F431BF280
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:26:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52CCF808A8
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:26:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zw2_a7aMpe3b for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 09:26:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DC8F480847
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC8F480847
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC8F480847
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 09:26:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E39C360004;
 Sat, 14 Sep 2024 09:26:25 +0000 (UTC)
Date: Sat, 14 Sep 2024 11:26:24 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240914112624.52462119@windsurf>
In-Reply-To: <20240909063340.533620-1-dario.binacchi@amarulasolutions.com>
References: <20240909063340.533620-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726305986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6SHpGQo2N4Kjq2f56YMB+cZsUBghLxMWz++IMhjSm+w=;
 b=P+c/P/RjBztWhI7iNxCsFZvywSOuWC8yobxT+IikjRt7vRpNOlSI3emwJ08nwdckPFfly3
 133UVza2mCgk0ad8SaBN8/ZVsLCuZIRDyljPmfGvF86x6mGrdDOHQPH1LgOpQCM7jqbj1x
 MpequFdjfbcUWdBSgTK6RG+WvWAZDXRfmblrpiXr2luZGrfkxpCwoZkq5BQ3qxwYEc9tRG
 48BLnAz5t9jnWnd5NXW2M6x+RDraGN6ITBLl2Nv/bXvP0abj9g4Y7UPD/+88PwGPRNt14M
 AV533jYwnQaTWe4eghvrENdqQg0A08kTaMj5+5gJWEh8kpjVE9x5T+UdKQYbWA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=P+c/P/Rj
Subject: Re: [Buildroot] [PATCH 1/1] package/xenomai: fix build with gcc 11
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
Cc: Romain Naour <romain.naour@gmail.com>, linux-amarula@amarulasolutions.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  9 Sep 2024 08:33:39 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> The commit adds an upstream patch to fix the following build failure:
> 
> latency.c: In function 'dump_histo_gnuplot':
> latency.c:415:9: error: 'fclose' called on pointer returned from a mismatched allocation function [-Werror=mismatched-dealloc]
>   415 |         fclose(ifp);
>       |         ^~~~~~~~~~~
> latency.c:404:15: note: returned from 'popen'
>   404 |         ifp = popen(xconf, "r");
>       |               ^~~~~~~~~~~~~~~~~
> 
> Fixes:
> - http://autobuild.buildroot.org/results/e15ccef2f2bd58482204b5061f77e76a8a540ebd
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  ...y-Use-corresponding-pclose-for-popen.patch | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/xenomai/3.0.10/0005-testsuite-latency-Use-corresponding-pclose-for-popen.patch

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
