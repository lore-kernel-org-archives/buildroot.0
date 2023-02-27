Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5D9C64ED6
	for <buildroot@archiver.kernel.org>; Mon, 27 Feb 2023 16:08:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6570660FE4;
	Mon, 27 Feb 2023 16:08:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6570660FE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id prB1p_Z579b4; Mon, 27 Feb 2023 16:08:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7964760670;
	Mon, 27 Feb 2023 16:08:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7964760670
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 12A0C1BF2AA
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 16:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E002A60670
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 16:08:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E002A60670
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XOAYBK3Mn2Fc for <buildroot@lists.busybox.net>;
 Mon, 27 Feb 2023 16:08:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 930B8605A2
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 930B8605A2
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 16:08:28 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so7548416wmb.5
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 08:08:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jSNCsuKh3VQ6pHqt/hZRpHPzZezN3CbLXEws0VVympA=;
 b=EftwYiGqltUsNmIyoWwkMMYpCcP4dxUayc3QVGUtePIL0ap8f72kF1mklIxnUihn3I
 Jc9lmnzzfUEOWHQ4MkhUThyASe6cJjlvxG+a9tqjk5jyic9mLibTKucoQJpXZbQcl7VI
 8inbxe2GmZOOi2OTuASQfrDj8TtNakyu+q6sJF4imPeU8AyLc91DnPMLN2KpB+TsBvkL
 huZCO6R6y4EdUw0qLT9B4XOV4Ktj7dMd5GC230cBDbdpZ+qUl4//Th1Nc6YuUxTyNpw3
 5e/FhoQ4uJPbpsge9R0Qfsb0U4oSRpVkPEKJSpH6d6kJkmRcBldx2IMO2tKKcbFH1mYp
 q9OA==
X-Gm-Message-State: AO0yUKXpwmfGR8vWMf5ksbrSTgB6uUFQofZp8CGhXBTTThl9deOft36F
 vekNbPEUw7ZvH/c5CrDFEk1Zklel8f0=
X-Google-Smtp-Source: AK7set/qMhe8vfi/RMA+SzLGGCsoDaWNk+2F/sqOYiBFZJw+gaaS3IKAjpos62WbizHa/8MGjuxjkw==
X-Received: by 2002:a05:600c:4b30:b0:3df:fbc7:5b10 with SMTP id
 i48-20020a05600c4b3000b003dffbc75b10mr13624168wmp.0.1677514106111; 
 Mon, 27 Feb 2023 08:08:26 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 k14-20020a05600c1c8e00b003eae73f0fc1sm10550419wms.18.2023.02.27.08.08.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 08:08:25 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Feb 2023 17:08:22 +0100
Message-Id: <20230227160822.1552039-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jSNCsuKh3VQ6pHqt/hZRpHPzZezN3CbLXEws0VVympA=;
 b=WHV9E0oVCmd4pxxzPphhuMuBJW5aew8BRyPrX+Z/ZRSlN6KXIuPpXeL/ACmXQR2Fm+
 CA01MgPKvhqCTMLfmacZzWinJe0RKKG1ua4mMAr0R98YDqdbWPMXPQ5xF31xHlTtZGoY
 Bip+Ki5Dwn8J5HxjQF1G13m0pJ5+RLs0JolmCy0gLdvmSOEgzmPcNzckkPaEUElKtHzc
 bWGTaEl2KPbsaslpNsNN63uURM6Y7oVsH/M6zc4Ye6yXB+Yt3iUpa7Y3R6Q7PRYaaNRp
 z1vBV5Qkp3uQ/3DtrjaSK+vfYReEpL9b2HO8c3tN7q+ifOBwXbHxSvxdc+uoHJcJ9Q72
 mVVw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=WHV9E0oV
Subject: [Buildroot] [PATCH v2, 1/1] package/libpjsip: fix CVE-2022-235{3,
 4}7
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/pjsip/pjproject/security/advisories/GHSA-9pfh-r8x4-w26w
https://github.com/pjsip/pjproject/security/advisories/GHSA-cxwq-5g9x-x7fr

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Peter Korsgaard):
 - Add missing patch

 ...ull-request-from-GHSA-9pfh-r8x4-w26w.patch | 99 +++++++++++++++++++
 ...ull-request-from-GHSA-cxwq-5g9x-x7fr.patch | 54 ++++++++++
 package/libpjsip/libpjsip.mk                  |  6 ++
 3 files changed, 159 insertions(+)
 create mode 100644 package/libpjsip/0001-Merge-pull-request-from-GHSA-9pfh-r8x4-w26w.patch
 create mode 100644 package/libpjsip/0002-Merge-pull-request-from-GHSA-cxwq-5g9x-x7fr.patch

diff --git a/package/libpjsip/0001-Merge-pull-request-from-GHSA-9pfh-r8x4-w26w.patch b/package/libpjsip/0001-Merge-pull-request-from-GHSA-9pfh-r8x4-w26w.patch
new file mode 100644
index 0000000000..01e1878189
--- /dev/null
+++ b/package/libpjsip/0001-Merge-pull-request-from-GHSA-9pfh-r8x4-w26w.patch
@@ -0,0 +1,99 @@
+From d8440f4d711a654b511f50f79c0445b26f9dd1e1 Mon Sep 17 00:00:00 2001
+From: Nanang Izzuddin <nanang@teluu.com>
+Date: Tue, 20 Dec 2022 11:39:12 +0700
+Subject: [PATCH] Merge pull request from GHSA-9pfh-r8x4-w26w
+
+* Fix buffer overread in STUN message decoder
+
+* Updates based on comments
+
+[Retrieved from:
+https://github.com/pjsip/pjproject/commit/d8440f4d711a654b511f50f79c0445b26f9dd1e1]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ pjnath/include/pjnath/stun_msg.h |  4 ++++
+ pjnath/src/pjnath/stun_msg.c     | 14 +++++++++++---
+ 2 files changed, 15 insertions(+), 3 deletions(-)
+
+diff --git a/pjnath/include/pjnath/stun_msg.h b/pjnath/include/pjnath/stun_msg.h
+index b52f95c586..e49f096f3a 100644
+--- a/pjnath/include/pjnath/stun_msg.h
++++ b/pjnath/include/pjnath/stun_msg.h
+@@ -442,6 +442,7 @@ typedef enum pj_stun_status
+ 
+    \endverbatim
+  */
++#pragma pack(1)
+ typedef struct pj_stun_msg_hdr
+ {
+     /**
+@@ -473,6 +474,7 @@ typedef struct pj_stun_msg_hdr
+     pj_uint8_t          tsx_id[12];
+ 
+ } pj_stun_msg_hdr;
++#pragma pack()
+ 
+ 
+ /**
+@@ -490,6 +492,7 @@ typedef struct pj_stun_msg_hdr
+ 
+    \endverbatim
+  */
++#pragma pack(1)
+ typedef struct pj_stun_attr_hdr
+ {
+     /**
+@@ -506,6 +509,7 @@ typedef struct pj_stun_attr_hdr
+     pj_uint16_t         length;
+ 
+ } pj_stun_attr_hdr;
++#pragma pack()
+ 
+ 
+ /**
+diff --git a/pjnath/src/pjnath/stun_msg.c b/pjnath/src/pjnath/stun_msg.c
+index 3def6b3eac..e904a0ba47 100644
+--- a/pjnath/src/pjnath/stun_msg.c
++++ b/pjnath/src/pjnath/stun_msg.c
+@@ -746,7 +746,7 @@ PJ_DEF(int) pj_stun_set_padding_char(int chr)
+ 
+ #define INIT_ATTR(a,t,l)    (a)->hdr.type=(pj_uint16_t)(t), \
+                             (a)->hdr.length=(pj_uint16_t)(l)
+-#define ATTR_HDR_LEN        4
++#define ATTR_HDR_LEN        sizeof(pj_stun_attr_hdr)
+ 
+ static pj_uint16_t GETVAL16H(const pj_uint8_t *buf, unsigned pos)
+ {
+@@ -2327,6 +2327,14 @@ PJ_DEF(pj_status_t) pj_stun_msg_decode(pj_pool_t *pool,
+         status = pj_stun_msg_check(pdu, pdu_len, options);
+         if (status != PJ_SUCCESS)
+             return status;
++    } else {
++        /* For safety, verify packet length at least */
++        pj_uint32_t msg_len = GETVAL16H(pdu, 2) + 20;
++        if (msg_len > pdu_len ||
++            ((options & PJ_STUN_IS_DATAGRAM) && msg_len != pdu_len))
++        {
++            return PJNATH_EINSTUNMSGLEN;
++        }
+     }
+ 
+     /* Create the message, copy the header, and convert to host byte order */
+@@ -2345,7 +2353,7 @@ PJ_DEF(pj_status_t) pj_stun_msg_decode(pj_pool_t *pool,
+         p_response = NULL;
+ 
+     /* Parse attributes */
+-    while (pdu_len >= 4) {
++    while (pdu_len >= ATTR_HDR_LEN) {
+         unsigned attr_type, attr_val_len;
+         const struct attr_desc *adesc;
+ 
+@@ -2357,7 +2365,7 @@ PJ_DEF(pj_status_t) pj_stun_msg_decode(pj_pool_t *pool,
+         attr_val_len = (attr_val_len + 3) & (~3);
+ 
+         /* Check length */
+-        if (pdu_len < attr_val_len) {
++        if (pdu_len < attr_val_len + ATTR_HDR_LEN) {
+             pj_str_t err_msg;
+             char err_msg_buf[80];
+ 
diff --git a/package/libpjsip/0002-Merge-pull-request-from-GHSA-cxwq-5g9x-x7fr.patch b/package/libpjsip/0002-Merge-pull-request-from-GHSA-cxwq-5g9x-x7fr.patch
new file mode 100644
index 0000000000..82249a2076
--- /dev/null
+++ b/package/libpjsip/0002-Merge-pull-request-from-GHSA-cxwq-5g9x-x7fr.patch
@@ -0,0 +1,54 @@
+From bc4812d31a67d5e2f973fbfaf950d6118226cf36 Mon Sep 17 00:00:00 2001
+From: sauwming <ming@teluu.com>
+Date: Fri, 23 Dec 2022 15:05:28 +0800
+Subject: [PATCH] Merge pull request from GHSA-cxwq-5g9x-x7fr
+
+* Fixed heap buffer overflow when parsing STUN errcode attribute
+
+* Also fixed uint parsing
+
+[Retrieved from:
+https://github.com/pjsip/pjproject/commit/bc4812d31a67d5e2f973fbfaf950d6118226cf36]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ pjnath/src/pjnath/stun_msg.c | 11 ++++++-----
+ 1 file changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/pjnath/src/pjnath/stun_msg.c b/pjnath/src/pjnath/stun_msg.c
+index c6b0bdd284..b55d29849a 100644
+--- a/pjnath/src/pjnath/stun_msg.c
++++ b/pjnath/src/pjnath/stun_msg.c
+@@ -1438,12 +1438,12 @@ static pj_status_t decode_uint_attr(pj_pool_t *pool,
+     attr = PJ_POOL_ZALLOC_T(pool, pj_stun_uint_attr);
+     GETATTRHDR(buf, &attr->hdr);
+ 
+-    attr->value = GETVAL32H(buf, 4);
+-
+     /* Check that the attribute length is valid */
+     if (attr->hdr.length != 4)
+         return PJNATH_ESTUNINATTRLEN;
+ 
++    attr->value = GETVAL32H(buf, 4);
++
+     /* Done */
+     *p_attr = attr;
+ 
+@@ -1757,14 +1757,15 @@ static pj_status_t decode_errcode_attr(pj_pool_t *pool,
+     attr = PJ_POOL_ZALLOC_T(pool, pj_stun_errcode_attr);
+     GETATTRHDR(buf, &attr->hdr);
+ 
++    /* Check that the attribute length is valid */
++    if (attr->hdr.length < 4)
++        return PJNATH_ESTUNINATTRLEN;
++
+     attr->err_code = buf[6] * 100 + buf[7];
+ 
+     /* Get pointer to the string in the message */
+     value.ptr = ((char*)buf + ATTR_HDR_LEN + 4);
+     value.slen = attr->hdr.length - 4;
+-    /* Make sure the length is never negative */
+-    if (value.slen < 0)
+-        value.slen = 0;
+ 
+     /* Copy the string to the attribute */
+     pj_strdup(pool, &attr->reason, &value);
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 5cc0423f5d..24db641446 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -15,6 +15,12 @@ LIBPJSIP_CPE_ID_PRODUCT = pjsip
 LIBPJSIP_INSTALL_STAGING = YES
 LIBPJSIP_MAKE = $(MAKE1)
 
+# 0001-Merge-pull-request-from-GHSA-9pfh-r8x4-w26w.patch
+LIBPJSIP_IGNORE_CVES += CVE-2022-23537
+
+# 0002-Merge-pull-request-from-GHSA-cxwq-5g9x-x7fr.patch
+LIBPJSIP_IGNORE_CVES += CVE-2022-23547
+
 LIBPJSIP_CFLAGS = $(TARGET_CFLAGS) -DPJ_HAS_IPV6=1
 
 # relocation truncated to fit: R_68K_GOT16O
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
