Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28158C7EE30
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 19:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D035E61229;
	Thu, 26 Jun 2025 19:24:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dgEdQLEtS4Ar; Thu, 26 Jun 2025 19:24:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD2F36079A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD2F36079A;
	Thu, 26 Jun 2025 19:24:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FC7D154
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A73B808AA
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:24:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oXYBjiqcJOof for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 19:24:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7B40B81BD6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B40B81BD6
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7B40B81BD6
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:24:20 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a4f379662cso1214907f8f.0
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 12:24:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750965858; x=1751570658;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O+yPYqwTzBLM4ET4HOTnBcta3YVNMckDcxeMCWAwU78=;
 b=FgKO5O04xv/45LONwqKRmXjzIaaP5tuddghYRNfD7BvuEF4JAQe6XkoN1QYTH5eR7N
 lO8SbStfEpwzeF+HXypIpLc6N+mtLQSA+QMZIbB9DQvFmOwpJ+gyDe6RUi5Q5zbnDy9v
 M5Uhj+s7eaShTw002GqiY4otq1ldBn16vJf4mY7jg4FLhz0H9b/2C4klpoLHehNfFTLs
 +nDvp7MzqogCfqklivptlFxeN6kZC9+sHi0e0vxO8I36Ph6ym58AH7vm+xtbkelEHbdT
 NKKs5cc04Me0yCsU40z5f24Olz3r4Dr50rjm2RRzPisl4F6c/SONkDQ4KSXw1fHrTQaK
 mDWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6/hRayXf2E42UDCuCqEl+O/F+uYnQO5p6c7PaIq6fBzOsUSwsBvnO7MWBN2AmiqLMFi2/rzAxn6U=@buildroot.org
X-Gm-Message-State: AOJu0Yz9ZEVWBIrOWEwixvqXnriyfJmwQc5DPvlar5yjdsXF1VeBscgz
 Zy6oSXO2ZKiHG4uCGnDgPe9502MgHSIt1q6UV8fG6uABMjQkpfW3ng6I+Hj3OkGw6/PcOEed8mz
 P5cfI
X-Gm-Gg: ASbGncsz8ZX067pWZTJNVy+w8iHgEnxWF5gwuTL51nMEPXIUySgfTjRmk3V54mSt9XW
 si35cCgV/cnh5muXU1b+kwrT5K5qOBYmOKq7rz+b6JfHj3Af6j4vlyXo1t/StBRCtFf55LDFkSP
 oMN9DdP1XIpAPkQziUPX4grS8QWZ6v6TIoMm7Wc11IeO9dNRmDNzpFdmfKL/xqwqWtqnL/mMPau
 J1L6RwYAT9z737ZCgztU7kSOeDWM09vBivZVO2bQo7rS9zAmVF9brTGBIABrhg60MQ9bMdpSnyC
 mha0q1/FtXHrGMtPqJlc9eD2cAGSFZCNw3/O3z5JYSifGE/Lb72A/1IwQVTHcHkslDuZQsu7mO7
 l6UiWNwUaFezeXp2J7AqyZT+AKF7QswcY
X-Google-Smtp-Source: AGHT+IF2cL56i6azsgeIESAMXoKIUfqwvBhG0NSO3fTvG3s/xeZGtJcJuKc+sO+Z4sfF1lOj8UGopg==
X-Received: by 2002:a05:6000:2a86:b0:3a4:d5e8:e352 with SMTP id
 ffacd0b85a97d-3a8f435df7cmr502377f8f.7.1750965858167; 
 Thu, 26 Jun 2025 12:24:18 -0700 (PDT)
Received: from localhost.localdomain (94.105.118.175.dyn.edpnet.net.
 [94.105.118.175]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c7fa750sm681118f8f.25.2025.06.26.12.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 12:24:17 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 26 Jun 2025 21:24:07 +0200
Message-ID: <20250626192407.8519-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612131200.393469-1-fiona.klute@gmx.de>
References: <20250612131200.393469-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750965858; x=1751570658; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O+yPYqwTzBLM4ET4HOTnBcta3YVNMckDcxeMCWAwU78=;
 b=gDeK/AkQlVoG29oa6fWkAIw97n1deHfpC3hJkXI77TFQMKvONT4NySVwtYlr/zr84S
 yqLRt6VVyfK5PfrHr0ACe14lVf1dbXmVG/C4n4gvvIWj5gVodQ0F5xb2j9G+1ef6eZXs
 GGKWdlt3SSvjBd7Rnm6HcKAF8GQB3DuGqJoKHVnK58Fm/48mGymxZYwMhSNzQqmE2A5t
 vevqKzL9Uq8/3XTvYUc3w6eeBv1hcGJtqQvRLXGDVL+CM66FkI5OLX7qdIJjyX2KpxPB
 mnCeAusuZweM8nFyHu0PsNmff7v6kFvSwu79G8MuNo9aE10WsXisI9KbHJdvnxkMp/l3
 9ykw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gDeK/AkQ
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

Applied to 2025.02.x. Thanks

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
