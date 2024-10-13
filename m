Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C0BCF258E
	for <buildroot@archiver.kernel.org>; Sun, 13 Oct 2024 10:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6848C4049E;
	Sun, 13 Oct 2024 10:48:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qid1I3RA2uRy; Sun, 13 Oct 2024 10:48:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31A3740928
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31A3740928;
	Sun, 13 Oct 2024 10:48:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 45F541BF35D
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 10:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 345F140238
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 10:47:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hplQSkxvWkc6 for <buildroot@lists.busybox.net>;
 Sun, 13 Oct 2024 10:47:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C6C824036E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6C824036E
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C6C824036E
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 10:47:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8B3F7C0003;
 Sun, 13 Oct 2024 10:47:47 +0000 (UTC)
Date: Sun, 13 Oct 2024 12:47:37 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20241013124737.04ed850c@windsurf>
In-Reply-To: <20241011211251.2775950-1-james.hilliard1@gmail.com>
References: <20241011211251.2775950-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728816468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/LfDxZ/fcO3W7FYqgVdbK2ozoquX4KnEeEOsxsNe9LQ=;
 b=Ia9JMfKV6EDMI6kXS1u6lmj1SeYwX28sfWeWsR+A+AKc7tu8dPPHO0DFxXjGeWSpcPOcJ8
 mJlwOCye/w0Pd4FHW/NivwdgPQR2Sb+hsRXrrq2vlmzW7CRKhjR1RwfqoAKQSV06CRC2oT
 +E5YPu40SBcr127wuZ8nJMnS70jzDP3DSIwQxvX/hKMenZmq8ciWnDkvQFk/80qUglU4wV
 xD4us8plqfoInAz27ktddOuQ+Fk5HVgUxKKk8Q76bSrprP+KdReaOZ5MLURwFM+gCdiPFS
 zk1x/864YPOyKDoZeABtV2QyKOQLLqxA/6a07gu7AR80okKpWLFU/xr30zQ0Bw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ia9JMfKV
Subject: Re: [Buildroot] [PATCH 1/1] package/python-wsaccel: bump to version
 0.6.7
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
Cc: Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 11 Oct 2024 15:12:51 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-wsaccel/python-wsaccel.hash | 4 ++--
>  package/python-wsaccel/python-wsaccel.mk   | 4 ++--
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
