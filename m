Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB44FCA0EE4
	for <buildroot@archiver.kernel.org>; Mon, 18 Aug 2025 16:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AE7E80B07;
	Mon, 18 Aug 2025 16:33:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Psj9HF5rGxfF; Mon, 18 Aug 2025 16:33:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B108180B04
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B108180B04;
	Mon, 18 Aug 2025 16:33:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BB9DA196
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 16:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A292D40070
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 16:33:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kGD50QrKKH3M for <buildroot@buildroot.org>;
 Mon, 18 Aug 2025 16:33:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AEC0B4004A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEC0B4004A
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AEC0B4004A
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 16:33:53 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 1D8CF4E40C25
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 16:33:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EBA33606A6;
 Mon, 18 Aug 2025 16:33:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F0E341C22C93E; 
 Mon, 18 Aug 2025 18:33:50 +0200 (CEST)
Date: Mon, 18 Aug 2025 18:33:49 +0200
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20250818183349.6373d330@windsurf>
In-Reply-To: <20250818140518.964728-1-angelo.compagnucci@gmail.com>
References: <20250818140518.964728-1-angelo.compagnucci@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755534831; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Nq8G5IahexGBeE5aY0Wc4TjIUoQPg8TioaHveJv2kzk=;
 b=NTjWW7/De/3P8u6yD2R5Nj2aSOBbXwmDAjKW4litz4frIP2p5d+gH9xItZBFLklzHgSLHw
 aSVALppS/yh+R9zTAJGrCixeOhfixAdz/DaiFolfQ2jAV7dVIM3nhuM4eSPQbC10L1U5y+
 d228fd7VZ6U6wmudl7hDugf1UTI2WBG9qYJvzumFJN2IKgs3N+YNxt/oZHfZvlVZz19yt9
 taBG84bzTDWPG4jTt+ukRfHGt3Y7E1tYr8CFm12P7/htq8eIMHx0YJnCvjgeZsBe0FxnVC
 4u+QyXVgssCKWGGT11AP3V48bHG+2dPIypZzBL7U74MDW5RImlBOPGRMCbuB3Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=NTjWW7/D
Subject: Re: [Buildroot] [PATCH] package/mono: remove mono and related
 packages
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

Hello Angelo,

On Mon, 18 Aug 2025 16:05:18 +0200
Angelo Compagnucci <angelo.compagnucci@gmail.com> wrote:

> Microsoft maintains a modern fork of Mono runtime in the dotnet/runtime repo and
> has been progressively moving workloads to that fork. That work is now complete,
> and we recommend that active Mono users and maintainers of Mono-based app
> frameworks migrate to .NET which includes work from this fork.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Thanks for this patch. But do we have the Buildroot packages for .NET,
which would replace these Mono packages?

Or should I read your patch as "This mono stuff is no longer
maintained, and if anyone wants to use .NET with Buildroot, they should
package .NET instead of using this unmaintained mono stuff" ?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
