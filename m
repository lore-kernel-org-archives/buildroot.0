Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DDE5C02198
	for <buildroot@archiver.kernel.org>; Sat,  8 Feb 2025 18:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E91CA41157;
	Sat,  8 Feb 2025 18:01:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SrVCwjA0BXSB; Sat,  8 Feb 2025 18:01:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D26B8412F6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D26B8412F6;
	Sat,  8 Feb 2025 18:01:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C1F61B5
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 18:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B5C060771
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 18:01:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ez5F-l7vzGhI for <buildroot@buildroot.org>;
 Sat,  8 Feb 2025 18:01:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=bobrofon@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0924260764
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0924260764
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0924260764
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 18:01:34 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4363ae65100so36904195e9.0
 for <buildroot@buildroot.org>; Sat, 08 Feb 2025 10:01:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739037692; x=1739642492;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6dCmroAW6RpkGuBgIwZ/0+Jobj4fzGLlPME8BOiz8Kk=;
 b=LLCnE+Mxx2yQ877AYsi82EuXvy1+1O1N+Z1DPhPLsZKBLrmzQrpuXzJ4C0/8pLxVfr
 lu/wFLO1cC8XN4V71Wlb31MGVDP92KalVdamCcHy4kJui4iWv8ABNMH8CX48IRPHo4IC
 pHIResG+d1tR6/Y7K5CkfR3ixNfbeCyVnnrXxXOVa7cLIuXfGM8hGvxC5mPNc3KjQMif
 TIrb9z3j0CZP/FI+A2tVD2pAa62Ba8ssv1TUXY5w2fHwKmMo52gPE7XopvGaEA508hZh
 DXNcFnwR1mrMtWrP3Zrv4nICGbVkLVbk7ytZK29UoD9N8Yl/Ae3NUq1m/XrmFET3VMQZ
 DZsg==
X-Gm-Message-State: AOJu0Yxp1h9L5Na8Xt99In0WZ6u5SL5kUM0gd1pl2/YITlsljQYsCeAh
 32pnndwJctxM1J0aAm/F5oWsMn5VLptQLnFRhFVEZZ1Czoz599xPamlz9LT/ww2dLQ==
X-Gm-Gg: ASbGncvTwb8qWS+zGXoSaRJ8NBZU9Zm0YQqa34n8fsO9qL07JYdkarxNIcG1ImFLRmq
 /7MpPJ+g1ps/nfLMZHZhqY7z4wTaSTr4xVAloP0QQV8ag1wr7DMHH2UTPYfuM4YjMbAHnRatu5M
 gXMoa/+SIBK0B4Di9AI+Le8DN0SJxBGbaXhK5zjB1INBrHXjNS/ff8aIQDv8nxN2JA8FYCeCwTy
 i1jAkd75UPS0jD1UzYoi/crtqzHd0BtPuk+FR8YIm3eY8YG0/QI15Q80/41jYE0OKQWQE7V26vx
 BYqIAe5G8yuX
X-Google-Smtp-Source: AGHT+IGiqL97npa2g4pHcbodEv+jdcW/E1dWA34N0EP+VINvGpSMQLc3aKN8V+uKg0XSd729Y4F9xw==
X-Received: by 2002:a05:600c:1c1c:b0:434:a1d3:a321 with SMTP id
 5b1f17b1804b1-4392497e6d5mr76840045e9.3.1739037692186; 
 Sat, 08 Feb 2025 10:01:32 -0800 (PST)
Received: from nibiru.. ([2a00:1370:8186:2b9c:75b9:fbac:c14:d694])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dc6c80df2sm5798597f8f.18.2025.02.08.10.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 10:01:31 -0800 (PST)
From: Sergey Bobrenok <bobrofon@gmail.com>
To: buildroot@buildroot.org
Cc: Sergey Bobrenok <bobrofon@gmail.com>
Date: Sat,  8 Feb 2025 21:01:03 +0300
Message-ID: <20250208180103.101825-1-bobrofon@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739037692; x=1739642492; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6dCmroAW6RpkGuBgIwZ/0+Jobj4fzGLlPME8BOiz8Kk=;
 b=c2lBQiuakTLpUC1ceBbimmmyZULpXUUgaw0FwC4IKxA+wbxtwaB6rxKjOZqSxvjZ0k
 EoTt5xG3BzmkdE3spc9fYfBP+wqXLz4R1vIWHwYkqjNvXiEbdXMQec6W9iK+8B1vPrwK
 nXMv/Rn2Mxt1TWaOolisOiKJ09I94JebOCAtLygWZ3AXg/IiAVigElApqBnlXdTBz9SW
 UcRDZvVY4p/AvPIGaKClvz3oa4ZRRmTJOWe7TWknPh3iodkmBQuGXqsWXdpTNjWaU3jj
 /kq12HivgRrrwHhndDr/AUDpRTAmFJd8Pny9nC/I9TvTeCcp/cPqleBHLTUbL0PMMYOK
 Zafw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=c2lBQiua
Subject: [Buildroot] [PATCH 2024.02.x] package/sdbus-cpp: fix build failure
 on gcc14
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

The original commit [1] was merged [2] in sdbus-cpp v1.5.0.

Fixes:
https://autobuild.buildroot.org/results/bd0a9fe123956f01336462a31c3375a036744234/

[1]
https://github.com/Kistler-Group/sdbus-cpp/commit/f50e4676fe9289eec0744efae2216aa8795fa461
[2] https://github.com/Kistler-Group/sdbus-cpp/pull/380

Signed-off-by: Sergey Bobrenok <bobrofon@gmail.com>
---
(2024.05.x, 2024.08.x, 2024.11.x and master are not affected as the
version was bumped)
---
 ...missing-algorithm-header-include-380.patch | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/sdbus-cpp/0001-fix-add-missing-algorithm-header-include-380.patch

diff --git a/package/sdbus-cpp/0001-fix-add-missing-algorithm-header-include-380.patch b/package/sdbus-cpp/0001-fix-add-missing-algorithm-header-include-380.patch
new file mode 100644
index 0000000000..df4b78edca
--- /dev/null
+++ b/package/sdbus-cpp/0001-fix-add-missing-algorithm-header-include-380.patch
@@ -0,0 +1,29 @@
+From f50e4676fe9289eec0744efae2216aa8795fa461 Mon Sep 17 00:00:00 2001
+From: Alfred Wingate <parona@protonmail.com>
+Date: Thu, 16 Nov 2023 21:26:42 +0000
+Subject: [PATCH] fix: add missing algorithm header include (#380)
+
+* https://gcc.gnu.org/gcc-14/porting_to.html
+
+Using gcc 14 uncovers a missing include in Message.h
+
+Signed-off-by: Alfred Wingate <parona@protonmail.com>
+---
+ include/sdbus-c++/Message.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/sdbus-c++/Message.h b/include/sdbus-c++/Message.h
+index 915a071..9c85c01 100644
+--- a/include/sdbus-c++/Message.h
++++ b/include/sdbus-c++/Message.h
+@@ -42,6 +42,7 @@
+ #include <cassert>
+ #include <functional>
+ #include <sys/types.h>
++#include <algorithm>
+ 
+ // Forward declarations
+ namespace sdbus {
+-- 
+2.48.1
+
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
