Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F4CC61DD3
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 07:11:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 051AE40411;
	Tue,  1 Sep 2026 07:11:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HrUDl6U3jrsG; Tue,  1 Sep 2026 07:11:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788246690;
	bh=5Zyk+baS0OVk0l4RUGU4V1bXd5CxSrceEd2vPZoh7wc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Gxt4dubEaorthzqjbdg0/6e7/XZT+NFhBtRs5B3uCRS6xzekDa7+rWKssC7xqbMEw
	 kgzAM7R7KT4JiHUqrvf0C8nD4NWpV8ukpF/805QMPr9ujshlrTfynImC4mYDGVa3/K
	 nO/8rMHq61YOjF+7Q24qL2LDmqrpWkCuwsrQTuxW7hz9pMszY4iYXKxjAcy3vol1um
	 6zIZd5V2bywSOWNt99cYZdehSJFF7TIzfJ6p6MSG0H/vImlouczCmVv5CK+faa/LYS
	 N+sxwSnKCKDlYDIif76yraWCvJ9DS56RItwCb+I2dtrrbUKUix+OoiLD+v0hS5V9Mr
	 Ah9HAKMtmTnww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68ABE40445;
	Tue,  1 Sep 2026 07:11:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3737B4AD
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 07:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3205E6072A
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 07:11:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FlhnBRKX6gTk for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 07:11:28 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=rhidian.dewit@openpixelsystems.org; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=none (p=none dis=none)
 header.from=openpixelsystems.org
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=openpixelsystems.org
 header.i=@openpixelsystems.org header.a=rsa-sha256 header.s=google
 header.b=EnYoZ+12
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 756AA60703
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 07:11:26 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-47f96c5b722so2775073f8f.0
 for <buildroot@buildroot.org>; Tue, 01 Sep 2026 00:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openpixelsystems.org; s=google; t=1788246685; x=1788851485;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Db7/WICBTIyHc69bzciZWicexl5cvAQOTrAY71BaPOI=;
 b=EnYoZ+12gMVLxjWuRTy3yHBIacnty+Ypz435Ltu4fJGJ6r4CJbEEqGJAoyGT2oW/kp
 Q5wVO5MUp8KwLCPx7eGAmVA6L5myDxVs8OjDvi9o6cjqKlYy37WcEC9do+4AwmkqMIH/
 lB1lyp7Pw48tlNV5tOztMbFwnZLtTxpDliYgKnnyuKHUU1WEBQi14ylMsAFZDHcJyuMl
 NqSDqlibPt4ZGWCBJlen0OFT/dbPkCV63bcrvXfcJK0ZXJfwH7DAhkTDe+P9lI2CiJlm
 ScpjimrNmSw5/vRQQTjvAdA8th5bt49oUFHMl6CkkXHJM9a+YMJgeuO18wsod9a9IBtB
 nFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788246685; x=1788851485;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Db7/WICBTIyHc69bzciZWicexl5cvAQOTrAY71BaPOI=;
 b=X/psE5DFzTTI02Wzspx9md8/CWnmDKBvROQ+WybxYBd7aTLupBMfOlEKsYgEA8N3i+
 LbRA0vVMoaj3Q0KPi9mmxgJKTlxDIDeCfW+7EPF/6f6AxSpH0LKRlHY/Cl4Q6Wq+nPIv
 u7xhf5AxrFikZaoWNJjHaGOL4ZaDGomF6P9P0VlxQbVzN0nM66smW9qb2xWrr1WGcAJ4
 u4IG6Ujk2onpXVMMozlXCVr4FdJZ3SvP/+l/u3AzdUcpafsJ1HTDpd3Q16aMDIzmFeFR
 HNsMlq9c9q54/DruKUm1+pvFBs1FE9J9AE8sbnGsxvgoQY3bh/9aVTyRBh2acNV+2mFi
 LPfg==
X-Gm-Message-State: AFuF++lDnROyM+j7IHH1p9n3718p1SbSM4zfQPqt7vs4uVSf6zDBRXmi
 I5etBtwdtM5cGzvKO+ot7lexTYiBGgpgLOyBLuFtQ8uFM3sGNOSc7cqP0giTRWkgk6Rl4RdZiiT
 vaNNT
X-Gm-Gg: AR+sD136sYKuR6ribe7WOntdIpKTh6pBxai1YdB5Cmba5qkWdIvqnUOZtjdzVFvQ7BM
 oazabKK/ghfUP6B8C9OC7mIyPAWL8GtSlHKVdFqLI1ajrMPLJ4zkI75ccY8JMszOuplZYVhjKea
 9T9YfBxJlFFp69hX+DXAJaeIRjc5uJGbojjfK4qAP/FtmiJMvXiiMErhuiQIqxnwGt19g/oHR0G
 EyqIrTvfEIatSxH/amiE4m4ImFJHTEFhIs6ezycf83PM0nFErROJvp4WKKIPY9YKBfBYHCIc6Dc
 DIbms1Ebpoqk9vGGRJspEnz13pUddVTRZbc5qeiwFYw2YU1psCM+9M3uAr0Dc7K1d2UwzKzpude
 UZQIrAbc5T+Xw5CA7tfoPIgyyN79fB6UkAP0iLAcYDciWfU4y7WT4082O/IrzPxbbGHmiAAnG6+
 WEKmnw2iR+va4+1uCEiIdAGBJEQ8EeeH467lI/4LsnEHPG3cukk30JepUSyIJ9He52a6zvJQU16
 xZf3Kdp7R0cnzdNO+dXjIMW4BATgqnCZQ+E6nbjBD0hP6vSxa4BQNbaK7uL/YbBoA==
X-Received: by 2002:a05:600c:1d08:b0:49c:d293:70c8 with SMTP id
 5b1f17b1804b1-49cdc40551bmr114804405e9.3.1788246684603; 
 Tue, 01 Sep 2026 00:11:24 -0700 (PDT)
Received: from titanium.opsys.org (253.124-78-194.adsl-static.isp.belgacom.be.
 [194.78.124.253]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48442d787b8sm3040192f8f.29.2026.09.01.00.11.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2026 00:11:24 -0700 (PDT)
From: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
To: buildroot@buildroot.org
Cc: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
Date: Tue,  1 Sep 2026 09:11:20 +0200
Message-ID: <20260901071121.834356-1-rhidian.dewit@openpixelsystems.org>
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

Signed-off-by: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
---
 ...bootcurrent-is-valid-before-using-it.patch | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/rauc/0001-Check-if-bootcurrent-is-valid-before-using-it.patch

diff --git a/package/rauc/0001-Check-if-bootcurrent-is-valid-before-using-it.patch b/package/rauc/0001-Check-if-bootcurrent-is-valid-before-using-it.patch
new file mode 100644
index 0000000000..a70ab29fa0
--- /dev/null
+++ b/package/rauc/0001-Check-if-bootcurrent-is-valid-before-using-it.patch
@@ -0,0 +1,41 @@
+From 48a0c8b2e647fe34cc53a4b55a43d4106fe45735 Mon Sep 17 00:00:00 2001
+From: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
+Date: Mon, 24 Aug 2026 10:04:24 +0200
+Subject: [PATCH] Check if bootcurrent is valid before using it
+
+Upstream: https://github.com/rauc/rauc/pull/2029
+
+Signed-off-by: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
+---
+ src/bootloaders/efi.c | 15 +++++++++------
+ 1 file changed, 9 insertions(+), 6 deletions(-)
+
+diff --git a/src/bootloaders/efi.c b/src/bootloaders/efi.c
+index 19224118..65875c9f 100644
+--- a/src/bootloaders/efi.c
++++ b/src/bootloaders/efi.c
+@@ -625,12 +625,15 @@ gchar *r_efi_get_current_bootname(RaucConfig *config, GError **error)
+ 		return NULL;
+ 	}
+ 
+-	GHashTableIter iter;
+-	g_hash_table_iter_init(&iter, config->slots);
+-	RaucSlot *slot = NULL;
+-	while (g_hash_table_iter_next(&iter, NULL, (gpointer*) &slot)) {
+-		if (g_strcmp0(slot->bootname, bootcurrent->name) == 0) {
+-			return slot->bootname;
++	if (bootcurrent != NULL)
++	{
++		GHashTableIter iter;
++		g_hash_table_iter_init(&iter, config->slots);
++		RaucSlot *slot = NULL;
++		while (g_hash_table_iter_next(&iter, NULL, (gpointer*) &slot)) {
++			if (g_strcmp0(slot->bootname, bootcurrent->name) == 0) {
++				return slot->bootname;
++			}
+ 		}
+ 	}
+ 
+-- 
+2.51.0
+
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
