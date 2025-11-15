Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3F7CEB2E4
	for <buildroot@archiver.kernel.org>; Sat, 15 Nov 2025 17:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 363444040D;
	Sat, 15 Nov 2025 17:51:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A1YEs3FJhcUL; Sat, 15 Nov 2025 17:51:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BA02403BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BA02403BB;
	Sat, 15 Nov 2025 17:51:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CD05158
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 17:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A47C83EFF
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 17:51:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PG0l2aTB3q4U for <buildroot@buildroot.org>;
 Sat, 15 Nov 2025 17:51:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AFB7A83EF4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFB7A83EF4
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AFB7A83EF4
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 17:51:06 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b72cbc24637so524049066b.0
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 09:51:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763229064; x=1763833864;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n1KUnv5O9sxAKRYM1C/oj9+4CVvaLjhItjhMKLMGhDM=;
 b=sd5fcy+j/x72MMyWmoLPTQ7nYBNc5olIL3hZtGB+H0iIxJx0B5YHa+WhT1a8nw2YYK
 90zU+1DLjtW3trhH9ZGRM05Fu/TP8VSQVpGPf5t9as1zaURMs2A8QBmrJSXoJK7bEFVU
 oEk6CDHp2QA8N2646ou/SHQv0BGDXTAAEeOsV3suGijDN5WKubyjdfCRTiAtBl3DUp/c
 +2aENWSK1mbxTR4Q6xGSFw/z2yf1KrgcvYBdEl1SyP1EBeV3PUJM9dDpoRWY5jY3y2R6
 C1skynna5jJcijXi68EKTISDBgrLUoytDIsXS/DyruRaC2FBzqjjfhD4rF5kAuWqqWTa
 74bg==
X-Gm-Message-State: AOJu0Yy5lVfagB2d3Na4BVQUc1Mj7aUXiUxPw9ni9ukcudDK/XPUFSlo
 LQvcpxEx786bKEtKIQqXlJ2ziys450cVZvXJADKDLZU+Qbxr77anDlEwr8jj/QLJXvbkbiQ7Pq9
 hek5U
X-Gm-Gg: ASbGncvYhlPGuAJsSsOgxvwUEPwC+tdWg4u84ebQLxdoLXPdx0IgehSuW9GTLwF2ulM
 mUp1gQSi5yUeP0iOEVWBIYAi55OBaFrwNpb1nXXeJcgUJ4HC6nV0w4I0epzWfgItn2d79njclB7
 cWNnIwTa4UVLRzp4Wwq/G75v4w6uSaAD5LjDMOsdlisE3s2gtCviGMgemXoR44UplHI5pH8Z4Hd
 KumD0sq5e92Yu0AoSMJBXRbxqiUaepDGBC2QbEkqucuxoUJyQp1TCIJ4X19LDqACS7C5fbnJbBs
 WFxALFI9/S1sk8fwfMT9A54fng2sS4RN3SkR8OdaD40Bm8UB/wWl6OOWNlxS9o9eHC/Q+7u1gUK
 ysICDX3jhUeKceCtebJTqnDzuKFnLfcdZW/8Yc6uaX5IWZaKRlKRk1O/oTX4lR6ImIvDclBWg+h
 SkTIx+NLZOjCVxUCMf46gP5F2bWM1eqiSyWE8IsSn2ka2V6ld0JvY/lQlJz5Z2EykC6w8Nr7usr
 vOcDpQH93XazaLUV/HhWTrezJFgPltSKv+axFc8jbVF2LzdWtAOk/zG5M5nUH9s/g==
X-Google-Smtp-Source: AGHT+IFn+Tftn6wGkwnZDuA9QJ1dow8TLDe56r4/DEpPqbwisahuAawq+gTrtpHVDKVFz6W8EkwUEg==
X-Received: by 2002:a17:906:ee87:b0:b6d:7e01:cbc5 with SMTP id
 a640c23a62f3a-b7367b9ccfcmr692336366b.53.1763229064358; 
 Sat, 15 Nov 2025 09:51:04 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-54-71-163.retail.telecomitalia.it. [79.54.71.163])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fd8084csm648886266b.34.2025.11.15.09.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Nov 2025 09:51:03 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat, 15 Nov 2025 18:50:53 +0100
Message-ID: <20251115175053.398944-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1763229064; x=1763833864;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=n1KUnv5O9sxAKRYM1C/oj9+4CVvaLjhItjhMKLMGhDM=;
 b=peIH0wtCoiLbwcfldkXWORooxzfjFGiZ1qhfoYK5Wr26GljPxREEmRxPSEUDOiu7K+
 6G/tHzI9h129Fv93dTmWfYknJW/zgRkRk0Qt1kVQRiKl0wZFyt4sT9xIAuEhnAlwplRM
 5pI8QWeCNp0Yber+DPIkfR8KA77r5LNCD7SH8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=peIH0wtC
Subject: [Buildroot] [PATCH 1/1] package/netcat-openbsd: bump to version
 1.234
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

The hash file for license (netcat.c) has changed due to copyright year
updates and changes not related to the license topic.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/netcat-openbsd/netcat-openbsd.hash | 8 ++++----
 package/netcat-openbsd/netcat-openbsd.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/netcat-openbsd/netcat-openbsd.hash b/package/netcat-openbsd/netcat-openbsd.hash
index 267e02f84486..14f51d5174b8 100644
--- a/package/netcat-openbsd/netcat-openbsd.hash
+++ b/package/netcat-openbsd/netcat-openbsd.hash
@@ -1,6 +1,6 @@
-# From https://snapshot.debian.org/archive/debian/20250429T083749Z/pool/main/n/netcat-openbsd/netcat-openbsd_1.229-1.dsc
-sha256  493e3973ffca7fedf0435e498bf18ebc934b1c3aa76db2b29cf80f98d9175a86  netcat-openbsd_1.229.orig.tar.gz
-sha256  c3bff4330a2fe1fbe384861eacbf4f6ad2c59912aa772efad07462644ed9d936  netcat-openbsd_1.229-1.debian.tar.xz
+# From https://snapshot.debian.org/archive/debian/20251023T202923Z/pool/main/n/netcat-openbsd/netcat-openbsd_1.234-1.dsc
+sha256  121c18d9441ec42b92a9b566468a596bbcf673894db8b12d892947552a8e3bbe  netcat-openbsd_1.234.orig.tar.gz
+sha256  008892553774e23a62f4088cdcbd4428f7b764a6cdadfcb35d1793224a697996  netcat-openbsd_1.234-1.debian.tar.xz
 
 # Hash for license file
-sha256  fe62c02c86f4cad7c5c031a1a5601fd2e37e7f2773def39bede8652fe51716bb  netcat.c
+sha256  2b1ce9166023bbd71dec13fdbfc677a42a2d5efbb6b43fc5728e455d9fda339c  netcat.c
diff --git a/package/netcat-openbsd/netcat-openbsd.mk b/package/netcat-openbsd/netcat-openbsd.mk
index a5ea4727af57..a8fff935ceac 100644
--- a/package/netcat-openbsd/netcat-openbsd.mk
+++ b/package/netcat-openbsd/netcat-openbsd.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-NETCAT_OPENBSD_VERSION = 1.229
+NETCAT_OPENBSD_VERSION = 1.234
 NETCAT_OPENBSD_SOURCE = netcat-openbsd_$(NETCAT_OPENBSD_VERSION).orig.tar.gz
 NETCAT_OPENBSD_PATCH = netcat-openbsd_$(NETCAT_OPENBSD_VERSION)-1.debian.tar.xz
-NETCAT_OPENBSD_SITE = https://snapshot.debian.org/archive/debian/20250429T083749Z/pool/main/n/netcat-openbsd
+NETCAT_OPENBSD_SITE = https://snapshot.debian.org/archive/debian/20251023T202923Z/pool/main/n/netcat-openbsd
 NETCAT_OPENBSD_LICENSE = BSD-3-Clause
 NETCAT_OPENBSD_LICENSE_FILES = netcat.c
 NETCAT_OPENBSD_DEPENDENCIES = host-pkgconf libbsd
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
