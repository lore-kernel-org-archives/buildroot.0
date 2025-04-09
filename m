Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 131A6C36002
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 16:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CBB560B0C;
	Wed,  9 Apr 2025 16:33:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 31AFIe4W73-Z; Wed,  9 Apr 2025 16:33:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EB6D6101A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EB6D6101A;
	Wed,  9 Apr 2025 16:33:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5961D108
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 16:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28B1441244
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 16:33:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p8L0TZPiKXUN for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 16:33:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9D850410AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D850410AF
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9D850410AF
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 16:33:47 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3913b539aabso4354795f8f.2
 for <buildroot@buildroot.org>; Wed, 09 Apr 2025 09:33:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744216425; x=1744821225;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=064zntqEGvEE4NacyuiuDPT7FBgXjH8qI1oTXiDsHoQ=;
 b=Vmcu3MZcMnBksqOaLvwlHsCPcaWM3+455hCPPvAblr4kPQ16QYBINLhoxL5HCCfDOW
 leHKP/QoK2U48xvMNfmq9vyPX1/n6VBUJhdF0NKi288uJJVqAcjap4O6Mu4hU9+EvlBd
 tq2VN2DZfypVamrmjQLwgiRbaHIgXYOIvh2VQphOC18gI+vYZXrzV5paYJtHjb2sovMj
 67jN1t/Ady9hnqKk04Rr3Azi0jgB7bAFYUF5sbveMbpwrPZbXBu49c78aQnhh2+7yK0S
 Sx3z8T/BgY6KUaDtUhhs4Et/PaJu72WBWJ4WYi02NCfgTDV9QGvWoTvXGqY/hpb2UJ3p
 /pTw==
X-Gm-Message-State: AOJu0YyHzvncZxTiH4WiiOYwDYt2fHAogYNcz60ysvuYOukmlK+Dkon1
 MZQjF/Iym3WPtbYrGWXnSFRU0gI1iyBC8C6cSIwfa/8TpRIS6/uWTQtfwn9nx6IIrhZ9dC8WVcb
 u
X-Gm-Gg: ASbGncsXLy12I8T4lofE5CPfPdFNoNGj0WRdq/lGrLyVnDrXtOP4Anm8kerBbLge84i
 pQRcIvSqLhXZD5KkRA/ctTM25Zq2NRh7Jg+fJDyQnyZWt26qwjeWZROA+AzOeqn7U+4PLJb1mwR
 cf4rrO1qBCXifJJYlPXsb1abBh8Xn96uuWd69vQh3Cm8ug27jHDSeRxAxwzJugdt5324cHhS5JI
 g5WmnjEzS9Sl3zCqsUhtqhIkwF3uI1x6MF3bykFFe4l0DaMEjRgIRx/2W5zLzJ1WCqF/v3fDtJp
 H5mrpkxYRAu0Xl8Q115DKwuk5Imv8/0Bub56N1MB6SBpzg7DPHm1YG0=
X-Google-Smtp-Source: AGHT+IFTpnFAUal6Tb1GySZHUUz+HsWJh+1iRIFgzRY5Gp6GZOCOIwgLFT6NSBKCF2hN//cvVtks6Q==
X-Received: by 2002:a05:6000:178b:b0:39c:1f11:ead with SMTP id
 ffacd0b85a97d-39d8853927dmr2770118f8f.26.1744216425258; 
 Wed, 09 Apr 2025 09:33:45 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.61])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d8938a67bsm2056176f8f.46.2025.04.09.09.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 09:33:44 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Joris Lijssens <joris.lijssens@gmail.com>
Date: Wed,  9 Apr 2025 18:33:34 +0200
Message-ID: <20250409163334.687686-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1744216425; x=1744821225; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=064zntqEGvEE4NacyuiuDPT7FBgXjH8qI1oTXiDsHoQ=;
 b=gy40M3oEWVzVvJ6ztY8WIPWgOEgJb/lbmIC6C0YcJN5zPpHR779YX2u9kvC3GuXnX0
 o89e1Lwu0lIb7Hw5zOII64FzyoNYHTMNw/VdSBMFlgO8ve3oqXpzHhCBjIT1k0SONM8S
 +ZPiV1ta9wrguTMQRaPviJd+gh0zKQvpbVYR0W0R/rJLABe+zExnCWJ2/lHbxwltcz20
 J4uSGBJ/+S/Wen5wiZHaMSV1D5NhZqMEt+yN7GzodlcJo1ddN8Evvz6cGstGcF7eFuYc
 XmPEPOTSYVY12K9yy3KjUtmNZOPTDZz765sc4v/LF6XS+ljEIxnlrc9UPYis6iC8dVp0
 /mVA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gy40M3oE
Subject: [Buildroot] [v2 PATCH 1/1] package/libcoap: bump version to 4.3.5
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

The patch introduced in [1] that fixed the CVE-2024-0962 is now
available upstream in the 4.3.5 release [2].

For more details see the release note:

https://github.com/obgm/libcoap/blob/v4.3.5/ChangeLog

[1] 9002b818be package/libcoap: fix CVE-2024-0962
[2] https://github.com/obgm/libcoap/commit/2b28d8b0e9607e71a145345b4fe49517e052b7d9

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
