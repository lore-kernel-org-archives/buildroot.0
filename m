Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C35C7115D
	for <buildroot@archiver.kernel.org>; Mon, 23 Jun 2025 08:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2482660E7B;
	Mon, 23 Jun 2025 08:19:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DQxgsPHfkOWG; Mon, 23 Jun 2025 08:19:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 418CD60E94
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 418CD60E94;
	Mon, 23 Jun 2025 08:19:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D614D154
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 08:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BBDA940898
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 08:19:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BlQXY-Fp-GLz for <buildroot@buildroot.org>;
 Mon, 23 Jun 2025 08:19:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AFDE540893
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFDE540893
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AFDE540893
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 08:19:13 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-453398e90e9so25036195e9.1
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 01:19:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750666751; x=1751271551;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qcIGhZGJAWKxyYWZFwiQpArx92CYv1dg91KMwAwwrAI=;
 b=Ln40Evvfns0Vgod3kosTvgglQaw1+tAH4Glyr1iOQvHzE4kCRtHxKbcv5JV9TfqynH
 AD/dazNjTY34Iozkz98fDbbTy8D4BzUGQ3scw3JVzgnFxh6dzUSv3SHxq83qKf9N5Iyu
 lbmz+rmuQTRsMHiF0eQIeobighI8fVn5ik0Q61zhyKIkc4wbvovEZaJu+qICNhTnjTCL
 bLEBgVc/U1UZiyb02mWxn01CinNlLvjW37CknrwZ8W6X1GGARdU36lHlaX8IWTmPz9dv
 L7tzGKpOsM8kE8w4j0wBU3NWswuQDKmP9yLzD91d/yHTR/KkNvtU5BOoIqA9H9gZIprS
 WqTQ==
X-Gm-Message-State: AOJu0YzHi7hlAFE7t9GXGKb4qfQqie1PYxEE9IlnpAY7sSERYs22R0ni
 FwNsPb3i0LvcYUiDMt9n4qaaezXi7sKW3xGGTrMMPOvvinzXP5987Y1+Vt6CNXiwiGnQN2Rkci9
 N10pl+t0r3Q==
X-Gm-Gg: ASbGnct6PpWz++uVCIi9l6JtEzAGFIrZbfI6URnC6tqQJeQ+1xHqDUCjeuIPFz9CcBU
 YSsVLJRVi3GXjFpCFWZbIBT2Hu8GPhwS5+X/IRGkwONI8zFJZIL/t5FnaT2qUMppFFZ15Y5OTqo
 QtjPwF8vqvpuD4d9hy1drNQOhmIFQoggj014BFsCpu8nOaeUZBZXB8kJM91132XkXZBJpBgEkeL
 3b8HQHP6gmtuSUeX71vrTwJgGUuajPTN+EpqsRJkFrc/gI55HtdO2+sDSKy0kwtSNw9K9NSEBrU
 T/V3Dpdh6HCYV4C0kDxQZtvglCrd9qRxJDwDE6atomr5myvexZvXADeGCoZx1SqidcRc2vjpckH
 9tuDLsQJDYyq54a2ttw==
X-Google-Smtp-Source: AGHT+IHSoioac6sZrFzdkUYCm5KzembYnymUCw8/ZxY/HIq/Zrx/Tt73zxV0cxVc2PLoNm1B/Dd08g==
X-Received: by 2002:a05:600c:1991:b0:444:c28f:e81a with SMTP id
 5b1f17b1804b1-453659f5888mr94318305e9.27.1750666751086; 
 Mon, 23 Jun 2025 01:19:11 -0700 (PDT)
Received: from dragon.local.ess-mail.com
 ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4536470370fsm101896765e9.29.2025.06.23.01.19.10
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jun 2025 01:19:10 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 23 Jun 2025 10:18:56 +0200
Message-ID: <20250623081856.644237-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750666751; x=1751271551; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=qcIGhZGJAWKxyYWZFwiQpArx92CYv1dg91KMwAwwrAI=;
 b=KOQ1J76eQNJu0ppMJoq/lydoCq8OO8cAP2xAIsCMaeDb3dENyF1RmVMoZtTzmtJfHU
 SPbfTYGKTEt6q9yW6yeKos9sONk28CPJLaW/smTeohJ1QFlzxjMwCo82qyzTsg6l6NE8
 uN28Lwi+DELD5lSmVdOVT8ZT4X3XSO2/H0rbssNaYzFVwgwsNhS5F/mS0EYvI6NzBMbz
 /y9c8CFVIkYjefKs7Un8nvYt7SSBaIwSqZn+IBA+42umi9AMjDpTjjnZlGDTyrlOSnu8
 a7koTar4D2UyauiadPi3mUqqOHQK8mwxz+1+71Zwbjmi45x9BvvTTqQbtLinL+z5rL6n
 bD0g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=KOQ1J76e
Subject: [Buildroot] [PATCH] package/waf: bump to v2.1.6
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See the changelog: https://gitlab.com/ita1024/waf/-/blob/waf-2.1.6/ChangeLog

Tested with `./utils/test-pkg -p ntpsec` (ntpsec is waf package)

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/waf/waf.hash | 6 +++---
 package/waf/waf.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/waf/waf.hash b/package/waf/waf.hash
index 8255ed4f60..061a093c55 100644
--- a/package/waf/waf.hash
+++ b/package/waf/waf.hash
@@ -1,7 +1,7 @@
 # Locally computed
-sha1  523f645690747501b19e0d107a044de514ba80b4  waf-2.1.5
-sha256  9d0b5d13e85f781b6976cfefb909b76cbc94a07419fa95d34216dca744257786  waf-2.1.5
+sha1  d11579fb088200adc5e6bf6c96e31fcb7afd94cb  waf-2.1.6
+sha256  4bc4587a11925e19739da021e021a5764d39759fada85563bc6d4ded17515b14  waf-2.1.6
 
 # The waf script also contains its license, but is renamed `waf` in the extract
 # step, so this is a synonym for the above, to check WAF_LICENSE
-sha256  9d0b5d13e85f781b6976cfefb909b76cbc94a07419fa95d34216dca744257786  waf
+sha256  4bc4587a11925e19739da021e021a5764d39759fada85563bc6d4ded17515b14  waf
diff --git a/package/waf/waf.mk b/package/waf/waf.mk
index 88b8d9096e..911dcc5fc6 100644
--- a/package/waf/waf.mk
+++ b/package/waf/waf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAF_VERSION = 2.1.5
+WAF_VERSION = 2.1.6
 WAF_SOURCE = waf-$(WAF_VERSION)
 WAF_SITE = https://waf.io
 WAF_LICENSE = BSD-3-Clause
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
