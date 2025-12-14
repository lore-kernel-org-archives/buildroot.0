Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C606AD59D99
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 21:11:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 765DD606AF;
	Sun, 14 Dec 2025 21:11:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3rhloOIy4Gjm; Sun, 14 Dec 2025 21:11:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 950D6607D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765746690;
	bh=hEfXjrUqd+ltsW5v4goOHHjRyEqot2NMQSUnFOaw4i4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nN2rDloEhlZSAxDxsDoO66KuehnFF5EUnzA/r88wQSsvY1TYAmP27imXlzEp8ndNJ
	 H3R78EKljc/ge9xFfNhrFNUqXWvc9j1RWLvS11uV22DpKi/mWi+reP1FMEcBbauzCF
	 DX0Cy2N0ilGdZRua6w3+HueJBkoK+6eeb2DUPzM1Sq2gogu5XNCbKvpjxwoAaSG2ZY
	 TqSG+y1u23YDVvPiW8+ev0o58IwSiRm11HXiiqfiV/ZCH1xUiCanUi7KUtbvpCVW4X
	 JlCzbMGCM+job3bBFVSNOoj6TwEAZ7WHy+6CpwsizkiEtO/Hwdew3qGvSCFjZcj8jX
	 yGed1oE3Ncz7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 950D6607D0;
	Sun, 14 Dec 2025 21:11:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 751492D0
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67FCB403B6
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:11:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rXD0VCGnV615 for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 21:11:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.100;
 helo=smtpdh16-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EE160403B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE160403B0
Received: from smtpdh16-1.aruba.it (smtpdh16-1.aruba.it [62.149.155.100])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE160403B0
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:11:27 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id UtNEvsPyW3pJ0UtNEv70GC; Sun, 14 Dec 2025 22:11:24 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 14 Dec 2025 22:11:23 +0100
Message-ID: <20251214211123.2531954-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfGmcba6VTfFenVVLKwgKrCwF9EuQNeMq3n0bR2apJdfpZsjCFOGbFrPGszKaMdMmOPcAXtuQiyVaFp9IKUrzeoIEw7d+FcOnz+/rIHujjS7DsBmCZvHK
 XtAzyzeSMTKeUKmpTuXC5ZL0nQGxQyKrRCWI8u0R3hakAYMlyT80Z81E90X1n/N4k1jx4qr8KroeL+vuuW/fqyYHXYOjGzTw+2Uc+uNY5ozuUMuMFZv2pyo6
 7Nckw16Ywg38b+IiD8YuL8oeDAp0LqfRK99zlAePFqYMxO24MWJfBDd4Clha8yUm6M6NQueGUKlCsyCBE9B8Gw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1765746684; bh=6WT5vWEwHf2NIdgcq38GLQ+B0+7KM14V7tzaNFC2wOc=;
 h=From:To:Subject:Date:MIME-Version;
 b=N9NIvWxEcPknEQ50uuuXddLulI7vuP0pakQWJvsxbR93EOdRyaWL6UdGBRVg0XIlC
 HM2cmK36NH4rgQkLDt6S34jeAcp7PrXlhSv+9qck44j/YS6NeUNJN8r5Pi0Qv35yzK
 WxiSbpftt9AGNOJiTxfxAGOrJeTuldA/gdmsVWf/WseW0fy/9os7oVABf+UeY7CibQ
 ffcQl7T09c+LPdQx2bRWIUVghbJIKB9VBUwLrbMeQOc+IEihpYWvwHcsYgB4vpV5y0
 J149H23c26ogUxBG90v5Z5kjANViwbrEcKQIkGwiQr93PMlW+un9nF7UR3qSgJAk11
 /adKdy53GJ91w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=N9NIvWxE
Subject: [Buildroot] [PATCH] package/rtl8821cu: fix build failure with Linux
 6.18
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

Add pending upstreamed local patch.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ..._sha256-conflict-with-linux-function.patch | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/rtl8821cu/0001-Fix-hmac_sha256-conflict-with-linux-function.patch

diff --git a/package/rtl8821cu/0001-Fix-hmac_sha256-conflict-with-linux-function.patch b/package/rtl8821cu/0001-Fix-hmac_sha256-conflict-with-linux-function.patch
new file mode 100644
index 0000000000..6f96cb2bee
--- /dev/null
+++ b/package/rtl8821cu/0001-Fix-hmac_sha256-conflict-with-linux-function.patch
@@ -0,0 +1,43 @@
+From 85a4ce313531e0941a8a80f1b198f5fd5ceb9168 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Sun, 14 Dec 2025 22:05:45 +0100
+Subject: [PATCH] Fix hmac_sha256() conflict with linux function
+
+Prefix local hmac_sha256() with rtl_ resulting into rtl_hmac_sha256().
+
+Upstream: https://github.com/morrownr/8821cu-20210916/pull/195
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ core/crypto/sha256.c | 2 +-
+ core/crypto/sha256.h | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/core/crypto/sha256.c b/core/crypto/sha256.c
+index ea5d9e3..d0a18c7 100644
+--- a/core/crypto/sha256.c
++++ b/core/crypto/sha256.c
+@@ -97,7 +97,7 @@ int hmac_sha256_vector(const u8 *key, size_t key_len, size_t num_elem,
+  * @mac: Buffer for the hash (32 bytes)
+  * Returns: 0 on success, -1 on failure
+  */
+-int hmac_sha256(const u8 *key, size_t key_len, const u8 *data,
++int rtl_hmac_sha256(const u8 *key, size_t key_len, const u8 *data,
+ 		size_t data_len, u8 *mac)
+ {
+ 	return hmac_sha256_vector(key, key_len, 1, &data, &data_len, mac);
+diff --git a/core/crypto/sha256.h b/core/crypto/sha256.h
+index 5219022..6260146 100644
+--- a/core/crypto/sha256.h
++++ b/core/crypto/sha256.h
+@@ -13,7 +13,7 @@
+ 
+ int hmac_sha256_vector(const u8 *key, size_t key_len, size_t num_elem,
+ 		       const u8 *addr[], const size_t *len, u8 *mac);
+-int hmac_sha256(const u8 *key, size_t key_len, const u8 *data,
++int rtl_hmac_sha256(const u8 *key, size_t key_len, const u8 *data,
+ 		size_t data_len, u8 *mac);
+ int sha256_prf(const u8 *key, size_t key_len, const char *label,
+ 	       const u8 *data, size_t data_len, u8 *buf, size_t buf_len);
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
