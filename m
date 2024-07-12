Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9222CC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 12:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43F61405C9;
	Fri, 12 Jul 2024 12:58:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hICD6p8hVHqw; Fri, 12 Jul 2024 12:58:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2007B405CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2007B405CC;
	Fri, 12 Jul 2024 12:58:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 43A711BF40F
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 12:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30D03605F5
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 12:58:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rnWBFu7E1e7n for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 12:58:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E39CC605E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E39CC605E0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E39CC605E0
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 12:58:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1215B1BF204;
 Fri, 12 Jul 2024 12:58:40 +0000 (UTC)
Date: Fri, 12 Jul 2024 14:58:40 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20240712145840.5191010d@windsurf>
In-Reply-To: <20240207214729.115691-1-giulio.benetti@benettiengineering.com>
References: <20240207214729.115691-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720789121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/FB9CAGxd11Cot5GfM5mnXPCplgzVn3QrOYai20cGqc=;
 b=TUFPHABRTLe3ZLXmsNTNVTnYX2grjjHuSrL8+gXjCicm6IzTjQyalV+1K04ZGS7D0ZbnCo
 MepvEtQIRKDNzeVhDN61x90NqQ5JOxQxCi9lH1Dkjj3SCoHERD1U9BRkm1GPxIjlePvApu
 chGeVjSs3XnxV0G/eGX8RLf1iJAnMt5l3+Hc4agSclxyKNyE9abGAf1KtLHA2uHCS1/KVP
 Xl1o4To7Y+t/b6P6U97zD89bWbJIM5VQUTJMTFhB5NGBtM3xONIvOfpbvKZ5wnE40OINtU
 aIPQEo2xrnB6ZlIPSEUJKTp72xibtQflZAJAYjKIOK3sy6dElE3b290MkH/rwA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TUFPHABR
Subject: Re: [Buildroot] [PATCH] package/rtl8188eu: bump to 2024-02-06
 version on v5.2.2.4 branch
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  7 Feb 2024 22:47:29 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> This version allows to build with Linux 6.8
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/rtl8188eu/rtl8188eu.hash | 2 +-
>  package/rtl8188eu/rtl8188eu.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
