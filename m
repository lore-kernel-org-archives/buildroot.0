Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4011DD44166
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 10:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 146CD41150;
	Fri, 12 Dec 2025 10:25:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rNkRz7HdfV1f; Fri, 12 Dec 2025 10:25:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C06AE41144
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765535106;
	bh=5dX2lzWzeakhi78wYlo+pxcJkb/elwA9goFStdAVvc0=;
	h=Date:To:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Z62C7u9vB8CPrHcaB5EGSLCtjZaGkZeyXhOY7xJBdx9gx0WwQjAjJnS9jiXwtL3QT
	 rGMblLRSV/eAlVumyloYQGvbLrchAUaqClJxqB+EZaLAh1EbU6uCaztQdcE/aXjM6o
	 oaoNmHCxMe2RxRx8q3+eJBMTlw4ftXsLGhZPkbOVX83jLnma6MZiSB86OtcEqL/D0G
	 7bB8BJ7N42q0kjpbd5wOPNvtB280wSu6Xvt63pCD2N61mYlr3BJI+n6ehJ7mBOj3IT
	 K19rhyCtlzQbSwtHk7jJjLK/KgRWqDlVmxI0P8JNHRHH3L2FPqW3FH64TjwLux+jeG
	 0OO7KDhbY178Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C06AE41144;
	Fri, 12 Dec 2025 10:25:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C1A692C6
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 10:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2D0140291
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 10:25:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HppE9Oe6pU-L for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 10:25:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 361C84020B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 361C84020B
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 361C84020B
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 10:25:04 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 3C5C1C1935D;
 Fri, 12 Dec 2025 10:24:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5327A606DF;
 Fri, 12 Dec 2025 10:25:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E6AE5103C8E03; Fri, 12 Dec 2025 11:25:00 +0100 (CET)
Date: Fri, 12 Dec 2025 11:25:00 +0100
To: Kory Maincent <kory.maincent@bootlin.com>
Message-ID: <20251212112500.07c8ec9a@windsurf>
In-Reply-To: <20251212101533.820554-4-kory.maincent@bootlin.com>
References: <20251212101533.820554-1-kory.maincent@bootlin.com>
 <20251212101533.820554-4-kory.maincent@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765535101; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=WE0qmKdUJEgtUsz8BNEItQlRrbLUL8ypo0Kd2KNBjJ4=;
 b=evmrhGBnco2Z+hnevtANJHfjD0sK2tSLuHbU1Nevv36GjkNZtNxc2N30atLElZu82jsGvu
 Eu2sQfainAmb/8uTVQ4BdmbwAqKdS3ZiVulwQMtelE1deoY/DpR81mMPRdjoWLeOzYnLnj
 VERWN9TZrSlpn2uj+Grm0gAqPP++QsseQ9E7lbAVNR3iTTbopfd6ISe+Oya1WuyfPlxHyB
 WH7O0RcnuFecFKKgu7kqghH3fRLbussAN6xDTOALp8ofSFba9CKMvj9JuP07BXJDV6i4r/
 4HJP3xlt7A75FWzuKTtHpnm07nvLs11lcADgrnnhfHuGH5acZYUYmJmz2Beilw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=evmrhGBn
Subject: Re: [Buildroot] [PATCH 3/3] board/beaglebone: Add BeagleBone Green
 Eco support
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
Cc: Bajjuri Praneeth <praneeth@ti.com>, Bryan Brattlof <bb@ti.com>,
 Lothar Felten <lothar.felten@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 12 Dec 2025 10:15:30 +0000
Kory Maincent <kory.maincent@bootlin.com> wrote:

> From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
> 
> Add the am335x-bonegreen-eco device tree to enable support for the
> BeagleBone Green Eco variant. This ensures the device tree is built
> from the Linux kernel sources and included in the boot partition.
> 
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
