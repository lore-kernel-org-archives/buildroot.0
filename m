Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 668F5E77188
	for <buildroot@archiver.kernel.org>; Mon, 30 Dec 2024 21:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24CBD80528;
	Mon, 30 Dec 2024 21:44:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DSm9zw3K24wi; Mon, 30 Dec 2024 21:44:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 492FC80844
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 492FC80844;
	Mon, 30 Dec 2024 21:44:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 960A6E0F
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 21:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8334B40577
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 21:44:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vzb3DQ7UcZ1U for <buildroot@buildroot.org>;
 Mon, 30 Dec 2024 21:44:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 66BF64057D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66BF64057D
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 66BF64057D
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 21:44:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AEABF240003;
 Mon, 30 Dec 2024 21:44:08 +0000 (UTC)
Date: Mon, 30 Dec 2024 22:44:08 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <20241230224408.62d21096@windsurf>
In-Reply-To: <20241230200000.199571-1-ju.o@free.fr>
References: <20241230200000.199571-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735595048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EXsoXHO31kikTtoMbZUZGnS9Zb3KDmCY/jjfqt9tUgM=;
 b=Mz7WiyUWFlYdPJnuG1gdJFOPQTPwgK9lmiDK6nSXa6eYoVm0f/6drBN8cHJ4+W//ROmUZb
 Mnh1TA+elMEpetVEEMAQoea6MZ20StMiGwTAzT5MMKW86AHa5CyB+bSSgrUrdDIftC6+ey
 RP9C1aPPWe9jaR3fBiNluWy9bl6kMVylslZhgTp4IyROHw30RpcFvPPhrzSU04CbN9JTae
 hynsoMHIgckOfN4x9kZY1r//9IW5MFrScm7Vf4WMBuDp7CzAfIm/7cQYRqdeEznCmCNCjZ
 jBNlSP/0HSCeFZb+xZ8ANJnOK7Twh9l5Tg9idveCTm7uxzsg7y3mWnkZaTfn2A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Mz7WiyUW
Subject: Re: [Buildroot] [PATCH 1/1] package/xxhash: bump version to 0.8.3
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

On Mon, 30 Dec 2024 21:00:00 +0100
Julien Olivain <ju.o@free.fr> wrote:

> For the relase note, see:
> https://github.com/Cyan4973/xxHash/releases/tag/v0.8.3
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/xxhash/xxhash.hash | 2 +-
>  package/xxhash/xxhash.mk   | 2 +-
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
