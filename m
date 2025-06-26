Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A05C7EE31
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 19:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FCB040B8F;
	Thu, 26 Jun 2025 19:52:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2uqGo0-ZMH5W; Thu, 26 Jun 2025 19:52:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A18FE40446
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A18FE40446;
	Thu, 26 Jun 2025 19:52:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F423E154
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E59E540446
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s-4AzNKdrQ9m for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 19:52:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EC8AD403DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC8AD403DF
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EC8AD403DF
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:52:51 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a4f379662cso1234920f8f.0
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 12:52:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750967570; x=1751572370;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bP6NE0J5zb61Kn8Nndqr6wC1HangUBNIdNFTv3qXy2k=;
 b=bkgekm9Jgi9rqbMEqC7UM1c3fiXybWTSMkeY1EI5BnQ4i53YFVOQEig+uxdKWCinIR
 g2ERi4jmg+nhrt4obeQD8MiXyyX9lJdo8+2297syTkpFYYxl6Rd7v90OKSm1c/rD7g9d
 6F4chzPDtBmpKdDfOuzpAlGAokd7c3C81FuzuR9I5JynJ0X3CrxNLCw44/qboTGpwchW
 PiUAMyQlXd7nl3g2P/MmOjIPpRr1N/liEQT+F31nWADqcBctWgI19D7amu8ZMMz9wajD
 vT0NQ2V375diGLftQVvudFe7DWAMjFnyUUxPfSUuy71jApxRQEFUGhue6SqgFngWJd1j
 NaxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTnuJWUEJBqimgaCyoqACnikj0WRes3oXclNSwLBqhKQITRogrXBFGOeMY1QX9ZaWxmkJ5ofCzE0s=@buildroot.org
X-Gm-Message-State: AOJu0Yy+NZjBAxDjeiOA1HpxHAtse/6nnV8RgZ8XehOH215GlyTjms7S
 /94XakkAIqrTXhtkGVYrdLS5AVt4Kou3Z5QirhWJAMJoCrjTGTSd2QhPdY10a7qe5RP3/PvWIEv
 AE/1j
X-Gm-Gg: ASbGncvgR8Xy/XqAqcCaHujk+bbAg+Nn7eMys3ntxICedDrzduwP1MNGd371QFgXXOw
 3X/an3jMCDwppEIfNrvbVNBDJS5fT+ZpGoF612py4bV5bC/HUUKTU6r6cIGJ9DoIXmkL4BOUqyu
 6VmDgpc6ZJeOo8+c6llj/CUGuXVzGIcYIz8qintKSvqExVgskMekuTX6vNW8yFtqpgOTesRFo69
 uo/Fzr2VdjR5th++utfML7OLIHt8e//oQaNeH/nn0WOrwetTg4fn80eq1sRJugqOhHROvOiocoi
 gImTOF/TzSus7J9R1taxRPMy5GfXZ25AHPlBlTrAuV9Fbnuc94DU9VZIrzslwn2PYG/QvAHvMIx
 6PhHpR3vk7hA73SeTrig93KEV6Xs5UzBb
X-Google-Smtp-Source: AGHT+IF5RnLQkD9UoNOrUSEWLxRu0uxNjNmb4MZXQcksJi1SALVWxh6K+vv2TI11d2NV1xxIW4rq3w==
X-Received: by 2002:adf:9c83:0:b0:3a5:5103:6ff2 with SMTP id
 ffacd0b85a97d-3a8fdeff47fmr606579f8f.28.1750967569783; 
 Thu, 26 Jun 2025 12:52:49 -0700 (PDT)
Received: from localhost.localdomain (94.105.118.175.dyn.edpnet.net.
 [94.105.118.175]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c7facb3sm735587f8f.30.2025.06.26.12.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 12:52:49 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 26 Jun 2025 21:52:40 +0200
Message-ID: <20250626195240.14810-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612131200.393469-1-fiona.klute@gmx.de>
References: <20250612131200.393469-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750967570; x=1751572370; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bP6NE0J5zb61Kn8Nndqr6wC1HangUBNIdNFTv3qXy2k=;
 b=P7tVmp8iamdqVwr94hUShoDrXF6LgLB4vo8vNP43z7hljUj+nx+bOea2M1Uxun0mK4
 KaOye7Nlwdy/tBSuReseHiQuY+EgUbxUsQxwOcgSEPOJcNymCxy9+2gZEORgGm3SvEFz
 GOfnoZbqndCJt0QNRH0J0aaenA3TFc2LpLwvCDAYPy0HYnuv/jLYZlskuBcrGrVKd8xp
 FpQJxQgdG9okZM/IYCr9DOqlOJmTVrVqA8lkHusvOOtY2JB9zZGsIVjHSze8NlIQaorY
 6hUcVVGURVHQDvKt5A9KR2o+GS+cH3pMLti7fuR54PoYOrvnAVyzEVK5DZp1owgQBifX
 VdCA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=P7tVmp8i
Subject: Re: [Buildroot] [PATCH 1/1] package/libndp: fix build with GCC 14
 and musl
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Patch has been pending upstream for a while [1], Alpine has merged an
> older version that includes some whitespace damage but is functionally
> equivalent.
> 
> [1] https://github.com/jpirko/libndp/pull/29
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Applied to 2025.05.x. Thanks

> ---
>  ...le-pointer-types-with-gcc14-and-musl.patch | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 package/libndp/0001-fix-incompatible-pointer-types-with-gcc14-and-musl.patch
> 
> diff --git a/package/libndp/0001-fix-incompatible-pointer-types-with-gcc14-and-musl.patch b/package/libndp/0001-fix-incompatible-pointer-types-with-gcc14-and-musl.patch
> new file mode 100644
> index 0000000000..6cf97e8afa
> --- /dev/null
> +++ b/package/libndp/0001-fix-incompatible-pointer-types-with-gcc14-and-musl.patch
> @@ -0,0 +1,43 @@
> +From e821ddbfdff5e1b14846421d9196978ffebac346 Mon Sep 17 00:00:00 2001
> +From: oreo639 <oreo6391@gmail.com>
> +Date: Sat, 15 Mar 2025 18:38:50 -0700
> +Subject: [PATCH] libndp: fix incompatible pointer types with gcc14 and musl
> +
> +When compiling with gcc14 and musl, the following error is produced:
> +libndp.c: In function 'mysendto6':
> +libndp.c:212:50: error: passing argument 5 of 'sendto' from incompatible pointer type [-Wincompatible-pointer-types]
> +  212 |         ret = sendto(sockfd, buf, buflen, flags, &sin6, sizeof(sin6));
> +      |                                                  ^~~~~
> +      |                                                  |
> +      |                                                  struct sockaddr_in6 *
> +In file included from libndp.c:27:
> +/usr/include/sys/socket.h:343:49: note: expected 'const struct sockaddr *' but argument is of type 'struct sockaddr_in6 *'
> +  343 | ssize_t sendto (int, const void *, size_t, int, const struct sockaddr *, socklen_t);
> +      |                                                 ^~~~~~~~~~~~~~~~~~~~~~~
> +
> +In POSIX, sendto() takes a sockaddr pointer:
> +https://pubs.opengroup.org/onlinepubs/009604499/functions/sendto.html
> +
> +While glibc uses the gcc __transparent_union__ extension to mark them as
> +compatible types, musl does not, as such we need to explicitly cast the pointer
> +to tell the compiler that it is fine.
> +
> +Upstream: https://github.com/jpirko/libndp/pull/29
> +Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> +---
> + libndp/libndp.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/libndp/libndp.c b/libndp/libndp.c
> +index fa20a31..315333a 100644
> +--- a/libndp/libndp.c
> ++++ b/libndp/libndp.c
> +@@ -209,7 +209,7 @@ static int mysendto6(int sockfd, void *buf, size_t buflen, int flags,
> + 	memcpy(&sin6.sin6_addr, addr, sizeof(sin6.sin6_addr));
> + 	sin6.sin6_scope_id = ifindex;
> + resend:
> +-	ret = sendto(sockfd, buf, buflen, flags, &sin6, sizeof(sin6));
> ++	ret = sendto(sockfd, buf, buflen, flags, (struct sockaddr*)&sin6, sizeof(sin6));
> + 	if (ret == -1) {
> + 		switch(errno) {
> + 		case EINTR:
> -- 
> 2.49.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
