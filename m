Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D37CA0EE6
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 13:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2594060A68;
	Tue, 19 Aug 2025 13:39:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jvAcwSHiXf4j; Tue, 19 Aug 2025 13:39:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 432E460A70
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 432E460A70;
	Tue, 19 Aug 2025 13:39:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 378CEDE6
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 13:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1DA6B60A70
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 13:39:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MFF8pCAG_jZQ for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 13:39:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9FE4160A68
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FE4160A68
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9FE4160A68
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 13:39:17 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-45a1b00f187so24752075e9.0
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 06:39:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755610755; x=1756215555;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t43jv1b/ZxwvvnpXrYqdbvrC7RQSEjl3OZst7Yt7P/k=;
 b=ChTGcApTWZNyg3YoU0VNDsxeXiphdjo2vJogd2i6BiThrQx7EulZ7MD3OSiy6MdvZD
 rshLX46GgixUz8zlT5OdZbzPeN7ZdhDrfYlzlP79pyIYSqaQ6OoOc671bnVAPBYQ/3db
 xd1v9wDetE8dJiV7ZTBgkGCVpKCcfskvL/xiaae/H7nGGrUMGtcdC4qgiRMFZd+zKaYt
 TtnK7OJu5iT8+HENtAK6xxxBFx+dMLLMNSG1HlMrrVvmv5K6HEz74LlqkUni/y93Qauu
 GpcG8CYD7P9WBsLVUVYtzUs8BWgvoFjbuffQwBcDN8UgbJfEDducDAOQ3JX7EyEuwPsl
 MZjA==
X-Gm-Message-State: AOJu0YxUZd92An+pMcYKftT5wChPOmrervEorkTOxQ2dAmlz0f5Y9SX0
 syP99vWsjv6gtnz7impQtQ0veLOO7SraKDiwR6QvfCxNuL6TExjwYTyb3SttIZUjJsAubPFOqSy
 /0c3uNGw=
X-Gm-Gg: ASbGncu0Vs0Ki6v88hoNCTHFMj2IsfWAVr7wz4ouZAQIgHU19CpTOm5ftxpS3+o5wix
 yTKxeTbufNeXzfAfg6VSLRW8ARZY1YgBHTOZGiRanprHAAvpN9oR1hT74B6H2on9+QEE6so8SiK
 dzieWzJ+KVJHmlWMzxaGZnzR/rg3pOyxPXJi4Q7A46Q0GtHiQsxsfZ/4tz/EZp9L3OokhZId41r
 E9fsZC1vYnThTMAWDzBuQ/a18OKjyvDTyG0JvmhPr1culPa45T9CpxkJaWXw+offvaFTgXax07k
 1HS04N6ajIuXmJVn1CjwadbXDcVEBlB06u7/A9Ly6zra4+OHEaCsSlRgtqB32cz0hP6Y7R5KuOL
 vsKcNl6znKq6PrvEH6Hs27K/H
X-Google-Smtp-Source: AGHT+IESGeY1pqOoH+hrqoX06lcDzi2GSKPV1otuJZNzzt6XfHGBe0N/uBbcgwJ0NQaxUhIBzlZVuw==
X-Received: by 2002:a05:600c:3513:b0:459:443e:b177 with SMTP id
 5b1f17b1804b1-45b43e0bc36mr22518445e9.25.1755610754865; 
 Tue, 19 Aug 2025 06:39:14 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c077788df7sm3805731f8f.48.2025.08.19.06.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 06:39:14 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>
Date: Tue, 19 Aug 2025 15:39:11 +0200
Message-ID: <20250819133911.3965048-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755610755; x=1756215555; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=t43jv1b/ZxwvvnpXrYqdbvrC7RQSEjl3OZst7Yt7P/k=;
 b=c1Uf9+MMDeEa4y8y4WkcEblN7YkAPMUzpo6kVcWltRfnScUaPOqER+PREsko0eqcpL
 jc2G7bWgBc2gCs4Om6FFUcgVPx7UAPz+xL17CvmgHvy7zsFkXx/era1T3UdlPoxeCak6
 0KC0xte+foYLcAHwWvNBAzQSNNhTzfqpD6hEAnfgDoZvtc2aW98VEk6w0HHnuSjpO93E
 C3S8txsMceF/hM/zZIjkt6oxC7A4AF7wjOE9cCF5kCtPqoeu8GfTg7mBLfX/q0CzaDh6
 z1mG5uBp+UQDpjpc3zs5WiCAKQ2JUE4nxmgJkvB+4X4oFcRVvzqRG4gP6qyCAkucQGhY
 5+LA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=c1Uf9+MM
Subject: [Buildroot] [PATCH] package/openjpeg: add patch to fix
 CVE-2025-54874
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following vulnerability:

- CVE-2025-54874

    OpenJPEG is an open-source JPEG 2000 codec. In OpenJPEG 2.5.3 and
    earlier, a call to opj_jp2_read_header may lead to OOB heap memory
    write when the data stream p_stream is too short and p_image is not
    initialized.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-54874
  - https://github.com/uclouvain/openjpeg/commit/f809b80c67717c152a5ad30bf06774f00da4fd2d

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...check-for-error-after-parsing-header.patch | 41 +++++++++++++++++++
 package/openjpeg/openjpeg.mk                  |  3 ++
 2 files changed, 44 insertions(+)
 create mode 100644 package/openjpeg/0001-check-for-error-after-parsing-header.patch

diff --git a/package/openjpeg/0001-check-for-error-after-parsing-header.patch b/package/openjpeg/0001-check-for-error-after-parsing-header.patch
new file mode 100644
index 0000000000..9a02fbf3d4
--- /dev/null
+++ b/package/openjpeg/0001-check-for-error-after-parsing-header.patch
@@ -0,0 +1,41 @@
+From f809b80c67717c152a5ad30bf06774f00da4fd2d Mon Sep 17 00:00:00 2001
+From: Sebastian Rasmussen <sebras@gmail.com>
+Date: Thu, 16 Jan 2025 02:13:43 +0100
+Subject: [PATCH] opj_jp2_read_header: Check for error after parsing header.
+
+Consider the case where the caller has not set the p_image
+pointer to NULL before calling opj_read_header().
+
+If opj_j2k_read_header_procedure() fails while obtaining the rest
+of the marker segment when calling opj_stream_read_data() because
+the data stream is too short, then opj_j2k_read_header() will
+never have the chance to initialize p_image, leaving it
+uninitialized.
+
+opj_jp2_read_header() will check the p_image value whether
+opj_j2k_read_header() suceeded or failed. This may be detected as
+an error in valgrind or ASAN.
+
+The fix is to check whether opj_j2k_read_header() suceeded before
+using the output argument p_image.
+
+Upstream: https://github.com/uclouvain/openjpeg/commit/f809b80c67717c152a5ad30bf06774f00da4fd2d
+CVE: CVE-2025-54874
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/lib/openjp2/jp2.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/lib/openjp2/jp2.c b/src/lib/openjp2/jp2.c
+index 4df055a54..da5063186 100644
+--- a/src/lib/openjp2/jp2.c
++++ b/src/lib/openjp2/jp2.c
+@@ -2873,7 +2873,7 @@ OPJ_BOOL opj_jp2_read_header(opj_stream_private_t *p_stream,
+                               p_image,
+                               p_manager);
+ 
+-    if (p_image && *p_image) {
++    if (ret && p_image && *p_image) {
+         /* Set Image Color Space */
+         if (jp2->enumcs == 16) {
+             (*p_image)->color_space = OPJ_CLRSPC_SRGB;
diff --git a/package/openjpeg/openjpeg.mk b/package/openjpeg/openjpeg.mk
index 275659cd3c..7b1352c222 100644
--- a/package/openjpeg/openjpeg.mk
+++ b/package/openjpeg/openjpeg.mk
@@ -11,6 +11,9 @@ OPENJPEG_LICENSE_FILES = LICENSE
 OPENJPEG_CPE_ID_VENDOR = uclouvain
 OPENJPEG_INSTALL_STAGING = YES
 
+# 0001-check-for-error-after-parsing-header.patch
+OPENJPEG_IGNORE_CVES += CVE-2025-54874
+
 OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_ZLIB),zlib)
 OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBPNG),libpng)
 OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_TIFF),tiff)
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
