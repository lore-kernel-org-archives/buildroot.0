Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475EECA0FED
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 07:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F189F4128E;
	Wed, 10 Sep 2025 07:52:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lbo2Ck3t4b4r; Wed, 10 Sep 2025 07:52:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2807141294
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2807141294;
	Wed, 10 Sep 2025 07:52:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E7AD510E
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 07:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE7E483022
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 07:52:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id riqIGK-ihFL1 for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 07:52:18 +0000 (UTC)
X-Greylist: delayed 357 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 10 Sep 2025 07:52:18 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0DB3C82FEA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DB3C82FEA
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0DB3C82FEA
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 07:52:17 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id F26311A0957;
 Wed, 10 Sep 2025 07:46:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C89C1606D4;
 Wed, 10 Sep 2025 07:46:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 70E61102F28C0; 
 Wed, 10 Sep 2025 09:46:03 +0200 (CEST)
Date: Wed, 10 Sep 2025 09:46:00 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20250910094600.67ead264@booty>
In-Reply-To: <20250904211239.1928818-1-neal.frager@amd.com>
References: <20250904211239.1928818-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757490377; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=uB9Z1ZeGUQ6CObt5yiupli6dr+b291ZKXPgCwh2rahc=;
 b=b1VogXc/Yx6pdE0s6lE0FiyQlE0tX74JfS33Qpy5VH4JmXxshJc8GBeKr9sBOcAnWHwqgw
 L8QsvfKZSOusNRi0OWIfjvXdKv0RyFfkxn9jxTXe4vMB7yU/Y79Udt9UDBX19xmMqJxLDX
 lxx/k3I1b/6dV3f7A9sDTaOKk0aKoS+a0HvAkt3IF2rzSRyG9s0FreRHxouJWuiIGqtuSu
 PeN3DrqFnyDdka/ghABuQGWS1pVcZScWRuNQpKeR8oZufITLs0yqOUzHEx/5eZf0POzC8W
 m+RIMVWXbnisq9hLaFkIcL44iaD4ZrkLIYuP1uXSDvmvmOaDTHNDln7b4y0I6w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=b1VogXc/
Subject: Re: [Buildroot] [PATCH v4 1/4] boot/xilinx-prebuilt: add support
 for plmfw.elf filename
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

On Thu, 4 Sep 2025 22:12:36 +0100
Neal Frager <neal.frager@amd.com> wrote:

> AMD / Xilinx has made the decision to change the name of plm.elf to plmfw.elf
> in the prebuilt binaries repo starting with the next update.
> 
> This patch updates the xilinx-prebuilt package to support either the old
> plm.elf filename or the new plmfw.elf filename.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

I had reviewed this series at v2, apparently you missed picking up my
R-by tags.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
