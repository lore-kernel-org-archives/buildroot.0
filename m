Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24537C52D7D
	for <buildroot@archiver.kernel.org>; Sat, 17 Aug 2024 10:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB8C340037;
	Sat, 17 Aug 2024 10:01:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0gZl2f-TyLHC; Sat, 17 Aug 2024 10:01:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79B2040731
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79B2040731;
	Sat, 17 Aug 2024 10:01:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ED4801BF3FB
 for <buildroot@lists.busybox.net>; Sat, 17 Aug 2024 10:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D930B81AEA
 for <buildroot@lists.busybox.net>; Sat, 17 Aug 2024 10:01:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r4KulQZR0b00 for <buildroot@lists.busybox.net>;
 Sat, 17 Aug 2024 10:01:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8867D819D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8867D819D2
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8867D819D2
 for <buildroot@buildroot.org>; Sat, 17 Aug 2024 10:01:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8D42FFF803;
 Sat, 17 Aug 2024 10:01:26 +0000 (UTC)
Date: Sat, 17 Aug 2024 12:01:25 +0200
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Message-ID: <20240817120125.52ea7ba0@windsurf>
In-Reply-To: <20240816153825.43499-1-buildroot@bubu1.eu>
References: <20240816153825.43499-1-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723888886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4D/Q664AAvyN8IF/9rD8Wyvhwy7VRKjIGM2YnUaAmLA=;
 b=ejY0z2mwOEtFmPm+cwkgvPts3hIoJ94yNWJHEY6s1EE6heGQbqwESB4oxG+XxKv+eUSsR0
 zQ0utMKPASuKYzmcezEP2/kOtjMzOziCmZlS1Y2QxdTllmRnj4rl1lcKByMQewj6jWXWMV
 itgOtkZrt8zfWLblBkgGy0qXBrcZYehvGPvwtV9KA7/x2mDK50L89g1wyyuUWa21gCqwcc
 y4Ljn0kCKBV44pRGB49stYURiyPYhL6unJOf9gMONTxIyEOVDeP5vbBVK2HTEF4N26MUzP
 qpFUCZXkjeJx00wtDeY4C/gwZDVLvCiQJjy7sN9rjFgYtJWa67amc8+ztmAMwQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ejY0z2mw
Subject: Re: [Buildroot] [PATCH 1/2] package/python-starlette: bump to 0.38.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 16 Aug 2024 17:38:23 +0200
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> Changelog:
> * https://github.com/encode/starlette/releases/tag/0.38.0
> * https://github.com/encode/starlette/releases/tag/0.38.1
> * https://github.com/encode/starlette/releases/tag/0.38.2
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  package/python-starlette/python-starlette.hash | 4 ++--
>  package/python-starlette/python-starlette.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Both applied to next. Please note that your second patch title was not
correct: you wrote package/fastapi instead of package/python-fastapi. I
notice this because I have some local tooling that extract some info
from the commit title, and therefore I notice when it's wrong :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
