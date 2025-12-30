Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39F8E95A8B
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 13:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC87081E3C;
	Tue, 30 Dec 2025 13:05:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sHYoKARDkAu5; Tue, 30 Dec 2025 13:05:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCA9F808F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767099943;
	bh=fbi/6YSS+1oWtE8EaW+OY+o2nCFS9/mAdaEZ9/6FyXY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ngjgpDpUMxwe8tkxlK0goJRWnY00qC/1W6IHcU28+xHyKPVnTphFOZGGlifL8FGJv
	 ht6SQHdJhcSre6c8riqSoVNguP4cod1PgrW2FDD/MsGgQlwz3gPUBxuDYcm6y60+i/
	 GgbYY+JEVjFm9WhVGnfUsvDFBG8EP5HUS4ZIjnFYGf47oXLEGk3qSSV1ZrekzWmp3e
	 bmbDI5SkhJ24Y8LVjjtIGTNMda414NZSUnSS7FDVHBQKn+9ZiI2PlTqSCcM/Yd2If4
	 ZReNeHNop37LO0rAyd4Zlk81fDfQGPFO0/nFazGqK8FIvrU4CxNIC6zIuiwS4D9pnK
	 xj1zbEDrWlVMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCA9F808F5;
	Tue, 30 Dec 2025 13:05:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4122DD8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3355860B95
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:05:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9UU2eoFB1INo for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 13:05:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 25A4760B90
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25A4760B90
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 25A4760B90
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:05:41 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 907ACC1D734;
 Tue, 30 Dec 2025 13:05:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2745A6072C;
 Tue, 30 Dec 2025 13:05:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6E8A4113B0392; Tue, 30 Dec 2025 14:05:38 +0100 (CET)
Date: Tue, 30 Dec 2025 14:02:25 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20251230140225.3118f676@windsurf>
In-Reply-To: <20251228220408.2722820-1-james.hilliard1@gmail.com>
References: <20251228220408.2722820-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767099938; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=+sO0IAnk3luiUZD4zohwzAaRVHkgzbP4R4J3f5gv9Tw=;
 b=Ip+B0K731Tl+hUUD/hjAu4c04blh1kYxsiSmWVJclvNaAmDeUNj28E49GnZ++oohKIH6/A
 KxNa99X7Hfr84geJL4z0CvXu04jJ9opmlKxLEL5c3hjxDOEVcu71yoHjkRrR15ipxDJUBT
 jzEp+g7L1cJqs+UxKWGuKvDnuwpCTFnTQvVTeye3qBtkCmnRfDR6t4pVncjoXrNcnP0eim
 lo9VKHx0QoYMJRhadR0JTxaGexD45eVSz/HfgqlboqaOPTl0hGvP6qI7cHpmXfc0gwQg6d
 y1Esqx1XgyFNSy8FwX5tPDl2G82TxFwqQba0C1ZtDS29DjW1Hc1YHnFk+UuvfQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=Ip+B0K73
Subject: Re: [Buildroot] [PATCH 1/1] package/python-hatchling: bump to
 version 1.28.0
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

On Sun, 28 Dec 2025 15:04:07 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-hatchling/python-hatchling.hash | 4 ++--
>  package/python-hatchling/python-hatchling.mk   | 4 ++--
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
