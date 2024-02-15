Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8838C4829E
	for <buildroot@archiver.kernel.org>; Thu, 15 Feb 2024 14:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 680BA60FC9;
	Thu, 15 Feb 2024 14:24:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rAHMO9qttapv; Thu, 15 Feb 2024 14:24:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C99C860FAE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C99C860FAE;
	Thu, 15 Feb 2024 14:24:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 24C991BF844
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 14:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09C316081B
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 14:24:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9elbn5ZaioOx for <buildroot@lists.busybox.net>;
 Thu, 15 Feb 2024 14:24:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1130; helo=mail-yw1-x1130.google.com;
 envelope-from=gilles.talis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0972160608
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0972160608
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0972160608
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 14:24:34 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-60782336a3aso7313837b3.2
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 06:24:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708007073; x=1708611873;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dLIsKcTvURUMkvvvhBZxJUzVCP3yzWPMLgsmyYvWi4E=;
 b=Ok2vnpxC65eUhubFaLVY8aa5nEXF9OQqqVUzdBEqhAQvt7O5EOETPOK1jX+f3mGh82
 zQr4Wk1JcfmqxkVKY6nIvhNEvektUNE6tyriD8H5VdZHjqMYw5wLx43uctBJs8RYcJKl
 EAHBS9WEE7KBH5CuwMwtGEobzj/NADcUjw4g9vVu4zuFG5tvXvasUUs5U+9i6W8ceWZ2
 fUqvaR/lrZRNqH5JsQcmgTpKY3jCbv2UWHSkhSgl06duz/3tKiZmNf9JhQq6ktP4cR2L
 X2ix0mMB7GzB4TZLAC4yHbj1apVQuIMPIaKLXOSiKn+MZUrZ7hjL7wAIU/j1ZNo+ZHUv
 pb1A==
X-Gm-Message-State: AOJu0YwgQddjaucbkGTa/hloPvwtDlbJggn8zSUAjY6/h+oCSFOWb1cT
 WzDFUwmyAUl2iNlWyb8P71q5i3ARoa+1TxbLAS+TXKWVdxUUVxKMc/bUBkFjJLo=
X-Google-Smtp-Source: AGHT+IF+oKFlShgBwKRKLKRKZBXsPzGrej6O55tm/lCQA1xyFuJv2encVFfTZlzY8YCqIsIg2OAZ+w==
X-Received: by 2002:a81:4902:0:b0:607:a98c:81a6 with SMTP id
 w2-20020a814902000000b00607a98c81a6mr1733624ywa.44.1708007072846; 
 Thu, 15 Feb 2024 06:24:32 -0800 (PST)
Received: from gilles-Precision-3571.lan
 ([2605:59c8:6662:b310:7f4:4b02:4a36:4d21])
 by smtp.gmail.com with ESMTPSA id
 i197-20020a0ddfce000000b0060437133f85sm260967ywe.7.2024.02.15.06.24.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 06:24:32 -0800 (PST)
From: Gilles Talis <gilles.talis@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 15 Feb 2024 10:24:08 -0400
Message-Id: <20240215142413.451505-3-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240215142413.451505-1-gilles.talis@gmail.com>
References: <20240215142413.451505-1-gilles.talis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708007073; x=1708611873; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dLIsKcTvURUMkvvvhBZxJUzVCP3yzWPMLgsmyYvWi4E=;
 b=NjaAqlHnAhyXb/SWOtejZArjghhE11AHWv4BasmlpI/cnssgFrULMAcAKjy84m0sFx
 YY6RRRAL5ifFjUaQgClWO5R/IDI7ukYGw25YDO7IRZycygSeGdlA1BERZQEJucGIJcgt
 y/sKIxN0LTK8g/jG0/CMw2M2JWt7OCPhpKz7mD0Monmrq3IeF2F2xjfakKF/721tTO7s
 /8UHJ8IEX2WVKTcW0ipiCL+rqlRBfAAdK0QX7LwPRIEw9A2/o/U0FJSh4ED8d40Yw1vr
 SWT5TwHWxTjyuOsiChVHj79zwkP+wiYH6NwhNO1A2eM44z6B0UmAeNm5hih+b7LIkmls
 T7Xw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NjaAqlHn
Subject: [Buildroot] [PATCH] package/leptonica: bump to version 1.84.1
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
Cc: Gilles Talis <gilles.talis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Change log:
http://www.leptonica.org/source/version-notes.html

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/leptonica/leptonica.hash | 2 +-
 package/leptonica/leptonica.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/leptonica/leptonica.hash b/package/leptonica/leptonica.hash
index 6511d6b410..3416cfeb39 100644
--- a/package/leptonica/leptonica.hash
+++ b/package/leptonica/leptonica.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  8f18615e0743af7df7f50985c730dfcf0c93548073d1f56621e4156a8b54d3dd  leptonica-1.83.1.tar.gz
+sha256  2b3e1254b1cca381e77c819b59ca99774ff43530209b9aeb511e1d46588a64f6  leptonica-1.84.1.tar.gz
 sha256  87829abb5bbb00b55a107365da89e9a33f86c4250169e5a1e5588505be7d5806  leptonica-license.txt
diff --git a/package/leptonica/leptonica.mk b/package/leptonica/leptonica.mk
index 4cb73296e8..0e902c6488 100644
--- a/package/leptonica/leptonica.mk
+++ b/package/leptonica/leptonica.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LEPTONICA_VERSION = 1.83.1
+LEPTONICA_VERSION = 1.84.1
 LEPTONICA_SITE = https://github.com/DanBloomberg/leptonica/releases/download/$(LEPTONICA_VERSION)
 LEPTONICA_LICENSE = BSD-2-Clause
 LEPTONICA_LICENSE_FILES = leptonica-license.txt
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
