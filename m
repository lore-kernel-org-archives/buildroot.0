Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EFB1CA0EE4
	for <buildroot@archiver.kernel.org>; Sat, 16 Aug 2025 08:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F282F61504;
	Sat, 16 Aug 2025 08:29:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7H3Mpo9lBmng; Sat, 16 Aug 2025 08:29:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15B656125B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15B656125B;
	Sat, 16 Aug 2025 08:29:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B5AF3959
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 08:29:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C2B440B0A
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 08:29:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RChIx3dn2RZs for <buildroot@buildroot.org>;
 Sat, 16 Aug 2025 08:29:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0F3A24004D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F3A24004D
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0F3A24004D
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 08:29:50 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-45a1b066b5eso11866925e9.1
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 01:29:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755332988; x=1755937788;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kLoR1jRo/ykSkEBKqXtoxWghu7ebWlIEf3Cn4I13TNU=;
 b=n8/BuLVQJhxxyGaaBGAeLShF1COuuBnwL/hHDO6He+y08ikVE7Cr9pebCZFVneIHMv
 zrALqirnyFsmIUXYhWnxVmS/nx++hTynWNZ6YXJxXQr9vmWfa9gUxxNGJGiuO1uT2Bbz
 UvTy6k8Jex3aqNSqcb4jpiZz56R5ZOO0+sA2IWi80naWJzBENMXKbpmcX/0egjtzDtoh
 WJXIpQCdWYt6ww/1qVRU+YIwbDyCgy0X1yeGgfL8OBcJ6abXZMi0qZTYj+mHq/N3XZse
 KM4+gkTLaupL4iTMOoyxxEcWi7nodg/3D5fnzaVIPkx/nRqdmNjBx1ip0Z9PPRcqLD3q
 fJVA==
X-Gm-Message-State: AOJu0YxcDbunmWdylRj++2rpx/odn5SbEk8sbWt46QFokZ3qqjSMuUPL
 3K7NlIgYkPdaSRlaq1ukbXUQmT94b8gr5+kPYW96wBbpNbXQm9yCs5zhzn1hPQ/Yylb2grb7ahz
 W9+VrIPw=
X-Gm-Gg: ASbGnctFn94pjKkwTN/C+vFJmGQZ8ULDYZVdP6arNWIWGgCAlnwoO/ersec9zREL0v6
 cIUgu0gilfBF4u8yNWffr3O+n8Bhw/JfbrCPWb+1fCFgl4Fw7wHMLR06dPWqN7q12Mv95U3bt3W
 7gmHeu/Fc0e9R91xLVTdQb08nDDQ2J6LwBJnAWuwYpDsQi641MQSXDVdHRS4Yvs4wDJ4C0TBUwr
 6Ue22VbhpE2LC61gYuvUuVA2nwLDqPLt1a8gcL8hd0WDiZclqkR+PIEDSsVr/0ifZeX69MqcepO
 FA20FXU7o4x8N6UHkWk0dulknKcBJMFYMiGQfKYy/X6oevCjxAysa1cPSSUxGv7uJWl/SizviYw
 cMkHx2RXpA2YdZQ==
X-Google-Smtp-Source: AGHT+IHSgp+RN69qJ8f4S6NnRe9JgY3WtL/Xcco/IizL31s+XRl1FJhiIbNvH1Gn6NCr+wy+mkRptQ==
X-Received: by 2002:a05:600c:458d:b0:456:1a69:94fd with SMTP id
 5b1f17b1804b1-45a217793f0mr47474255e9.0.1755332988241; 
 Sat, 16 Aug 2025 01:29:48 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1b78fed0sm49785435e9.1.2025.08.16.01.29.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Aug 2025 01:29:47 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 16 Aug 2025 10:29:47 +0200
Message-ID: <20250816082947.2947807-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755332988; x=1755937788; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kLoR1jRo/ykSkEBKqXtoxWghu7ebWlIEf3Cn4I13TNU=;
 b=FvuXGR4Dry+VZFvn0Cbt0bvZgZd+lIGQfWNvyySvguw07h2zkUvxoALg8DXO8COJJZ
 mIUwgoYjtTvUVjz8U7GLuIDSs8bnyul8+/TomaHEjHd74Rz56k154eh92LbRHruizaIu
 NVWw3LCxiWEq50jk5W+mazOrbegkdf0yjwMpoykM3+pgHSLTmqsfAQvvHFFLjbci+PwX
 fTzMEJSJ8mFoUdmLpwJvKURayZ4vmOMLwP725OIO853oAIL1KeLg0hFoEJxvgHyZuTko
 9+sTMnLiP6yvhtDQwDSicHuDtq5PwgaYuu/4zTQfEtZ88R3ADXAurHbDjKlsEwmKdg65
 jnXw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=FvuXGR4D
Subject: [Buildroot] [2025.02.x,
 PATCH] package/quickjs: add patch for CVE-2025-46688
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

Fix the following vulnerability:

- CVE-2025-46688

    quickjs-ng through 0.9.0 has an incorrect size calculation in
    JS_ReadBigInt for a BigInt, leading to a heap-based buffer overflow.
    QuickJS before 2025-04-26 is also affected.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-46688
  - https://github.com/bellard/quickjs/commit/1eb05e44fad89daafa8ee3eb74b8520b4a37ec9a

The patch is different from upstream since the BigInt implementation has
been added post 2024-01-13 (see commit [1]). The BigInt fix has been
stripped out to only keep the buffer overflow in the string
implementation.

On master the following CVE has been addressed with commit [2].

[1] https://github.com/bellard/quickjs/commit/61e8b9442840bf94a2a9b0b872c8b3a197c1eac3
[2] c5c7c44fa5 package/quickjs: bump to version 2025-04-26

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...ow-in-bjson-string-and-bigint-reader.patch | 29 +++++++++++++++++++
 package/quickjs/quickjs.mk                    |  3 ++
 2 files changed, 32 insertions(+)
 create mode 100644 package/quickjs/0001-fixed-buffer-overflow-in-bjson-string-and-bigint-reader.patch

diff --git a/package/quickjs/0001-fixed-buffer-overflow-in-bjson-string-and-bigint-reader.patch b/package/quickjs/0001-fixed-buffer-overflow-in-bjson-string-and-bigint-reader.patch
new file mode 100644
index 0000000000..ae4d8cf43e
--- /dev/null
+++ b/package/quickjs/0001-fixed-buffer-overflow-in-bjson-string-and-bigint-reader.patch
@@ -0,0 +1,29 @@
+From 1eb05e44fad89daafa8ee3eb74b8520b4a37ec9a Mon Sep 17 00:00:00 2001
+From: Fabrice Bellard <fabrice@bellard.org>
+Date: Mon, 7 Apr 2025 18:40:49 +0200
+Subject: [PATCH] fixed buffer overflow in BJSON String and BigInt reader
+ (#399)
+
+Upstream: https://github.com/bellard/quickjs/commit/1eb05e44fad89daafa8ee3eb74b8520b4a37ec9a
+CVE: CVE-2025-46688
+[thomas: backport JS_ReadBigInt function not present in 2024-01-13]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ quickjs.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/quickjs.c b/quickjs.c
+index 9be262e50..b2470ba64 100644
+--- a/quickjs.c
++++ b/quickjs.c
+@@ -35652,6 +35652,10 @@ static JSString *JS_ReadString(BCReaderState *s)
+         return NULL;
+     is_wide_char = len & 1;
+     len >>= 1;
++    if (len > JS_STRING_LEN_MAX) {
++        JS_ThrowInternalError(s->ctx, "string too long");
++        return NULL;
++    }
+     p = js_alloc_string(s->ctx, len, is_wide_char);
+     if (!p) {
+         s->error_state = -1;
diff --git a/package/quickjs/quickjs.mk b/package/quickjs/quickjs.mk
index 2bd9da1392..215deb8137 100644
--- a/package/quickjs/quickjs.mk
+++ b/package/quickjs/quickjs.mk
@@ -12,6 +12,9 @@ QUICKJS_LICENSE_FILES = LICENSE
 QUICKJS_CPE_ID_VALID = YES
 QUICKJS_INSTALL_STAGING = YES
 
+# 0001-fixed-buffer-overflow-in-bjson-string-and-bigint-reader.patch
+QUICKJS_IGNORE_CVES += CVE-2025-46688
+
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 QUICKJS_EXTRA_LIBS += -latomic
 endif
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
