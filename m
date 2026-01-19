Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 454BDCCF2DC
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 10:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EE5940D71;
	Mon, 19 Jan 2026 10:09:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EslFtm_Apd3s; Mon, 19 Jan 2026 10:09:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCFC840D0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768817371;
	bh=BJHPfwdsMUVrucfF4M+556XVfMRixNa6FBbZ7qOXHac=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=A3qasneE8TXtHk1ng9JFyE2S0b9q2/Jy1ZzrWVjS/Ahho72LBLhtj/OxKQsH8f8u2
	 Dbucr5MCl+O/0uQC5oh5EyZrqPWoiDv+HVFzIyjJ1usr2D2gHZZvK32sY82EPIzzv8
	 /gcNxHiC8kRVAwQlnzlXc99fldjM74Rcu8y2qnEWlxuGthpVPzeBN/O6LRAMB+/0iz
	 ofyPrO8t68UbBtS55b3bRQsMFtcWW/cVhVBGPQKdOtE3stfYPuxPCFa0cNkPoTFGH8
	 6nqmx1+XZxHOFuwMiPrHrb2RlX9ku1p8Er6nzOej9olFv0EjKH/52GnctNH1TUAIdL
	 CRc1+8pwlfQrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCFC840D0D;
	Mon, 19 Jan 2026 10:09:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 00F65160
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D83828065D
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wVp-uqx9no2Z for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 10:09:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C292280613
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C292280613
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C292280613
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EA251B97A961; Mon, 19 Jan 2026 11:09:22 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Mon, 19 Jan 2026 11:09:17 +0100
Message-ID: <20260119100917.12894-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260106192626.1712153-1-bernd@kuhls.net>
References: <20260106192626.1712153-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768817363; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=X4PSHh6HO7qE7RzDUZX9jGHBD5np8iYaaFFAGETpIis=;
 b=JWRst1txA1+L2FMKSxw+Z3PmbEVFxYNtAUGZscvC9sCRNI7v9GYFOPkOvI2uh3mx+6A1JD
 heNg6ZufqazEtGXSMDrr8ocsmNejqlQDbyszdCsgE3mP0VepdzrdLbhjkCu2IgndDKFK6m
 mSP+cCnYthUx08PMttsSNFKqjVbQn/0iq8k4MQ+71pgLQm0LOWDlCM2dZC5w8ZHY2DUKHy
 7yTAax99EmsYX/w3RcGMU+6e4q1pVoiHLky95C7ztb5+ew4C8t/dlXQyiFUT7YGbW8wKxs
 tFbuWsb6iVeGmSngxlKBGZI0mshXGOtFip8wup5oyetcc6z44zWnSkwsGkqlrw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=JWRst1tx
Subject: Re: [Buildroot] [PATCH 1/1] package/vlc: security bump to version
 3.0.23
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
> https://code.videolan.org/videolan/vlc/-/blob/3.0.23/NEWS
> "Security:
>  * Fix null deref in libass, undefined shift in theora and cc-708,
>    integer overflow in daala, Infinite loop in h264 parsing, buffer
>    overflow in png and multiple format-overflows"
> 
> https://code.videolan.org/videolan/vlc/-/tags/3.0.23
> "It also adds a small feature on audio codec information, and fixes extra
>  security issues compared to the numerous we fixed in 3.0.22."
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/vlc/vlc.hash | 8 ++++----
>  package/vlc/vlc.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/vlc/vlc.hash b/package/vlc/vlc.hash
> index 6733a870b1..9634ba3f1f 100644
> --- a/package/vlc/vlc.hash
> +++ b/package/vlc/vlc.hash
> @@ -1,7 +1,7 @@
> -# From https://get.videolan.org/vlc/3.0.22/vlc-3.0.22.tar.xz.sha256
> -sha256  e2cc1cf0ae0902a09da5a37c249a8a4e4b5ec4dc095443b8e1493c6a7cc138ea  vlc-3.0.22.tar.xz
> -# From https://get.videolan.org/vlc/3.0.22/vlc-3.0.22.tar.xz.sha1
> -sha1  f9871439cdb281e18a78828c389cf7bf66d47d69  vlc-3.0.22.tar.xz
> +# From https://get.videolan.org/vlc/3.0.23/vlc-3.0.23.tar.xz.sha256
> +sha256  e891cae6aa3ccda69bf94173d5105cbc55c7a7d9b1d21b9b21666e69eff3e7e0  vlc-3.0.23.tar.xz
> +# From https://get.videolan.org/vlc/3.0.23/vlc-3.0.23.tar.xz.sha1
> +sha1  7b8c00a9c5bb879a403d5328c99924eefe01739a  vlc-3.0.23.tar.xz
>  # Locally computed
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
> diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
> index 9091a7e7fa..07aeefd193 100644
> --- a/package/vlc/vlc.mk
> +++ b/package/vlc/vlc.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -VLC_VERSION = 3.0.22
> +VLC_VERSION = 3.0.23
>  VLC_SITE = https://get.videolan.org/vlc/$(VLC_VERSION)
>  VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
>  VLC_LICENSE = GPL-2.0+, LGPL-2.1+
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
