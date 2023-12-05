Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 345B9C4167B
	for <buildroot@archiver.kernel.org>; Wed,  6 Dec 2023 00:00:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF4A841D9F;
	Wed,  6 Dec 2023 00:00:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF4A841D9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pYxxe1k1ZIPz; Wed,  6 Dec 2023 00:00:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CE8841D80;
	Wed,  6 Dec 2023 00:00:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CE8841D80
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E7BE91BF279
 for <buildroot@lists.busybox.net>; Tue,  5 Dec 2023 23:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0E43416C0
 for <buildroot@lists.busybox.net>; Tue,  5 Dec 2023 23:59:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0E43416C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xDHqzA08zWAh for <buildroot@lists.busybox.net>;
 Tue,  5 Dec 2023 23:59:34 +0000 (UTC)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1B14041855
 for <buildroot@buildroot.org>; Tue,  5 Dec 2023 23:59:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B14041855
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1d03fb57b69so31129185ad.1
 for <buildroot@buildroot.org>; Tue, 05 Dec 2023 15:59:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701820772; x=1702425572;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jIDhaRG18RwRs7mljKZkNDk5Xas4Ivonehmx2GK7aTg=;
 b=cCJ9MpaIpm2UFvkyYuoZ7u6Jju8akBXRFh3jwQlG/Bf/Jcp8NnaFpLOijYtM/G/IaU
 DR1K80sPTUE43EoGGSYwjOlmsjZVx/ID2S+X3l2ztWC8iRjWIcy9DCvIKEk3CYRABUmQ
 tL2xaofpI34ym4kI4R/Ez+2dQ7x1Kye++Nq0gYYVgwazBTX9GuDSuMU+rYMi5jCbZMoa
 YnRb9WvrHK0amdOy11lXpi/nRNRubyWVh1ZJjVjYgzJ2XCs7kJ5sQApKxnim963JzCv4
 yrUvScLO4fWnjtZN1ick59s05A1LNXAyudd1Tola2k1lnKJp6qMYc3goxYUGQK4ioPbU
 HSGg==
X-Gm-Message-State: AOJu0YyhFVZGwzZfjHnQHcUW3reWKePAhEMq//JD8sFuVW4rqHcPl2YQ
 fI6/19FuWnLgxekPGLg7TUoI9mkQDpXuMB2l8II=
X-Google-Smtp-Source: AGHT+IE6XlrnDJVQzFK7x2ac2ihA6pHLj4/ZpSu6hF6siaJL8d8Ipp0xqFU1pw26AeOxgjceXnqJ7w==
X-Received: by 2002:a17:902:ab46:b0:1d0:c5d4:b9fb with SMTP id
 ij6-20020a170902ab4600b001d0c5d4b9fbmr12780plb.13.1701820772590; 
 Tue, 05 Dec 2023 15:59:32 -0800 (PST)
Received: from localhost.localdomain (75-174-247-100.bsmr.qwest.net.
 [75.174.247.100]) by smtp.gmail.com with ESMTPSA id
 f13-20020a170902ab8d00b001cc20dd8825sm7246369plr.213.2023.12.05.15.59.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 15:59:31 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  5 Dec 2023 16:59:19 -0700
Message-ID: <20231205235919.510051-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205235919.510051-1-adam.duskett@amarulasolutions.com>
References: <20231205235919.510051-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1701820772; x=1702425572;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jIDhaRG18RwRs7mljKZkNDk5Xas4Ivonehmx2GK7aTg=;
 b=L8ZETpa+nFYJIo9xASgaDJzlFiIyliYuTscOV8Xa5nuThl8pNE/nZpAoVKAzZKa1Dw
 1HI224muTEOqFFcvSxIMIGswarBkbD8Kq4bzLSBQHz9hRXECHtl7YXlZlZ8VLVXra7/Y
 q2r4kvc1BmZVG5SGuegPhWIiRmY++J9ZrNsvc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=L8ZETpa+
Subject: [Buildroot] [PATCH 3/3]
 package/giflib/0004-Fix-several-defects-found-by-Coverity-scan.patch: New
 security patch
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 ...veral-defects-found-by-Coverity-scan.patch | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 package/giflib/0004-Fix-several-defects-found-by-Coverity-scan.patch

diff --git a/package/giflib/0004-Fix-several-defects-found-by-Coverity-scan.patch b/package/giflib/0004-Fix-several-defects-found-by-Coverity-scan.patch
new file mode 100644
index 0000000000..1719769872
--- /dev/null
+++ b/package/giflib/0004-Fix-several-defects-found-by-Coverity-scan.patch
@@ -0,0 +1,61 @@
+From a1c48b91cd1cf1e9bf7077709b69f4bfd4c4abc7 Mon Sep 17 00:00:00 2001
+From: Sandro Mani <manisandro@gmail.com>
+Date: Tue, 5 Dec 2023 16:38:48 -0700
+Subject: [PATCH] Fix several defects found by Coverity scan
+
+From: giflib-5.2.1-17.fc39.src.rpm
+Upstream: Not submitted
+
+Signed-off-by: Sandro Mani <manisandro@gmail.com>
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ gif2rgb.c | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/gif2rgb.c b/gif2rgb.c
+index d9a469f..02cea41 100644
+--- a/gif2rgb.c
++++ b/gif2rgb.c
+@@ -170,6 +170,8 @@ static void SaveGif(GifByteType *OutputBuffer,
+     /* Open stdout for the output file: */
+     if ((GifFile = EGifOpenFileHandle(1, &Error)) == NULL) {
+ 	PrintGifError(Error);
++	free(OutputBuffer);
++	GifFreeMapObject(OutputColorMap);
+ 	exit(EXIT_FAILURE);
+     }
+ 
+@@ -179,6 +181,8 @@ static void SaveGif(GifByteType *OutputBuffer,
+ 	EGifPutImageDesc(GifFile,
+ 			 0, 0, Width, Height, false, NULL) == GIF_ERROR) {
+ 	PrintGifError(Error);
++	free(OutputBuffer);
++	GifFreeMapObject(OutputColorMap);
+ 	exit(EXIT_FAILURE);
+     }
+ 
+@@ -187,8 +191,11 @@ static void SaveGif(GifByteType *OutputBuffer,
+ 	       GifFile->Image.Width, GifFile->Image.Height);
+ 
+     for (i = 0; i < Height; i++) {
+-	if (EGifPutLine(GifFile, Ptr, Width) == GIF_ERROR)
++	if (EGifPutLine(GifFile, Ptr, Width) == GIF_ERROR) {
++	    free(OutputBuffer);
++	    GifFreeMapObject(OutputColorMap);
+ 	    exit(EXIT_FAILURE);
++        }
+ 	GifQprintf("\b\b\b\b%-4d", Height - i - 1);
+ 
+ 	Ptr += Width;
+@@ -196,6 +203,8 @@ static void SaveGif(GifByteType *OutputBuffer,
+ 
+     if (EGifCloseFile(GifFile, &Error) == GIF_ERROR) {
+ 	PrintGifError(Error);
++	free(OutputBuffer);
++	GifFreeMapObject(OutputColorMap);
+ 	exit(EXIT_FAILURE);
+     }
+ }
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
