Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47C5C3DA7F
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 20:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E43E81229;
	Mon,  5 Aug 2024 20:41:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lig4AzFVb_Di; Mon,  5 Aug 2024 20:41:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3711381228
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3711381228;
	Mon,  5 Aug 2024 20:41:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 854F41BF335
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 20:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6DDC94024A
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 20:41:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KS0YCoOYNqur for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 20:41:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 45DAB40245
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45DAB40245
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 45DAB40245
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 20:41:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 03E351C0003;
 Mon,  5 Aug 2024 20:41:19 +0000 (UTC)
Date: Mon, 5 Aug 2024 22:41:19 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240805224119.52cc1a85@windsurf>
In-Reply-To: <20240805190707.3410913-1-bernd@kuhls.net>
References: <20240805190707.3410913-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722890480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lVej5IJc2sceIZ9zR/SASg506Ig1yqEazHk7ENW/xok=;
 b=KT258+VNZp5YVpi5ZZlwU4xbNzTwNLLyqjUbpct5fUR8nFNdZ4ZdKO3HQoX7QQPeDJnjZQ
 RGuST0cyS+aNfu4Wp1WJrPe/6owkdpbYUZUOpluC178fgIE+A/a7PQdo3jrEGXxVfeXi1m
 9HhTMJ0NXnoE1u1im56V1ZFnvZPnDiM6EeJVSkNExcGz7RTNCGsqk4RyHESkX4flRBbPBH
 gfa41YQISDcP0wNmJeAe8Ah0Tj3vZbSQ5UnBKNLkhi3kPDPgbdVdho3oRpozY1GzLcIvEG
 ZxHBOx097eo6OArDVplJ6CiGJ02PDwfQUGGfpAVgYrnTXi2CYdqFlavNd5ZKqw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KT258+VN
Subject: Re: [Buildroot] [PATCH 1/3] package/libvpl: bump version to 2.12.0
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  5 Aug 2024 21:07:05 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libvpl/libvpl.hash | 2 +-
>  package/libvpl/libvpl.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Series applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
