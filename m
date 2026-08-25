Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CA1C61DBE
	for <buildroot@archiver.kernel.org>; Tue, 25 Aug 2026 14:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94E9880C94;
	Tue, 25 Aug 2026 14:31:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1P9y0WDVWOPg; Tue, 25 Aug 2026 14:31:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787668260;
	bh=CJXERDnccpJwGQbQTNUU47PRNpE+ttijmwv5lxTkYRA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SSl1hFFGqrupjyoMRWsQb8wxZUgo1IgcJaRr+J0eSfnYH5i2Mt/pNeoh0Wj8g+k3G
	 T/NEDoxxN//CU5gVU+YrxsJ4nvt7MzenfLGRcPTGiwkisDsMBFMosFcQIw+xxPXVfG
	 wqI13oRPub/jlVT0GhvktfBVY9E2fQZAbv9KwFfSBuoKCbNYfqJOe/7+zAnd5pH9oE
	 iMnCbeVKyY8sramMCwRutmZqtVbFGdL1vXicQwTc/jSbAqYoyUvr/Exh4dXGZbT0Q3
	 BmmNKR7RvQSEV/GSEHuX0IgnB9KwCKeceefmXPSJqoFgf5cKd3fT109KPO4Z3n5KK/
	 NAdoIjUUX7uyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B49C80C98;
	Tue, 25 Aug 2026 14:31:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DAC1C1465
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 14:30:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D8A1660604
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 14:30:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qbz2bGkithbF for <buildroot@buildroot.org>;
 Tue, 25 Aug 2026 14:30:57 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=rhidian.dewit@openpixelsystems.org; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=none (p=none dis=none)
 header.from=openpixelsystems.org
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=openpixelsystems.org header.i=@openpixelsystems.org
 header.a=rsa-sha256 header.s=google header.b=UXzkyaF0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E1B760603
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 14:30:54 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-482db627cd8so334248f8f.1
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 07:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openpixelsystems.org; s=google; t=1787668253; x=1788273053;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=hpUz6es/vUTBehRmPxr6UxzSMmB3A0Psvz6tnDncJA4=;
 b=UXzkyaF08HkyxD0DUH3+5vnEuoayof2k29TXajrDRFop6/dkxGHxWHyZMitEGXBETb
 PRvz1NDLwg6sYhsE4TbRccD3eVKV2+Qz79p/wSozBvmP4163oyOAyX2HQEyQMXEydPF9
 M5jjgfUk9ZmZ2hJhscotoPndxDWgNz8+QQHfaXTkUDpETb5lGu9gCqeh5yL1a/BO2F5R
 3hg38A2KRO6Bw7NrNgmgt4MbWiafSDHSdWQHKgB1PbHXiaOpA3GSfiKgpb64h9WIVQOB
 D5Whd5S2lfAj7jIAtT5xhyZ0EmAxG7uMJ9xa4/spmsssWIqZM1SRgaP2nU6I2dhoWqDs
 Ta/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787668253; x=1788273053;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hpUz6es/vUTBehRmPxr6UxzSMmB3A0Psvz6tnDncJA4=;
 b=kLrbPZGHVZIdex1fxYt+wlFzgiYBO+8IFaCLuJ9xgPn8c1BYBSbNgSIeegeDLLWADz
 UJx8f6UU6lLNSplOb1XDuAHPT54rAwBXuBFSM7i2DVhgmdEnntXkEYKa/AKWYDKCtorz
 4A+I1CaUYgkGcPZI1AZ3ir9iQNQ94KDq4LZWvh10ZqbuFl5UhDrWoklkU5faxi01S+lP
 75jksG55yPYp1o0d76rmtLUkQ5hk3C02azf0kgdpELvHYCEMTeDq3hQXjlRHuVjcWMGx
 Ca6S2lXeOutQTXFO550njzfkhWoiAjRBPbi8n8KlDa5qC7D3741a7yMAqJIxDt7Vjs73
 uluA==
X-Gm-Message-State: AFuF++m/wXGPq50RYby9Rm2JY4UxuqK7Se+5j28IBWBi2b90Rla55WbU
 detgybYtwkOwwKgJj63RAcmjjSEtlKzVnTbgslGT3HM219giOwJj9J063pL6Q/GvrOaSPN7s7wy
 h/DL4
X-Gm-Gg: AR+sD11WZogVMuaSvC5zBz9XbsdEKF5LCI39qxXMrFIy9ggrB9VvsitF3ar8ysrqQ4g
 +/cXlVlIFuCxpYX37ua/gTFmetS3mfTObTN8TexI3MLt24VEt/Mrxe4C07Gpxh+bSveA9dRRyDD
 xW0tbXwXsSAm8E7C/0udH8CXyNG+rlCdMOWO7dFqa4lyKKrfazox4rEaoc0246DU89nAxXiVLx1
 n/4ooqfxA5GN12Ma/acyfHFs8tp0WzslSep1NA6AsIAiSMPxPYUccCiymm6ZSwp4cKK2yWZpMLn
 eSrjdlqcMJh6163u5qx5K8ssKiuM0Up5gV7okrZ7WgkMGSyi87gjHQUI0VwhYIj6iNLieOmEfwv
 pxVCpv/Wch2CFmBpQTmsEXoP+FPoIE0SxC0NaCqD57/8qu+w/NkpjjlGAQX71QFv+0qB2UBgZ70
 4u5cQXir59zdf2RNMz+I2Utdlzso3hCSGnTKTcAxw9irqWRnfF0YTfQkkejyh1+2cmCsYwHyPC6
 qXV1447b0TDDau9jsoRwcbeCEJWua+gBHtUsZ9E+YrHwBouA6XqHGBbkgiTxpkm
X-Received: by 2002:a05:6000:41fb:b0:482:dac8:cd0d with SMTP id
 ffacd0b85a97d-482dac8ce39mr7459719f8f.21.1787668252808; 
 Tue, 25 Aug 2026 07:30:52 -0700 (PDT)
Received: from titanium.opsys.org (253.124-78-194.adsl-static.isp.belgacom.be.
 [194.78.124.253]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482c9bfd2aesm11936196f8f.21.2026.08.25.07.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 07:30:51 -0700 (PDT)
From: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
To: buildroot@buildroot.org
Cc: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
Date: Tue, 25 Aug 2026 16:30:30 +0200
Message-ID: <20260825143045.3860877-1-rhidian.dewit@openpixelsystems.org>
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
