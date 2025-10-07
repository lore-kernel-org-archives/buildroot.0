Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27756CCA476
	for <buildroot@archiver.kernel.org>; Tue,  7 Oct 2025 19:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7B0460A9E;
	Tue,  7 Oct 2025 19:40:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SCPtLdXayPpe; Tue,  7 Oct 2025 19:40:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9840260A8E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9840260A8E;
	Tue,  7 Oct 2025 19:40:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 806C79DA
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 19:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68CAA60A8A
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 19:40:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7RMqcmnCkEY8 for <buildroot@buildroot.org>;
 Tue,  7 Oct 2025 19:40:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6F14860A92
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F14860A92
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6F14860A92
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 19:40:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 3C2564E40F65
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 19:40:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1202B606C8;
 Tue,  7 Oct 2025 19:40:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 23D3D102F2176; 
 Tue,  7 Oct 2025 21:40:39 +0200 (CEST)
Mime-Version: 1.0
Date: Tue, 07 Oct 2025 21:40:38 +0200
Message-Id: <DDCCG0XIGP4J.JSQ8AY0T2A57@bootlin.com>
To: "Giulio Benetti" <giulio.benetti@benettiengineering.com>,
 <buildroot@buildroot.org>
X-Mailer: aerc 0.20.1
References: <20251007180553.2582202-1-giulio.benetti@benettiengineering.com>
In-Reply-To: <20251007180553.2582202-1-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1759866040; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Ka7jRwduj/SYcXQwTHduCVCuYggdRsjcQRojLSDQ0Pk=;
 b=bFbnTEI9vpUshZWJ7j66B6OLgZwe+YdvC9goaFUe2TcHjJ5K5ZjuGZp7RnRpcrZJ3hf+JZ
 RE+pRPnYkVWT2TnBi8q5h0oLpOhz6dTkLt6mYUwOYtlnyfpNuXZbzloN6EiXnffcHiYlpA
 jGCiQJiSuK9S1xgTbqxJe24C9vdfaayqdZ1GL5knT/IdIeNnje6/DE6+aqwcg8ZMfdw4h5
 ZNsyiWuJFgAGWMyw97T6q8H3UJJiGxExvWrZJxVCuSXWnc9T1WJUsT+euTbcTNiUnpoGT5
 cqnvoCSuYkppfe+48kC5BeJG04zxAjCqJg59Isl+QLyJzGhKSJcwPDvhNPFf/Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=bFbnTEI9
Subject: Re: [Buildroot] [PATCH] package/rtl8188eu: fix build failure with
 linux 6.17
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Giulio,

On Tue Oct 7, 2025 at 8:05 PM CEST, Giulio Benetti wrote:
> Bump to version 2025-10-07 on branch v5.2.2.4 to fix build failure with
> Linux 6.17.
>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
