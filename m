Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E4BC3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 20:29:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4C3B80CAF;
	Mon, 19 Aug 2024 20:29:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c4C6DAVP30e8; Mon, 19 Aug 2024 20:29:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C244580E54
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C244580E54;
	Mon, 19 Aug 2024 20:29:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4DCB11BF3C9
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 20:29:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44F8040616
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 20:29:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PdnI_VjUuocp for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 20:29:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D7175400B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7175400B9
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D7175400B9
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 20:29:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 73301240003;
 Mon, 19 Aug 2024 20:29:04 +0000 (UTC)
Date: Mon, 19 Aug 2024 22:29:03 +0200
To: Woodrow Douglass via buildroot <buildroot@buildroot.org>
Message-ID: <20240819222903.54711ddb@windsurf>
In-Reply-To: <20240819122631.1684155-1-wdouglass@carnegierobotics.com>
References: <20240819122631.1684155-1-wdouglass@carnegierobotics.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724099344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CUxLyIN/3k15sKBRTLNUuL9G7pqmK4al8znl6FlVKhU=;
 b=Btnvf5zxGPUL0J4/85MJxIEq1GN7RElq/Yxv5yc3kk5Q5CTL1BT2OJrY2C4KYeptNTyE2E
 7QZtWG8INRG3VMF/SrmNOiwihwY22ammj2QpcY1jRYXalySYIrw1W55Gp0VNKgiRaKZKu/
 KyoxmLAF7grDN9roeD/Td5ADPVYOOg6lkRheY+8/uXhwMZCj2kQegBuC1Qg0wbt5hCyQT8
 tMEX2iTNk5vQZwXfFiXMeQDtXBwplQixAZm0GS8ete/ur+pYeJf8x06+uMgzXbS8h97LAM
 bWGYUBiAKzdH9ygmZy+vRy5Z0zeOTy896tjfmqOQdAwv2qg6B6Xc3BtYkH4vTw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Btnvf5zx
Subject: Re: [Buildroot] [PATCH 1/1] package/chicken: Update to 5.4.0
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
Cc: Woodrow Douglass <wdouglass@carnegierobotics.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Woodrow,

On Mon, 19 Aug 2024 08:26:31 -0400
Woodrow Douglass via buildroot <buildroot@buildroot.org> wrote:

> This release includes a fix for CVE-2022-45145

Then, could you update the commit title to:

	package/chicken: security bump to 5.4.0

> 
> Signed-off-by: Woodrow Douglass <wdouglass@carnegierobotics.com>
> ---
>  package/chicken/chicken.hash | 2 +-
>  package/chicken/chicken.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/chicken/chicken.hash b/package/chicken/chicken.hash
> index 5a553da792..b5df49814b 100644
> --- a/package/chicken/chicken.hash
> +++ b/package/chicken/chicken.hash
> @@ -1,4 +1,4 @@
>  # From https://code.call-cc.org/releases/5.3.0/chicken-5.3.0.tar.gz.sha256
> -sha256  c3ad99d8f9e17ed810912ef981ac3b0c2e2f46fb0ecc033b5c3b6dca1bdb0d76  chicken-5.3.0.tar.gz
> +sha256  3c5d4aa61c1167bf6d9bf9eaf891da7630ba9f5f3c15bf09515a7039bfcdec5f  chicken-5.3.0.tar.gz

Are you sure you tested the build? The tarball here is still named
chicken-5.4.0.tar.gz. Also pay attention to the comment in the .hash
file, which contains an URL with the version.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
