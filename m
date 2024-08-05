Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDAF9C3DA7F
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 20:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 950E8811EA;
	Mon,  5 Aug 2024 20:41:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KZFNupxn6Sjc; Mon,  5 Aug 2024 20:41:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3651181200
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3651181200;
	Mon,  5 Aug 2024 20:41:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9F8B41BF335
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 20:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 997B66063E
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 20:41:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YQbh3C2MU1Sj for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 20:41:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 843EB607A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 843EB607A6
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 843EB607A6
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 20:41:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E73F0FF802;
 Mon,  5 Aug 2024 20:41:03 +0000 (UTC)
Date: Mon, 5 Aug 2024 22:41:03 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240805224103.6e23829d@windsurf>
In-Reply-To: <20240805171947.37834-1-bernd@kuhls.net>
References: <20240805171947.37834-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722890464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YCp4HO2b+6U+tgt9jZO0UYwwmw+kRXVAOScrTpzKgP0=;
 b=Vs67pcfg8uUEtH8TZcuyapFbvD6Xq5pzxYz9MycUYXnME+AD+rvJcrlvuymrVhzThUUxzW
 AqzU4PBi96LslQwi8KTl3VCV71LrmX2Goqf+RDlTFWJa16vD6HdrRFMLSFKSlsUkjp/wjS
 l5mll0mGK1YK/8xg+zScuFWigzoK3vM5Ib5lcp4jsDhtM5F8IzVV8QaB4OYgCsQi9jwB8/
 5HqqqF9E/grcrJhFCN03umwQRvYcnu8qXOc43cv7xln8V7Gzo0XDAPaKwcTyKb5uB5wFB3
 sKlYFml0z6vHeHI2qZC8l40iuF4zMS/f2+wEl6AYji5P7FCfpUFnk5sksk8X/w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Vs67pcfg
Subject: Re: [Buildroot] [PATCH 1/1] package/ffmpeg: bump version to 6.1.2
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  5 Aug 2024 19:19:47 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Rebased patch 0003.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/ffmpeg/0003-libavutil-Fix-mips-build.patch | 5 +++--
>  package/ffmpeg/ffmpeg.hash                         | 2 +-
>  package/ffmpeg/ffmpeg.mk                           | 2 +-
>  3 files changed, 5 insertions(+), 4 deletions(-)

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
