Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A883D5AE71
	for <buildroot@archiver.kernel.org>; Thu,  7 Nov 2024 08:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DE8440B6F;
	Thu,  7 Nov 2024 08:02:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WxHF-IP_b69t; Thu,  7 Nov 2024 08:02:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 326C040967
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 326C040967;
	Thu,  7 Nov 2024 08:02:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 33CBAC1
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 08:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 094F7408EB
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 08:02:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QOORhY2qQIGc for <buildroot@buildroot.org>;
 Thu,  7 Nov 2024 08:02:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9DECF40B93
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DECF40B93
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9DECF40B93
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 08:02:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D2BF3C0007;
 Thu,  7 Nov 2024 08:02:41 +0000 (UTC)
Date: Thu, 7 Nov 2024 09:02:41 +0100
To: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Cc: buildroot@buildroot.org, Johan Oudinet <johan.oudinet@gmail.com>
Message-ID: <20241107090241.3d76fc6d@windsurf>
In-Reply-To: <20241105170920.214977-1-thomas.claveirole@green-communications.fr>
References: <20241105170920.214977-1-thomas.claveirole@green-communications.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730966562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x0LWZVdJ07wqKGUJIRzyOsnEt3ygfzu41EID4VXk1lI=;
 b=FUMcvDyHi5yJOjvvwW2BihleN4bgRSXNBZNnXfr9NW7B4Ur6NrCUVhO6KMUAOC1Rw9CreF
 s7Kqcp8S2fu5x55YRx5Ys8gJal03ptYQHXmZ4tbouPHhgVSynk1oMbtfrjqpwc5KVc124+
 ZK5WdE4+m34NXUCIYXp330R7AVxQDX9dbS5aZR3gJBFlNO/tAtsgPETp+RZoqSRpuCDASy
 dOstTr2mPI15RcR4zm51z4PM1aG3Qxd4Iqe0Yrr7lsTXQRLawBRWEyzE85NbOuEPlRK77w
 FxwqbH8a8ZBxflfYvrH4ahNC/ZQhccIm816d6qw/lmf/espyxt8z7Kg0nugySw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FUMcvDyH
Subject: Re: [Buildroot] [PATCH 1/2] package/vuejs: bump to version 3.5.12
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

On Tue,  5 Nov 2024 18:09:19 +0100
Thomas Claveirole <thomas.claveirole@green-communications.fr> wrote:

> Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
> ---
>  package/vuejs/vuejs.hash | 2 +-
>  package/vuejs/vuejs.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
