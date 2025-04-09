Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 265BAC36002
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 16:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C432460ABF;
	Wed,  9 Apr 2025 16:27:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KxUDMJlX-48n; Wed,  9 Apr 2025 16:27:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5BB8607D2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5BB8607D2;
	Wed,  9 Apr 2025 16:27:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 95E70108
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 16:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8785C402B1
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 16:27:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZuPCQj42aCAJ for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 16:27:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 09E1F41262
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09E1F41262
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 09E1F41262
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 16:27:37 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43ed8d32a95so44517555e9.3
 for <buildroot@buildroot.org>; Wed, 09 Apr 2025 09:27:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744216055; x=1744820855;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C3ClrVU880oulV36h2yDhLR120VHcrE0WV7BISXP0Jg=;
 b=tcjqXEPeblDXs5x4fVATTct2l9iB9hHhx7DlSJ9+UtErYlFE4Mu1O7zSqDpT3lffMU
 IIZj2/v8tZeCvdYFBJulUabd7Eb6b9UjL/Xa7ymoxo3/Wtdu6IdX+laDa8GvHXpaWxhU
 R8LwnuQBFKiFOoERKzYpWOmMwev+ZSIHNKMcrYCQyGpMwJ3BUAfWEpf5E+giL9N72BnK
 Y5FRnoHAneENvf5VgUpH9Md+SypVtC28ytrwIWsv6ZOcR0ReAMr0iMtSFe2RVw75kFaZ
 F96P/fAoP72DVVZJCfQDk394hN3wB6oexXd16dN3Jla0bciVdnErRHsqcLlhHful3OIy
 j0RQ==
X-Gm-Message-State: AOJu0YymFL/ETzF5ycAoLI0/ZCHw/NTWuy9pyaWVZy+X2b4ZowVLlfTC
 yaMHBfobd65iFmuw/Vmrw5k9yr79CFj/unEyjvrNxvbFbmOxAi1FGvCZwzGI4sRuO9+zySdUhxp
 1
X-Gm-Gg: ASbGncukQtuHx0DsmUeIENcFcMB9uoR5pSwF+pyOZluKVn88hNci521AP/RE2qVbUnp
 Qkuwgdi3HOtX/2tUQOXVWiQwE+1aZMF7YKSTY8t97deRec5CM4llTYtzp+I7gXdM6vHKAMLWa9F
 0ucrQPBehoyr4Akl/nMZJ3QMrLcA9lhYJmmcNhb/LSbMszOc/qkDGvIMwiHsteN0IqNfYKU6lf4
 xp9CZjJcs1/uMilDeShHgpt052FGRcLz4kq5UnPAaLuZBA3Etsl1GS9p/MLcdhRxUeq+p6Kr3w3
 XOAK0BUYgrbCLpTrwITes28CC0zl+kXsZHU2qqI6lr/EmaO7cRH2iBY=
X-Google-Smtp-Source: AGHT+IFnhLPlX1NfShTQRlByrk1JaFKNUoSxEnkEfPv6/3g333x5q4GeyatY0Tnke2bYvTHBrne9nA==
X-Received: by 2002:a05:600c:3484:b0:43b:ca39:6c75 with SMTP id
 5b1f17b1804b1-43f1ecd6affmr44431915e9.16.1744216055361; 
 Wed, 09 Apr 2025 09:27:35 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.61])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f233a2c53sm21024835e9.14.2025.04.09.09.27.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 09:27:35 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Joris Lijssens <joris.lijssens@gmail.com>
Date: Wed,  9 Apr 2025 18:27:12 +0200
Message-ID: <20250409162712.675615-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1744216055; x=1744820855; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C3ClrVU880oulV36h2yDhLR120VHcrE0WV7BISXP0Jg=;
 b=Dhy5DlLVbkCUS99SlSTDxMTUF600qgUgPQQZQj13XWXH6Xo2ME23duYUakrx+KHg/f
 0x27xuGmyjLSl8YFPb8lCO+DwFYgX6RLCDatPYDpZexXDcJg1RtR8IpjQITVRbB+rAps
 +Gb5XIoESKycH/dJJJvJxw+qQs9vHx1rMR1xGdPPAowCr6D1DW1xP06hKTM8GDbAivss
 TypXt5CBVoguFXiNlrAFPzjD50rU1koQNRTbxIsbdm9QKBJpbc/IYmN32Ekbg1jGqriu
 PVsfX/osF1sbyKk3Mz3ZdTs+/3X35lEuhC2Xk5Q4Sundw30hcKIknmpcEsRyaDqRLE3D
 Xb+A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Dhy5DlLV
Subject: [Buildroot] [PATCH 1/1] package/libcoap: bump version to 4.3.5
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

From: Thomas Perale <thomas.mind@mind.be>

The patch introduced in [1] that fixed the CVE-2024-0962 is now
available upstream in the 4.3.5 release [2].

For more details see the release note:

https://github.com/obgm/libcoap/blob/v4.3.5/ChangeLog

[1] 9002b818be package/libcoap: fix CVE-2024-0962
[2] https://github.com/obgm/libcoap/commit/2b28d8b0e9607e71a145345b4fe49517e052b7d9

Signed-off-by: Thomas Perale <thomas.mind@mind.be>
---
 ...ing-OSCORE-configuration-information.patch | 38 -------------------
 package/libcoap/libcoap.hash                  |  2 +-
 package/libcoap/libcoap.mk                    |  5 +--
 3 files changed, 2 insertions(+), 43 deletions(-)
 delete mode 100644 package/libcoap/0001-coap_oscore-c-Fix-parsing-OSCORE-configuration-information.patch

diff --git a/package/libcoap/0001-coap_oscore-c-Fix-parsing-OSCORE-configuration-information.patch b/package/libcoap/0001-coap_oscore-c-Fix-parsing-OSCORE-configuration-information.patch
deleted file mode 100644
index e75250d613..0000000000
--- a/package/libcoap/0001-coap_oscore-c-Fix-parsing-OSCORE-configuration-information.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 2b28d8b0e9607e71a145345b4fe49517e052b7d9 Mon Sep 17 00:00:00 2001
-From: Jon Shallow <supjps-libcoap@jpshallow.com>
-Date: Thu, 25 Jan 2024 18:03:17 +0000
-Subject: [PATCH] coap_oscore.c: Fix parsing OSCORE configuration information
-
-Upstream: https://github.com/obgm/libcoap/commit/2b28d8b0e9607e71a145345b4fe49517e052b7d9
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/coap_oscore.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/src/coap_oscore.c b/src/coap_oscore.c
-index 83f785c92..e0fb22947 100644
---- a/src/coap_oscore.c
-+++ b/src/coap_oscore.c
-@@ -1678,11 +1678,12 @@ get_split_entry(const char **start,
-                 oscore_value_t *value) {
-   const char *begin = *start;
-   const char *end;
-+  const char *kend;
-   const char *split;
-   size_t i;
- 
- retry:
--  end = memchr(begin, '\n', size);
-+  kend = end = memchr(begin, '\n', size);
-   if (end == NULL)
-     return 0;
- 
-@@ -1693,7 +1694,7 @@ get_split_entry(const char **start,
- 
-   if (begin[0] == '#' || (end - begin) == 0) {
-     /* Skip comment / blank line */
--    size -= end - begin + 1;
-+    size -= kend - begin + 1;
-     begin = *start;
-     goto retry;
-   }
diff --git a/package/libcoap/libcoap.hash b/package/libcoap/libcoap.hash
index 20abb94f8f..2b0c3bcde4 100644
--- a/package/libcoap/libcoap.hash
+++ b/package/libcoap/libcoap.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  ae61a48c21f7b40e1442c9e1da9aab9e6f2cf0deccb02f3fed4de232a0b0522e  libcoap-4.3.4.tar.gz
+sha256  a417ed26ec6c95c041b42353b5b6fad1602e2bf42a6e26c09863450e227b7b5f  libcoap-4.3.5.tar.gz
 sha256  09dd86a017bad210527085008cbf706609c58210897b69845af14099577e7eb7  COPYING
 sha256  bdd94ddd8e75010aebd045ead1c951110788003395c708811d6960248acb3891  LICENSE
diff --git a/package/libcoap/libcoap.mk b/package/libcoap/libcoap.mk
index 29161142f6..c5e5f85c62 100644
--- a/package/libcoap/libcoap.mk
+++ b/package/libcoap/libcoap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCOAP_VERSION = 4.3.4
+LIBCOAP_VERSION = 4.3.5
 LIBCOAP_SITE = $(call github,obgm,libcoap,v$(LIBCOAP_VERSION))
 LIBCOAP_INSTALL_STAGING = YES
 LIBCOAP_LICENSE = BSD-2-Clause
@@ -15,9 +15,6 @@ LIBCOAP_CONF_OPTS = \
 	--disable-examples --disable-examples-source --without-tinydtls
 LIBCOAP_AUTORECONF = YES
 
-# 0001-coap_oscore-c-Fix-parsing-OSCORE-configuration-information.patch
-LIBCOAP_IGNORE_CVES += CVE-2024-0962
-
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 LIBCOAP_DEPENDENCIES += gnutls
 LIBCOAP_CONF_OPTS += \
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
