Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22CDBC48260
	for <buildroot@archiver.kernel.org>; Sat, 10 Feb 2024 21:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EDF3605F1;
	Sat, 10 Feb 2024 21:49:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xcCQ7tPpyvpl; Sat, 10 Feb 2024 21:49:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC75E605F7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC75E605F7;
	Sat, 10 Feb 2024 21:49:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 729A71BF295
 for <buildroot@lists.busybox.net>; Sat, 10 Feb 2024 21:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15FE14319B
 for <buildroot@lists.busybox.net>; Sat, 10 Feb 2024 21:25:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XDxmm8N-Nnbe for <buildroot@lists.busybox.net>;
 Sat, 10 Feb 2024 21:25:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 00614404AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00614404AF
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 00614404AF
 for <buildroot@buildroot.org>; Sat, 10 Feb 2024 21:25:01 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-33b1d7f736bso1344725f8f.3
 for <buildroot@buildroot.org>; Sat, 10 Feb 2024 13:25:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707600300; x=1708205100;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3wIKYIymMFX3pUMxGav7zlOHJh9yksLNLcMSxzdQ8jU=;
 b=KooTWXH6bnvXJiDIAcfONTtsgoF3XtO3apkbI2ALhXVzCtZyOEoBHoiK9kAauSzNME
 K/KLJ6MRiK1gKEUuvPhQo7pgwiWHPLMJy8Cd6KGmmnvLiikvnh1bsloUEyySEqzhILlD
 gkDsemtv89m+/qtyzma0k96tdhrzsLKrg3lOgTZ0Jg8gD/AnR9ZTOqGlCLpxCHKEU2WZ
 3ldgK5WyS7PFQor3U99WA3pD65/nax6Jw8LzsOE/hX1xyJHeJs7UWieNgE9sGBQhB9lk
 7Ok+/jqt3rIhBERaNTNtU9ZNcO/oj+SIwMfQzxP7osFrHPlwM6LKpfT1NDcDXOCYtZTI
 m8tA==
X-Gm-Message-State: AOJu0YwfWJeexkiQNlATwjrd5J0zDkSwOTy0xSgA6K5FMFMwD9vL3P7K
 aLBMsjrzGuPGYzEGMVkfs0SmjM+CN9NnrizFzotiyZnhxrHGoQSDu7qxUvS8
X-Google-Smtp-Source: AGHT+IGIsl+aLuRfl43KaKc9zcxVGEHDjtSZKa1g4lSYk64y8quxfsMUFpPDkm2hWg1XOiUAklprsw==
X-Received: by 2002:adf:cd81:0:b0:33b:4ec0:8166 with SMTP id
 q1-20020adfcd81000000b0033b4ec08166mr1739555wrj.37.1707600299824; 
 Sat, 10 Feb 2024 13:24:59 -0800 (PST)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ba23-20020a0560001c1700b0033946c0f9e7sm2728962wrb.17.2024.02.10.13.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Feb 2024 13:24:59 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 10 Feb 2024 22:24:54 +0100
Message-ID: <d4690e555ad7f84c9340bc66d7bc0a75edcbbf46.1707600292.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707600292.git.yann.morin.1998@free.fr>
References: <cover.1707600292.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707600300; x=1708205100; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3wIKYIymMFX3pUMxGav7zlOHJh9yksLNLcMSxzdQ8jU=;
 b=akYBJYD7WSRbHsttbPUQFi/LWZi3SzJebLcaaO5oa+q3ol7jc66ESyT34Gudi8JEJ6
 1HPxyO4hQQQnC7pWrhzQtdx8gxktzzf99QHkg9XU0CR7lYEZO7P9EPKJK/lygFSXbZ4s
 rasj2uqqfZyL89tff3ao2BgaLf59RiZiVGghg6Deh1Xx8njPK5mfaWufyvKPoLrlBrsA
 nrT2ejLjfk4vT6RrPKlYfKv6T24wqWcx/GlrRB+97qZHqssI4PUVUI3CZAL9+m+OuXLN
 yhwEuWBY/92rMlcJL832f/A3oFpJSK4y4TzPn8WRAFjPoD4OGfy48t4CyOZ6NKZydPTJ
 E+BQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=akYBJYD7
Subject: [Buildroot] [PATCH 1/6 v2] utils/check-package: use https for the
 manual URL
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 utils/check-package | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/check-package b/utils/check-package
index 105902303e..de41891b56 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -69,7 +69,7 @@ def parse_args():
                         help='override the default list of ignored warnings')
 
     parser.add_argument("--manual-url", action="store",
-                        default="http://nightly.buildroot.org/",
+                        default="https://nightly.buildroot.org/",
                         help="default: %(default)s")
     parser.add_argument("--verbose", "-v", action="count", default=0)
     parser.add_argument("--quiet", "-q", action="count", default=0)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
