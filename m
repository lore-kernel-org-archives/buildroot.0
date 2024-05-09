Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A9DC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 16:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0ECEE41E66;
	Thu,  9 May 2024 16:32:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mQdmnKp4EQtI; Thu,  9 May 2024 16:32:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDFEF41E67
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDFEF41E67;
	Thu,  9 May 2024 16:32:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BA60A1BF337
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A547A41E5A
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:32:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PGoMF1qSOkBd for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 16:32:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F0DCA41E34
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0DCA41E34
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F0DCA41E34
 for <buildroot@buildroot.org>; Thu,  9 May 2024 16:32:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 21A921C0003;
 Thu,  9 May 2024 16:32:27 +0000 (UTC)
Date: Thu, 9 May 2024 18:32:26 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240509183226.64779ea1@windsurf>
In-Reply-To: <20240423191712.16218-1-ju.o@free.fr>
References: <20240423191712.16218-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715272347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aJALj7XpOxLBH6c3vFsTtnHNS0URCOEqzVnBdWN0/9E=;
 b=jjygs5AIGCozCpdu7CCXbomBFF02VyW+/MFEWUdypRjFm0Apv/EN12HHisQ73i3qoancZ8
 6O8u+JL/WR13ZR/h01ou5/S0m46mOMnOmwTP0TGCjMZrciU1c4XBOJbxhSHpMDe0FWqtQu
 DC4QoK1z8BnjyXi7dXdKejWbdLrsGArMXM9X1tH+hYM+cLVUOOzAs/wMvNWKHVYebfJ7Zm
 hfcd9gdI9JEzesLEHat/PTSSJ9yySu6uy0Xfwg9QjOugnm+ORlPlSZ1RZ7tga8ApndACW6
 QQPyraMbI77aXPtV68a4nAtdh2GgA+mJPQc6A3JJFA428Dpd6TN31rL7lCaZSw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jjygs5AI
Subject: Re: [Buildroot] [PATCH 1/1] package/imagemagick: bump to version
 7.1.1-31
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

On Tue, 23 Apr 2024 21:17:12 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For change log, see [1].
> 
> License hash file changed, due to the addition of an URL. See [2].
> 
> Fixes: [3]
> 
> Some 32 bit architectures were failing at runtime with the message:
> 
>     FATAL: time limit exceeded 'file.png' @ fatal/cache.c/GetImagePixelCache/1702
> 
> The fix is included in 7.1.1-23.
> 
> [1] https://github.com/ImageMagick/Website/blob/main/ChangeLog.md
> [2] https://github.com/ImageMagick/ImageMagick/commit/2c87d7da1b1db4573a37bd7933dfbf772ac3eecf
> [3] https://github.com/ImageMagick/ImageMagick/issues/6891
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/imagemagick/imagemagick.hash | 4 ++--
>  package/imagemagick/imagemagick.mk   | 2 +-
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
