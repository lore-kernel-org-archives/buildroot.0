Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19083C3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 07:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C526D810B0;
	Tue,  2 Jul 2024 07:39:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NLI_F_Qv0gVa; Tue,  2 Jul 2024 07:39:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8B54810BE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8B54810BE;
	Tue,  2 Jul 2024 07:39:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2AAA91BF365
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:39:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1784540D23
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:39:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vkT1TzbkTQ82 for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 07:39:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 344DA40D17
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 344DA40D17
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 344DA40D17
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 07:39:32 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-57d106e69a2so1699084a12.0
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 00:39:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719905970; x=1720510770;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l+ScL1iIqE8b07sgrmsqyr2vFXRPChTp+izF0lpnx3s=;
 b=GyHDQFUOL9XpPZ/QZOpJuOrcwrHJmnGdR1SooZP1wzjopOTullVPrKd8P9VsPfQMoN
 qojjZzeeeQDS6B4mCTtSqEdzxoQWsJviFyjAxbjR8jAOMh0e3vHHHFWVqgBLfe/1G9Cv
 gCrAuVYfKEQmIR0CelF4bFCv1zVKLuPxqnTtjj7rtI19NnB1bUsyQId6xI069sSDLFwV
 RKunMA5rY5HY17JG6VxjNDjd0ZYlauAX1khCKVgGZ7Tb+Zc9siYFE2jVD72ptWh/zQuG
 VgTe6GPmyK0fImupwn3rnyWfivKclds9waUbkXsGiAYoLFIuWgqnHRTbCeocNAdGC7RP
 Unww==
X-Gm-Message-State: AOJu0YxKAekEQVkM25Z8y7bgHROHVnkiJJInAgaGtPzD3RnlOI+dNJrf
 NV5+HjFfw9CZXzBVFL35f42Pyq/+OEXDB3II6EtdPPuRI512j2E49SPI1syWXNyuMmUcmQ9BZQb
 4/0k=
X-Google-Smtp-Source: AGHT+IEO4Yrl5+iLpMWse4GUshshrjnPCN08nMR7D527s3QxqduhIpDlghRhAP1XgkDJefJOF4TKDg==
X-Received: by 2002:a05:6402:2353:b0:57c:a8e5:35f0 with SMTP id
 4fb4d7f45d1cf-587800699ecmr6637939a12.2.1719905969551; 
 Tue, 02 Jul 2024 00:39:29 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:c733:f73f:670d:ca47])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-58612c83583sm5342086a12.5.2024.07.02.00.39.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 00:39:29 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jul 2024 09:39:26 +0200
Message-ID: <20240702073926.2379089-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1719905970; x=1720510770;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l+ScL1iIqE8b07sgrmsqyr2vFXRPChTp+izF0lpnx3s=;
 b=OBTpg0eyB7ICvFLh37nv3RrW7CmqB5VosfTgsfKhwXNmNivyhXhvKJd+7ejFLBDa/w
 /FTNCdAB1F+lbpJcMiCEchGpmC68xe0RwFIcGy0z82jpI2RUNE5BUU1cHRR1kOPpNu2L
 Qo1fpsmhf8i2TuHBICUg5LNMJqVYvJJ/2r+yw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=OBTpg0ey
Subject: [Buildroot] [PATCH 1/1] package/freerdp: update the patches to be
 applied with fuzz 0
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, freerdp fails to build with output:

    Applying 0001-Fix-variable-declaration-in-loop.patch using patch:
    patching file client/X11/xf_graphics.c
    Hunk #1 FAILED at 386.
    Hunk #2 succeeded at 456 (offset 61 lines).
    1 out of 2 hunks FAILED -- saving rejects to file client/X11/xf_graphics.c.rej

    Applying 0002-Fixed-variable-declaration-in-loop.patch using patch:
    patching file client/X11/xf_graphics.c
    Hunk #1 succeeded at 246 (offset 6 lines).
    Hunk #2 FAILED at 255.
    1 out of 2 hunks FAILED -- saving rejects to file client/X11/xf_graphics.c.rej

This commit refreshes the package patches on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../0001-Fix-variable-declaration-in-loop.patch | 17 +++++++++++------
 ...002-Fixed-variable-declaration-in-loop.patch | 17 +++++++++++------
 2 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/package/freerdp/0001-Fix-variable-declaration-in-loop.patch b/package/freerdp/0001-Fix-variable-declaration-in-loop.patch
index 799a92734be7..ec1795364afe 100644
--- a/package/freerdp/0001-Fix-variable-declaration-in-loop.patch
+++ b/package/freerdp/0001-Fix-variable-declaration-in-loop.patch
@@ -1,27 +1,29 @@
-From ddde652460350b962d32036981ff8ed77ed2f1ed Mon Sep 17 00:00:00 2001
+From 48f25939f4a48b01072f3cd2ece1e36a41c0ad44 Mon Sep 17 00:00:00 2001
 From: Armin Novak <armin.novak@thincast.com>
 Date: Wed, 16 Sep 2020 09:30:37 +0200
 Subject: [PATCH] Fix variable declaration in loop
 
 Upstream: https://github.com/FreeRDP/FreeRDP/commit/ddde652460350b962d32036981ff8ed77ed2f1ed
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  client/X11/xf_graphics.c | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/client/X11/xf_graphics.c b/client/X11/xf_graphics.c
-index 76fbef5bd6..bf71b563c3 100644
+index 5aa1fd48b5a3..c8f24362aec7 100644
 --- a/client/X11/xf_graphics.c
 +++ b/client/X11/xf_graphics.c
-@@ -386,6 +386,7 @@ static BOOL xf_Pointer_New(rdpContext* context, rdpPointer* pointer)
- static void xf_Pointer_Free(rdpContext* context, rdpPointer* pointer)
- {
+@@ -447,6 +447,7 @@ static void xf_Pointer_Free(rdpContext* context, rdpPointer* pointer)
+ 	WLog_DBG(TAG, "%s: %p", __func__, pointer);
+ 
  #ifdef WITH_XCURSOR
 +	UINT32 i;
  	xfContext* xfc = (xfContext*)context;
  	xfPointer* xpointer = (xfPointer*)pointer;
  
-@@ -395,7 +396,7 @@ static void xf_Pointer_Free(rdpContext* context, rdpPointer* pointer)
+@@ -456,7 +457,7 @@ static void xf_Pointer_Free(rdpContext* context, rdpPointer* pointer)
  	free(xpointer->cursorWidths);
  	free(xpointer->cursorHeights);
  
@@ -30,3 +32,6 @@ index 76fbef5bd6..bf71b563c3 100644
  	{
  		XFreeCursor(xfc->display, xpointer->cursors[i]);
  	}
+-- 
+2.43.0
+
diff --git a/package/freerdp/0002-Fixed-variable-declaration-in-loop.patch b/package/freerdp/0002-Fixed-variable-declaration-in-loop.patch
index 1a4e89943073..838844d63523 100644
--- a/package/freerdp/0002-Fixed-variable-declaration-in-loop.patch
+++ b/package/freerdp/0002-Fixed-variable-declaration-in-loop.patch
@@ -1,19 +1,21 @@
-From 4f8a48d96e472e43a5f856c449f61669792ce9fa Mon Sep 17 00:00:00 2001
+From b0b856590b523869358875594841f3e6c2919569 Mon Sep 17 00:00:00 2001
 From: akallabeth <akallabeth@posteo.net>
 Date: Tue, 22 Sep 2020 07:43:56 +0200
 Subject: [PATCH] Fixed variable declaration in loop
 
 Upstream: https://github.com/FreeRDP/FreeRDP/commit/4f8a48d96e472e43a5f856c449f61669792ce9fa
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  client/X11/xf_graphics.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/client/X11/xf_graphics.c b/client/X11/xf_graphics.c
-index bf71b563c3..c50726c8e4 100644
+index c8f24362aec7..c8b604cc6ad4 100644
 --- a/client/X11/xf_graphics.c
 +++ b/client/X11/xf_graphics.c
-@@ -240,7 +240,7 @@ static BOOL _xf_Pointer_GetCursorForCurrentScale(rdpContext* context, const rdpP
+@@ -246,7 +246,7 @@ static BOOL xf_Pointer_GetCursorForCurrentScale(rdpContext* context, const rdpPo
  	double xscale;
  	double yscale;
  	size_t size;
@@ -22,12 +24,15 @@ index bf71b563c3..c50726c8e4 100644
  
  	if (!context || !pointer || !context->gdi)
  		return FALSE;
-@@ -255,7 +255,7 @@ static BOOL _xf_Pointer_GetCursorForCurrentScale(rdpContext* context, const rdpP
- 	xTargetSize = pointer->width * xscale;
- 	yTargetSize = pointer->height * yscale;
+@@ -264,7 +264,7 @@ static BOOL xf_Pointer_GetCursorForCurrentScale(rdpContext* context, const rdpPo
+ 	WLog_DBG(TAG, "%s: scaled: %" PRIu32 "x%" PRIu32 ", desktop: %" PRIu32 "x%" PRIu32, __func__,
+ 	         xfc->scaledWidth, xfc->savedHeight, settings->DesktopWidth, settings->DesktopHeight);
  
 -	for (int i = 0; i < xpointer->nCursors; i++)
 +	for (i = 0; i < xpointer->nCursors; i++)
  	{
  		if (xpointer->cursorWidths[i] == xTargetSize && xpointer->cursorHeights[i] == yTargetSize)
  		{
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
