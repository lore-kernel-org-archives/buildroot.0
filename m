Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87590C87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 524BF80F21;
	Thu,  7 Aug 2025 18:25:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w7fW4mqqsP2C; Thu,  7 Aug 2025 18:25:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 665CC80FAF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 665CC80FAF;
	Thu,  7 Aug 2025 18:25:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E9D310A
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24D0A80F1A
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:25:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xu9mZTyVqGFk for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:25:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EC7DD80E6A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC7DD80E6A
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC7DD80E6A
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:25:13 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-459eb4ae596so12171165e9.1
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:25:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591112; x=1755195912;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zcWCODIc4+8li9ImbR8GIikDpaYQ4b+ppm49vuhledw=;
 b=gY391yVeO5ERqUbR/iLmCahHPHT+2d0G/F3WQF8bdP9dlihrRStj3xrk1uTv6uNSbE
 snf6gE0ofKXqN0M7fIEzqqabl66H+8XH6Mjz+AO4sLUBo9UVLlinkGEE+thcR5/N7+qA
 6v4CjF3NjCRFAsu5Bwy7LdxtAD2GlB9EWRni/flbuRauQs+q/97wbpde2WMSYyKVsD75
 tldYkdAxeUMIVQDoXe0JYZPhaOlvBVd5iJKyF0yYwwQngwT7i1Kh8nVVm5FtCoDPIkGT
 k3IC3gIAAIno63ySS7I31c42mOJl54BbFdobufoGdxxR6Pmq6gGjyAMyuZ/mXpZZoAPK
 l0ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOg4BdjLKCrYjSy+OqulPvCf2SIHjkB8qGhfP3eWVeDF8Y7RM5y4cCSXXM0gU2ToMNd3QORFK5pdo=@buildroot.org
X-Gm-Message-State: AOJu0YzDD3dVbNzXIkjcIcm597uIyLqxDkYIS8FkJkblDQeiT2TXudsa
 JQHSXg9H6fjT0nZxN6MkgDM0WanvN/xBun2wUBZ7dduqJiPktjbeLH/htp74sjuwSLs=
X-Gm-Gg: ASbGnct81ytBZbI6Pj5yoMQVxpN1eJvEZ+vyCAR5scQqjTuaY3MjPURnMqmml1oVV3h
 Ig7JY67aoZ47yVc+OqWy1VKBp+rxKNnKyOk1T6CC8vaDP4Jo4F+rItoLGPtfaAulMItbuQqwD5M
 fQiZut9U6HikzkayUWa+K/5BooPyxUoq+DoupKQuknQ/PgoV7HID3fkUHz+oisKl/9Twq4WWJ18
 qQJsKquIm5KJTnHR6olK+Xb0L/iLVXK6sFOElTx+X/JdNaCxPcTlmXQgiADzFAJaKzeSofx62dN
 BmgCHr+beDkMGmcV+OyQetBChNXLFE51NskUg1TpsU9FJAGkNf05g+v8eHBNxMuVC1Nz6TpinfB
 iV+CaZ8I3SZC1OQ==
X-Google-Smtp-Source: AGHT+IEOVipCybvlCVEtqOnBWpZ1AQqtkcMteDCVRIhZbVieHR0SUTVtcsa9XEGyehcP5mtPgLtoWQ==
X-Received: by 2002:a05:600c:3b0a:b0:456:1a69:950b with SMTP id
 5b1f17b1804b1-459e7462de3mr64303585e9.22.1754591111964; 
 Thu, 07 Aug 2025 11:25:11 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e583ff76sm102021245e9.5.2025.08.07.11.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:25:11 -0700 (PDT)
To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:25:11 +0200
Message-ID: <20250807182511.726934-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250724120604.2992836-1-elmehdi.younes@smile.fr>
References: <20250724120604.2992836-1-elmehdi.younes@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591112; x=1755195912; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zcWCODIc4+8li9ImbR8GIikDpaYQ4b+ppm49vuhledw=;
 b=WCSp2W4R3OuFXbkgqdOHb2jyUwHbz+vIl/1eOcQTaINBECCg+QeOeiTLneKxY4+sQ6
 o4ncS/qMZHbPAHFmTnKUfRvtYDQwT/gaZpgv6nRmPaUwKAWqun6lLO7R0kWCkk2lEqDU
 mzrEGe6JZ3n+YTi57OXj6tFOYRCQ6WDPOvDadI2T3H5/U+4Gi20AmcqmZv08Dp8fpDwZ
 PS6AeE+ggM969v02o5L6MaCb/GKyI4lUY/nFzM0yf+/7vXIW6Gsg1EoFS72ojrdf6CTZ
 A6fnOlbNQgOjdb7jGYXoh8U7B2HvZsDkxEpDNfUl5eZiH+NOBNN+jVsW+HED+9hMOyzM
 4boQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WCSp2W4R
Subject: Re: [Buildroot] [PATCH 1/2] utils/update-rust: fix MIT hash
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
> The LICENSE-MIT file has changed.
> Commit 432aef05 fixed it for rust package but forgot
> the update-rust script.
> 
> Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>

Applied to 2025.05.x. Thanks

> ---
> Since we added rust 1.86.0 to the 2025.05.x release,
> I think this should be backported too.
> ---
>  utils/update-rust | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/utils/update-rust b/utils/update-rust
> index 0f40f2e2b6..7db3feff9c 100755
> --- a/utils/update-rust
> +++ b/utils/update-rust
> @@ -62,7 +62,7 @@ RUST_DIST_URL = "https://static.rust-lang.org/dist"
>  
>  LICENSES = {
>      "APACHE": "62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a",
> -    "MIT": "23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3",
> +    "MIT": "b71bd43a069ca0641a9ecfe585ca7b3c53b5cc1608f8b68321168698e28b5ea1",
>  }
>  
>  
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
