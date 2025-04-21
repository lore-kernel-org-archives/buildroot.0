Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50CF3C369D3
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 21:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0616980B83;
	Mon, 21 Apr 2025 21:51:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EtwgyXJpKSbT; Mon, 21 Apr 2025 21:51:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 371A080DA2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 371A080DA2;
	Mon, 21 Apr 2025 21:51:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B22F868
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3F1340621
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:51:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m1jtOukThHbg for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 21:51:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A1FD6408DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1FD6408DB
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A1FD6408DB
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:51:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 63267432EB;
 Mon, 21 Apr 2025 21:51:14 +0000 (UTC)
Date: Mon, 21 Apr 2025 23:51:13 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <20250421235113.4052b53e@windsurf>
In-Reply-To: <20250320223549.138974-1-ju.o@free.fr>
References: <20250320223549.138974-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeduleejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeekudeuieduheetgfeviedtteefleefieefueejieffkeelleduffdvffefueeffeenucffohhmrghinhepfhgvughorhgrphgvohhplhgvrdhorhhgpdhgnhhurdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745272274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l9b775Sgx9uh3JG+1MP0IM02pcL2BpUefFJ+e1n+078=;
 b=ShXXhIC+Dde4yteLRWLM1D4g2aCOGnU3AVzXCUd0eVrVSZnV721H5oXkKXUYUUR1Kv3ugP
 H9s/u/GeOkyFhrCxS/5cU2Lt/CAFlqsnr2HHnVyBv+kbdQRlpNRnXahmUMIu94h1io/uvT
 bs5r5YdPy3jqzs9ZJ6LZNMrBLoGgGNOzIcmsmibiPaovMRvVPum2K+jUz3ibOTYS4rbWUK
 hZPJ0H4ZqOOFVl+7iBupVUQN/6GZpGhUWiQdi0sAmlQkri/ZwxXsfDyiXdZ0uMcSXVSJC3
 Xz+DtGlD8c7O5RUwsGaE6aNrDEfpR7tdmlAFoU7HZorwMC3q276J88vDwg1ejA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ShXXhIC+
Subject: Re: [Buildroot] [PATCH 1/1] Config.in: introduce
 BR2_HOST_GCC_AT_LEAST_{12..15}
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 20 Mar 2025 23:35:49 +0100
Julien Olivain <ju.o@free.fr> wrote:

> Fedora 42 is planned to be released on 2025-04-22 [1].
> It is also planned to include the upcoming gcc 15 release.
> Gcc 15 is changing the default C language from -std=gnu17
> to -std=gnu23 [2].
> 
> This change is expected to possibly introduce build failures [3].
> In order to be prepared to fix those, this commit introduces the
> BR2_HOST_GCC_AT_LEAST_{12..15} symbols.
> 
> [1] https://fedorapeople.org/groups/schedule/f-42/f-42-key-tasks.html
> [2] https://gcc.gnu.org/gcc-15/changes.html#c
> [3] https://savannah.gnu.org/support/?111150
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  Config.in | 20 ++++++++++++++++++++
>  Makefile  |  2 +-
>  2 files changed, 21 insertions(+), 1 deletion(-)

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
