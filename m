Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF560C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 20:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AB5A41D94;
	Mon,  6 Nov 2023 20:49:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AB5A41D94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qmXEHxvjfqoH; Mon,  6 Nov 2023 20:49:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C38D941FAA;
	Mon,  6 Nov 2023 20:49:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C38D941FAA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ADA0A1BF3A4
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 20:49:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F2006126F
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 20:49:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F2006126F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JGbinHnLoEYP for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 20:49:11 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 943FF6126A
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 20:49:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 943FF6126A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 45E09FF806;
 Mon,  6 Nov 2023 20:49:08 +0000 (UTC)
Date: Mon, 6 Nov 2023 21:49:07 +0100
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20231106214907.679b703d@windsurf>
In-Reply-To: <0f681e5b-2522-462e-9f09-f86694a2d3dc@mind.be>
References: <20231030002748.280144-1-dlemoal@kernel.org>
 <5761b87d-4843-4669-bc65-f6e1351e12b7@kernel.org>
 <20231106084314.2458b0c3@windsurf>
 <0f681e5b-2522-462e-9f09-f86694a2d3dc@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699303748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S+yluu0+B7WcI76Im1zazlLvuSlLaDwdahVxQMcD9aQ=;
 b=HZe9ka+vJpFRUqBRrfTf0h7Hl6wrA34cHD/Qui3u9g7wMdRvApyxUK4vwngLuf8v2JV5kS
 DdTCocy1mGcAbe6Bx2w7BaDIIxgVUlsMmJi0vfTvJ52Z/nUsH5dCP+utnGyyXrZa4tAv9L
 bwPOq48iZkbSoaEavz+wdsCrA0s3Qzm5EJjJoMxDKX8nyFN/Mbz2scfWnF1ydBifTm5uWF
 ht8JCQ9Wv+ZJk9ukooI5bTTj2uZ2KY6a6jC1MumlJWCqKrh7xF18lvC0dYJr7l6YUHYfkg
 dsiXmz5E/cUJ/kN76Ln+bLld+DLuuvgEmyytCWFMh5kVaRwDGFk05H+UeaNvGg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HZe9ka+v
Subject: Re: [Buildroot] [PATCH] package/gcc: Fix gcc finale library
 installation
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
Cc: Romain Naour <romain.naour@gmail.com>, Damien Le Moal <dlemoal@kernel.org>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 6 Nov 2023 21:18:04 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

>   Even so, we could apply this already as a first step that fixes many 
> configurations, and improve the fix later? Currently there are quite a lot of 
> configurations for which we simply can't build a toolchain...

Oh, yes, absolutely. This patch is better than doing nothing, that's
for sure.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
