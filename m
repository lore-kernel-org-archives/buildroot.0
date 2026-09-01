Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B67C61DD6
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 07:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36A4240683;
	Tue,  1 Sep 2026 07:02:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7K1NSwVIXbZq; Tue,  1 Sep 2026 07:02:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788246131;
	bh=CJXERDnccpJwGQbQTNUU47PRNpE+ttijmwv5lxTkYRA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AI1adFxqgB/qSiBh5GxvA2oUonPPGjsWeM+svqLceXMRi2PiYPF0DbRRIC858JtF/
	 WDAyXLAveE71CTtJtDdl6oaHICPX3FBl5emyMGUF0O8uJTxYN/FISJgExZ53Yv38DL
	 2VExmAjl1oC73htqjiEqmzmflLhjXWIz9ac6+7FnrPjXpLg43T2vyZhydjWZ3Gq/qB
	 EEJXOj5GH4wsr1nUF20YryaDECvnQi63JRQbdRivnoAy8IQMrC9J9/8QuuE/ENjP67
	 ThRMFlPdx6/R55b0WeDfofdfaWv2BYWWYXvj5/6iVugZxc1SoiYfr1/jar8b5eL7db
	 EhENI4SLfJbsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D2D540684;
	Tue,  1 Sep 2026 07:02:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A22D9127
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 07:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 845DC60720
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 07:02:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hnLeVZipBv4K for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 07:02:09 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=rhidian.dewit@openpixelsystems.org; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=none (p=none dis=none)
 header.from=openpixelsystems.org
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=openpixelsystems.org
 header.i=@openpixelsystems.org header.a=rsa-sha256 header.s=google
 header.b=dTi7iktI
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5C00E60703
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 07:02:07 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-49b0dbfbf7bso31294925e9.2
 for <buildroot@buildroot.org>; Tue, 01 Sep 2026 00:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openpixelsystems.org; s=google; t=1788246126; x=1788850926;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=hpUz6es/vUTBehRmPxr6UxzSMmB3A0Psvz6tnDncJA4=;
 b=dTi7iktIQ57oXroMazXC93gZX9TpptwKk8oqggFzWyovuGFe3Xn7GcsSPhCt1le8hF
 oyTC81uCZcpKoWOEeI2pzUA6cBrOYp5ovN8GLc6tBlDlDKss7HNLPxVSf5xXf0wV4r4g
 LDSGuDj1z/NQXDDBLmRNB9VTS3CWplJhiCHSy0E9Is70hq8+aRJEPzi+SIcr4oqIW9WP
 WPfLqg/ubKO17TpnB1BJU0Q0j+4MFsEByp7OXvU0aOvfB8p4Yy/Q4o5dRMfckcNDb1wY
 w6B+DE8vabcGP5AGKIJ5qcwR3PSyCBMaapS0N4pBFKo7WUZJX0XY7QyKBqdJI/COoiuU
 6kzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788246126; x=1788850926;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hpUz6es/vUTBehRmPxr6UxzSMmB3A0Psvz6tnDncJA4=;
 b=rJmQ6Ai7Anr19kRRlejFJaukwG9FuCHx3gGWR/31/eUdyzgG4C94uKQnSY1IVQcfXz
 K/pxEWHlpN6X59pnV/jH7jdtQ+v/PlO4Ej4db3VEa7K54YaDyNsKnRpHNi8PDDYNMZX5
 eYkmq2gy4DBsI0xEgh/JF2WM9KOY5WuTJI+Y+iY1AYqHb1NsMAZfGBH8yZ97ZneAOTGl
 RcH0rS07eRBfHBfaSLFAnhyNRsZjN+JqqEeXHkhVzQ3Zhv2UO9t9Mt98lruBQpE4nWSH
 4QSCdxGWIhoOpw/Q+hDxw52+4kxMduo4x9oAhKJk67hK+LhCepXwXmriwn016bKpTQBe
 nonQ==
X-Gm-Message-State: AFuF++lDzgkHmELlBLe7LmMfzySgW2cL6Zp3887JbXyVdZovalWPAdpH
 06F3Gmnt5g6TgAXUm44/cI0VsROdO9Ig1Fm0Fg7yWh2Z6u69bKrk9uMNitu4GM5Dw200OuGCUVw
 ERPWS
X-Gm-Gg: AR+sD11p0sHqES+0CuFvZdpTrNQDgvpnRCPWtaZUnBLWE7gAw1CvNK83CPIBOkkNBsR
 WSe1BIZ7gqG+rWOKLJkY7KTiF98OIoVxWQ/LYop5URTViKycTReF5IW/0aW0f3PlhWhKfSwKNo8
 eVQ+BxVVqLNjrMXkDScOjmed4wsnFIPLjqK3GpapqufjdVeCM2p7uIKrZihzEbz4Pk3qaR3s700
 6HM9mvrrODLl8m203K30+eA+Mz2rz2jXEp1H2/0+YneZ3AURfEUScfcnvrZF50jvSwSwhuw2WaC
 /M7g4zqKHlq8++QToJWvLeQCvdvAaclQm6fN+3VbM5VyMTKuy3Go0UOGcW0Qg+HW7Ux7nb9nymD
 ijEiI20EdU/aiGr+bIJ+CfoO69A4O67SxNlNOZ/bn81nS7zT8ZnpjjS4A+yt0bYRhu0FGzn5xJ2
 NbOSql7G4W7wrD5qO0qk65UlcCf3i5vsU7C5WrF/7DWv3ZZ1l+T1kGjNeC9FAanYgGOJjNFVrrk
 6BsNqmwn0fCyrIeaxC+UH5nbTgLE5qwh1C7v80YQ/1ralmieex25jfRUVmpWBZQ8w==
X-Received: by 2002:a05:600c:1d99:b0:49c:cee0:e7c0 with SMTP id
 5b1f17b1804b1-49cdc560282mr125934025e9.16.1788246125789; 
 Tue, 01 Sep 2026 00:02:05 -0700 (PDT)
Received: from titanium.opsys.org (253.124-78-194.adsl-static.isp.belgacom.be.
 [194.78.124.253]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cdcdd5f5esm43383255e9.0.2026.09.01.00.02.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2026 00:02:05 -0700 (PDT)
From: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
To: buildroot@buildroot.org
Cc: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
Date: Tue,  1 Sep 2026 09:01:55 +0200
Message-ID: <20260901070201.831563-1-rhidian.dewit@openpixelsystems.org>
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
