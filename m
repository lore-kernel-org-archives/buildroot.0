Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 886EEC021B8
	for <buildroot@archiver.kernel.org>; Wed, 26 Feb 2025 19:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29A8981E08;
	Wed, 26 Feb 2025 19:52:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z-k5ZFX6Gjd2; Wed, 26 Feb 2025 19:52:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4648F81EBF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4648F81EBF;
	Wed, 26 Feb 2025 19:52:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A72A68
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 19:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19D2281EBF
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 19:52:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ISTrZ3AcdIC0 for <buildroot@buildroot.org>;
 Wed, 26 Feb 2025 19:52:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com;
 envelope-from=kuzminov.sergey81@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 125CE80E8B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 125CE80E8B
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 125CE80E8B
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 19:52:10 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-3092643f4aaso2112181fa.1
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 11:52:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740599528; x=1741204328;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UDKMws+/PJRZWdx9hAYvniGpNAE75NpeypZW6cxSd8s=;
 b=pe1WNzzXi1rOvezie2KgvEvqFGvDZuqG30WaRYYqClhCxVN1gvfM3WcRQG6LdYO800
 Z/RYJxzn1zu4g2jvVbDXa7r6N1qx+du0oAiFwI4NXwWSQoJ2N/mu5gqfmlfSgMx/BCSm
 P4cw4/UBT/B8eVqBQLxTiU2Cp1CpEcdQByAINziek/JTLWloBVKldMcfRgiNYOlGRf8k
 KmIsu92AIXqp6GdLQaKl2oPpjXUU8KG4WeOe9Omc6x/zJp11JGXLaO9LJwLd7G03YSS4
 7GqlZmPLsNPvxR689uYsgqJjIR4sevrjKvw1tuLdS2jpaeJe8QIdnKRPkx+4sMmSctWn
 EGhQ==
X-Gm-Message-State: AOJu0Yz7bDWBfIrgAOc5Or0Oq8GL33d2pYh+9hqqQ+qjEZZZryY2zygL
 hOzeDNFh/Q5zol/xOPEOIhKK2faw2nroqW+vX5AWscCxMWqCPesUpzIFPA==
X-Gm-Gg: ASbGnctAydP9g+lTd1zLNj0ZQkiOfrE03AMw1KowD8LO9K6RH/hQSwtWVZkLhVRn+4f
 gnG65NDjxqBw/IeEXmj7TBrp0xeB47/cdrA0iKO7cRESOATJl0TLrrBOykyiLiZCBXfX3Haawbm
 3n2sEk+0lQunCcusLXXgaZmFe7I//8dBCqu6fvPQmM0/arTQtOyqdQv+TkkEhfzyfpVe/r1F6f8
 vyhrphl6WBH0hOdBcbvfYCBsNdolcfvcqB87PmEQXvYDcnluCKB0h5mqK40jOJUUbqvxrXL/9J1
 qqXYk3iL1rK9ilJiSdH2carrr3JXg7h0cLmZ5QFfoQ==
X-Google-Smtp-Source: AGHT+IEhcIW+DmLxsW8bHiD+AJiu8IZdHyiCpZkM5w+N7b8mBj/0xe0SmHMBIFzvQ4+DzaTTiJzrxQ==
X-Received: by 2002:a2e:920b:0:b0:309:20ad:c514 with SMTP id
 38308e7fff4ca-30b84575588mr2437711fa.0.1740599528160; 
 Wed, 26 Feb 2025 11:52:08 -0800 (PST)
Received: from calculate.local ([188.191.244.248])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a81ac3151sm6122221fa.68.2025.02.26.11.52.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 11:52:07 -0800 (PST)
From: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
To: buildroot@buildroot.org
Cc: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
Date: Wed, 26 Feb 2025 22:52:05 +0300
Message-ID: <20250226195205.4847-1-kuzminov.sergey81@gmail.com>
X-Mailer: git-send-email 2.45.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740599528; x=1741204328; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UDKMws+/PJRZWdx9hAYvniGpNAE75NpeypZW6cxSd8s=;
 b=UsvlfVgbONATrvlpsyZaIl1vGUg/e66G4UOtnVA+KmKTgfllOlz6SisIk4K0iwoQDv
 w8vPSU/EvTQxvoVed73mtuuKKYSYE1GSJfGaT8rR5YKvwmD1Rdl0TzdMvcnJN0bSBlSg
 1nV59+tphW/pfLL9nhsF8PMieNwkC6QQnBcV9ndbTE46APtHmzA2N9LpWRf84tSfq+Ku
 CgosXQYzwWzUAbOfOMOseRQROBIuI4osF3Q+Wp/A3Cwh3S/fUj/mOx8zePDBcc777LHF
 qGZtJYdIEWMfHyIcITS/sPuhh/ATDK7d73yVdtPhWnr8u6EXg8SbjKUSZTOfwX1IEL2s
 h7jQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UsvlfVgb
Subject: [Buildroot] [PATCH v2] board/friendlyarm/nanopi-r3s:
 rk3566-nanopi-r3s.dts: enable hw random
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

This patch enables the hardware random number generator in the device tree.
Without it, the entropy level in the Linux kernel increases very slowly.
To check the entropy level: cat /proc/sys/kernel/random/entropy_avail

Signed-off-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
---
Changes v1->v2:
 - Upstream: not applicable
---
 ...001-rk3566-nanopi-r3s.dts-enable-rng.patch | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 board/friendlyarm/nanopi-r3s/patches/linux/0001-rk3566-nanopi-r3s.dts-enable-rng.patch

diff --git a/board/friendlyarm/nanopi-r3s/patches/linux/0001-rk3566-nanopi-r3s.dts-enable-rng.patch b/board/friendlyarm/nanopi-r3s/patches/linux/0001-rk3566-nanopi-r3s.dts-enable-rng.patch
new file mode 100644
index 0000000000..62b4599c75
--- /dev/null
+++ b/board/friendlyarm/nanopi-r3s/patches/linux/0001-rk3566-nanopi-r3s.dts-enable-rng.patch
@@ -0,0 +1,30 @@
+From 284e6683b4a0ee6b1fd22ccd34785e1f2d58c115 Mon Sep 17 00:00:00 2001
+From: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
+Date: Tue, 25 Feb 2025 19:49:00 +0300
+Subject: [PATCH] rk3566-nanopi-r3s.dts: enable rng
+
+This patch enables the hardware random number generator in the device tree.
+Without it, the entropy level in the Linux kernel increases very slowly.
+To check the entropy level: cat /proc/sys/kernel/random/entropy_avail
+
+Signed-off-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
+Upstream: not applicable
+---
+ arch/arm64/boot/dts/rockchip/rk3566-nanopi-r3s.dts | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/arch/arm64/boot/dts/rockchip/rk3566-nanopi-r3s.dts b/arch/arm64/boot/dts/rockchip/rk3566-nanopi-r3s.dts
+index fb1f65c86883..a89bdbf71e12 100644
+--- a/arch/arm64/boot/dts/rockchip/rk3566-nanopi-r3s.dts
++++ b/arch/arm64/boot/dts/rockchip/rk3566-nanopi-r3s.dts
+@@ -552,3 +552,7 @@ &vop {
+ &vop_mmu {
+ 	status = "okay";
+ };
++
++&rng {
++	status = "okay";
++};
+-- 
+2.45.3
+
-- 
2.45.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
