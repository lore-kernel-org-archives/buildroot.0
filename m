Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 322F3CA0FED
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 07:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D85C383E10;
	Wed, 10 Sep 2025 07:53:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nUmIqLtFs_Vs; Wed, 10 Sep 2025 07:53:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D98383DFD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D98383DFD;
	Wed, 10 Sep 2025 07:53:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 52A2B10E
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 07:53:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 448A46080B
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 07:53:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GwOAsrWaw1Fa for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 07:53:19 +0000 (UTC)
X-Greylist: delayed 365 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 10 Sep 2025 07:53:18 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EA02760E1B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA02760E1B
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA02760E1B
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 07:53:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 8C2B04E40BB1;
 Wed, 10 Sep 2025 07:47:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5EE12606D4;
 Wed, 10 Sep 2025 07:47:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 61335102F2955; 
 Wed, 10 Sep 2025 09:47:08 +0200 (CEST)
Date: Wed, 10 Sep 2025 09:47:07 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20250910094707.63436900@booty>
In-Reply-To: <20250904211239.1928818-2-neal.frager@amd.com>
References: <20250904211239.1928818-1-neal.frager@amd.com>
 <20250904211239.1928818-2-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757490430; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=sv9dBoG+MQtsUnWQ5ugjYXDAgU4KbjhuzuLCmFsvs+U=;
 b=eGQMEyWkm6NM0FBRA5bB/vaOrz6QSEDv4o7e5rnLBtYpZEJEiqxfkEInUtMqOVjdR8C22Z
 JRzpPD9Bd7TiUfKTFe1gRrcUt0+jdH+9zIdlHUwPRDJHKr7wVLWJkXruPNVCc5vZK456mA
 /oeVIAkz5ujNNvtvOX/gCnWERoWp2hq0IvXZ2/7NLjgRvbHkAdVRkAGB4tVzKHPZw77wh6
 x5G4UW2J8SXdDYbGYuue7TJ/t5y/iQ9KHpdu4tHfGkWIdISXnGZfWLbx9YWvk//ksGqONp
 dXp3h+Hkf5iUO5Esjawz8+R2RsjqnzayUQJtZgOkrnkF6vFJEq/80H2LDb6zCA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=eGQMEyWk
Subject: Re: [Buildroot] [PATCH v4 2/4] boot/xilinx-prebuilt: add hash for
 xilinx_v2025.1_update1 tag
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

On Thu, 4 Sep 2025 22:12:37 +0100
Neal Frager <neal.frager@amd.com> wrote:

> Add the xilinx_v2025.1_update1 release tag hash to the xilinx-prebuilt
> package, so that Xilinx boards can use this new release tag.
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
