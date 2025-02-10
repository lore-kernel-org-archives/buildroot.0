Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80074C02198
	for <buildroot@archiver.kernel.org>; Mon, 10 Feb 2025 19:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5A3340946;
	Mon, 10 Feb 2025 19:18:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XBwts6mCFYMl; Mon, 10 Feb 2025 19:18:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66D8440664
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66D8440664;
	Mon, 10 Feb 2025 19:18:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D5382C2
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 19:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C54B781D16
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 19:18:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HbsTx_LgWVUs for <buildroot@buildroot.org>;
 Mon, 10 Feb 2025 19:18:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 69C3C81CE7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69C3C81CE7
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 69C3C81CE7
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 19:18:33 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ab7430e27b2so919102066b.3
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 11:18:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739215111; x=1739819911;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7geHDlpOtQ2YEc7p4DKP/pn325d51DVHn7wwXuYs700=;
 b=pvkhkFZV8lFd6s6RmJ/yb0N309ZZ5sL13DC1qsATo9P5oToY9RYHnjzJyhCo81wV8C
 23gRLJQBVXH64dZG5eYtcbW/aXs5hFoTsguKb0lzpIrthwrKq6/b0F+ibc9lzD+DbImg
 UxyAsiXPg8o2pmnuqRSskf3pOfKrlMjYXLs+iAtHke06id8UWYruUXKNBovEtAWjqgAL
 m7paqFSHA7OEWzt4vdUln5TkpyFoNzE7+81oTyhG9UJ9H0XWDHQTfHffajiQ9oIszPYA
 NJbQHphEF2ePqsn4YhPWrioVb9q4a4plGZLNpauvWFTK/H1H4H6Nr/nJFITHO2HwEWj1
 PMHw==
X-Gm-Message-State: AOJu0Ywt/OeEixfmRLDN7bMkHWyJRPlO8ARbAlTzzGEe/tsXcwvCiXij
 hgRaS4zmYTZq7nKzhIeVNtf/4XbRbvlZThrdlHDm+AgX6KRGRjSZwjgSsa2w5XD5eXo5eBxNE3P
 RDkQ=
X-Gm-Gg: ASbGncvDgGLTsgSDT7SF/1HqjRYUuBjtEUUJglGKGoG5JhIJKtl2upd8PlZSG2qeOuC
 NMRJUwiikQlagqVawP8oN7x/UU/atHYMB0VLdMw4Y4w6+a4kblU/9vsRx1CJsdqXMrnlsuCEfbg
 mBFhFrV5NHfz+F1SGGahn7qVhEDwHSmxR3kOrkV7gokjpRyCSBr/hvZp8rK43F3E5XmX298N5xw
 XI7J9e0SJ2h1ftySTVpI+R1boUeficNkzmGuVlXfIuFHMIGAuEwuEtgrFVeYQ4OMGMwXafKK/cm
 pHFyPjpb6awO8oBdqCpdyWgaFfGlaXI=
X-Google-Smtp-Source: AGHT+IFNCBaeI0aFaiHPGL7QVoR36N1ykyNXYIrj3qIc0TWN8YJPJnLk/FCKcMVwR/WIjRnjMtB6HQ==
X-Received: by 2002:a17:906:3791:b0:ab7:da06:a372 with SMTP id
 a640c23a62f3a-ab7da06a48bmr69175566b.10.1739215110779; 
 Mon, 10 Feb 2025 11:18:30 -0800 (PST)
Received: from localhost.localdomain ([79.132.233.153])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7800ddc19sm856742266b.175.2025.02.10.11.18.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2025 11:18:29 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 10 Feb 2025 20:18:02 +0100
Message-Id: <20250210191802.426552-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1739215111; x=1739819911; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7geHDlpOtQ2YEc7p4DKP/pn325d51DVHn7wwXuYs700=;
 b=ZJYzYM+TszyvNcqvbnlb8Cj2Tmy+PgqsO7lACt8wFkeTWQQmZfcAvcdNVrS6Y4462t
 AdFfpAe56jy/XvgFjZ3Srv4ekK7bDa/tw8HGwr8YUQwa3uZ3qFmjcr4iffIo+CDs7oO+
 uvCozQmMwK7hiPmfpr3vRztmhbXj33JSR6YAh7CTJoBn5MHVQR23D9wWOyn5LnABGQBp
 wg6zRR8jHI3/azpwgNVMpsY9ln+WhRxOtsWB2bCrI4LRhIM/rziNmH5i1QsObSx1s2Oj
 69nZ3oMQUzS13sXVECsKwAjZ0zisnMnp4r4T8JiMgo6ZEYK0HVxrxAyTzVgmiBiyIjD3
 pMHw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZJYzYM+T
Subject: [Buildroot] [PATCH 1/1] package/go/go-bin: re-introduce go-src hash
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The commit b4006287f8 "package/go: security bump to version 1.23.6"
removed the go source from the go-bin package `.hash` file.
Since that commit, a number of autobuild errors for the host-go-bin
package started spawning during the 'legal-info' step.
Because the package 'go-bin' defines the '_ACTUAL_SOURCE_TARBALL'
variable the source hash is still required for the legal-info.

Similarly to the 'nodejs' package, the hash files for both the `go-bin`
and `go-src` package are shared in the `package/go` directory with the
help of a symbolic link used to make the subdirectories point to that
common `.hash` file.

Fixes:
https://autobuild.buildroot.org/results/337/33763441a065ddb07e944e26ad8f1f6d43b68592

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/go/go-bin/go-bin.hash | 9 +--------
 package/go/go-src/go-src.hash | 4 +---
 package/go/go.hash            | 9 +++++++++
 3 files changed, 11 insertions(+), 11 deletions(-)
 mode change 100644 => 120000 package/go/go-bin/go-bin.hash
 mode change 100644 => 120000 package/go/go-src/go-src.hash
 create mode 100644 package/go/go.hash

diff --git a/package/go/go-bin/go-bin.hash b/package/go/go-bin/go-bin.hash
deleted file mode 100644
index 50d2be239f..0000000000
--- a/package/go/go-bin/go-bin.hash
+++ /dev/null
@@ -1,8 +0,0 @@
-# sha256 checksum from https://go.dev/dl/
-sha256  e61f87693169c0bbcc43363128f1e929b9dff0b7f448573f1bdd4e4a0b9687ba  go1.23.6.linux-386.tar.gz
-sha256  9379441ea310de000f33a4dc767bd966e72ab2826270e038e78b2c53c2e7802d  go1.23.6.linux-amd64.tar.gz
-sha256  561c780e8f4a8955d32bf72e46af0b5ee5e0debe1e4633df9a03781878219202  go1.23.6.linux-arm64.tar.gz
-sha256  27a4611010c16b8c4f37ade3aada55bd5781998f02f348b164302fd5eea4eb74  go1.23.6.linux-armv6l.tar.gz
-sha256  0f817201e83d78ddbfa27f5f78d9b72450b92cc21d5e045145efacd0d3244a99  go1.23.6.linux-ppc64le.tar.gz
-sha256  321e7ed0d5416f731479c52fa7610b52b8079a8061967bd48cec6d66f671a60e  go1.23.6.linux-s390x.tar.gz
-sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go-bin/go-bin.hash b/package/go/go-bin/go-bin.hash
new file mode 120000
index 0000000000..0531a32c5c
--- /dev/null
+++ b/package/go/go-bin/go-bin.hash
@@ -0,0 +1 @@
+../go.hash
\ No newline at end of file
diff --git a/package/go/go-src/go-src.hash b/package/go/go-src/go-src.hash
deleted file mode 100644
index b60995fedc..0000000000
--- a/package/go/go-src/go-src.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# From https://go.dev/dl
-sha256  039c5b04e65279daceee8a6f71e70bd05cf5b801782b6f77c6e19e2ed0511222  go1.23.6.src.tar.gz
-sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go-src/go-src.hash b/package/go/go-src/go-src.hash
new file mode 120000
index 0000000000..0531a32c5c
--- /dev/null
+++ b/package/go/go-src/go-src.hash
@@ -0,0 +1 @@
+../go.hash
\ No newline at end of file
diff --git a/package/go/go.hash b/package/go/go.hash
new file mode 100644
index 0000000000..fd2cd71c59
--- /dev/null
+++ b/package/go/go.hash
@@ -0,0 +1,9 @@
+# sha256 checksum from https://go.dev/dl/
+sha256  039c5b04e65279daceee8a6f71e70bd05cf5b801782b6f77c6e19e2ed0511222  go1.23.6.src.tar.gz
+sha256  e61f87693169c0bbcc43363128f1e929b9dff0b7f448573f1bdd4e4a0b9687ba  go1.23.6.linux-386.tar.gz
+sha256  9379441ea310de000f33a4dc767bd966e72ab2826270e038e78b2c53c2e7802d  go1.23.6.linux-amd64.tar.gz
+sha256  561c780e8f4a8955d32bf72e46af0b5ee5e0debe1e4633df9a03781878219202  go1.23.6.linux-arm64.tar.gz
+sha256  27a4611010c16b8c4f37ade3aada55bd5781998f02f348b164302fd5eea4eb74  go1.23.6.linux-armv6l.tar.gz
+sha256  0f817201e83d78ddbfa27f5f78d9b72450b92cc21d5e045145efacd0d3244a99  go1.23.6.linux-ppc64le.tar.gz
+sha256  321e7ed0d5416f731479c52fa7610b52b8079a8061967bd48cec6d66f671a60e  go1.23.6.linux-s390x.tar.gz
+sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
