Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE00D12D49
	for <buildroot@archiver.kernel.org>; Sun, 10 Nov 2024 16:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97E8840580;
	Sun, 10 Nov 2024 16:48:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vOHntpJZvbvz; Sun, 10 Nov 2024 16:48:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C4B440579
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C4B440579;
	Sun, 10 Nov 2024 16:48:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 60C8FDAC
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 16:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F96D4031C
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 16:47:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rg0OSYoIyN_y for <buildroot@buildroot.org>;
 Sun, 10 Nov 2024 16:47:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 28705403D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28705403D2
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 28705403D2
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 16:47:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 912D9FF803;
 Sun, 10 Nov 2024 16:47:52 +0000 (UTC)
Date: Sun, 10 Nov 2024 17:47:28 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Louis Aussedat <aussedat.louis@gmail.com>, Asaf
 Kahlon <asafka7@gmail.com>
Message-ID: <20241110174728.292e9f76@windsurf>
In-Reply-To: <20241109192045.796501-1-james.hilliard1@gmail.com>
References: <20241109192045.796501-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1731257272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4S4hgzxUxrQpQW5/oOK0jgfb/YvVO9RiRNJpkiB8kT8=;
 b=HxTR/nzIMEWFKCtzkPl2DMidkgN4V+TxridDfpbj1jAQkUgN10oPuyGT9xPsbInln1c6fA
 aVMuxk1QpLpzHmIV1QR2LJdCam5U/J/EuFXYBiLQ5wzWvlDbQExqkKt/bhYuxL4zVATKEl
 YQ2SWmbNgAQ4uLMDnfWM64QIOBP75F/ojAHibxbBvTbhxJGWYQd+lCNHs1+2ear/JZYrBg
 51IcTcNUiecJUxryCt3HvSVuFL1DuXq1W6YAHhBtqXy3Ef46vAcUcYciQkpDeUiBwJpFVn
 xvOU1LTx85ZHpthrgZUU9qzs2yJbP9atFcc+254k4Al+4BaX5P+R0R+d7OZrRA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HxTR/nzI
Subject: Re: [Buildroot] [PATCH 1/1] package/python-tqdm: bump to version
 4.67.0
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

On Sat,  9 Nov 2024 12:20:45 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-tqdm/python-tqdm.hash | 4 ++--
>  package/python-tqdm/python-tqdm.mk   | 4 ++--
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
