Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E06C27C4F
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 20:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 235ED402B3;
	Sat, 15 Jun 2024 20:42:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PJ_s0DKrpm7v; Sat, 15 Jun 2024 20:42:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB8DC404D1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB8DC404D1;
	Sat, 15 Jun 2024 20:42:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9B2E61BF2FB
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 20:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 947FB404D1
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 20:42:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ohOEyW31clWC for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 20:42:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 32387402B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32387402B3
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 32387402B3
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 20:42:42 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4217990f997so24492355e9.2
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 13:42:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718484160; x=1719088960;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hmd8J/17YFZQZza7FN8hw0VYaIKawBAVMH728RMhmyE=;
 b=OSlm/KgMR+G5OWTSRwmsqske0rYajcZPSXwfs90mOSllVHSKG14LRd9lQI1T+uJORT
 5m/cx4MX6zLw0BPwFPmNQOmJZYnHLx5uQSxIXGIgnLmG3Yip0tOO7N9LuExIKoYvzPgu
 FzHPfSNPLk+CKUVFC6wiBycipxfMiz6/TBEik+p/RkHKhPwZ4GE8znSNdlc7PSNRkz11
 ZFhMx99t5aYTbZqf6BwyYueGbSGYPvwIrfZNa12hj1gWgITa8UWS8usJ83iqFp5qYpig
 0g3tHeYGxsYmJTGCsV4GWflcW1/DcRoan0R3HgsQuhTPn1TbdV93pTTu71v7tImTgqIM
 19Dg==
X-Gm-Message-State: AOJu0YwqHicw1jrcHLalkwjOhQnao44X/pcomQro/6zcgJTAetCZAaJN
 JHWHFJMa7rerp1lWhOskBw8lX6zbWSXzzKhBeaYXt5IKOnJ/QTF2c9Zkew==
X-Google-Smtp-Source: AGHT+IGkUTInjjxIJ6zQcGO2OeWbOtfz8h38e+fYmQoqMC5hK9vdoTtmT8GTgWQJMgBSAHLxjx1ubg==
X-Received: by 2002:a7b:ce97:0:b0:423:b6cd:8ea5 with SMTP id
 5b1f17b1804b1-423b6cd8fcemr15984115e9.4.1718484159532; 
 Sat, 15 Jun 2024 13:42:39 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422874e73e8sm147011795e9.43.2024.06.15.13.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jun 2024 13:42:39 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jun 2024 22:42:33 +0200
Message-ID: <20240615204233.3339310-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718484160; x=1719088960; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Hmd8J/17YFZQZza7FN8hw0VYaIKawBAVMH728RMhmyE=;
 b=jvXEUHReXwM5D/lsnUoqd8BX4phHr9Vjf4GODhCnOhKa8q2sE5BER+KPPdNdy6Uykf
 rY4DXGJlrznBcRCXrC3gFWacEIqZHKxGdGL/W2/69kc3L5u07HTqTmf7ELFoTgQvRJk8
 Ppcr89E/gQXAJcyGv5f3O39tp8jM9zkj/Z2eC1wmptq42d+s5MIgqtEN2rBn9nBnf/+f
 uKVQkMIZamKijcMKP6Pz5UGLo5Cl/+hI3uYxThEAYMtABvDb7qn13OXMeBB78YMf2NJI
 2uyQBE+5N+vzrdSy5a72TRC+FPjDWF+/sBAEda+k4O+svy7lIr2vcbTzbvsRkBLFkCAh
 Lr4A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=jvXEUHRe
Subject: [Buildroot] [PATCH 1/1] package/beecrypt: fix build with gcc 14
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with gcc 14:

blockmode.c: In function 'blockEncryptCTR':
blockmode.c:162:42: error: implicit declaration of function 'swapu32' [-Wimplicit-function-declaration]
  162 |                                 buf[i] = swapu32(fdback[j]);
      |                                          ^~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/651e0e31305b1f211071d94ea74f7b7a5793b03e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/beecrypt/0004-beecrypt-4.2.1-c99.patch | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 package/beecrypt/0004-beecrypt-4.2.1-c99.patch

diff --git a/package/beecrypt/0004-beecrypt-4.2.1-c99.patch b/package/beecrypt/0004-beecrypt-4.2.1-c99.patch
new file mode 100644
index 0000000000..489ce437f6
--- /dev/null
+++ b/package/beecrypt/0004-beecrypt-4.2.1-c99.patch
@@ -0,0 +1,17 @@
+Add missing header to fix C99 conformance in blockmode.c
+
+Upstream: https://sourceforge.net/p/beecrypt/patches/13
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+diff --git a/blockmode.c b/blockmode.c
+index 46d1fde..9998c23 100644
+--- a/blockmode.c
++++ b/blockmode.c
+@@ -29,6 +29,7 @@
+ # include "config.h"
+ #endif
+ 
++#include "beecrypt/endianness.h"
+ #include "beecrypt/blockmode.h"
+ 
+ int blockEncryptECB(const blockCipher* bc, blockCipherParam* bp, uint32_t* dst, const uint32_t* src, unsigned int nblocks)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
