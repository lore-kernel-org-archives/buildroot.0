Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0DDC4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 22:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77AD64EED3;
	Wed,  1 Nov 2023 22:37:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77AD64EED3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AF8soeaaYi0R; Wed,  1 Nov 2023 22:37:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B38BC4EED9;
	Wed,  1 Nov 2023 22:37:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B38BC4EED9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1ADF21BF30B
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 22:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E18A8432A5
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 22:37:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E18A8432A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RaYmcKLeY-d3 for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 22:37:35 +0000 (UTC)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4B546432A2
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 22:37:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B546432A2
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-507a0907896so268609e87.2
 for <buildroot@buildroot.org>; Wed, 01 Nov 2023 15:37:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698878253; x=1699483053;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dHjlQhC/E9BXrQFvzXaWaBJi5s4oTNifPTaWi5AfWAY=;
 b=QjzQyzC8I4pfA1wxsja+H2d3xH708uIKd+p0VkykMO8x48fSjEQx6vHIdBMBkDMamv
 zCY0ERj3si4JXz+f92DCx5OfjT0NKu5UcxF8VasyQkRXBxLtPV2CQ+AfhUKcElfv/1F7
 q+OTAeVgUwawwDGpuzLMvwnyQ+QwFzz6TSHYp6NP9kdIuNtgR6EgWsCao1qo5MgiaPem
 /X8suZLfq/Ir4lGJB+Q3xN5hpM1qz94dzQi699IBNYiZk5TZPn8tFWnFU3Ub1h7nq63D
 RZaFYxiovBlHtOIakkJ2NbYflz4CdGVdh9t3tnsn2ckzRBN7PI+8FYettUiws9ogsV7Z
 ibfA==
X-Gm-Message-State: AOJu0Yycccoyb7kkSluWqB53ad8qCiWVct7kf4wETIdN7jC1jaYmV10H
 5/6LbgX/vqUBG4OzRWXnCXzoHHj0kz4=
X-Google-Smtp-Source: AGHT+IEc1VaeEFSI3ea1Z7UjRyZk7wWqGoyZAfXUDEfIPkONckre/zUrfOWL1CmsnjnCVwlEN9vWKQ==
X-Received: by 2002:a05:6512:401d:b0:503:3787:f75a with SMTP id
 br29-20020a056512401d00b005033787f75amr14799378lfb.62.1698878252501; 
 Wed, 01 Nov 2023 15:37:32 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 l13-20020adfe58d000000b0032dba85ea1bsm785974wrm.75.2023.11.01.15.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Nov 2023 15:37:32 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  1 Nov 2023 23:37:19 +0100
Message-ID: <20231101223719.36953-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698878253; x=1699483053; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dHjlQhC/E9BXrQFvzXaWaBJi5s4oTNifPTaWi5AfWAY=;
 b=cP4THHqqpaIcGMLo1KWmbbEzWtaE3W64GZSgvfw0GFYQR9/MqKhdw2/RqjTPVFDVf6
 bF2S/xHIeD8DXBSEAP5stqJZLGgfZkc9b9kxztbPW/avJUIOZ5fpJLOGidqxDHBzFtAJ
 rehalynBCZxXeeG4CcaVYo68wTJeF9Sv/6XBD8ZJ43o9fNIV2Q78q95xF7ogF0Q82jqI
 JnZ/7GLniOb+pOqBuX5ivhuwVyXJv/o523V7Rfj5OrEN535Xq7qi3vpKOvjJjtF7Aaa9
 zVbCeBtlQMxX+VxXxECAipu3B+JxyktLtMzE6G6wQC0ICq/NLCp1fVBSPptgSJv3T3Y4
 TGjw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cP4THHqq
Subject: [Buildroot] [PATCH 1/1] package/libcoap: bump to version 4.3.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop patch (already in version)
- LIBCOAP_IGNORE_CVES is not needed after bump
- Update hash of license file: LGPL-2.1 added when RIOT support with
  https://github.com/obgm/libcoap/commit/8d869fff047d34a1c825ffc1bab5d3fde28c75b7

https://github.com/obgm/libcoap/blob/v4.3.4/ChangeLog
https://github.com/obgm/libcoap/compare/v4.3.1...v4.3.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...0001-Backport-fix-for-CVE-2023-30362.patch | 59 -------------------
 package/libcoap/libcoap.hash                  |  4 +-
 package/libcoap/libcoap.mk                    |  6 +-
 3 files changed, 3 insertions(+), 66 deletions(-)
 delete mode 100644 package/libcoap/0001-Backport-fix-for-CVE-2023-30362.patch

diff --git a/package/libcoap/0001-Backport-fix-for-CVE-2023-30362.patch b/package/libcoap/0001-Backport-fix-for-CVE-2023-30362.patch
deleted file mode 100644
index ddc5329299..0000000000
--- a/package/libcoap/0001-Backport-fix-for-CVE-2023-30362.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From c63ecbdc6b38cc7e571a72964fe9ca63834dcc89 Mon Sep 17 00:00:00 2001
-From: Jon Shallow <supjps-libcoap@jpshallow.com>
-Date: Wed, 6 Sep 2023 21:38:13 +0200
-Subject: [PATCH] Backport fix for CVE-2023-30362
-
-Upstream: https://github.com/obgm/libcoap/issues/1063#issuecomment-1626962307
-Signed-off-by: Daniel Lang <dalang@gmx.at>
----
- src/net.c | 34 +++++++++++++++++++++-------------
- 1 file changed, 21 insertions(+), 13 deletions(-)
-
-diff --git a/src/net.c b/src/net.c
-index 98859443..e259ab00 100644
---- a/src/net.c
-+++ b/src/net.c
-@@ -1305,19 +1305,27 @@ coap_send_internal(coap_session_t *session, coap_pdu_t *pdu) {
- 
-       /* Need to check that we are not seeing this proxy in the return loop */
-       if (pdu->data && opt == NULL) {
--        if (pdu->used_size + 1 <= pdu->max_size) {
--          char *a_match;
--          size_t data_len = pdu->used_size - (pdu->data - pdu->token);
--          pdu->data[data_len] = '\000';
--          a_match = strstr((char*)pdu->data, cp);
--          if (a_match && (a_match == (char*)pdu->data || a_match[-1] == ' ') &&
--              ((size_t)(a_match - (char*)pdu->data + len) == data_len ||
--               a_match[len] == ' ')) {
--            coap_log(LOG_WARNING, "Proxy loop detected '%s'\n",
--                     (char*)pdu->data);
--            coap_delete_pdu(pdu);
--            return (coap_mid_t)COAP_DROPPED_RESPONSE;
--          }
-+        char *a_match;
-+        size_t data_len;
-+
-+        if (pdu->used_size + 1 > pdu->max_size) {
-+          /* No space */
-+          return (coap_mid_t)COAP_DROPPED_RESPONSE;
-+        }
-+        if (!coap_pdu_resize(pdu, pdu->used_size + 1)) {
-+          /* Internal error */
-+          return (coap_mid_t)COAP_DROPPED_RESPONSE;
-+        }
-+        data_len = pdu->used_size - (pdu->data - pdu->token);
-+        pdu->data[data_len] = '\000';
-+        a_match = strstr((char*)pdu->data, cp);
-+        if (a_match && (a_match == (char*)pdu->data || a_match[-1] == ' ') &&
-+            ((size_t)(a_match - (char*)pdu->data + len) == data_len ||
-+             a_match[len] == ' ')) {
-+          coap_log(LOG_WARNING, "Proxy loop detected '%s'\n",
-+                   (char*)pdu->data);
-+          coap_delete_pdu(pdu);
-+          return (coap_mid_t)COAP_DROPPED_RESPONSE;
-         }
-       }
-       if (pdu->used_size + len + 1 <= pdu->max_size) {
--- 
-2.42.0
-
diff --git a/package/libcoap/libcoap.hash b/package/libcoap/libcoap.hash
index e0006b62af..20abb94f8f 100644
--- a/package/libcoap/libcoap.hash
+++ b/package/libcoap/libcoap.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  074a71deca01e06d3acb00a1416d0fbeb87d130f40a3c0f6fda3a5c711855dca  libcoap-4.3.1.tar.gz
+sha256  ae61a48c21f7b40e1442c9e1da9aab9e6f2cf0deccb02f3fed4de232a0b0522e  libcoap-4.3.4.tar.gz
 sha256  09dd86a017bad210527085008cbf706609c58210897b69845af14099577e7eb7  COPYING
-sha256  5711e8bf7e94b59fcf0681d0f73752111bc196563b60f8568f19dacd0213192b  LICENSE
+sha256  bdd94ddd8e75010aebd045ead1c951110788003395c708811d6960248acb3891  LICENSE
diff --git a/package/libcoap/libcoap.mk b/package/libcoap/libcoap.mk
index 94bfc59702..62f08a20e9 100644
--- a/package/libcoap/libcoap.mk
+++ b/package/libcoap/libcoap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCOAP_VERSION = 4.3.1
+LIBCOAP_VERSION = 4.3.4
 LIBCOAP_SITE = $(call github,obgm,libcoap,v$(LIBCOAP_VERSION))
 LIBCOAP_INSTALL_STAGING = YES
 LIBCOAP_LICENSE = BSD-2-Clause
@@ -14,10 +14,6 @@ LIBCOAP_DEPENDENCIES = host-pkgconf
 LIBCOAP_CONF_OPTS = \
 	--disable-examples --disable-examples-source --without-tinydtls
 LIBCOAP_AUTORECONF = YES
-# 0001-Backport-fix-for-CVE-2023-30362.patch
-LIBCOAP_IGNORE_CVES += CVE-2023-30362
-# Doesn't affect 4.3.1, see https://github.com/obgm/libcoap/issues/1117
-LIBCOAP_IGNORE_CVES += CVE-2023-35862
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 LIBCOAP_DEPENDENCIES += gnutls
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
