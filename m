Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D661CD0D14F
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:49:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD13B822D6;
	Wed,  7 Jan 2026 17:49:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WV0b50BLBVq4; Wed,  7 Jan 2026 17:49:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE95C80F4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808144;
	bh=gTl+OFweu//J3X1tWNN5tzRZjTK8rB2b00gY1q2laLY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FuIzwa2esoDBC/Engos91IAycZn3n3LxkGbMWMwrPkUZ8+GexPiDo/phlLd8Tb6gr
	 pVnrqDuCaT9ojpv5F291h3vmHlGClgOqecZm1Rn9oVwogM25RzQm2oHQYFyS7zhJDf
	 mDJhLK9rnlGFrQ/WnuaGFqzkFR5p78C5/wgsOP0vAWJouBVMc18Kyu1GQknppvNzkt
	 +cAvroPJMoxN4NoE32p0Ku9qYNYz07KudMUfJ3FkDauaFjb4aXJjUZhmPjIN4V+7Xo
	 A1Io0l0WV/1eObZOzAO3W9IGkahLO0KWh4YIeBsEsZdw0gWXCgoL+D0OWlbEf4IYdz
	 ldTPzJvF+xa7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE95C80F4B;
	Wed,  7 Jan 2026 17:49:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 58B8225B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B0B2607D9
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7NopdGEUU3f4 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:49:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 39E77607FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39E77607FC
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 39E77607FC
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7D5C4B97A596; Wed,  7 Jan 2026 18:48:59 +0100 (CET)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:48:57 +0100
Message-ID: <20260107174857.224712-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215225837.1257574-1-thomas.petazzoni@bootlin.com>
References: <20251215225837.1257574-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808139; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=LplceF2HNnTnzOMrR5bhMXdjfru3lFujTOHyOkM91CM=;
 b=LxO+gxlmMU1nirJe8g8J2JCzUwN3/hFUh5qDWlDpudz79E0vxguYEbLAizeQK9A9pc5VaP
 CFGLW1CELBVV3325K84Eq+JtkRZd58T9rhh70i6x31yCbebVmeGSDW919BTT3JWjjm5YRn
 gQZ/arhNlyStR18HVllZnT2WSJ4a+IT/LH26m5SC7+4L7p2PBKKjsIp6g/CoajVbdtmZ5D
 sd7mlSklX9Vqvh0PyZVX+P/92U8XJiL1N7ITk3Jmfuo3vmzRKSy5Zw/3OzGx+3dlFL2Z3v
 AqXd1ADEGAywjIkcSyzaMnnrBtuQ4dRwTVxd5+xOS5lXD2LXB3WZjNgEetHbLQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=LxO+gxlm
Subject: Re: [Buildroot] [PATCH 1/2] package/cage: properly propagate
 wlroots dependencies
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Commit 00fb3a57cbaedb8df43f75f0e891423c1ef7d8c6 added a wlroots ->
> libgbm dependency, but forgot to propagate it to package/cage.
> 
> Fixes:
> 
>   https://autobuild.buildroot.net/results/dc185c3d4886e9cfd9e6f46b50b864e5b2f28605/
> 
> Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/cage/Config.in | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/cage/Config.in b/package/cage/Config.in
> index 4f823c768c..95c68732ed 100644
> --- a/package/cage/Config.in
> +++ b/package/cage/Config.in
> @@ -1,6 +1,7 @@
> -comment "cage needs udev, EGL and OpenGL ES support"
> +comment "cage needs udev, EGL, OpenGL ES and GBM support"
>  	depends on !BR2_PACKAGE_HAS_LIBEGL || \
>  		!BR2_PACKAGE_HAS_LIBGLES || \
> +		!BR2_PACKAGE_HAS_LIBGBM || \
>  		!BR2_PACKAGE_HAS_UDEV
>  
>  comment "cage needs a toolchain w/ threads, dynamic library"
> @@ -13,6 +14,7 @@ config BR2_PACKAGE_CAGE
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # wlroots
>  	depends on BR2_PACKAGE_HAS_LIBEGL # wlroots
>  	depends on BR2_PACKAGE_HAS_LIBGLES # wlroots
> +	depends on BR2_PACKAGE_HAS_LIBGBM # wlroots
>  	depends on BR2_PACKAGE_HAS_UDEV # wlroots
>  	select BR2_PACKAGE_WLROOTS
>  	help
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
