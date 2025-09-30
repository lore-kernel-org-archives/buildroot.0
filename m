Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7AACCA470
	for <buildroot@archiver.kernel.org>; Tue, 30 Sep 2025 16:34:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3434806A1;
	Tue, 30 Sep 2025 16:34:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 97A-VsmkAUI9; Tue, 30 Sep 2025 16:34:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2D2880684
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2D2880684;
	Tue, 30 Sep 2025 16:34:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7077B111
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 16:34:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56B9440C2B
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 16:34:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T8zYNifHPjnF for <buildroot@buildroot.org>;
 Tue, 30 Sep 2025 16:34:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 539AA40C26
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 539AA40C26
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 539AA40C26
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 16:34:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 4B0091A0F94
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 16:34:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1FD8C606E4;
 Tue, 30 Sep 2025 16:34:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A47D3102F184F; 
 Tue, 30 Sep 2025 18:34:01 +0200 (CEST)
Date: Tue, 30 Sep 2025 18:33:59 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20250930183359.20a64759@booty>
In-Reply-To: <20250930125823.971241-1-neal.frager@amd.com>
References: <20250930125823.971241-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1759250064; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=JCLZX9PoD9blglLdXyGwsGx2CQuNEjbYIhjpBH1T/dY=;
 b=wO2JbGK3jFk+MA78t5My/s55TC+3W/3K39ab5ZLEd19zHMKE4bIgXk8wX4rHtTUq7nQDEC
 L18N1YqFEUBqaI5USW4ndgqWBSAk2s5xM7VnLvz5lOAHIlEwNqsKjeld2qTToN6Mw+UDmL
 kWLxivIasdvwy5P0i324QoVFNDSXCgI8aPIVO3ZcJlnrgzUq4zV0H61BzpDEehpuPdE7A1
 w7t3iQBfVkt62SO+JNgD73RZiMI4BhgtqdXUuQuafy+CXsJH+nV9FLzg5faYaEGuakOEeu
 V4PCbafpqO8kND91a9Rl3zKOoX0kenQWuEpB3mtz+B0QnkXBZh/2nWrDoTEZ3g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=wO2JbGK3
Subject: Re: [Buildroot] [PATCH v2 1/1] boot/xilinx-prebuilt: simplify
 family logic
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: yann.morin@orange.com, ibai.erkiaga-elorza@amd.com, buildroot@buildroot.org,
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 30 Sep 2025 13:58:23 +0100
Neal Frager <neal.frager@amd.com> wrote:

> Currently, the xilinx-prebuilt package uses an if-then-else statement for
> deciding which files need to be installed from the xilinx-prebuilt repo. This
> works fine for now because there are really only two options, either versal or
> zynqmp/kria.
> 
> Starting with the xilinx_v2025.2 release, the versal2 family along with the
> vek385 board will be added to Buildroot and thus the xilinx-prebuilt package
> as well. In the future, additional families will also probably be added to
> this package.
> 
> To avoid creating a long if-then-else-then-else statement which will only grow
> in complexity over time, simplify the logic of the xilinx-prebuilt package by
> giving each xilinx family its own if statement. In the long term, this will
> make the xilinx-prebuilt package easier to understand and maintain.
> 
> For this reason, this patch moves the zynqmp/kria families from the "else"
> statement to having an if statement separate from the versal family.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
