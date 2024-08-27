Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F68C54731
	for <buildroot@archiver.kernel.org>; Tue, 27 Aug 2024 16:26:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADB66608AC;
	Tue, 27 Aug 2024 16:26:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1u43SIvAnz_7; Tue, 27 Aug 2024 16:26:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9DC8608B2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9DC8608B2;
	Tue, 27 Aug 2024 16:26:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F36951BF4E5
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 16:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFBB0608AD
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 16:26:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r24OeRPE6bpG for <buildroot@lists.busybox.net>;
 Tue, 27 Aug 2024 16:26:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 91E1F608B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91E1F608B0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 91E1F608B0
 for <buildroot@buildroot.org>; Tue, 27 Aug 2024 16:26:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 430CE1C0008;
 Tue, 27 Aug 2024 16:26:21 +0000 (UTC)
Date: Tue, 27 Aug 2024 18:26:20 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20240827182620.5dabfc06@windsurf>
In-Reply-To: <20240826210228.57853-1-peter@korsgaard.com>
References: <20240826210228.57853-1-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724775981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pzzZ2NSTITw/nbaWTZF6R+NcPQLGmtSJGrkJtxRknEE=;
 b=CgWAZ5vWNz1hceZnlUaOZPk3bxC6MZoE+mLwUUPo26/vyRz5BOiccFVoY2mVPm8C6Jh0rV
 SkEUcRPg97xZBvT7mc5GYO/pvotAgFy2Qx9Sn7R6IHvwr9AiGEm8w8K7LD5BcA9RcEmZrg
 v1HUJZWln3QQqN2IwCuFiYiRme6CYaMmd26HRLEUXBd18WxhWVa+L0KyX9UZ1Ghjo0F215
 NWK4npAFL4JKDoZnoMnDe8eWeCPIUJNcYvS/zZsBG9fLwgGVMCBaQAVVxFmkFikcoAdLHY
 HjH7tnfXRTXq1DK7n/cfZlX6UnB3mEO95y4JGAfnQEN5/n30ng5xOg6LzVZtVA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CgWAZ5vW
Subject: Re: [Buildroot] [PATCH] package/python3: security bump to version
 3.12.5
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 26 Aug 2024 23:02:28 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes the following security issues:
> 
> - gh-121957: Fixed missing audit events around interactive use of Python,
>   now also properly firing for python -i, as well as for python -m asyncio.
>   The event in question is cpython.run_stdin.
> 
>   https://github.com/python/cpython/issues/121957
> 
> For more details, see the changelog:
> 
> https://docs.python.org/release/3.12.5/whatsnew/changelog.html#python-3-12-5
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/python3/python3.hash | 6 +++---
>  package/python3/python3.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
