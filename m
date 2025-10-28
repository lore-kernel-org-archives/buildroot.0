Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E715FCCF9EA
	for <buildroot@archiver.kernel.org>; Tue, 28 Oct 2025 08:05:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B38B9412E7;
	Tue, 28 Oct 2025 08:05:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U7-n2rZfFTeQ; Tue, 28 Oct 2025 08:05:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45B8B40E24
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45B8B40E24;
	Tue, 28 Oct 2025 08:05:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1481770B
 for <buildroot@buildroot.org>; Tue, 28 Oct 2025 08:05:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F243F40E24
 for <buildroot@buildroot.org>; Tue, 28 Oct 2025 08:05:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iyjkfT-OlGsy for <buildroot@buildroot.org>;
 Tue, 28 Oct 2025 08:05:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1336040CFE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1336040CFE
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1336040CFE
 for <buildroot@buildroot.org>; Tue, 28 Oct 2025 08:05:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 09A231A16C2;
 Tue, 28 Oct 2025 08:05:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C4C5D60704;
 Tue, 28 Oct 2025 08:05:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B5312102F2511; Tue, 28 Oct 2025 09:05:07 +0100 (CET)
Mime-Version: 1.0
Date: Tue, 28 Oct 2025 09:05:02 +0100
Message-Id: <DDTSSVLX0TGC.346730GJXF7S0@bootlin.com>
To: "Neal Frager" <neal.frager@amd.com>, <buildroot@buildroot.org>
X-Mailer: aerc 0.20.1
References: <20251027131839.2779098-1-neal.frager@amd.com>
In-Reply-To: <20251027131839.2779098-1-neal.frager@amd.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1761638726; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=sqAlWGX9Exrmh+m/j0PAI0uhRbnAnwnwQdAL+XMifHU=;
 b=SgkVaDYgmeeu1qr0YSlPjZSxhBHce3+oadZCs6j7YKzLZnc8cCZlz0DpauwtXRWgJyUCGb
 3umoLXQegn9ZN3iVC+yypz4J7hU5JA2Vuiyo6RP0hmB4nGS+b1D44j5gTufNDRM+r5N4Db
 9LCHzMLyRfKg4Jhv5X0Ll8/r/NAE/LsUWxVU8j8H+dpjwb6EQrPJqssTvVXhZLpLVy/pZs
 DEe5HbCD1iBWyB235s45MO9aBlEnkJH97E8NE2fKfrA2oLV8uwbFMjjMlg/65Sb2LGGgOJ
 GPneFY8tLGUWF/TyyFrUWTmVBYWlzyPRFEluryonO2zmPftV9cAG98Oh5m3VGg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=SgkVaDYg
Subject: Re: [Buildroot] [PATCH v2 1/1] boot/xilinx-prebuilt: add local
 versal xsa support
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
Cc: ibai.erkiaga-elorza@amd.com, yann.morin@orange.com,
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon Oct 27, 2025 at 2:18 PM CET, Neal Frager wrote:
> Most of the time, users will be running Vivado on their local host machine,
> and will generate a XSA (Xilinx Shell Archive) locally.
>
> Instead of requiring users to create a URL location for their XSA file,
> this patch improves ease of use by allowing users to work directly with
> just a path on the local host machine.
>
> BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA_LOCATION can thus be defined as either
> a simple local location or a URL location for the XSA file.
>
> In either case, a hash for the XSA file needs to be added to the
> boot/xilinx-prebuilt/xilinx-prebuilt.hash when using this option.
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
