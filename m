Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5762BC3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 16:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 033144026A;
	Mon, 22 Jul 2024 16:06:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7RXWpljTTovJ; Mon, 22 Jul 2024 16:06:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B78594026E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B78594026E;
	Mon, 22 Jul 2024 16:06:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 478BA1BF284
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 412574023C
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:06:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5pc4XqOnvf_p for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 16:06:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C762040109
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C762040109
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C762040109
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 16:06:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6B8C860005;
 Mon, 22 Jul 2024 16:06:35 +0000 (UTC)
Date: Mon, 22 Jul 2024 18:06:34 +0200
To: Marcus Hoffmann <buildroot@bubu1.eu>
Message-ID: <20240722180634.0bb07726@windsurf>
In-Reply-To: <99a9d884-8052-4128-8f4e-f68517d80a65@bubu1.eu>
References: <170715461915.13905.5968173515742280918-0@git.sr.ht>
 <170715461915.13905.5968173515742280918-1@git.sr.ht>
 <20240722145236.4e7ec0bf@windsurf>
 <99a9d884-8052-4128-8f4e-f68517d80a65@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721664395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RCv+1RoveNSFR9/sBkKC/+RHdTP4YHzJTP+e3M6yCZQ=;
 b=OxOww6M8FGECGF4+ri2+7qEpwego5HkLgkzmUECkXpjW1+dD4ZcvAgjajIysDbGDagSCFH
 F90bXljuVB3zIx2HHXLtXAmW+dSgivDEOOon1jt8zr22661knZIJvoTJ5hHOUja94j9c8u
 dUdg7Ml67f/DStSzO1e3hySG66PZuqn30+qqSXI+5Myrw8QWaHoBOYwdsHWeg9okV6dUxB
 LVQEHToziYxk3TNkrAPcsG+dg+BkAFLiHF5+62LKZ+Kr540sxg9NagkRkWmZcV0gWUAoRh
 KLz7Am8cY0yhxnl7nb4lXmcGLRf1RfyoxpNO4KDOvy0M6RMCPzz4HmnDdQAugA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OxOww6M8
Subject: Re: [Buildroot] [PATCH buildroot v2 2/2] support/testing: add
 fastapi runtime test
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
Cc: James Hilliard <james.hilliard1@gmail.com>, ~bubu <bubu@git.sr.ht>,
 ~bubu <bubu@bubu1.eu>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 22 Jul 2024 16:48:08 +0200
Marcus Hoffmann <buildroot@bubu1.eu> wrote:

> People have hit that here through conda forge as well: 
> https://github.com/pydantic/pydantic/issues/8429
> 
> James, can you take a look maybe? (We still use pydantic-v1, so I don't 
> really have any idea about pydantic rust core build topics.

We have some updates to pydantic-core/pydantic pending:

https://patchwork.ozlabs.org/project/buildroot/patch/20240719043739.3241372-1-james.hilliard1@gmail.com/
https://patchwork.ozlabs.org/project/buildroot/patch/20240719042632.3227242-1-james.hilliard1@gmail.com/

(I was about to merge them)

Not sure if they are related / solve the issue?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
