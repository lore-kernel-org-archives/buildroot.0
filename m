Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E69C52D7C
	for <buildroot@archiver.kernel.org>; Wed, 21 Aug 2024 10:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDBE660B01;
	Wed, 21 Aug 2024 10:39:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dRzodX8biD9N; Wed, 21 Aug 2024 10:39:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B02306073A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B02306073A;
	Wed, 21 Aug 2024 10:39:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 373AB1BF354
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 10:39:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2ED1B40695
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 10:39:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HEdtdVck5qdK for <buildroot@lists.busybox.net>;
 Wed, 21 Aug 2024 10:39:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E84DD40697
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E84DD40697
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E84DD40697
 for <buildroot@buildroot.org>; Wed, 21 Aug 2024 10:38:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0D64E1C0007;
 Wed, 21 Aug 2024 10:38:56 +0000 (UTC)
Date: Wed, 21 Aug 2024 12:38:56 +0200
To: Buildroot List <buildroot@buildroot.org>, Peter Korsgaard
 <peter@korsgaard.com>
Message-ID: <20240821123856.5d3d2eca@windsurf>
In-Reply-To: <20240821103816.1940502-1-thomas.petazzoni@bootlin.com>
References: <20240821103816.1940502-1-thomas.petazzoni@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724236737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OufBs0+G9bMgVi2VPggd8PgwqhSo+0qV2rdZD2/VSig=;
 b=NeRqaluSEhG+GJlk0JzHzLl8pDNaY/9cUz4BYjVFXpA3/tSYUQ4H1XgzuATPlJs9vEYyeP
 O135t6CRFINe6as3c03Ljpey45yjlD5UL2a6t1YmasYQ/pEcw53It0r3O/ctGS1qGHPbM+
 ZwDFHsEjCvhCPhTfgJ3xgelEfcuyJYBxKKRX+wnPrhjubzSzgUVUFFa7lwC25J0ahdBJFx
 CC0LAZIq9tjUfpi0yTOFqbM1GamSTOWgtThavF7f4XYHmLOjtMBa0hHjpCfuSe3rFyo+5i
 +Ar5Q+S6ukuV5+wni+KmypYSIiKxRgPtRTOwddQMf93kEFvXZm6YAqCyoAfnOQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NeRqaluS
Subject: Re: [Buildroot] [PATCH] package/fan-ctrl: remove package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 21 Aug 2024 12:38:15 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> For this package, we're downloading from the CVS repository viewer,
> but it is gone. The only way would be to download from the CVS
> repository itself, but really upstream is completely dead, and this
> package has seen no update since it has been introduced in 2013, so
> let's get rid of it.

Fixes:

  http://autobuild.buildroot.net/results/13cced54c9bf7ace79de092e4af7249757fe4cf4/

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
