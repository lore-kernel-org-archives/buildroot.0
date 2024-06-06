Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9105BC25B75
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 12:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 566EF81F5C;
	Thu,  6 Jun 2024 12:11:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UO8c4Y3PvvEj; Thu,  6 Jun 2024 12:11:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62C1E81F60
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62C1E81F60;
	Thu,  6 Jun 2024 12:11:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E6881BF255
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 12:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B9D56087C
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 12:11:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JWXtttvlI16L for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 12:11:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org;
 envelope-from=jarkko@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6AC47605EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AC47605EA
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6AC47605EA
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 12:11:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5A01761D28;
 Thu,  6 Jun 2024 12:11:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E69F6C32786;
 Thu,  6 Jun 2024 12:11:41 +0000 (UTC)
Mime-Version: 1.0
Date: Thu, 06 Jun 2024 15:11:40 +0300
Message-Id: <D1SXAF25A410.2W6SH2FPX4S5W@kernel.org>
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailer: aerc 0.17.0
References: <20240606104813.1514-1-jarkko@kernel.org>
 <20240606104813.1514-4-jarkko@kernel.org> <ZmGXisKDjGBFJNFV@landeda>
In-Reply-To: <ZmGXisKDjGBFJNFV@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1717675903;
 bh=/Oi7HyG65GVW5PrZrrbqmZoGo9OToL6lVKJ0UBxzXYU=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=GyUKyjVJPfPNb0QDOPhOHau83M+wKzvzalk4JKGqd+3zitEeo16lHZAsOhtTifO4x
 aHgxxGmJtAUU5B2JKaHWsXRDu1MKMetPa6Bf5usIFXrImUQrpm4xO0CxVvGpZFG6QF
 g2yPlGFv6q/BGujHOC17lDYNs+KR8Pe+HvFeVJa50TOTv+AI6GQVPRvBX1PQElDric
 lRspa4R+2cEeUx0opkYG8cVFH0xrrXvR0YR/KH6urtbRb07DUZQOxVKasLq2cb9TeK
 wanynD8IeyJeIOUQiTSWsGDDfSCRZAu7P35zp76IYNr2jeAWtS6XBlMoWUpVDKkztq
 Sml7AecnvjJlw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GyUKyjVJ
Subject: Re: [Buildroot] [PATCH v2 3/3] package/systemd: add the missing
 superblock identifiers
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Erik Larsson <karl.erik.larsson@gmail.com>, buildroot@buildroot.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu Jun 6, 2024 at 2:03 PM EEST, Yann E. MORIN wrote:
> Jarkko, All,
>
> On 2024-06-06 13:48 +0300, Jarkko Sakkinen spake thusly:
> > The following superblock identifiers are missing:
> > 1. BCACHEFS_SUPER_MAGIC
> > 2. PID_FS_MAGIC
>
> Does that already happen with systemd 254?
>
>   - if yes, then this change should be sent before the version bump:
>     first, bug fixes, then new features;
>   - if not, then this patch should be included in the patch that does
>     the version bump, otherwise the version bump by itself is broken.

Compiling and testing, soon we will find out.

>
> Regards,
> Yann E. MORIN.

BR, Jarkko
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
