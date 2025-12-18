Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 183F8D6E2B0
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 16:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3F70410F5;
	Thu, 18 Dec 2025 16:37:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5NAuajS9_kUZ; Thu, 18 Dec 2025 16:37:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1218B410F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766075873;
	bh=rJNdDHfi04xFcAT/EO5mDyNwCmrgEwHRm+ZM4INRs+Y=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QS8kmf5PrdL1/5yti40bvQqNbSqOwqcmBNnwiC5GPoW50F7jxQM2SYDr9JMetjhac
	 kbJuM+88klC2H8k3HH9T2gZ9RzDyt6Qhg+JxIpPhT+YgzloBRDJ9RhBJ81AL/xZM7K
	 zQTSFY0Grqomxr+pXrXvB4pFFBY8PiupbWmC5CuUHS5aOh4K1I0GM7kEzjR9WGjJme
	 tTvYRneK0k5pDrQwh/iO5gOi5YHLCLo8A6ik/3xg9rgOLROULvYnD7dZI2cAdBiSR8
	 7pnXmHFAkGwdinNp/BhYONEw1o38zdVgymk4oCryqAY8t1qtRg6CDYJLEOtiVIsKDn
	 76Km6blvdDe7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1218B410F8;
	Thu, 18 Dec 2025 16:37:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B110E361
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9831983DC8
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:37:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yp6C-SrKI0Jf for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 16:37:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 97DA480BA4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97DA480BA4
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 97DA480BA4
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:37:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 45000B97A297; Thu, 18 Dec 2025 17:37:48 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu, 18 Dec 2025 17:37:46 +0100
Message-ID: <20251218163746.379713-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251208203114.3649526-1-bernd@kuhls.net>
References: <20251208203114.3649526-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1766075868; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=LgT2Jcd71Sj8/bKNM0dE9R9YooSsKHk5SjbdikuHgYc=;
 b=HauJ6Jd6W0GQHkJ8t25cSfGZWRIcjO2PTJkfPXHOyPcNGzhR00hmBdS0HjXFuNtqqdlj1l
 e3I91Z2yG3/lw38HyIrkZ+RKH8TXM2Yf31FOo0eUgLsH7MIVPNmrzQ3TfwswgPVhHw0gi6
 qbasTaoFADcAL57pGD2eoNf/m47SCUmjXGD26X5d63Fpcr6mXt4S2JJSfHsuJPCW/LsDh0
 Z9PbBOWrZh0nEzqZ8gZJLCYlTYXn1M5j4Y1eO38EfNgVnPSEpK9FU5O0ASQISyc/si/15G
 VZEVbE+F1MA4UxcBvA2DXDf286iNiI75lQoLd744I8Op3RxrdMdI8QMVZlF6Zg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=HauJ6Jd6
Subject: Re: [Buildroot] [PATCH 1/1] package/libpng: security bump version
 to 1.6.53
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
> Release notes:
> https://raw.githubusercontent.com/pnggroup/libpng/v1.6.53/ANNOUNCE
> https://raw.githubusercontent.com/pnggroup/libpng/v1.6.52/ANNOUNCE
> 
> Version 1.6.52 fixed CVE-2025-66293 (high severity).
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x. Thanks

> ---
>  package/libpng/libpng.hash | 6 +++---
>  package/libpng/libpng.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
> index fc4aeba85a..1e57e1dc33 100644
> --- a/package/libpng/libpng.hash
> +++ b/package/libpng/libpng.hash
> @@ -1,5 +1,5 @@
> -# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.51/
> -sha1  8fd6ff93769fac269ab9197c106d4e0808521b04  libpng-1.6.51.tar.xz
> +# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.53/
> +sha1  90672f16e545e4931abd50d372edef50596a1d46  libpng-1.6.53.tar.xz
>  # Locally computed:
> -sha256  a050a892d3b4a7bb010c3a95c7301e49656d72a64f1fc709a90b8aded192bed2  libpng-1.6.51.tar.xz
> +sha256  1d3fb8ccc2932d04aa3663e22ef5ef490244370f4e568d7850165068778d98d4  libpng-1.6.53.tar.xz
>  sha256  16d9daaafbf63a31a5bdc91d4600972548fef5aaa1244202393288dbd079c49a  LICENSE
> diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
> index e78115146b..7b66f17bbf 100644
> --- a/package/libpng/libpng.mk
> +++ b/package/libpng/libpng.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBPNG_VERSION = 1.6.51
> +LIBPNG_VERSION = 1.6.53
>  LIBPNG_SERIES = 16
>  LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
>  LIBPNG_SITE = https://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
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
