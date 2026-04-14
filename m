Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7162F9D0D3
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 15:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DED642B01;
	Tue, 14 Apr 2026 15:44:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pVWcmaxIu-Pf; Tue, 14 Apr 2026 15:44:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D20842B04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776181450;
	bh=j0OLQvheY1wKTaq3u7nrbmy+tdt1wqlPxIuFW/kr5OE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MPs1jXveEtj5cdo5SmOtPFxMiNyj4GwqhMY3+wPoLGo3554rjBAa/JtT5eh4F5Ec9
	 jMjMAGCOoa+OmJd3em0qxernKNq9UshP9NQ16sHmEIAq25yT5h57apUKncy9hvy+bZ
	 7TKVrM8bT4mV/lW0/X0b05QGWE8j/J8zQlntYXGqPeQJJ3q7WbAhZ9VioM6EgE7meZ
	 eB8d21e3LatZrX9sLq90z7seiHT7x8yoyS0CpZJcegaPG5Dkqno/U4Y0R9NCBA+dfr
	 ZDRKxuhJj1jwlibXYjY+B0tQev7HzVDIYaBei9TB3kRl+u6TYvg0hutLetajzxxbMI
	 Z5mojQf9dZDXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D20842B04;
	Tue, 14 Apr 2026 15:44:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B16C283
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8159442B04
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:44:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D94KD0cU22ho for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 15:44:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6A1E142B00
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A1E142B00
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A1E142B00
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:44:08 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-488b3f8fa2bso59594625e9.1
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 08:44:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776181446; x=1776786246;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LRHo0vRpzFqfirPCePJ6oKwmW3Yj62lr0fc5YCwK9B4=;
 b=UiR43FBwx/zvMjksVNDm2TXAMDxZw8+FXsBj7oLZJSeDfWWg6vqCfRH7P21dpe3nuu
 KmmT01liCLiZgyaXFy1bwXW7bBSo7fAvL9MlNzTa5dS6lP1iILqKKfVYTjZwfCVOo7RM
 UxhFAZNpn3Fnwi9tReGxKAjry23jcWmLknIm65q31oQz8gD4zgW+emyHv2OoGrgDiTbL
 X1fV7SJ2i8TTujeWrz+FFURcfCsVD6griakcMgKrDCUulrA/16mLC1yR+sM/Jn4jDo8W
 Iwk/FVf+R0ukx4VE1M9W0ezihp/kcIgAI8Ukn8az0vc8S/XqwMhBTCCcZReqAst4DcGT
 H0WQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9uxm2njzMc4Xl1H7cUm3e2OVyAOIiOLpV0Ilbc9Mywwt8548dRTgh0MdJFFFf9oTkJHxaQACn0s0Q=@buildroot.org
X-Gm-Message-State: AOJu0YyVKvkn9wnF5UPaXAzeSWcM+XDd3mEJ/YtwEr1qtNFWgjBuNyL4
 oFTAQzJsf+t1gOCHyqeZtzM/3XPNssZ/fvequOXQPRRmz5I4iXqtfil8EpLwc572RILY5GSOaFZ
 +Fcnm
X-Gm-Gg: AeBDievo0JaSlDeCBCDiVovF49pPYOG28EKn1HK8QuyyhcVvCb+CAJxM3iQd/2acSTT
 u94hpWXfgZQQAQPWVWozKcqe3TczsbcOrVA66o7hNvC5gsmQjFYD1ZZEdPfJj5JVukHUQaQ5Mr3
 auPZ3r/VSaDPeOiZcZyQbP94DnThUOl1U+yoTVQsyBFx9XzuXwzSvHWL+MN428PZ4GuwxD6hPfx
 t8ISmdybcJnjRgxvIWQu/2rPVoDEjU3letM6NXSpEwETFVaOXRPU5PPv3gGD+5qykixuusqaG2Y
 Bm8lrPA53YJwOBVMHcXUxWJV2ZmqIAMmhZC8I4BE5iKQZ35dYhQ8oX/eKhdIfgURb31LZctN4Cb
 dkZnPY5DYww2FhTpVyjSFNA9KdPDiQCAFp0odb3zMzbgzUh6IY20U5dCR4Paoz1Q2RdyYNl0CHX
 1B6WKHI4sMulYYSS4X
X-Received: by 2002:a05:600c:c10c:b0:486:faa8:9e4 with SMTP id
 5b1f17b1804b1-488d68cb8demr152528875e9.12.1776181446255; 
 Tue, 14 Apr 2026 08:44:06 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488ede2519dsm61054095e9.8.2026.04.14.08.44.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2026 08:44:05 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Tue, 14 Apr 2026 17:44:05 +0200
Message-ID: <20260414154405.334134-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260315131107.3959487-2-bernd@kuhls.net>
References: <20260315131107.3959487-2-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776181446; x=1776786246; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LRHo0vRpzFqfirPCePJ6oKwmW3Yj62lr0fc5YCwK9B4=;
 b=XdeVOXcwU3crEKVrla9lj31DWuCnkyV2vlNA2sxjqnsxaRGHPPSvguMCYemHdVb5EN
 1Oh51G7axvBs5XCdVG8F58BgPw5X4/AreAi8rf7WohW57uOfqwK3Y9sgRtqzJ36jvGl2
 eZ09+7OnUWpBE7SMJg9eyw+7SwZqdEipXK7CStpOpsf8xfE7PacTlGKtLNBdjnWl8Z7i
 r+qgLy55rRk8oUQhLTRkmzEjGx02Sz9yacjI2FfEmTaAF24S9IusXYqaG9iW67/7bQY4
 dC4aYWk+bmt7hqhQMtVrLMJRjoLkamagD/dMymqGsP2ZjILl3K/5jDy8+TlLg9chyH8h
 IgNQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=XdeVOXcw
Subject: Re: [Buildroot] [PATCH 2/3] package/kodi: allow build with giflib
 6.x
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
> These patches fix build errors which would be introduced by the upcoming
> bump of giflib to 6.1.2.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.02.x. Thanks

> ---
>  ...rePacker-allow-build-with-giflib-6.x.patch | 71 +++++++++++++++++++
>  ...rePacker-allow-build-with-giflib-6.x.patch | 71 +++++++++++++++++++
>  2 files changed, 142 insertions(+)
>  create mode 100644 package/kodi-texturepacker/0001-TexturePacker-allow-build-with-giflib-6.x.patch
>  create mode 100644 package/kodi/0002-TexturePacker-allow-build-with-giflib-6.x.patch
> 
> diff --git a/package/kodi-texturepacker/0001-TexturePacker-allow-build-with-giflib-6.x.patch b/package/kodi-texturepacker/0001-TexturePacker-allow-build-with-giflib-6.x.patch
> new file mode 100644
> index 0000000000..5a23237375
> --- /dev/null
> +++ b/package/kodi-texturepacker/0001-TexturePacker-allow-build-with-giflib-6.x.patch
> @@ -0,0 +1,71 @@
> +From 29492cbd20d4c90a9c00a30ab525d4d0e81a968b Mon Sep 17 00:00:00 2001
> +From: Rudi Heitbaum <rudi@heitbaum.com>
> +Date: Sun, 15 Mar 2026 11:38:16 +0000
> +Subject: [PATCH] TexturePacker: allow build with giflib 6.x
> +
> +Current #if clauses are written with a maximum of giflib 5 written in,
> +update the to >= to allow for newer versiosn of the giflib api.
> +
> +Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
> +
> +Upstream: https://github.com/xbmc/xbmc/pull/28016
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + .../native/TexturePacker/src/decoder/GifHelper.cpp        | 8 ++++----
> + .../depends/native/TexturePacker/src/decoder/GifHelper.h  | 2 +-
> + 2 files changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp b/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp
> +index eb513134b3eb8..b216ecbcef7fa 100644
> +--- a/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp
> ++++ b/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp
> +@@ -52,7 +52,7 @@ GifHelper::~GifHelper()
> + bool GifHelper::Open(GifFileType*& gif, void *dataPtr, InputFunc readFunc)
> + {
> +   int err = 0;
> +-#if GIFLIB_MAJOR == 5
> ++#if GIFLIB_MAJOR >= 5
> +   gif = DGifOpen(dataPtr, readFunc, &err);
> + #else
> +   gif = DGifOpen(dataPtr, readFunc);
> +@@ -73,7 +73,7 @@ void GifHelper::Close(GifFileType* gif)
> + {
> +   int err = 0;
> +   int reason = 0;
> +-#if GIFLIB_MAJOR == 5 && GIFLIB_MINOR >= 1
> ++#if (GIFLIB_MAJOR == 5 && GIFLIB_MINOR >= 1) || GIFLIB_MAJOR >= 6
> +   err = DGifCloseFile(gif, &reason);
> + #else
> +   err = DGifCloseFile(gif);
> +@@ -181,7 +181,7 @@ bool GifHelper::Slurp(GifFileType* gif)
> +   if (DGifSlurp(gif) == GIF_ERROR)
> +   {
> +     int reason = 0;
> +-#if GIFLIB_MAJOR == 5
> ++#if GIFLIB_MAJOR >= 5
> +     reason = gif->Error;
> + #else
> +     reason = GifLastError();
> +@@ -246,7 +246,7 @@ bool GifHelper::GcbToFrame(GifFrame &frame, unsigned int imgIdx)
> + 
> +   if (m_gif->ImageCount > 0)
> +   {
> +-#if GIFLIB_MAJOR == 5
> ++#if GIFLIB_MAJOR >= 5
> +     GraphicsControlBlock gcb;
> +     if (DGifSavedExtensionToGCB(m_gif, imgIdx, &gcb))
> +     {
> +diff --git a/tools/depends/native/TexturePacker/src/decoder/GifHelper.h b/tools/depends/native/TexturePacker/src/decoder/GifHelper.h
> +index 6124b69e46296..ce5dca3394b41 100644
> +--- a/tools/depends/native/TexturePacker/src/decoder/GifHelper.h
> ++++ b/tools/depends/native/TexturePacker/src/decoder/GifHelper.h
> +@@ -128,7 +128,7 @@ class GifHelper
> +   bool PrepareTemplate(GifFrame &frame);
> +   void Release();
> + 
> +-#if GIFLIB_MAJOR != 5
> ++#if GIFLIB_MAJOR < 5
> +   /*
> +   taken from giflib 5.1.0
> +   */
> diff --git a/package/kodi/0002-TexturePacker-allow-build-with-giflib-6.x.patch b/package/kodi/0002-TexturePacker-allow-build-with-giflib-6.x.patch
> new file mode 100644
> index 0000000000..5a23237375
> --- /dev/null
> +++ b/package/kodi/0002-TexturePacker-allow-build-with-giflib-6.x.patch
> @@ -0,0 +1,71 @@
> +From 29492cbd20d4c90a9c00a30ab525d4d0e81a968b Mon Sep 17 00:00:00 2001
> +From: Rudi Heitbaum <rudi@heitbaum.com>
> +Date: Sun, 15 Mar 2026 11:38:16 +0000
> +Subject: [PATCH] TexturePacker: allow build with giflib 6.x
> +
> +Current #if clauses are written with a maximum of giflib 5 written in,
> +update the to >= to allow for newer versiosn of the giflib api.
> +
> +Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
> +
> +Upstream: https://github.com/xbmc/xbmc/pull/28016
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + .../native/TexturePacker/src/decoder/GifHelper.cpp        | 8 ++++----
> + .../depends/native/TexturePacker/src/decoder/GifHelper.h  | 2 +-
> + 2 files changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp b/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp
> +index eb513134b3eb8..b216ecbcef7fa 100644
> +--- a/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp
> ++++ b/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp
> +@@ -52,7 +52,7 @@ GifHelper::~GifHelper()
> + bool GifHelper::Open(GifFileType*& gif, void *dataPtr, InputFunc readFunc)
> + {
> +   int err = 0;
> +-#if GIFLIB_MAJOR == 5
> ++#if GIFLIB_MAJOR >= 5
> +   gif = DGifOpen(dataPtr, readFunc, &err);
> + #else
> +   gif = DGifOpen(dataPtr, readFunc);
> +@@ -73,7 +73,7 @@ void GifHelper::Close(GifFileType* gif)
> + {
> +   int err = 0;
> +   int reason = 0;
> +-#if GIFLIB_MAJOR == 5 && GIFLIB_MINOR >= 1
> ++#if (GIFLIB_MAJOR == 5 && GIFLIB_MINOR >= 1) || GIFLIB_MAJOR >= 6
> +   err = DGifCloseFile(gif, &reason);
> + #else
> +   err = DGifCloseFile(gif);
> +@@ -181,7 +181,7 @@ bool GifHelper::Slurp(GifFileType* gif)
> +   if (DGifSlurp(gif) == GIF_ERROR)
> +   {
> +     int reason = 0;
> +-#if GIFLIB_MAJOR == 5
> ++#if GIFLIB_MAJOR >= 5
> +     reason = gif->Error;
> + #else
> +     reason = GifLastError();
> +@@ -246,7 +246,7 @@ bool GifHelper::GcbToFrame(GifFrame &frame, unsigned int imgIdx)
> + 
> +   if (m_gif->ImageCount > 0)
> +   {
> +-#if GIFLIB_MAJOR == 5
> ++#if GIFLIB_MAJOR >= 5
> +     GraphicsControlBlock gcb;
> +     if (DGifSavedExtensionToGCB(m_gif, imgIdx, &gcb))
> +     {
> +diff --git a/tools/depends/native/TexturePacker/src/decoder/GifHelper.h b/tools/depends/native/TexturePacker/src/decoder/GifHelper.h
> +index 6124b69e46296..ce5dca3394b41 100644
> +--- a/tools/depends/native/TexturePacker/src/decoder/GifHelper.h
> ++++ b/tools/depends/native/TexturePacker/src/decoder/GifHelper.h
> +@@ -128,7 +128,7 @@ class GifHelper
> +   bool PrepareTemplate(GifFrame &frame);
> +   void Release();
> + 
> +-#if GIFLIB_MAJOR != 5
> ++#if GIFLIB_MAJOR < 5
> +   /*
> +   taken from giflib 5.1.0
> +   */
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
