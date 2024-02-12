Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCAEAC4829E
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 21:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9750F40760;
	Mon, 12 Feb 2024 21:55:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WoH7qGCevP9R; Mon, 12 Feb 2024 21:55:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CB0A40523
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CB0A40523;
	Mon, 12 Feb 2024 21:55:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 90B281BF853
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 21:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DC3C80BEA
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 21:55:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SscpIuMjGG5A for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 21:55:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2B82180BBC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B82180BBC
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2B82180BBC
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 21:55:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2206320003;
 Mon, 12 Feb 2024 21:55:22 +0000 (UTC)
Date: Mon, 12 Feb 2024 22:55:21 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240212225521.70d80a7c@windsurf>
In-Reply-To: <20240211214935.1603160-1-ju.o@free.fr>
References: <20240211214935.1603160-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707774922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fKUbD3E2pXicFm9k6dDiJsb+XnUp3lo7NEq0RSoPNEw=;
 b=QYZXz2MvzL9FS2ruPbCDd/LRiLDSvINXUS9mFe5U1x1Qn35dGugsF7JnMhLpf37Iw/wQTC
 F4emQRiYKgznMxGAt6qFcfZHSlAjkCwtOCHZ3kn6Owwxa74hLv7bfcP/wfRkloFS2F1Iqh
 klhON4zCNJYEMoRI9YKG31Tg1SBnGJzRYGy1uDBtJQfpROiYncgsBgrnQy7vBHV1VgVqex
 tFd6j6g11rrZvciHm4vudSQ9Nx/0DqgLwzYSxBJNdsDy8SI8aEPI2anfIK3IEka051MDO+
 dFDDDF/DwuN71PQwbYHRAEMxIw7lfuaXnkw6GzofuVH1ObxL9Xr6KHH0KlCKJg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QYZXz2Mv
Subject: Re: [Buildroot] [PATCH 1/1] package/gnu-efi: bump to version 3.0.17
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 11 Feb 2024 22:49:35 +0100
Julien Olivain <ju.o@free.fr> wrote:

> For commit logs, see:
> https://sourceforge.net/p/gnu-efi/code/ci/3.0.17/log/
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/gnu-efi/gnu-efi.hash | 6 +++---
>  package/gnu-efi/gnu-efi.mk   | 2 +-
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
