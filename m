Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7001C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 16:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6FDC83BA7;
	Wed,  7 Feb 2024 16:11:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vO1-B-_8bnJv; Wed,  7 Feb 2024 16:11:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BAB0E83BBB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAB0E83BBB;
	Wed,  7 Feb 2024 16:11:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 698521BF3DF
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 575FD6142C
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:11:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4YJcWxP_8TXg for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 16:11:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EC6F16142B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC6F16142B
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC6F16142B
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 16:11:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 018EB40004;
 Wed,  7 Feb 2024 16:11:49 +0000 (UTC)
Date: Wed, 7 Feb 2024 17:11:49 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20240207171149.2f609365@windsurf>
In-Reply-To: <20240107115958.173945-1-giulio.benetti@benettiengineering.com>
References: <20240105140611.6a19a037@windsurf>
 <20240107115958.173945-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707322310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D6tITZL4in5jN6vYcGaXdiz06ggiynAxOdhVIa4dJTM=;
 b=at5wBWz2agcIWkQA/z3bR5M7oo3+9t8iugvD9XR1vTFgfrua8noLkDT/3OMlVUlCoXsGuc
 guUKtpkbDYvjs7DaQKL3nkapluMVcIfFkPMqYXBoqHkfi8x4zIpYjdM2T65OBM0T1YZEvS
 kwFX4t/aa6RuX59sjcF7jhhuJPKzI2bMplpPikjgFWRbW8W+E047prru+iSqzC3YMbKUSu
 IwAYI1ohJxim7SaCi8dL3463aBI68gsBGVWe6JqSmaIWXuwPzCYS06A1Oi5NffbWp3i3f8
 cLqWkt538ln2sRN6C2LaiEKcbSsj05Jl/SjIRL+3Ii4S5HZ+bIxltYp+LgNFHQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=at5wBWz2
Subject: Re: [Buildroot] [PATCH v3] package/swugenerator: add missing
 runtime dependencies
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
Cc: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  7 Jan 2024 12:59:58 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> From: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
> 
> Package swugenerator can use openssl to encrypt files in .swu(cpio)
> resulting output archive and gzip or zlib to compress the same files but
> we're not sure build environment have or not openssl, gzip and zlib
> installed so add them as host dependencies like:
> * host-openssl
> * host-gzip
> * host-zlib
> 
> Signed-off-by: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
> ---
> V1->V2:
> * V1->V2:
> * add host-zstd and clarify in commit log these are runtime dependencies as
>   pointed by Thomas Petazzoni
> V2->V3:
> * improve commit log explaining why we need this patch as pointed by
>   Thomas Petazzoni
> ---
>  package/swugenerator/swugenerator.mk | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

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
