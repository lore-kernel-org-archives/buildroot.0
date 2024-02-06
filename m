Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5138C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 12:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B6BB8228C;
	Tue,  6 Feb 2024 12:57:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z_D0iPjQoQFX; Tue,  6 Feb 2024 12:57:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68AA782345
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68AA782345;
	Tue,  6 Feb 2024 12:57:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 814A01BF33B
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 12:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F8138216D
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 12:57:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TLR3_93MASAg for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 12:57:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9B8468232C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B8468232C
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9B8468232C
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 12:57:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 287E46000C;
 Tue,  6 Feb 2024 12:57:26 +0000 (UTC)
Date: Tue, 6 Feb 2024 13:57:25 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240206135725.01f393d5@windsurf>
In-Reply-To: <20240110040751.1028591-1-james.hilliard1@gmail.com>
References: <20240110040751.1028591-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707224246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bfJAScZpwwpqnAeAKxNh11dwLCQGhtEn5TdGvuQgLys=;
 b=erulX6gGu6gjfJygE7qMkiYiatjBMaivthUl4N89uwtao4bUN3FSjJnDZI2lcNwAq881OW
 3QpxPy3+Iv3+Su29pHF0kXvi3BYnYPFvaySjinDmUX9NmIoTOZZA8eJTdP6u5ObG16I2Ui
 cNFT9Th25cSPCxIEZ+IsDHJBW68kwsdk4xlWsGS9By0Y9yMQ15Aqz/Llz2Cs6B8SRHqTkp
 hYZ8mDXrnREJuExtf/d9ulybfT+eVfkpvrua4x65OVzpJ49FKcFtwEF2vgFLLwsqCtD8vq
 o/A0r3lj+J8Lftn4GibUvrWNWk/fxZPSHd9h1+S2gt8EeFtIXegwUvVMMEvPng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=erulX6gG
Subject: Re: [Buildroot] [PATCH 1/1] package/python-netaddr: bump to version
 0.10.1
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

On Tue,  9 Jan 2024 21:07:51 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-netaddr/python-netaddr.hash | 4 ++--
>  package/python-netaddr/python-netaddr.mk   | 4 ++--
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
