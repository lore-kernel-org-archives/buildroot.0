Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20567C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 16:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCF5540560;
	Thu,  9 May 2024 16:21:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QlhlfNpj5cu4; Thu,  9 May 2024 16:21:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5685409A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5685409A3;
	Thu,  9 May 2024 16:21:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A46051BF337
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C9D2409A3
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:21:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nzfjSxP_LpkR for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 16:21:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3BA3D40560
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BA3D40560
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3BA3D40560
 for <buildroot@buildroot.org>; Thu,  9 May 2024 16:21:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E5BAE1BF203;
 Thu,  9 May 2024 16:21:29 +0000 (UTC)
Date: Thu, 9 May 2024 18:21:28 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240509182128.06f196ae@windsurf>
In-Reply-To: <20240422193645.405490-1-ju.o@free.fr>
References: <20240422193645.405490-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715271690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Id260dzepuyqgljRO4zx/aEAG+wulUqI4G4VflA4v38=;
 b=VcnKff0Evs8SfHr5XLzRFYM4a0ua7k3Lr0Xppg+gP6V8qIiPME4Z70JgtSYXcyDkly8MMv
 ldepOQI27QMFwzlUEq8XZ9/KdVL9Bhc7JVdi3xaLurozua6ehVDTjZa4e8aS7NSxnwQlWQ
 k0U+jUJWt9CJj6YuitxSDonABtHxYAQQO3qbHXJaplJF1HPC4JBjRwKMzBMeSh2GjU6aYn
 hZsQbrLKmqrv6RQpFubfZNOlNbeFsUeMMuYpG4YCVikK2YVwVryiDeAR/XHBy3O8zoTsZz
 pfoM4ZqyW7iHOu9iE6xs+JHWQ6cSlMKcf4QaOf35EQr9AOnWfSRh4pQsUW7ziA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VcnKff0E
Subject: Re: [Buildroot] [PATCH 1/1] package/ncdu: bump to version 1.20
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
Cc: Bogdan Radulescu <bogdan@nimblex.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 22 Apr 2024 21:36:44 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For change log since 1.19, see:
> - https://dev.yorhel.nl/ncdu/changes
> 
> The license hash changed: the years were removed. See:
> https://code.blicky.net/yorhel/ncdu/commit/a9d608fab119bb98d57b0996f14498ec58bc79b9
> 
> This commit also adds the pgp signature check comment in the hash file.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested on branch master at commit 256aa8e with commands:

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
