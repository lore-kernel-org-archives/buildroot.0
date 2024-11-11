Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1FE8D3ABF7
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 21:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 508AC40360;
	Mon, 11 Nov 2024 21:29:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TXTp0W2Hx-A6; Mon, 11 Nov 2024 21:29:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5391440362
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5391440362;
	Mon, 11 Nov 2024 21:29:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7047BD8F
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 21:29:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E21F80B53
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 21:29:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O-EI3T2Zoq3u for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 21:29:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5502680FB1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5502680FB1
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5502680FB1
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 21:29:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5E49040002;
 Mon, 11 Nov 2024 21:29:27 +0000 (UTC)
Date: Mon, 11 Nov 2024 22:29:26 +0100
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org, Alexey Brodkin <alexey.brodkin@synopsys.com>
Message-ID: <20241111222926.079a1918@windsurf>
In-Reply-To: <20241108155434.1924823-1-fancp2007@gmail.com>
References: <20241108155434.1924823-1-fancp2007@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1731360567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UhCCvPs+aJUxkGLHLeAm14sQmGQbSpyhyd/y+FhaiaY=;
 b=oYf+sBc7OmIV/59Y63Q/K6l26b68t5sX8eEFWtuDL7qbgzpy1hDgvC0FsO/Weux0MBKjnT
 u//YvD8uyyOX7M4g9HCVRaxOh3e6IZREQKfuBRMaoqSX2FRaPW0IVeGue3PgG/MLbhZfdk
 S9uFUTzBmPOYHTkJm17+Jst3ZiA1DU3c+UFBEVxC9iaA6PJ0/TaYfbmH4iB56gPSMivM9v
 9eGegPZKbscNmjoh+wzduihcKHFVujGTwHmgnsL2vhDw4gQcxAsAcwWpQYhXasr+qi8jfx
 SIcIV4UfDF277ImpeL/oXmpIHusrZIA4QdfJK+nzwPIU/q0CyjZqMy4tNAH8HA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oYf+sBc7
Subject: Re: [Buildroot] [PATCH 1/2] configs/cubieboard2: bump Linux to
 6.11.6 and U-Boot to 2024.10
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

On Fri,  8 Nov 2024 23:54:31 +0800
Scott Fan <fancp2007@gmail.com> wrote:

> The boot.vfat image size is not enough now. The new zImage file
> is over 10M, so it is expanded to 16M.
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>
> ---
>  board/cubietech/cubieboard2/genimage.cfg | 2 +-
>  configs/cubieboard2_defconfig            | 8 ++++----
>  2 files changed, 5 insertions(+), 5 deletions(-)

Thanks for your patch. However, we now require defconfigs to use hashes
to verify downloaded tarballs. Could you please enable
BR2_DOWNLOAD_FORCE_CHECK_HASHES=y, and create the hashes using
utils/add-custom-hashes?

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
