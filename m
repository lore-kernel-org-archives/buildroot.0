Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704F9CD4F5B
	for <buildroot@archiver.kernel.org>; Tue, 19 May 2026 22:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A32B240BD8;
	Tue, 19 May 2026 22:39:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VpzkjHKBRKkP; Tue, 19 May 2026 22:39:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78E164094A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779230378;
	bh=CkcsY/t8o9gzhfajQQl8ck0NCtUHiSnpY4Ddt09Jeyk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CLrF6Ag9+Wh8KR84tF0IDV7xACZJdp2/HM6QRD4ejo/Qg15LAZIcqmni/HEDJ6Ygv
	 ixTRDV1UnhiZsY7UXfI8RvVzEuFxL1SLuuxAiebMvlR/4kdlpIFisu3tL8LeczeVGO
	 sKvAfmY+S+E4XxPUNc/Zw6veAAVyaNm45JciPBEf+kEXDdT5pvB6jxkrJnT8Sahroe
	 7B2++PWeRHuoIkn9wNDpueekL+B0xrNYoHoO63/8Kj3+c6mbQCGN/F8KqK68Bm4quG
	 AO4IRbuDlpNXbR/R0qnbZ2SCN9hxPSl7WFaLu5QKVh0VwVHXcHoQZwOiR/Ra12GVjc
	 fduuQxBinmEfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78E164094A;
	Tue, 19 May 2026 22:39:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 12122265
 for <buildroot@buildroot.org>; Tue, 19 May 2026 22:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBBB4405F3
 for <buildroot@buildroot.org>; Tue, 19 May 2026 22:39:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 25QcIVa9c309 for <buildroot@buildroot.org>;
 Tue, 19 May 2026 22:39:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::335; helo=mail-ot1-x335.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E1609405C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1609405C7
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E1609405C7
 for <buildroot@buildroot.org>; Tue, 19 May 2026 22:39:35 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-7dca00c1591so1141164a34.3
 for <buildroot@buildroot.org>; Tue, 19 May 2026 15:39:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779230374; x=1779835174;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JbLxN98VRMU7p7lGUiC6ElE9QsBH+03tk7lM2RHr9m4=;
 b=WJ//3kU9Z9r8ytyEbc7+zsYsDXqmW/GSyuL+LUKcGZ0y9WgVirBLnQXBljiPxlWz1o
 cMq+UIKhIBcANnE/f4eiyojjSzbIgnZ+pYPteqcpQIjJ9R0j4f+n6lFpOyn9Atdx83dW
 AnQ4vEu6Xf7r8AaHLnv6ZblpRk2+azNSB+/qV5yfbFktIizFrdyGiujMheX7s0StxuFG
 Ivelqf3X4HKM9xB0vIHYf0LgBArcqyMC9jiE9SkuYmgBVh7cwq/HUT+2SYt1sa5O+dqT
 3ftybEJpkOhr0g6QzwIaROGAjyAd1S2IBOh/Deq7qb+tEz4Uohs8GdhaQHI4GlKRGQsn
 afww==
X-Gm-Message-State: AOJu0YxK5KqCp7thHCmeMQ6eQ2EJAMrPEM/LrARdIatvAXqVjOMH+6S5
 SQrRke+23WpPGWsxcsT61jImapq/uOiDO5xxtZOT4G3jMq03jOdE2FTw2yhccwO5
X-Gm-Gg: Acq92OFQDid7bfM42YU34BF23pWzpAM4tckPagTWameI9MJfKjnGD53KcRen+TcM3h3
 fBA/mbKCmgbLNatT4H57AdCI1W6loTWxhRzUdWb7YL3n5Ov1PVXOBsxjPW8YiDiLcZypflTEs4I
 TtXp/VRU8gys+PdQRWobdhq0p5oVoMh54eiGOpLIcs1gQdtfAOiFcSwbHhPMxuio9K7pKI5Sac7
 iKPWAt8Kj58zWtW2WSLuPihnFVSoPjYDKXk7g6dVlNZWMtOvBh1HSnyqMi/oFuwq+LlgrXI/keh
 6FPV6cWW/pXcsb59kDDVsKBlDW+00vknLDFNezJT+C95pOKbLyrMOzBqDfLnhtiUh/veavnWxbc
 W7acOVM+UigUWXDR4rJcNhCEpRxM1dUz7chbooFKU1P+H0RyYefmpDV4TYRYpJfPLOwkcQN20FT
 4Zcx9/UTh/eT98Wnghcm9bTjXenpyIpV7DkKQ9sKWnL/0ggcRya6yBemtcCZ4Qc/NTfVJwdgtkD
 f7wySrRgaE7TGK6RVLQ0g+TOKJXOo/Io0CsSs1e8btsN6LUOrKyhDudTjbE1vuI6WUpwRhTYZfC
 E3nB
X-Received: by 2002:a05:6830:4991:b0:7de:c6b8:2349 with SMTP id
 46e09a7af769-7e4f2b3e8fdmr13779369a34.14.1779230374565; 
 Tue, 19 May 2026 15:39:34 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (184-96-146-19.hlrn.qwest.net.
 [184.96.146.19]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7e5cbb1a46esm1019518a34.20.2026.05.19.15.39.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2026 15:39:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 19 May 2026 16:39:32 -0600
Message-ID: <20260519223932.1034317-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779230374; x=1779835174; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JbLxN98VRMU7p7lGUiC6ElE9QsBH+03tk7lM2RHr9m4=;
 b=fWC9GReIbXM1GLrObQDu4x2foi7HFaUOsCkzNAPTI3O4co3jOr4OzqVoWWSGpOI74X
 J4r0RXe5H5wQTlko+tX/sCScCIFmDyDuH0aZgDCInCSk2EWTg+EmFxrKUYFZEI9Ag7t0
 fEr87200j/Q7O2lEauDeI33QM/dOgHismVObi6BJrxp0C+IEkicL9IV1/xwHB7QloYVs
 08Pmdhiq4hBathRH96mo+etuC5Fcd2IUIxjdEPpcjdtnInZ+ufa3DlEW2DeKziMbwozj
 e26FQgXefi8jH8DvGquBlZWI6wen0ICP03pnmuEhH4FJFTDjLK2SnQkks1kacpUrbVRJ
 fFvg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=fWC9GReI
Subject: [Buildroot] [PATCH 1/1] package/cog: fix build with Weston 15
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

The current cog release only supports weston protocols up to weston 14

When weston was bumped to version 15 in
2e6b2b82d5301977cf2f59adfd633d8774830f69 it broke building cog.

Backport a patch adding weston 15 support to cog.

Fixes: No usable weston-protocols dependency found

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...-Add-support-for-weston-15-protocols.patch | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/cog/0001-Add-support-for-weston-15-protocols.patch

diff --git a/package/cog/0001-Add-support-for-weston-15-protocols.patch b/package/cog/0001-Add-support-for-weston-15-protocols.patch
new file mode 100644
index 0000000000..c737ae6a66
--- /dev/null
+++ b/package/cog/0001-Add-support-for-weston-15-protocols.patch
@@ -0,0 +1,29 @@
+From b59d3a3c0feceecb10f0376ac2695d9466c9ecf6 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Tue, 1 Oct 2024 10:24:56 -0600
+Subject: [PATCH] Add support for weston 15 protocols
+
+Weston 14 was released recently and the weston development branch is
+now using libweston-15-protocols.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://github.com/Igalia/cog/commit/b59d3a3c0feceecb10f0376ac2695d9466c9ecf6
+---
+ platform/wayland/meson.build | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/platform/wayland/meson.build b/platform/wayland/meson.build
+index 74215f0..dad47a6 100644
+--- a/platform/wayland/meson.build
++++ b/platform/wayland/meson.build
+@@ -49,6 +49,7 @@ wayland_protocols_path = wayland_protocols_dep.get_variable(pkgconfig: 'pkgdatad
+ 
+ if wayland_platform_weston_protocols.length() > 0
+     foreach weston_dep_name : [
++            'libweston-15-protocols',
+             'libweston-14-protocols',
+             'libweston-13-protocols',
+             'libweston-12-protocols',
+-- 
+2.53.0
+
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
