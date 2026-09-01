Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B408C61DD6
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 07:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31B93406A5;
	Tue,  1 Sep 2026 07:01:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fpAp4qVi93e9; Tue,  1 Sep 2026 07:01:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788246104;
	bh=CJXERDnccpJwGQbQTNUU47PRNpE+ttijmwv5lxTkYRA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=j+8AG/ziXqSzEK6sU5CrqkJBLsT9JbFzRlrrj+9zZv+4orSXCvBvyvz+QozYvWEQn
	 CtE3Wlz6ZPjVmXRld3HJ2qLJaRaNwk4fqrN5uo+SDXTW/QJ6XJZ5mighAIUvV3rwhb
	 pDKM/61Hd1qHbPaDIMoUv4CYpTiC7ru2OgLTgZn+UBZczSW/RTlMjDmOBo45iWyPsJ
	 HTBVbwi84RTCNPNUZA4c6ZyzVVH/5Pi3KGcb4yBpthsd6UW0bwq/FCSC42vZPrrnPq
	 I9x+yRqN0gBc8jlChLQTUUFpMEvZ1tqc05YDgrsC2gWFeDNWPSRXj37rGigYQbr5tf
	 sFd4TuImm4N8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CC9B40684;
	Tue,  1 Sep 2026 07:01:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E7A87127
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 07:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D71C060720
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 07:01:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YsFYvHZMLuHe for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 07:01:41 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=rhidian.dewit@openpixelsystems.org; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=none (p=none dis=none)
 header.from=openpixelsystems.org
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=openpixelsystems.org header.i=@openpixelsystems.org
 header.a=rsa-sha256 header.s=google header.b=MiICx5Ip
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E8796071A
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 07:01:37 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-48444eff835so45727f8f.3
 for <buildroot@buildroot.org>; Tue, 01 Sep 2026 00:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openpixelsystems.org; s=google; t=1788246096; x=1788850896;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=hpUz6es/vUTBehRmPxr6UxzSMmB3A0Psvz6tnDncJA4=;
 b=MiICx5IpCNSyxPKNcR0ii0pndoRPaJ5qe4oTXtIBQovvk7s8Nlf9jLExeeCUrEnhJM
 +k7A+s7CAxdyNJ6XnvQcD2e3Q9XyoJt2Av7clkqElDwCoCbnFIixkRyBBMWVRUWzAjso
 Shq6UoHYKSYXHAnFngQECxzZ5yYz4/Ps6pXFFQRoOnMtRls9Hnq8tkdgeHgO6ThfQFwi
 ylfUR8wfSDH4Tbsk3jAjT0LR8yZWCEb9tb5ElLNVQKIgD2JvAf6E7PJn6Gyfu5qhwizZ
 QlYeIwDC31lQkTNcRViK1HX+4pXO7MM67YTthjY5F2ZnCIX6O1dXRLVFJuhgz4kFsap/
 oWbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788246096; x=1788850896;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hpUz6es/vUTBehRmPxr6UxzSMmB3A0Psvz6tnDncJA4=;
 b=rhX3dvPtJETmbU0eBGMnnPTjBblOY52uX+31ZTM7VpJCmaEsk33aJDHg8Stl2Fl7Td
 g5niqME5CxIqlwy7mvX1gEwNSWFX8ZiPXi6olAczuTXI9e+E26RuxHoMGZluYTucfWb3
 JHk+jr2eoNtTxxqhLO/O8ySeb3EFD+f/AvLKB67yMykXC2ST5v95zLhcvTZA3IZimcXK
 wRRP7kxfuzASAIcwRr50Op2wakCA+BHGx3ZLC1Uixcof1LOz5FBrz9xVFjL/vsUBjjCb
 D1lufAuCpM5y7L2n2gdNEJ9o74YMaqf9rQ4syni+omm6ukHuueezlmI47frL7RZCZw9c
 xYuA==
X-Gm-Message-State: AFuF++kpCwNLWyHpVa6FsRCSNvenhPxdVom2dP5yUdPP3aDUUfWXcb0g
 KBxmkBUwcv3XTv0Y1QNta/9R/RuQrrHCyrUwrDqCaKa7NpFaR8iQLTjyIQVn13UswSR7Fj+/fmY
 /qN6O
X-Gm-Gg: AYBFou0sXz9hGBcoBK355PyJ+SDpzu+mOKyySYKKL4t5o8ufV32Nm08UgSwqrfTZPkT
 RBKqHh1rSyp3TfI5WIXLH5v+tetJWFGVx6WezRO5DSo7ibZxLPX/7PRiNQRqzVJ8hVHanQjmLT2
 kE200TODDT3J8CgRrJnf56DHzAOUtBuusf5zxZDABkMjjHkjSl2SmU3kGyUdjhEguDVrsiLfqL2
 vV4ry5Jpvn6cwU3XldyZbwmXelJDo906y24hCCFzrBR7X6AIP34ETDHyJCYLZk7AzzyjdOn+Bn6
 9ljwuinpJewnZlgY2tSxVAHEBAZ3iLZmys0KLcai8yLxDlOa2YHjWDzRvD5DIgH2okH7LLt3vsT
 BSZBDEXCd1QjhkpCKCUZsRcTZlA4kQ4OWOEuUD1qMASUDVJ1xGgBnE0NWHkB3EhTsY/e+re3ana
 LCFesuQOt9mmdI+3ZHO5bLVBG1Z6NHPZBN005hsyQJIzUAn0XyvRCOvGVVLu4FHLU0x8m2Ga8Zv
 ClG+mh8CGyhfeA8L1cbRKYDc9xI3klyvfdseE9i/yb1Q0vPWXOmdSB6GQyaNs8W
X-Received: by 2002:a5d:6f14:0:b0:484:3728:1369 with SMTP id
 ffacd0b85a97d-48437281425mr30550618f8f.6.1788246082320; 
 Tue, 01 Sep 2026 00:01:22 -0700 (PDT)
Received: from titanium.opsys.org (253.124-78-194.adsl-static.isp.belgacom.be.
 [194.78.124.253]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48442d78a0bsm2850052f8f.28.2026.09.01.00.01.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2026 00:01:21 -0700 (PDT)
From: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
To: buildroot@buildroot.org
Cc: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
Date: Tue,  1 Sep 2026 09:00:56 +0200
Message-ID: <20260901070113.831292-1-rhidian.dewit@openpixelsystems.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] Avoid segfault on x86-64 with invalid EFI boot
 entries
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

Upstream: https://github.com/rauc/rauc/pull/2029

Signed-off-by: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
---
 ...bootcurrent-is-valid-before-using-it.patch | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/rauc/0001-Check-if-bootcurrent-is-valid-before-using-it.patch

diff --git a/package/rauc/0001-Check-if-bootcurrent-is-valid-before-using-it.patch b/package/rauc/0001-Check-if-bootcurrent-is-valid-before-using-it.patch
new file mode 100644
index 0000000000..38fc02c5bf
--- /dev/null
+++ b/package/rauc/0001-Check-if-bootcurrent-is-valid-before-using-it.patch
@@ -0,0 +1,43 @@
+From 931d0af0f66b9afd2a7c9d9532abef1ec67b1f69 Mon Sep 17 00:00:00 2001
+From: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
+Date: Mon, 24 Aug 2026 10:04:24 +0200
+Subject: [PATCH] Check if bootcurrent is valid before using it
+
+Signed-off-by: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
+---
+ src/bootloaders/efi.c | 19 +++++++++++--------
+ 1 file changed, 11 insertions(+), 8 deletions(-)
+
+diff --git a/src/bootloaders/efi.c b/src/bootloaders/efi.c
+index 19224118..6de5f73d 100644
+--- a/src/bootloaders/efi.c
++++ b/src/bootloaders/efi.c
+@@ -625,14 +625,17 @@ gchar *r_efi_get_current_bootname(RaucConfig *config, GError **error)
+ 		return NULL;
+ 	}
+ 
+-	GHashTableIter iter;
+-	g_hash_table_iter_init(&iter, config->slots);
+-	RaucSlot *slot = NULL;
+-	while (g_hash_table_iter_next(&iter, NULL, (gpointer*) &slot)) {
+-		if (g_strcmp0(slot->bootname, bootcurrent->name) == 0) {
+-			return slot->bootname;
+-		}
+-	}
++  if (bootcurrent != NULL)
++  {
++    GHashTableIter iter;
++    g_hash_table_iter_init(&iter, config->slots);
++    RaucSlot *slot = NULL;
++    while (g_hash_table_iter_next(&iter, NULL, (gpointer*) &slot)) {
++      if (g_strcmp0(slot->bootname, bootcurrent->name) == 0) {
++        return slot->bootname;
++      }
++    }
++  }
+ 
+ 	g_set_error(error,
+ 			R_BOOTCHOOSER_ERROR,
+-- 
+2.51.0
+
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
