Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A12AD0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:49:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 417BA82306;
	Wed,  7 Jan 2026 17:49:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EwpJaBth7Ujh; Wed,  7 Jan 2026 17:49:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8563822CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808152;
	bh=AMz+NsUJRWeH1sH5LaeYGelTbUL392MENwkYnQbi6nc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RSil0UcglzEpymQaX2IiqrDmeJg2BC1Aep6sfd43hDAf+882PtjVByc1VrZrgm7Ou
	 MdGmkVLHIHoLLf0xH88Iz3UdE6dpt+01hFWlznhdPXvZK2WNTZJf05vnMqT1oHiOqB
	 UTUoGt413jRXTX9pi0mokfyswmjHfyrExWcfVgo9C/K9aBK7aJP9G8/NUkd0bQdWXb
	 F0GKfWuean6bkS84B1FAsIjQTtD5Tlu6FfAsBhrDvfsWjTqUwEizmX09L422OQtEBr
	 o6ttshmI7xXjA2ZgfJEdasIe0IKQkzDs1RpUBe/1WyisWwxljZh9ii7Y1FlsHMxG2C
	 u5F7pLBw5akfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8563822CE;
	Wed,  7 Jan 2026 17:49:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1700E25B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1683607FC
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TIboxS16ngER for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:49:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C5548607D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5548607D9
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C5548607D9
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 02170B97A70F; Wed,  7 Jan 2026 18:49:06 +0100 (CET)
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:49:05 +0100
Message-ID: <20260107174905.224903-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251216182845.2575378-2-buildroot@bubu1.eu>
References: <20251216182845.2575378-2-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808147; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=ubs60vUSg6oxEW++IgXMUet8qeOaOqAQDkSKnaK+nB8=;
 b=Yy8uo/4JfMFXdfo77GlU+ZF/3XygZfKd20F3EbeecwGzX7g5Tkmnttexbz/hC7ZfkHjRfQ
 GNEY0JwkqmGqeBIUrjBxrd/Td3JNnHeGXA0drT6khTyR/47Da8GryIeoDn8TlVbmSzew5y
 8upqoiJ0SWyrF3W+XEM0nBv56JSQx0e17lUxV/Lz5484y3KNAf6NuQHIQjgg4pRM4hJzmT
 g9pEx2zEDaQkWZfVPMTJ4sZC4oMtUXRYVSpaBlDUUNJ7U7HkUPyVVMJ/e3WTLD2uUbLKo+
 NexAByvrRD98ZTnmKjLApzF4qMVpAblvM4Z12G3mcc1GLE2XyN/+Z+Tqu5hYTQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Yy8uo/4J
Subject: Re: [Buildroot] [PATCH 2/2] package/zic: bump to 2025c
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
> https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/TAGXKYLMAQRZRFTERQ33CEKOW7KRJVAK/
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/zic/zic.hash | 4 ++--
>  package/zic/zic.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/zic/zic.hash b/package/zic/zic.hash
> index b9daccb381..7fe7582f10 100644
> --- a/package/zic/zic.hash
> +++ b/package/zic/zic.hash
> @@ -1,4 +1,4 @@
> -# https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/6JVHNHLB6I2WAYTQ75L6KEPEQHFXAJK3/
> -sha512  19826b12968c10fc4db7e4b07ba782bfb8590eeebaec6f719d74b92a2e642ab817bd72bceff0015ce52a838edfdb00753b3cd87dd84b35abf2606e5bee445f76  tzcode2025b.tar.gz
> +# https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/TAGXKYLMAQRZRFTERQ33CEKOW7KRJVAK/
> +sha512  d14bc0680b9cb33d6526a2c0e483f2abafc2593cfe5fbfe7dcab940aafdc1baaec065dbaa1bb58b03586a8631ffdf43ebb22ff5a70503298b6ea2cf061d82c16  tzcode2025c.tar.gz
>  # Locally computed:
>  sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
> diff --git a/package/zic/zic.mk b/package/zic/zic.mk
> index 1abeb2d70e..06d8ebaf15 100644
> --- a/package/zic/zic.mk
> +++ b/package/zic/zic.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -ZIC_VERSION = 2025b
> +ZIC_VERSION = 2025c
>  ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
>  ZIC_SITE = https://www.iana.org/time-zones/repository/releases
>  ZIC_STRIP_COMPONENTS = 0
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
