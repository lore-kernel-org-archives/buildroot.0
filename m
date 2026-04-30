Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF22FF886F
	for <buildroot@archiver.kernel.org>; Thu, 30 Apr 2026 05:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C469084A9C;
	Thu, 30 Apr 2026 05:46:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dzKtCY3-rHPs; Thu, 30 Apr 2026 05:46:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B9DF84A9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777527971;
	bh=kCvayE9E8RPajST5PCsW1bCK2oGBZ+rZfInlnKZOQ2I=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ci/DiKHScnIOtVJTw++71lgNyZkmDn0c+p3NiP2jm7804pzHxoDCUG8I8qFRf6jdI
	 2tva5090Fgh5B2Z9Vb82PvH8W/6Vuag2IMuJDnRUuBXfgu/aWMRpT/ZCA/C63pJsQZ
	 Kt7UXQ2nF8Le2ZfnllgPR1vN5MJpmelicKEV88u08SDAJtqwQdwrqXjbKDw9jIOkkZ
	 vwf6p+auz0GTE1SwaJJeRS57huWiLz3r7nf/3fbtiVEDZTiKzw/MQwmpFVBZYMuQtM
	 cu9oQ0pAyv2VEj4biFLDAlomin/XP801rm0KEQ12+SptSeYkew0R/w1PdCJXoLqo6B
	 n7pEh5q8/TdYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B9DF84A9D;
	Thu, 30 Apr 2026 05:46:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D894218F
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 05:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA8E74208F
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 05:46:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jc8tY2b-nGFS for <buildroot@buildroot.org>;
 Thu, 30 Apr 2026 05:46:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0443E40573
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0443E40573
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0443E40573
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 05:46:08 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2ad21f437eeso3581825ad.0
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 22:46:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777527967; x=1778132767;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j7nCwquOeRwz4NuNPnEnCExj01p88lRF8Cq4fTxZg6M=;
 b=CEba12BXRSZF1M/0cX5oA56SJCc4YgR6Nxz9GodhiPIx0bQ9fhnHu+WyR+cpUmyq4K
 7dR4HIDANsoZaGICCQTPnhI7MP3XqNE3fxyQpY1xXec7TiBVV20ar4e0e/NiZF3kGPg+
 had7FVDG22mLvB3JdI1No9AFiww1blfVUOhmU77dUdU30Dv4CDarDAaF3rEwl3jUcuI2
 pUctcp3CGc1TgYDIbrrDALWP7vPKJ/P/QRiGARRqmcACAn/36KocXgMn7eBVqazE5rTr
 aESI1dLx8xDEN5Jac2yYu29F2Mvp/333AX3ntJdz7y5gpVHkVziQwUwWWMzJdWcNKpMW
 aMPg==
X-Gm-Message-State: AOJu0YzTDq8N2/UXTrmvAixBD6CwjfsWLpQzT+OfVB65oATf4FDWOjCZ
 7/ITD8pWAs3kDtiw0/IWmGyyueLpLPOD6XzuJv5eOflR54IymKjDn19Ffwa9PfwG
X-Gm-Gg: AeBDieuk/Kt7BD2RdejM9541TVxiLR0Ei6lvbfq6V+b/QjC+MyPhITems42pdXkNVaD
 xNdn9+MBIxfOjEuuK5gfFHufkY/c6LDWyThw7ZrmZhHHFbkjEWpZcR+REdoTwratnnu6WdCl/k0
 3F5gqMZnvuQ4tAkDTfvQ7uG6otcKgXs/PmdYlC0lgars6uBachyUxgH14JejRH8WtTWF4vjVNZd
 VS5pkAT9sH7syDW+cwKN2wIvvtm+Wuxgm9G1iDOo2HSIEaJgOLnqCLYantW7QYWN8V99pIv1A1r
 Dyc4sbbfiVG1slvnCsCipEvl/Saw8nnq0KAKbTIG4e9cGEGou4X6hZ7wGxaCAKAQEwKNW2MikhX
 0H6sqY7T9WYYlB5EiXujKnoJwA+ozbPyamMBjOXUJQffcj3dzgsDnEoiO5LBm8Y4DemJbswE0PX
 J3YHSqJPJm9P5AWs0vZaHb2xBDfl4tyVSwaAalnt5CqqBCWwsS+C52LFU=
X-Received: by 2002:a17:903:2f0f:b0:2b4:64cf:e8f8 with SMTP id
 d9443c01a7336-2b9a42aae6dmr10753455ad.2.1777527967349; 
 Wed, 29 Apr 2026 22:46:07 -0700 (PDT)
Received: from fedora ([2409:40e5:1178:1c37:1cfb:6a83:ee5f:eeda])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b988798368sm40866925ad.26.2026.04.29.22.46.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2026 22:46:06 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 30 Apr 2026 11:15:43 +0530
Message-ID: <20260430054544.9473-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777527967; x=1778132767; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=j7nCwquOeRwz4NuNPnEnCExj01p88lRF8Cq4fTxZg6M=;
 b=fN6OYVRKEivCNm6Vt+B8fEhiEac6Cq3WNtJf8lulwPMAdugJeLbWv005OH9bXoCaJB
 irQeEDF2t6zkZAJ74DHxAkXuAd0SujmfMxRI7k8uPJaDTRop1hvgw7vWBi8n+YJslFKz
 RP1PaJNPx4W++yJf5PPDL67tZpDXX1wdkGjaBEaWf4THe/clf0+BoaIKd1864WImZhpj
 OYuJdXVlmknWKAFAdGZjb1CzJBnUi8t2Kdc2mKCUCvKQqW1tK5u56FOOOJXVkKd7BDK+
 Z6ih92PCG5kU14rapxYLMl0w1bRwXroSlPVC4oiRTw1yl52xn8XO0oozEhG3lhSPaUC0
 KgIw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=fN6OYVRK
Subject: [Buildroot] [PATCH] package/iproute2: bump to version 7.0.0
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

- dpll: Fix notifications and add fractional frequency offset support
- tc: Add cake_mq support
- mptcp: Show interface names with color support
- devlink: Support param display and reset to defaults
- lib/bpf_legacy: Use userspace SHA-1
- Update kernel headers to 7.0-rc0
- Remove upstreamed musl patch

https://lwn.net/Articles/1067497/

Tested Using:
- utils/test-pkg -a -p iproute2

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 ...ridge-avoid-redefinition-of-in6_addr.patch | 36 -------------------
 package/iproute2/iproute2.hash                |  2 +-
 package/iproute2/iproute2.mk                  |  2 +-
 3 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 package/iproute2/0001-lib-bridge-avoid-redefinition-of-in6_addr.patch

diff --git a/package/iproute2/0001-lib-bridge-avoid-redefinition-of-in6_addr.patch b/package/iproute2/0001-lib-bridge-avoid-redefinition-of-in6_addr.patch
deleted file mode 100644
index c684b030a8..0000000000
--- a/package/iproute2/0001-lib-bridge-avoid-redefinition-of-in6_addr.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 7119f3736f689ab396ca4193ac593938affd55fa Mon Sep 17 00:00:00 2001
-From: Yureka <yureka@cyberchaos.dev>
-Date: Sun, 12 Oct 2025 14:39:47 +0200
-Subject: lib: bridge: avoid redefinition of in6_addr
-
-On musl libc, which does not use the kernel definitions of in6_addr, including
-the libc headers after the kernel (UAPI) headers would cause a redefinition
-error. The opposite order avoids the redefinition.
-
-Fixes: 9e89d5b94d749f37525cd8778311e1c9f28f172a
-Signed-off-by: Yureka <yureka@cyberchaos.dev>
-
-Upstream: https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=7119f3736f689ab396ca4193ac593938affd55fa
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- lib/bridge.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/bridge.c b/lib/bridge.c
-index 5386aa017..104f5858b 100644
---- a/lib/bridge.c
-+++ b/lib/bridge.c
-@@ -2,8 +2,8 @@
- 
- #include <net/if.h>
- 
--#include "bridge.h"
- #include "utils.h"
-+#include "bridge.h"
- 
- void bridge_print_vlan_flags(__u16 flags)
- {
--- 
-cgit 1.2.3-korg
-
diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index e743b4fa0d..c918fcd2b3 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256  9781e59410ab7dea8e9f79bb10ff1488e63d10fcbb70503b94426ba27a8e2dec  iproute2-6.17.0.tar.xz
+sha256  e62890f7b5de63c05a3bf331dc8deb4c015c336013f341a4edf46969797f2f4e  iproute2-7.0.0.tar.xz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 6d69a20126..4ca49d294e 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 6.17.0
+IPROUTE2_VERSION = 7.0.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
