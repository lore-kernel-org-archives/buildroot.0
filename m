Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D37BC5DF81
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 09:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43E606060A;
	Mon, 24 Aug 2026 09:35:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RNP-SeibqgLQ; Mon, 24 Aug 2026 09:35:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787564137;
	bh=jmOWxPwIunEMWn8OfcYT78jO/Q0x82T4g79pAHMYf2c=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SMvLOzQc2VGbAymlQ1N+Q3jh5UUX01ssi29SwTmka1AcXekMiwalPVvPqooNg3wIb
	 JVWvbNhyMmfmNALAVbz5Mz45I+xeSGvv4VhLM8kVv4Sb0n9w8fHjdS4/L7wF6Q4hW4
	 qRTacM0Z89xJI3rlVHctp07l1Jq+4kcMmESyyrQSwq0q5ssJ4bEf+HfVPan04QvSRc
	 PGLjLOKeYv7YVBTFdP+3bfLR3AU8CP/xsEqmv+FqMCRedEKiJ7FYRoW+IPh4F2aRlz
	 PXHQmcO0mREuQiOKbtmqwE9g9rGYTHgwTR8RsBsRIAfrOJAqISlKRlwOUPBlbcHSaF
	 MFZrbEMwaW1hQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5666B60617;
	Mon, 24 Aug 2026 09:35:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 34310386
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 09:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 269DF80AAD
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 09:35:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZJm6gCVMZF-E for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 09:35:35 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=rhidian.dewit@openpixelsystems.org; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=none (p=none dis=none)
 header.from=openpixelsystems.org
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=openpixelsystems.org header.i=@openpixelsystems.org
 header.a=rsa-sha256 header.s=google header.b=OSs1cCaR
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 75CBB80AA9
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 09:35:34 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4980dc26022so21627935e9.1
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 02:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openpixelsystems.org; s=google; t=1787564132; x=1788168932;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=eseVBHwryeWL52Yfr1xFOKGrjuzthio+LGG6XIihCXI=;
 b=OSs1cCaRQdMnnqdcBPq7hL7SV6TQE3pE9eNKr4RvHtkZTg3N2dvZWLdnCII0NyB4YD
 4fiyaI09KI2KOyOAC9VCkAF3zRB2wXQyvublAg/cicVYJghxKsQVjBELh7EorF1mlXSB
 GkgJ3UnrIA2Vf4/Z2vHUiUAzt/iYRvnscq6/u+bqZtwhQH/DuYeGP4+VHq6u9MTSwbeC
 AEfR2PeKIm1RkBHcpxdAU+ttftqA212okuR1jqbKEeAxdKY9oI0oQXNfhMnT8wBjy3y1
 iQGFnB6ND2TcIL5cGOy1Okmt0ken3lNPfc1ABQhR4cRiexEV7KnmGP6qnY75HmKIk75C
 R0SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787564132; x=1788168932;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=eseVBHwryeWL52Yfr1xFOKGrjuzthio+LGG6XIihCXI=;
 b=PWexeeNQJLy55Wt1kdu23t2k0dGL3qxszm4Ylq91a4ULNbEWpOgDgn2Sagm8CcOQJW
 DUWASqKAEfeFbiyErukZhWatHV3bANaQzDkcKVgAG+9UhbY5h4QScGzWIUzolSk1OzgM
 EFgPqeddLf/sKKFwSflyP39Fwx9Th3QXzkPOcdWiZ2I1MyDrGA9lemy9C8wtmKBMdjY/
 UKL8rI5OSmuw5PBJ5OlZV2BQWWjoBuuam2gK3MGznpgt64wQXzwEpn0CuzD3EFlepzxz
 5Ejr6K+jAyv+7JV/Oh56eI4xzANs1fJhaR14R2CjusYmOk1Ua4N4wMTkWCvzi8xf6Rn3
 lhEQ==
X-Gm-Message-State: AFuF++lOn9Z+1+9k6nxJyuFAFMDhlqZZ9NvGjF6XoMHqFQ6o5Szgf8Ur
 XDPAUAC8yuMZerTS7Tg0iN0UrlsnM0w1JVV+rgF3WCCnWa/M4FWX0HQ8KUAhnOGsOTWcya7sF1A
 PKgyA
X-Gm-Gg: AR+sD12uAY+zRu/HBbHf6ml5jAzAHevU5ixhVtyj3SAs8ET1Em0s34em5EYO81BqeNU
 Y04hvg4xDlZs4Iyv1616SbCKdi3WSvqqIqWRuLyCzY8ggbIBcXp/k+vJ4ad1inNJ7jmrALjaGbL
 5C0+f1IjFzJa2PUlxCZtI5ENZXWgg64RDvw9SgdirJ/rHJY71SuCfUk27gBZCNhNquTkCIeNUa9
 TqsD7MeD9XDil+5bKKEngUDVKM5MrslO+89kkxkcwyv7KfOxBukFz9rUdvLaqEf8AXhAlEj+Z2Y
 aLpcbnGIAz3NnB6JbuHtjosplKTLM2IzkQryt96zENVvZp1Yr7h5Hn7adnRPmKfLxFNyaD36uob
 J0JcdmS4Bl42J43yiFnNm9RrRL7qU4xST2IfzC0B8e4zrSAMHE5dmhpsQ1p8nn6XjIplgEejBLG
 x6iUolO2hf2+FjmUu1N/WGUPbUi/13kIV4Hzpm8MiF6ZayOAlMBrXKKHw68d8rsw3UepypHGf+3
 vzYNj2Tk0+ytNNAPnmdw13Af4oUugYrVPOynh2R76eEvPoIUM7QoDmDVx8GCB2Qi7OCEIMmtxwW
X-Received: by 2002:a05:600c:4f0c:b0:499:872b:abd4 with SMTP id
 5b1f17b1804b1-499c19c70femr190550975e9.6.1787564132381; 
 Mon, 24 Aug 2026 02:35:32 -0700 (PDT)
Received: from titanium.opsys.org (253.124-78-194.adsl-static.isp.belgacom.be.
 [194.78.124.253]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482c9b78df1sm7384270f8f.10.2026.08.24.02.35.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2026 02:35:32 -0700 (PDT)
From: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
To: buildroot@buildroot.org
Cc: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
Date: Mon, 24 Aug 2026 11:35:28 +0200
Message-ID: <20260824093528.3357438-2-rhidian.dewit@openpixelsystems.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260824093528.3357438-1-rhidian.dewit@openpixelsystems.org>
References: <20260824093528.3357438-1-rhidian.dewit@openpixelsystems.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] Check if bootcurrent is valid before using
 it
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
 src/bootloaders/efi.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/src/bootloaders/efi.c b/src/bootloaders/efi.c
index 631ea39d..15cbf417 100644
--- a/src/bootloaders/efi.c
+++ b/src/bootloaders/efi.c
@@ -510,12 +510,15 @@ gchar *r_efi_get_current_bootname(RaucConfig *config, GError **error)
 		return NULL;
 	}
 
-	g_hash_table_iter_init(&iter, config->slots);
-	while (g_hash_table_iter_next(&iter, NULL, (gpointer*) &slot)) {
-		if (g_strcmp0(slot->bootname, bootcurrent->name) == 0) {
-			return g_strdup(slot->bootname);
-		}
-	}
+  if (bootcurrent != NULL)
+  {
+    g_hash_table_iter_init(&iter, config->slots);
+    while (g_hash_table_iter_next(&iter, NULL, (gpointer*) &slot)) {
+      if (g_strcmp0(slot->bootname, bootcurrent->name) == 0) {
+        return g_strdup(slot->bootname);
+      }
+    }
+  }
 
 	g_set_error(error,
 			R_BOOTCHOOSER_ERROR,
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
