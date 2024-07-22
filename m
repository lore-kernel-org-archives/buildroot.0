Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB384C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 16:28:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6791402E5;
	Mon, 22 Jul 2024 16:28:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EiH34y5SNg_P; Mon, 22 Jul 2024 16:28:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 468D74028E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 468D74028E;
	Mon, 22 Jul 2024 16:28:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6A12C1BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 57E1E8107F
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:28:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H2nKnJr2V_N5 for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 16:28:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4BE1E8106A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BE1E8106A
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4BE1E8106A
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 16:28:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6E85B40004;
 Mon, 22 Jul 2024 16:28:26 +0000 (UTC)
Date: Mon, 22 Jul 2024 18:28:25 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240722182825.53fa31f1@windsurf>
In-Reply-To: <20240722161740.301988-1-dario.binacchi@amarulasolutions.com>
References: <20240722161740.301988-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721665706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HKqm1Jftvkfyx88Tqn9SK9rIJHrAX+Vd9Hmxcf1fd0Q=;
 b=WQ8oAZmFV6WGRqoBe94eEV60H8S3yyqJyIRjkwKzGpe9ixOXr0ZCFcI5CBLpJOIFLwrbsU
 9TagxCxiBpz5aZtsiyyfJdzyvb2539TWg2DdtLyju/umjjmKRsbzk7ip472SCf/sC67CBD
 DrtDDfAXMGV8E5Hb/tzXz95BPK31QHk1NBeFhciAfTsZ1Y7bkUdUrn+rjGGj0KEhGZlaGO
 /S0tTkyk1bFLSwaERSKbYCCVdYyQoXl9l735VqNB2dndK+Z5ouDFJyGFNnxGKPTbu5b8gV
 q9mgHbNKO5iBrCruVIYBHfkV+F4mL7zJaWnb7J4JmxZxHEMf3zCPIXKJjJqLCw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WQ8oAZmF
Subject: Re: [Buildroot] [PATCH 1/1] package/zxing-cpp: bump to version 2.2.1
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
Cc: Francesco Nicoletta Puzzillo <francesco.nicolettap@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 22 Jul 2024 18:17:40 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> Release notes:
> https://github.com/zxing-cpp/zxing-cpp/releases/tag/v2.2.0
> https://github.com/zxing-cpp/zxing-cpp/releases/tag/v2.2.1
> 
> The added patch fixes the library compilation when only the writer
> support is enabled.
> 
> Co-Developed-by: Francesco Nicoletta Puzzillo <francesco.nicolettap@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  ...-when-only-writer-support-is-enabled.patch | 164 ++++++++++++++++++
>  package/zxing-cpp/zxing-cpp.hash              |   2 +-
>  package/zxing-cpp/zxing-cpp.mk                |   2 +-
>  3 files changed, 166 insertions(+), 2 deletions(-)
>  create mode 100644 package/zxing-cpp/0001-Fix-building-when-only-writer-support-is-enabled.patch

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
