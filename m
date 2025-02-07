Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA6BC02194
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 14:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C4DF429A5;
	Fri,  7 Feb 2025 14:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ql5rZUiKEL5k; Fri,  7 Feb 2025 14:46:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14EC742B75
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14EC742B75;
	Fri,  7 Feb 2025 14:46:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 98EA21B5
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 14:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8402061058
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 14:46:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rJzTuWitZDkW for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 14:46:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.52;
 helo=mail-wr1-f52.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 919B06066A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 919B06066A
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 919B06066A
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 14:46:42 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-38633b5dbcfso2272290f8f.2
 for <buildroot@buildroot.org>; Fri, 07 Feb 2025 06:46:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738939600; x=1739544400;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+vBaghQ7Y2RUh9//x8OstTDc0vURyUHg6rS7/60V1Wo=;
 b=JvlJq8/LftgNvBRMKJmmg2Iv4mZ27sK/Gg1Z99vdEvBjIVrPFuxEvzDT2HSYP3qP6/
 YQ0PkxuU4o8dg1SrvVi6IH/iYCHcylDt8EhGLKD+7kUrTJdyna+nboqgHYsEOggHO3BG
 Igkgl/9fS9Wzywz8dv9DvNtFScnFRB+klblTu1SN/sEnX+OT5YL8mOPmu8m2g100Bl5f
 PmTp1YyS6te1GuYLWY2+tt1sBdEQWr/GHF+0HkBw83ifCnQi8unio+skeTCFD75Bg0UV
 I34pQWmtMTboeaoEBRpGMZV4ycCKXuIguVsxECot/pu69x+ccXeIgw/RyU+iIBkKtH3F
 +0Zw==
X-Gm-Message-State: AOJu0Ywk9KOg2YSeatByQnxQlZdRMivLLXYU9svw+3OQ2O5PIBsJ9Mag
 EVVVAlxM5wvaCXUnERhZ0o1k1qtinQr0/5h184rKhJh0bQ1oBjpLx9j4ELcHw3k=
X-Gm-Gg: ASbGncsUvSupP1QrT26ZQe2IX8Wm6B0+GLkNcJXgydxzxkUwio794CCQKvHobhxTkAj
 ie+GcIMniNlBhm8ABNWRW7wGAh85mobC9uu6eO99px2xengP+3GP678IKOtPzlHd62O+Bs8lCnm
 i8jGsrrBjPUnJTSOXZDc4/p7pQULf6erHtrh4ZaSxOqA3tAfXpIamfNQGfCFSgptxqRtVAQtMLo
 g9p4EhfeS66ho+uWFClLI+kYKTpsBzqDdkvF3G+C7gYJJA1HdcHCZP8WlKSW/5KyeJFaNyQULXa
 YxKqZyZ4rUfMHWD+OtU3vrH/535UhLsffubsx4XGGZD2Lw==
X-Google-Smtp-Source: AGHT+IF+vXcwwQ5kOVkQL9X0QO6eKOBWjp3iSGHdX9D5+K1qpC1NtY4ASdC4ZNZVFqjvxCHGDw4a5A==
X-Received: by 2002:a05:6000:156e:b0:38a:88f8:aadd with SMTP id
 ffacd0b85a97d-38dc9353e87mr3149119f8f.53.1738939599929; 
 Fri, 07 Feb 2025 06:46:39 -0800 (PST)
Received: from thomas-Precision-7670.barco.com
 ([2a02:a03f:eb68:2f00:c6ae:4084:c50f:f7ad])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dcfebb896sm704195f8f.33.2025.02.07.06.46.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 06:46:39 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Thomas Devoogdt <thomas@devoogdt.com>
Date: Fri,  7 Feb 2025 15:46:36 +0100
Message-ID: <20250207144636.620427-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH] package/fontconfig: fix build
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

../test/test-crbug1004254.c:28:10: fatal error: pthread.h: No such file or directory
   28 | #include <pthread.h>
      |          ^~~~~~~~~~~

Commit cef7358 "package/fontconfig: fix compilation on targets without pthread support"
fixed compilation for targets without pthread support, but that was apparently nog enough.

Back then, I tested all the targets by using `./utils/test-pkg -p fontconfig -a`,
but somehow these targets didn't enable the fontconfig tests, so I didn't see this
compile failure. Fix it now by explicitly disabling the fontconfig tests.

Fixes:
 -  https://autobuild.buildroot.org/results/5f0/5f0c716c20788ba49a3a9f185251ded373a764cd/build-end.log

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/fontconfig/fontconfig.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index 21eba76a83..7ac8872e82 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -18,6 +18,7 @@ FONTCONFIG_CPE_ID_VALID = YES
 
 FONTCONFIG_CONF_OPTS = \
 	-Dcache-dir=/var/cache/fontconfig \
+	-Dtests=disabled \
 	-Ddoc=disabled
 
 FONTCONFIG_CFLAGS = $(TARGET_CFLAGS)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
