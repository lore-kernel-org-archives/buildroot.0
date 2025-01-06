Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D008E77198
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 04:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8108D60AE6;
	Mon,  6 Jan 2025 04:16:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NE6e0Uo-Eomp; Mon,  6 Jan 2025 04:16:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CCE460B1F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CCE460B1F;
	Mon,  6 Jan 2025 04:16:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9914CD92
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 04:16:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 791E540C26
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 04:16:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vjyWu4d2ctEL for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 04:16:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5412140C16
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5412140C16
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5412140C16
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 04:16:03 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-2ef714374c0so17021994a91.0
 for <buildroot@buildroot.org>; Sun, 05 Jan 2025 20:16:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736136962; x=1736741762;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6quQappw2ix8o3jCPoEg3u6XMLS0Xs2eJZhPH1Gll70=;
 b=TKJZ6/udTlaDbgpNgcNXD4Uh7yfgPM9a7WtF55gtB7vCCR+DUFEjMsnfWPH8y4z22p
 5IsfJNtqWZMawFwvkDSB4cp+Uoc1e9LN/fPvOFIVed+K8HIiZScq5dZtzCTcwhZSfrDA
 DMe2t3xrqdn3yyVGV79gihE3Kg8DGTZo6WRKsO68LldVcUoCifYGgY9mVrH46og9Z1ud
 jFAxM7Gtu7gfJa19Lq8zdwmDJ1XkMpilaQ+dLmwse2PqDb1PMdx7L2ZzUL/t9toFPp9B
 j1w9XNCeTbDZlfNJpM2yL79UVRtsANlxbewQLmzavdSxUVkO7sfOCXHlU7dwia/1DE3v
 8UNQ==
X-Gm-Message-State: AOJu0YxV7M7qRbXvXed+qPwgYpB60AX7/nbbPaU2CuMux+XuBbpbkk+B
 /axeYSX8uW+D/Erd/ZRZDFBxupUkjLmWZWNLnRJsy1ngEgF1pe3Cu3b05A==
X-Gm-Gg: ASbGncuPAMGrKwFZspp+iPXy8jKUArfY6iAmf+EeyzDE0CpweLz4U/5q9vQnRgCcily
 fFOb46J77fsOTUy8C2EfExfUJeNtTFWkF/6er0jDpsEQciUneyFYj3HHpzpAVfgOf+jy1omeyzA
 t9YccnqWWv5E5GD3w5tMWiNQuO1Sgw9fFXq0irvpn3d0KEs/PEbxDzDxTbDTcoH8Hkj2KFEWJpX
 1kUdnCDOgQhDuUpYCwSWaI/CL3bw/qvV+5zYvtqlYcXwRBec5jQO3K3dj+1XA03g7OINZkTRI8S
 QH1dAtcEkipxX5mR2MQQldL+7Jj7SjpUuO3pOZxD
X-Google-Smtp-Source: AGHT+IEexJ6XLslAT8zTKbKJJ3bKPY/oP+wOAwFjAXFp+DmHjnSOuK3X1ct6yKi7VljEVNT/WZ/kdw==
X-Received: by 2002:a17:90b:54d0:b0:2f1:2e10:8160 with SMTP id
 98e67ed59e1d1-2f4536d193bmr84094741a91.11.1736136962328; 
 Sun, 05 Jan 2025 20:16:02 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f44779890bsm36374171a91.9.2025.01.05.20.16.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2025 20:16:01 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Sun,  5 Jan 2025 20:03:23 -0800
Message-Id: <20250106040323.153486-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736136962; x=1736741762; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6quQappw2ix8o3jCPoEg3u6XMLS0Xs2eJZhPH1Gll70=;
 b=mCuU5Li6tv60klzeNvfjesMm83iJLn30TaVbbl+2mHnI2WqJItHRWvHEEXHDWgwGr4
 VG/JPbCJ/xKshjIWCatIWGxtb4p3p9bPACraGGcO7ZniXHI4KxFE8tIOZ1TtoAMy7YKO
 bySHq2WXXVAlRyqSKIrpgrzQm0XwOxROuibam3giKi/36KUhRiPS2N/pTcSttZaDNIGj
 HB5Sluf5I+DGDxBNpK4BT3VLCEft1VzTOpL9QVZBLK9okeR1sMPsFAGdMj8SwlKQKxXO
 VyjCsMXcXUPfHpGousy6linZHToVEoW+vObb5/9qDYr7QSDM2txMZlR+zFj/NbL/irdF
 PmvQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mCuU5Li6
Subject: [Buildroot] [PATCH 1/1] package/json-c: bump to version 0.18
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

Changelog - https://github.com/json-c/json-c/compare/json-c-0.17-20230812...json-c-0.18-20240915

Drop 0001-json_pointer.c-initialize-idx.patch.
Upstream commit - https://github.com/json-c/json-c/commit/7ff7eab603611c65b3110dcb1b0caf5cc68b07a3

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 .../0001-json_pointer.c-initialize-idx.patch  | 37 -------------------
 package/json-c/json-c.hash                    |  2 +-
 package/json-c/json-c.mk                      |  2 +-
 3 files changed, 2 insertions(+), 39 deletions(-)
 delete mode 100644 package/json-c/0001-json_pointer.c-initialize-idx.patch

diff --git a/package/json-c/0001-json_pointer.c-initialize-idx.patch b/package/json-c/0001-json_pointer.c-initialize-idx.patch
deleted file mode 100644
index 3dbe0b4067..0000000000
--- a/package/json-c/0001-json_pointer.c-initialize-idx.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 7ff7eab603611c65b3110dcb1b0caf5cc68b07a3 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 8 Nov 2023 22:42:48 +0100
-Subject: [PATCH] json_pointer.c: initialize idx
-
-Fix the following build failure with gcc 5:
-
-/home/thomas/autobuild/instance-2/output-1/build/json-c-0.17/json_pointer.c: In function 'json_pointer_result_get_recursive':
-/home/thomas/autobuild/instance-2/output-1/build/json-c-0.17/json_pointer.c:193:25: error: 'idx' may be used uninitialized in this function [-Werror=maybe-uninitialized]
-    res->index_in_parent = idx;
-                         ^
-
-Fixes:
- - http://autobuild.buildroot.org/results/523b35a979d59121fe4e18c38171792b06233940/
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/json-c/json-c/pull/839
----
- json_pointer.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/json_pointer.c b/json_pointer.c
-index 89e9e21..0ac8aaa 100644
---- a/json_pointer.c
-+++ b/json_pointer.c
-@@ -158,7 +158,7 @@ static int json_pointer_result_get_recursive(struct json_object *obj, char *path
-                                              struct json_pointer_get_result *res)
- {
- 	struct json_object *parent_obj = obj;
--	size_t idx;
-+	size_t idx = 0;
- 	char *endp;
- 	int rc;
- 
--- 
-2.42.0
-
diff --git a/package/json-c/json-c.hash b/package/json-c/json-c.hash
index c9bb8c708b..88bb49cb9d 100644
--- a/package/json-c/json-c.hash
+++ b/package/json-c/json-c.hash
@@ -1,4 +1,4 @@
 # From https://github.com/json-c/json-c/wiki
-sha256  7550914d58fb63b2c3546f3ccfbe11f1c094147bd31a69dcd23714d7956159e6  json-c-0.17.tar.gz
+sha256  876ab046479166b869afc6896d288183bbc0e5843f141200c677b3e8dfb11724  json-c-0.18.tar.gz
 # Locally calculated
 sha256  74c1e6ca5eba76b54d0ad00d4815c8315c1b3bc45ff99de61d103dc92486284c  COPYING
diff --git a/package/json-c/json-c.mk b/package/json-c/json-c.mk
index 68401433b4..254b6fd838 100644
--- a/package/json-c/json-c.mk
+++ b/package/json-c/json-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JSON_C_VERSION = 0.17
+JSON_C_VERSION = 0.18
 JSON_C_SITE = https://s3.amazonaws.com/json-c_releases/releases
 JSON_C_INSTALL_STAGING = YES
 JSON_C_LICENSE = MIT
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
