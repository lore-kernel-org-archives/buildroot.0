Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE28FA3751
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 21:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEEC181193;
	Fri,  2 Jan 2026 21:48:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HqAl-GoppJgo; Fri,  2 Jan 2026 21:48:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 828FF81165
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767390522;
	bh=NyYLkSsRMzSeXP3D7sC9rC7dnS18yGxu3AwD+0lem8k=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TrN3CchP4/o1y5ObSsxoBFRB9jOd/Rz1wWa5TQmbnZk8xqohJCKdv/IwUh4nJ5glk
	 lNnZgXKe5CUUIh37zch8IHYXOuUI9RqOVUoJR9ox6LW9l5lNmQB1j3Xw/DoePu6knE
	 ASBBJTtn9ltw5172irvynkP5aFNfWRG/laF8go1jYnSinZeI/y6szxd3WkLPEghrJj
	 N9488GTYE/0q9IYhfVwuH973eyj5cAO9aMQNUwEkHKtobtipuMm1wtiFNwT9ZOvek5
	 ETCfdPaRL9+B8j74wdcmRWG2N8MxT41gH3nLTXXL3jQumiWf+3GSarPKUVlAKriY6G
	 tiYIHfiO7PjCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 828FF81165;
	Fri,  2 Jan 2026 21:48:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BE3E19D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 21:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C5294083E
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 21:48:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yV2XXovLYocX for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 21:48:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2E4FC4083B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E4FC4083B
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E4FC4083B
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 21:48:40 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id AD43C4E41F03;
 Fri,  2 Jan 2026 21:48:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 67985606C7;
 Fri,  2 Jan 2026 21:48:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 30366113B023D; Fri,  2 Jan 2026 22:48:36 +0100 (CET)
Date: Fri, 2 Jan 2026 22:48:35 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: Vincent Jardin <vjardin@free.fr>, buildroot@buildroot.org
Message-ID: <20260102224835.04e90dc9@windsurf>
In-Reply-To: <b829984809262d058d08ca5e7bceb227@free.fr>
References: <3dfed5b9a6cf85883a65e432ff53c3b5@free.fr>
 <20241122230120.96898-1-vjardin@free.fr>
 <20241122230120.96898-2-vjardin@free.fr>
 <b829984809262d058d08ca5e7bceb227@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767390516; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=eWB7GgnKuTww5lS1WfML8pd2ikwS2uyzn9vv29LlVyo=;
 b=HWgbdhQZqPb432uXGwH4eNcpj81igFgg1cmLHZuWpGTVFrZEW3DP4sY8Mi2ENVKmyIhn83
 h1rkpzJUTpsaTWYo0hdbTlCMjFdzdspdo7bCSYiwoZMjyHqk1nrXKjMo9FTMb++5Ff6UWG
 4qhbjyr8id73wpj8iguwgcYDHAFhUxh6i4C+GRvtZ6xU6t6oy2DW3ZH48x0I0tc8XoaRXj
 lKs8ct8iKXCUKmg7VAv2BD1t967w3LELJX88+cQx3m0oT2uVw+W/lXXIYnrmPPBFw5QuCd
 rvGz5RvPKLces/qXA4vo16atFjTbMF/ZPrN3LGBtUWEUBuQcG+oB3ozonpAlQg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=HWgbdhQZ
Subject: Re: [Buildroot] [PATCH v3 1/2] package/mstflint: add new package
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

Hello Vincent,

On Tue, 04 Feb 2025 14:46:37 +0100
Julien Olivain <ju.o@free.fr> wrote:

> Could you send an updated series with package sub-options
> and their corresponding description in help string, please?

I don't think we ever received an updated version of this patch series.
So I'm marking this v3 as "Changes Requested" in patchwork.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
