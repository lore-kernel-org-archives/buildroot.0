Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05273C3065C
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 13:53:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3812F820D6;
	Tue,  2 Jul 2024 13:53:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sh9-bACToDuB; Tue,  2 Jul 2024 13:53:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE9D881E43
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE9D881E43;
	Tue,  2 Jul 2024 13:53:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 36EFA1BF313
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 13:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 233D24077C
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 13:53:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TCRS9MEd1O5x for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 13:53:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 726F14072E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 726F14072E
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 726F14072E
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 13:53:15 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-42574064b16so26449075e9.2
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 06:53:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719928393; x=1720533193;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=njxbjTNB86QWyjBIj+OyypvxyNklJFXrhlvhonPC+5M=;
 b=Xc0R2OTrIWVEZ77k9zvj30ygKN+mSVJ7yh/Zz6YRufuWyoQQ/dOW4pqz5183npoXbt
 JevUNMINiq564Iq1ppTTq9TUFIA9QWFw1uW1T7ysUxEOfCAFH6TrkyHZqQATHIlXAsAc
 djCIE2cqrENgh5V0MA0afEPt2bqcp3zcsqtK5OrhEaZ6aXPIGcE28KWVyH6edtnPb7C4
 ZYAjuKYl3yX7ElRczvDCxnQHfpHu6DhulSj1yWy7KEwEACnbv3edr3bohfLTJzfqKiGj
 vPNOIYT0eCJjfpGJFErT1xT1h/s9q3HkrytuIvwOn8/APjX1vQUj28+YxZGOjQhOosTX
 tgnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGr+837V6s64CxC1pEoU2vw9SuuIuUQiiuOgt55sQzAf7KGdGOH1NTK0HYJE7RxDlFFJC48bwFvC0vPJ15cUuQoMtV8H8Vzg==
X-Gm-Message-State: AOJu0YxhN2YTpzO/B18Pwx+9ebH+rTCLI5bvPs/5ZHLP1P4+vQzKJqOx
 RUt2v7qm8u/QyX7q8aLRY3bSgrGn5kPPpr4oqcHmyhBNvDkYXwjBwerJBUswjg8=
X-Google-Smtp-Source: AGHT+IFlyQ9+0njtgAm52bOMwk37RVHK4syNrE1C5eHVZj+Q7splHh/VGS5tY0gabgD6QlFxtqNYVw==
X-Received: by 2002:a05:600c:19cb:b0:425:6424:6e47 with SMTP id
 5b1f17b1804b1-4257a02b896mr58281565e9.2.1719928393182; 
 Tue, 02 Jul 2024 06:53:13 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af55d0fsm197445845e9.19.2024.07.02.06.53.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 06:53:12 -0700 (PDT)
Message-ID: <e5a48dc6-e2a8-4f8e-93ba-d9c49dafd0b0@mind.be>
Date: Tue, 2 Jul 2024 09:56:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240702073926.2379089-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-GB
In-Reply-To: <20240702073926.2379089-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719928393; x=1720533193; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=njxbjTNB86QWyjBIj+OyypvxyNklJFXrhlvhonPC+5M=;
 b=F4n7FY1XvZsZPwIrX/ILH4l2X7RSUcsEkmcH00BjCm/XYD0eUj27qg354mgkCRxWSZ
 zTjmHmT7hpRA/nPAS0E9azMBrBGX6VJhMsiQXuYJY3xJLR3XTNj+4q+ZpZ+Wrcx7M8wh
 eKHHdHO+11k1bLVB613hSGsqFEt5f5B0Shn0rCdcx7dFRzLWqW+UUG1gawY5f/9ntGjH
 P4AZBolTzEhcx5QrtiLCeS7dW8hidUe58pLK4Us090Su7E9RRKwWopnMNf/e42Azx4GC
 KwAFo+U3xB3JZp5Nvj0NfhWcycPI6k16g6BLdcstXsZZoqPyFaPhI0OGB4uS8saVPIdo
 Me1w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=F4n7FY1X
Subject: Re: [Buildroot] [PATCH 1/1] package/freerdp: update the patches to
 be applied with fuzz 0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: linux-amarula@amarulasolutions.com,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/07/2024 09:39, Dario Binacchi wrote:
> Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
> fuzz factor to 0") reduced the fuzz factor.
> 
> Due to this change, freerdp fails to build with output:
> 
>      Applying 0001-Fix-variable-declaration-in-loop.patch using patch:
>      patching file client/X11/xf_graphics.c
>      Hunk #1 FAILED at 386.
>      Hunk #2 succeeded at 456 (offset 61 lines).
>      1 out of 2 hunks FAILED -- saving rejects to file client/X11/xf_graphics.c.rej
> 
>      Applying 0002-Fixed-variable-declaration-in-loop.patch using patch:
>      patching file client/X11/xf_graphics.c
>      Hunk #1 succeeded at 246 (offset 6 lines).
>      Hunk #2 FAILED at 255.
>      1 out of 2 hunks FAILED -- saving rejects to file client/X11/xf_graphics.c.rej
> 
> This commit refreshes the package patches on the current package version.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../0001-Fix-variable-declaration-in-loop.patch | 17 +++++++++++------
>   ...002-Fixed-variable-declaration-in-loop.patch | 17 +++++++++++------
>   2 files changed, 22 insertions(+), 12 deletions(-)
> 
> diff --git a/package/freerdp/0001-Fix-variable-declaration-in-loop.patch b/package/freerdp/0001-Fix-variable-declaration-in-loop.patch
> index 799a92734be7..ec1795364afe 100644
> --- a/package/freerdp/0001-Fix-variable-declaration-in-loop.patch
> +++ b/package/freerdp/0001-Fix-variable-declaration-in-loop.patch
> @@ -1,27 +1,29 @@
> -From ddde652460350b962d32036981ff8ed77ed2f1ed Mon Sep 17 00:00:00 2001
> +From 48f25939f4a48b01072f3cd2ece1e36a41c0ad44 Mon Sep 17 00:00:00 2001
>   From: Armin Novak <armin.novak@thincast.com>
>   Date: Wed, 16 Sep 2020 09:30:37 +0200
>   Subject: [PATCH] Fix variable declaration in loop
>   
>   Upstream: https://github.com/FreeRDP/FreeRDP/commit/ddde652460350b962d32036981ff8ed77ed2f1ed
>   Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Dario: make the patch to be applied with fuzz factor 0]
> +Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>   ---
>    client/X11/xf_graphics.c | 3 ++-
>    1 file changed, 2 insertions(+), 1 deletion(-)
>   
>   diff --git a/client/X11/xf_graphics.c b/client/X11/xf_graphics.c
> -index 76fbef5bd6..bf71b563c3 100644
> +index 5aa1fd48b5a3..c8f24362aec7 100644
>   --- a/client/X11/xf_graphics.c
>   +++ b/client/X11/xf_graphics.c
> -@@ -386,6 +386,7 @@ static BOOL xf_Pointer_New(rdpContext* context, rdpPointer* pointer)
> - static void xf_Pointer_Free(rdpContext* context, rdpPointer* pointer)
> - {
> +@@ -447,6 +447,7 @@ static void xf_Pointer_Free(rdpContext* context, rdpPointer* pointer)
> + 	WLog_DBG(TAG, "%s: %p", __func__, pointer);
> +
>    #ifdef WITH_XCURSOR
>   +	UINT32 i;
>    	xfContext* xfc = (xfContext*)context;
>    	xfPointer* xpointer = (xfPointer*)pointer;
>    
> -@@ -395,7 +396,7 @@ static void xf_Pointer_Free(rdpContext* context, rdpPointer* pointer)
> +@@ -456,7 +457,7 @@ static void xf_Pointer_Free(rdpContext* context, rdpPointer* pointer)
>    	free(xpointer->cursorWidths);
>    	free(xpointer->cursorHeights);
>    
> @@ -30,3 +32,6 @@ index 76fbef5bd6..bf71b563c3 100644
>    	{
>    		XFreeCursor(xfc->display, xpointer->cursors[i]);
>    	}
> +--
> +2.43.0
> +
> diff --git a/package/freerdp/0002-Fixed-variable-declaration-in-loop.patch b/package/freerdp/0002-Fixed-variable-declaration-in-loop.patch
> index 1a4e89943073..838844d63523 100644
> --- a/package/freerdp/0002-Fixed-variable-declaration-in-loop.patch
> +++ b/package/freerdp/0002-Fixed-variable-declaration-in-loop.patch
> @@ -1,19 +1,21 @@
> -From 4f8a48d96e472e43a5f856c449f61669792ce9fa Mon Sep 17 00:00:00 2001
> +From b0b856590b523869358875594841f3e6c2919569 Mon Sep 17 00:00:00 2001
>   From: akallabeth <akallabeth@posteo.net>
>   Date: Tue, 22 Sep 2020 07:43:56 +0200
>   Subject: [PATCH] Fixed variable declaration in loop
>   
>   Upstream: https://github.com/FreeRDP/FreeRDP/commit/4f8a48d96e472e43a5f856c449f61669792ce9fa
>   Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Dario: make the patch to be applied with fuzz factor 0]
> +Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>   ---
>    client/X11/xf_graphics.c | 4 ++--
>    1 file changed, 2 insertions(+), 2 deletions(-)
>   
>   diff --git a/client/X11/xf_graphics.c b/client/X11/xf_graphics.c
> -index bf71b563c3..c50726c8e4 100644
> +index c8f24362aec7..c8b604cc6ad4 100644
>   --- a/client/X11/xf_graphics.c
>   +++ b/client/X11/xf_graphics.c
> -@@ -240,7 +240,7 @@ static BOOL _xf_Pointer_GetCursorForCurrentScale(rdpContext* context, const rdpP
> +@@ -246,7 +246,7 @@ static BOOL xf_Pointer_GetCursorForCurrentScale(rdpContext* context, const rdpPo
>    	double xscale;
>    	double yscale;
>    	size_t size;
> @@ -22,12 +24,15 @@ index bf71b563c3..c50726c8e4 100644
>    
>    	if (!context || !pointer || !context->gdi)
>    		return FALSE;
> -@@ -255,7 +255,7 @@ static BOOL _xf_Pointer_GetCursorForCurrentScale(rdpContext* context, const rdpP
> - 	xTargetSize = pointer->width * xscale;
> - 	yTargetSize = pointer->height * yscale;
> +@@ -264,7 +264,7 @@ static BOOL xf_Pointer_GetCursorForCurrentScale(rdpContext* context, const rdpPo
> + 	WLog_DBG(TAG, "%s: scaled: %" PRIu32 "x%" PRIu32 ", desktop: %" PRIu32 "x%" PRIu32, __func__,
> + 	         xfc->scaledWidth, xfc->savedHeight, settings->DesktopWidth, settings->DesktopHeight);
>    
>   -	for (int i = 0; i < xpointer->nCursors; i++)
>   +	for (i = 0; i < xpointer->nCursors; i++)
>    	{
>    		if (xpointer->cursorWidths[i] == xTargetSize && xpointer->cursorHeights[i] == yTargetSize)
>    		{
> +--
> +2.43.0
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
