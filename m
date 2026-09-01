Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34C8C624C6
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 07:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CD66406E4;
	Tue,  1 Sep 2026 07:02:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rzpMQueWJ3Gg; Tue,  1 Sep 2026 07:02:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788246134;
	bh=dU7pyLwNCCSFFwxFe6kI1P0uMQxM3Hi0jWwx9ori1UE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S6iX/BuoF36PSSJYu/fRRqP2mFkHN00W+g7lr03YjOCysG+gji/D10FsgK9rf6CzE
	 Yx+2wWs6RcFO9NOdTTSaUIBuFyJNilwLEumdYASeshMzLN4plyUyzL4YoHSisdGbSY
	 CW8hQnM1oJYmaVPH7n4aX7CBepvfpkfGlISmCgG580vZaG2KopNd/VD3Fu21qrCCpP
	 uj3slEnBKEnsKqbYff+El4bGODR6hL1mOHuArkJEY7kcja7yWgh2LDoNxqQxcQJiPA
	 UaBflyCPsx1MIXGECr6VtvIzhFu/Yga49TUSEMiJkmm05XzTahP0/aYTHC7rWvlybx
	 MAVK+N9qEUlkg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78877406D7;
	Tue,  1 Sep 2026 07:02:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C211D127
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 07:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B254D40189
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 07:02:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l-yc4uaFZRq0 for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 07:02:11 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=rhidian.dewit@openpixelsystems.org; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=none (p=none dis=none)
 header.from=openpixelsystems.org
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=openpixelsystems.org header.i=@openpixelsystems.org
 header.a=rsa-sha256 header.s=google header.b=TqD79+zM
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 899EB40186
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 07:02:09 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-49b965570d7so5944185e9.0
 for <buildroot@buildroot.org>; Tue, 01 Sep 2026 00:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openpixelsystems.org; s=google; t=1788246128; x=1788850928;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=OvgbWpxcp7PFFd0UukUIMj68njTEp9ZCeg6Qq9uyh7A=;
 b=TqD79+zMgGCNWkkJUPwZAZyyKnOC69owvZ1QY8tJf4qGyuGdCpqgxBczFe/5Y8sWw7
 vXbRqoDeAsoJxPnOmqMyty7ROIHmltDthtzhK2Etf6LVQ5qkHqj/noWBU/gMmVm+aOKL
 G3PXnutzOOCBzQDar+4Z+tNxJKgt8PGPmtUc3KObKHvodXy4bptcBz8N/oUyHG8pKK/0
 l7LL9da9+mOMYXqhlntdQrUaECEBwAXRSRWwR2LiGCAabnutNw1O/iKAki45CfiAh1P6
 IQnf/Y0J40KD1REnwNP9Ah3JRITCaBGUZYt2z3Hl73ik7hRjPsxeaXxn35Olggg/s7vc
 /blw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788246128; x=1788850928;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=OvgbWpxcp7PFFd0UukUIMj68njTEp9ZCeg6Qq9uyh7A=;
 b=AyzyBTSWTvJIx9tR/9gMHWnLVNXR6vsYT04bu4h67FZOKvEuxuCv8hy7+HBDxtTOR7
 R1ipdTgn1MWNvT5iVyy3bSDpqAWlwCt/pHRx2o0zc1i07AITeTbSXMjN2Aa+7NY5LdMr
 /hqbEVvXrvMQjNoX+RO/W9Mk6ZvdWuk0S06b06AoX68gve9sNG7ADzhAKmItSX4zL21T
 56hmty3dAm2Np7SJicsOctf53uAi78hEmqTuFkKVTz9looJjrH1Cy8ZWtUV3QnyUiEoO
 s7UzmRyc9kK1AKODbWy2Mxf1Ofz3WD85FR5fOB0C4x1Ej/FLaV7T0HLIAnCiuHUptomo
 VLBA==
X-Gm-Message-State: AFuF++mZ+SNWzGNoY7lYyTyhfJNW56Xj4hbyB+F0r4T1gE2g8BKpttNV
 qRWMTdxGRtdkQl1F4SgksTmVllq/Hz0R5uCkLfbr2Rqe7EuwsajhSO60rM4lWmfhriqzITNhfkp
 MzsXo
X-Gm-Gg: AR+sD12qx4JjN7mwjt/OGKaQ5gO9htW1fnWMOgfzSF7ESccWu/qZ9P+Ta9KKSKuHyrl
 uWErBRrHKudfwI58NkyzCmjp81qs493AOxtRiocOBYbOclMxm9whHsXurmMxUEHU4OWDVG4Mgaa
 ZfGfpkAAeA04YyNF70+IcDKINiN85C+uhaepL2JAztyqkzjWfni7yG+F1kDcoZyLei1KV6qOAT6
 KM/6yqX1HfKjrsuwYgvt6GoxA7j5sBRfRnkOf9Ye4n7A44xPtLekP9lJ0FNPoI0wonmDw8/6BFY
 K7Ni2CYtR2TYzkO9N+E7njUFIjmhj5YON/4vOmshVFGM4tdB6fpRmEKYYX+fkiqaU2UMNkStXuo
 NaS2ugnTMdtD9Is5iV+N7MJ3Bz/31eWXcbwvmLUU8oNMBTgHplnP5/4adycB8xpxyHToCK+AZqm
 aT25J/Kd3+iGYNjP6NLAb3B8ZsAyRTWQuP275538nW03kOO5sEKhuvRZPNSqsVAKpmdm9o8cyDl
 BpF4hCl10QaYG81Rcc9pUHxHNZfLKmEiIYBYo9XtOgD3Uj/8lwLvdGlkbclEN/P
X-Received: by 2002:a05:600c:5490:b0:49c:cf18:494e with SMTP id
 5b1f17b1804b1-49ccf18498emr328967315e9.12.1788246127273; 
 Tue, 01 Sep 2026 00:02:07 -0700 (PDT)
Received: from titanium.opsys.org (253.124-78-194.adsl-static.isp.belgacom.be.
 [194.78.124.253]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cdcdd5f5esm43383255e9.0.2026.09.01.00.02.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2026 00:02:06 -0700 (PDT)
From: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
To: buildroot@buildroot.org
Cc: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
Date: Tue,  1 Sep 2026 09:01:56 +0200
Message-ID: <20260901070201.831563-2-rhidian.dewit@openpixelsystems.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260901070201.831563-1-rhidian.dewit@openpixelsystems.org>
References: <20260901070201.831563-1-rhidian.dewit@openpixelsystems.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] Avoid double-free on x86-64 systems with no
 cmdline set
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

Upstream: https://github.com/rauc/rauc/pull/2028

Signed-off-by: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
---
 ...i-slot-bootname-to-avoid-double-free.patch | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/rauc/0002-Duplicate-efi-slot-bootname-to-avoid-double-free.patch

diff --git a/package/rauc/0002-Duplicate-efi-slot-bootname-to-avoid-double-free.patch b/package/rauc/0002-Duplicate-efi-slot-bootname-to-avoid-double-free.patch
new file mode 100644
index 0000000000..a062844659
--- /dev/null
+++ b/package/rauc/0002-Duplicate-efi-slot-bootname-to-avoid-double-free.patch
@@ -0,0 +1,39 @@
+From 1b17578e90b2929e1a7ed1f3eec8d3b5f663b673 Mon Sep 17 00:00:00 2001
+From: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
+Date: Fri, 21 Aug 2026 16:37:45 +0200
+Subject: [PATCH] Duplicate efi slot bootname to avoid double free
+
+Signed-off-by: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
+---
+ src/bootloaders/efi.c | 2 +-
+ test/bootchooser.c    | 1 +
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/bootloaders/efi.c b/src/bootloaders/efi.c
+index 19224118..8b0cf820 100644
+--- a/src/bootloaders/efi.c
++++ b/src/bootloaders/efi.c
+@@ -630,7 +630,7 @@ gchar *r_efi_get_current_bootname(RaucConfig *config, GError **error)
+ 	RaucSlot *slot = NULL;
+ 	while (g_hash_table_iter_next(&iter, NULL, (gpointer*) &slot)) {
+ 		if (g_strcmp0(slot->bootname, bootcurrent->name) == 0) {
+-			return slot->bootname;
++			return g_strdup(slot->bootname);
+ 		}
+ 	}
+ 
+diff --git a/test/bootchooser.c b/test/bootchooser.c
+index 43c45397..c35a78f1 100644
+--- a/test/bootchooser.c
++++ b/test/bootchooser.c
+@@ -970,6 +970,7 @@ bootname=system1\n";
+ 
+ 	bootname = r_boot_get_current_bootname(r_context()->config, "", &error);
+ 	g_assert_nonnull(bootname);
++	g_clear_pointer(&bootname, g_free);
+ }
+ 
+ /* If the underlying 'efibootmgr --bootorder ...' call fails (e.g. the
+-- 
+2.51.0
+
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
