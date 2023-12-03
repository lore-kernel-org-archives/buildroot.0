Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC9CC4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 22:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2981B4047D;
	Sun,  3 Dec 2023 22:25:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2981B4047D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8uwIbwaBT4UP; Sun,  3 Dec 2023 22:25:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D2EA40972;
	Sun,  3 Dec 2023 22:25:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D2EA40972
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8DC271BF3DA
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 22:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 739298175F
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 22:24:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 739298175F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4gRPiHehyPJW for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 22:24:04 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 44F038175C
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 22:24:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44F038175C
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40c0a074e71so5534175e9.1
 for <buildroot@buildroot.org>; Sun, 03 Dec 2023 14:24:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701642242; x=1702247042;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GApN29EQWeqUJKLd8MeD0zuV5DR/N8U6U91jJ3d8kAo=;
 b=tzmnmnLtt4scPUDdUjQLaYGuSPUMhfxLL3ZzFv2qKx7g+qMgH/Q/He9RCT5D8Iu9Ci
 cnftipD0Ev8slOIdPAlW7NLEKZn/TOzOfcMmaeypk/TB6cYRX2rlD9nqyGdRBqGC1nZd
 U+wlb31lj+cHP6VodjkzRlz27juD6Ydp7H0iOzQmg202XoEL8uxN0qzD6ri8quHr+jEv
 dGVdYQZ99AtkjYwiKQ96unq8ICbCsA+QEpIepNdhrOMadnd6RPCR5jH9GgyAmq9FU1kV
 51Kfx83jNldac9hPemKEAxa2xD/8NKpKmtBNeyHs5HGmfyvC21yw0V7+wDq47BZeZOWU
 719Q==
X-Gm-Message-State: AOJu0YzvuFO3mLXwRoN1eFAS3fPdVtz9g2k4nIK2OuOqb3B6Wf4UA3fJ
 8C6/mBfV26sxDtkoCzcOonaYV7PYqlo=
X-Google-Smtp-Source: AGHT+IFweZ+4SJ8wFpqUO4OktgdNxxoQvaHVktVy+LLvBX79U6L8ERHKr9YyDOncWAo0qzlld4tOwg==
X-Received: by 2002:a05:600c:42c1:b0:40b:5e22:971 with SMTP id
 j1-20020a05600c42c100b0040b5e220971mr2499756wme.96.1701642241586; 
 Sun, 03 Dec 2023 14:24:01 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 t3-20020a05600001c300b003333b8eb84fsm4540270wrx.113.2023.12.03.14.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 14:24:01 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Dec 2023 23:23:56 +0100
Message-ID: <20231203222356.350329-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701642242; x=1702247042; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GApN29EQWeqUJKLd8MeD0zuV5DR/N8U6U91jJ3d8kAo=;
 b=IRzfozHcEfvuJbd2OuWHS+Yk6X21OfHjdr2Vgp4NN2gtSs+wBUrvVGHWr4zLsJW9bK
 yUac8wao28ac08di69bc16jxZL7bgYHj2oB0zYJ+8VU/3Ffs75yfsnv9cGkzKDtfT4KW
 sflj2jzpeb8Ge5TbEkjkEww5GzF8NSehFHOr5UBSN/kkyYglb7dL8K9DZHevdfT6tyco
 uilO67ojYro2fdGyLeD397qG2IUOKzOyBVLrV2QHdxsYCfPDgAAo5vV7yTYP/oj/guf/
 dl+HQairzsBQ8ZrBxWyt3dMPrIbK2VhW11CNRj58gxGxthBCprxi8U0ZxFMr4tkcrf5E
 /kuQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IRzfozHc
Subject: [Buildroot] [PATCH 1/1] package/wireshark: security bump to version
 4.0.11
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

Fix CVE-2023-6174: SSH dissector crash in Wireshark 4.0.0 to 4.0.10
allows denial of service via packet injection or crafted capture file

https://www.wireshark.org/security/wnpa-sec-2023-28
https://www.wireshark.org/security/wnpa-sec-2023-29
https://www.wireshark.org/docs/relnotes/wireshark-4.0.11.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index c9b693c9cb..a6ef69b1af 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.0.10.txt
-sha1  830ba7ff602da90323bbc5ec15941c0878d9ee4a  wireshark-4.0.10.tar.xz
-sha256  b2e3ff03fa2be9058a9ffbedd12b0a670433bd16c8cc6c432ab48dabc2df1898  wireshark-4.0.10.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.0.11.txt
+sha1  4af3140d69f9d41e1c4e161fad66304a6920ddce  wireshark-4.0.11.tar.xz
+sha256  4c341cc33a6c512d983f4126e6f3e5c249f604e14ab7f337d38b1cbe58199e3d  wireshark-4.0.11.tar.xz
 
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 2f563950b2..6fb4b60f2b 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.0.10
+WIRESHARK_VERSION = 4.0.11
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
