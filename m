Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29AFDD3B7E2
	for <buildroot@archiver.kernel.org>; Mon,  8 Dec 2025 16:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A38240AA4;
	Mon,  8 Dec 2025 16:20:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ScRTk5BLrVf; Mon,  8 Dec 2025 16:20:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64DA740A04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765210846;
	bh=z/djd+V2KLOOqfXrYMaU+rsgp7ume+Vn0hRzbDwaW4Q=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EKAMfXpxxcreUB6+9Xawv5Xk+GFycQ8XDIYhm9Q0Lr+HUSaFZXqRL7I5AIbWGIarv
	 clBZ2dLFl/6fWZBpeGfKr3QoMiwq3tK50+2NBbuhq41OIETHJ2CfGqmje9GZU4P/gh
	 xl6jIVQRKi8OdnbwZejTtEnG6E1+m1vTgPqNvy50RY1MZQo9b9hQJ0CVIuWz+Gr8LX
	 3bRaAXXOpv0J8I425Eea7PhGjUglsg4/Wug5ZbnimBWi4R0i6+0ohyFcHS5RQkPGRs
	 Ci8z4xM6gLV/CNEUpesOqPueBLQu54YyT5XsJKbrohELDtma9KsLjkvwLUr+88M/ww
	 G9eq+eUVCMJTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64DA740A04;
	Mon,  8 Dec 2025 16:20:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1841D151
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 16:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0AF1440A04
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 16:20:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jy3Z1OgTVT17 for <buildroot@buildroot.org>;
 Mon,  8 Dec 2025 16:20:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 09C4540A02
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09C4540A02
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 09C4540A02
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 16:20:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 16CC9C180C9;
 Mon,  8 Dec 2025 16:20:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BDDA260707;
 Mon,  8 Dec 2025 16:20:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E9DFC10B61EC4; Mon,  8 Dec 2025 17:20:39 +0100 (CET)
Date: Mon, 8 Dec 2025 17:20:39 +0100
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <20251208172039.7c07673b@windsurf>
In-Reply-To: <1d599696-da61-443c-87c1-3405c24808a7@gmail.com>
References: <20251205171837.22075-1-raphael.pavlidis@gmail.com>
 <20251207153233.166a575b@windsurf>
 <1d599696-da61-443c-87c1-3405c24808a7@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765210840; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=QVLyrHt6Ueu1QCP2/o33vSbcE4jg+CxKaChhlEjOS5Q=;
 b=kQGjiOwIjY21quCA5qqUYhoGo4DxGMKm/yBTKmTEM/3svNkOs2uLRXGhmZllx3XYaRVl70
 Hn8VOSr3Us6ODiZYl0K+d0745xyecILTHNMuLmAH3LkVRtWzOWVG3MfX96Zc3zdBAPuAhI
 P3TYpUCTrRCAMXVBkq2l6sqcz+2/6KjIe69gd/rCbAWf65WHUThYOWf1YHT9H9plG/rMXT
 Cun8HbaCR/43Nw1zCl/Grj3lgswq4kVdVP4XLIfBhNz4cKCvN0lNDkhO3Y3/XmZXyiwb5a
 zKOCykbTpNqRxIbLR6zFtg80kSteXskH5LDwsA0C0CkedBO0BaQ+H7RyZnM6gw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=kQGjiOwI
Subject: Re: [Buildroot] [PATCH v1 1/2] package/xwayland: add nettle and
 libmd as sha1 libraries
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

Hello Raphael,

Please keep the mailing list in Cc when replying.

On Sun, 7 Dec 2025 18:00:36 +0100
Raphael Pavlidis <raphael.pavlidis@gmail.com> wrote:

> > Could you clarify why libmd is becoming the default instead of libsha1 ?  
> 
> In the meson files, libmd is checked first, so I assumed it would be the 
> preferred choice. The detection order is as follows:
> https://gitlab.freedesktop.org/xorg/xserver/-/blob/master/meson.build?ref_type=heads#L415-419

Seems relevant. Could you include this explanation in the commit
message?

Thanks a lot!

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
