Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C7ED43341
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:30:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 652D1411E9;
	Thu, 11 Dec 2025 19:30:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gyyp4KVeyArJ; Thu, 11 Dec 2025 19:30:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16F044116B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481456;
	bh=5F6iN7PGkJOPi8PPaE72faYygUjOsnKmD2OA63RNtpc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CTR6cK+2u3uebDYMPgmNdG6Ptq4Tlcem1xMuz+N/Adz5R+UkltsPcFb4azTHLucKa
	 qwN19BmoDWGXKPynqWgG4M14/+Qp6Jw6pVvKTKcjRgocc7TUwxr/s3sxL1sJdZXpNg
	 o8GW4s57/8z7Wr/OemRns7ENTYSKKr8AFRpOGq8Hr4fK7z2vfr+Eq+6G6f4D3K7lkf
	 yfIdzgPPFkaZ9og76VYMKRXD62B1an7flzDRTn6S7S9Y9RRGzefhv3cVwbKsR2LCjr
	 wlKygRW7jIzuujtJc2mm+pw29wTaq9Cbi7ZubOUsiubQk+4YTL+g4+eNbQtN3EVXqV
	 d34+Bid3FWOgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16F044116B;
	Thu, 11 Dec 2025 19:30:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A837DE7
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:30:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5F8A835A7
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:30:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qVAll5KPUriB for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:30:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8BAF6830A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BAF6830A8
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8BAF6830A8
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:30:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 77C71B97A082; Thu, 11 Dec 2025 20:30:51 +0100 (CET)
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu, 11 Dec 2025 20:30:47 +0100
Message-ID: <20251211193047.1099257-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251205171705.21591-1-raphael.pavlidis@gmail.com>
References: <20251205171705.21591-1-raphael.pavlidis@gmail.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1765481451; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=UM6UBV/aJUQSHi9kOALMz7AFK6Jv6hHq4+zHePJ6FIo=;
 b=Ce8S1zMkh08tTLFK1+kMsymfbqg6tOruNJJWPKx95Jeo5wGNF3Qgsuc9ihezt5kelMDY7E
 vp8ON3RteMA7RRboA+2YiibnRqUDelgn6ZP5nhycqqSyB9JUz0/Ie3WcwKAl4ukNWuuebr
 5+kxtrSrMGIYLLe9gYTTdM1jgomfb1GSrk9Yc3vLpcbKSapBKq31Yp9u2B6pOB3hvJozSj
 XmHKLQ5c0w7bGmic6lvWXCHfZYAebugPfQwdJ1kowGLHzx8rVZxfWXh3WlAd5uFjfmkM+v
 BHAX9MzxzcRkxY1veONTaBDGq6LdIoplgYiNcu0ISxpXzd27Dcc4YS8+HfRx8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=Ce8S1zMk
Subject: Re: [Buildroot] [PATCH v1 1/1] package/x11r7/xserver_xorg-server:
 security bump to version 21.1.20
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
> Changelog:
> https://lists.x.org/archives/xorg/2025-October/062147.html
> https://lists.x.org/archives/xorg/2025-October/062150.html
> Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>

Applied to 2025.02.x and 2025.08.x. Thanks

> ---
>  package/x11r7/xserver_xorg-server/xserver_xorg-server.hash | 6 +++---
>  package/x11r7/xserver_xorg-server/xserver_xorg-server.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
> index 7d373850d0..7509971ec6 100644
> --- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
> +++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
> @@ -1,5 +1,5 @@
> -# From https://lists.x.org/archives/xorg/2025-June/062065.html
> -sha256  c8591ceb70b177440062406542fe52ba60212f217f27f8f802dd20373ca9e74b  xorg-server-21.1.18.tar.gz
> -sha512  d0cd176e4c7273b6870999a3d008ed282fd5609acb2e0919c16447af3a5b2228d8592424388a8ace67acf216cdfae3a2d52f7a7ba81f6071467c61d57f32f314  xorg-server-21.1.16.tar.gz
> +# From https://lists.x.org/archives/xorg/2025-October/thread.html
> +sha256  a51aea1cbb29cb8122e39c1c8728469d4fd8db71a538565fbf017df11841bf04  xorg-server-21.1.20.tar.gz
> +sha512  dabe7e637df4b964a1ff04a15587157b9596851a722a753447c257253ad0422007078b74053e1a51bdfd2178e3140a52f94dff0f205242a8589b6fe02d27e8a8  xorg-server-21.1.20.tar.gz
>  # Locally calculated
>  sha256  4cc0447a22635c7b2f1a93fec4aa94f1970fadeb72a063de006b51cf4963a06f  COPYING
> diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> index 2ce02ade36..c9456c66b5 100644
> --- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> +++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -XSERVER_XORG_SERVER_VERSION = 21.1.18
> +XSERVER_XORG_SERVER_VERSION = 21.1.20
>  XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.gz
>  XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
>  XSERVER_XORG_SERVER_LICENSE = MIT
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
