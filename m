Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E655C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 22:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17F0683FA4;
	Fri, 12 Jul 2024 22:10:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KuQNXcl79jOS; Fri, 12 Jul 2024 22:09:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA4D583F70
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA4D583F70;
	Fri, 12 Jul 2024 22:09:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3082E1BF427
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 22:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1CCD3407AF
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 22:09:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nusQN1rAF-Hx for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 22:09:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E344D407AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E344D407AA
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E344D407AA
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 22:09:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4447EE0002;
 Fri, 12 Jul 2024 22:09:54 +0000 (UTC)
Date: Sat, 13 Jul 2024 00:09:53 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240713000953.1f27ce49@windsurf>
In-Reply-To: <20240712214838.446517-1-ju.o@free.fr>
References: <20240712214838.446517-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720822194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/yFnU6iuATSJQt1NTEK4cv/j5VinVY93iI7SD35JkQs=;
 b=darBEgBSgFktaAbrmTRRxm9yjboN1e+hXQVJM7zrawKbx7B3ZXfopV/5ujbc8g6J+v14Xz
 tavnmBue0dJbQxnFu1r5jfk72tAUfXIWuritoL4PRmZKmXRs9AiF5A3RqpHc1qoP7jdtZP
 GynX+zC5V/WmM3+5Xl5jtiOUXg2x+7sSbnPPgmjtbG3sofT6AwriVPU3E2KzvW3+sowxBp
 K+yyWl4glfMdRmMNFFjJ6zDmueGCiP4mYmG69/ggaZZppaIIpv0mzgj6N+poJO581yWzPH
 2odzI2HYwpZSrtaLY60+JGS5QctQXhMAw41zsn5hYOFacFaRIS13jKV6D6whIg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=darBEgBS
Subject: Re: [Buildroot] [PATCH 1/1] package/octave: add optional libsndfile
 support
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

On Fri, 12 Jul 2024 23:48:38 +0200
Julien Olivain <ju.o@free.fr> wrote:

> GNU Octave supports the --with-sndfile configure option since v4.0.0.
> 
> For reference, commit 40ea68b4b2 "package/octave: new package"
> introduced the package at v7.1.0.
> 
> This commits adds this optional support.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/octave/octave.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

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
