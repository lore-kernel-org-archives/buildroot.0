Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E0AD3C923
	for <buildroot@archiver.kernel.org>; Sat, 19 Oct 2024 18:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 433E680AD0;
	Sat, 19 Oct 2024 18:12:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tsyiSqOHVHCS; Sat, 19 Oct 2024 18:12:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CE5880CCD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CE5880CCD;
	Sat, 19 Oct 2024 18:12:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A1903A23
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 18:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68456607C3
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 18:12:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qW9-SijEEaSF for <buildroot@buildroot.org>;
 Sat, 19 Oct 2024 18:12:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 03A54607CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03A54607CB
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 03A54607CB
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 18:12:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D79CF40003;
 Sat, 19 Oct 2024 18:12:24 +0000 (UTC)
Date: Sat, 19 Oct 2024 20:12:23 +0200
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20241019201223.446a5575@windsurf>
In-Reply-To: <20241014012857.136756-1-fancp2007@gmail.com>
References: <20241014012857.136756-1-fancp2007@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729361545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E3bv0Kg5XwoJoBZV/4IzqM2/mjyMDbc4sBrXURMH+WA=;
 b=KSxIdhVA4hQk0WuYTU2lmu+FTGbM2ezLzGg4dV1HCMJc0Zp94LZczf0ocyXoMn6WG/Q8FQ
 oQcAg7UCbWH/bPUTCbMKtGHoufV2cNl/Fpv47fQW3acL9ndgLh1p9DNFiiCPXdlORDMZVe
 jLf73Ey4tiXbj0hAW4jUMIoZdrIJ12PHAIjWc6XLiNohokP2KIJfG5i32W5ybeLIADW4yI
 vyJunqJDeBgxcwj2pEeiZl2i8HmSoSfQK45CMGzTxnbiVrESEq682lUiK27q49hex5dENS
 f6RKHQdv+YsUOiCMGlKMLg9N8GphAj+tX/OEbXzr8YvdsQPaQPrOL212aDcTMA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KSxIdhVA
Subject: Re: [Buildroot] [PATCH] package/pppd: bump version to 2.5.1
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

On Mon, 14 Oct 2024 09:28:55 +0800
Scott Fan <fancp2007@gmail.com> wrote:

> Signed-off-by: Scott Fan <fancp2007@gmail.com>
> ---
>  package/pppd/pppd.hash | 2 +-
>  package/pppd/pppd.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
