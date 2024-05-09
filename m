Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F84FC25B10
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 15:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34F028174C;
	Thu,  9 May 2024 15:59:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sl5BwXwfKVhN; Thu,  9 May 2024 15:59:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12EFE81E1D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12EFE81E1D;
	Thu,  9 May 2024 15:59:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 41F8D1BF2B0
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 15:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C324606C2
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 15:59:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OdNSCExVjwkg for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 15:59:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 25143606A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25143606A5
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 25143606A5
 for <buildroot@buildroot.org>; Thu,  9 May 2024 15:59:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1AFE31BF207;
 Thu,  9 May 2024 15:59:30 +0000 (UTC)
Date: Thu, 9 May 2024 17:59:29 +0200
To: Peter Seiderer via buildroot <buildroot@buildroot.org>
Message-ID: <20240509175929.6f0916e3@windsurf>
In-Reply-To: <20240422073327.11948-1-ps.report@gmx.net>
References: <20240422073327.11948-1-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715270370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QMixcgq7vvFbqtZNFlTv+c4qanyuEOiJ/i65jZWJ2a8=;
 b=SFylgazMndJNuSDcTxgMGWEUnmfVtMbqxT9K6B79qbqL4x9lmCNHjwG97gWSYrfPPlMVVK
 r/W2svN5Xk0UmwFH78HJHH1okmXUdh1buIxtxE4jfNgJ08ZXnCmB8ul/eg5Pra+kBkmzGX
 vQTdsmhYf4oseYOjoCSgfMXvysk4PRuULmme/zr7SHZ4k6OdqZxHOa1Emb28c3/NsPdrfW
 WGU5jCPbEMVZ2g9EI8bBrc5oEm7ePcAZkb1wG7cW9C6UCsYS2qc5s3FIndDjSh8YKI4/gM
 cdf9Vh/LexIzCx5N9CIT1GYmCd9qvoJMbrpmjQXt+bJKsO5HL0XD4y7rQ1UQbQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SFylgazM
Subject: Re: [Buildroot] [PATCH v1] package/dotconf: bump version to 1.4.1
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
Cc: buildroot@busybox.net, Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 22 Apr 2024 09:33:27 +0200
Peter Seiderer via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/dotconf/dotconf.hash | 2 +-
>  package/dotconf/dotconf.mk   | 2 +-
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
