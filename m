Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A8F0C6FA8E
	for <buildroot@archiver.kernel.org>; Sun, 26 Feb 2023 13:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F055060BE9;
	Sun, 26 Feb 2023 13:55:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F055060BE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6xQ18ghtYTL4; Sun, 26 Feb 2023 13:55:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FA4D60BDA;
	Sun, 26 Feb 2023 13:55:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FA4D60BDA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0F9591BF361
 for <buildroot@lists.busybox.net>; Sun, 26 Feb 2023 13:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD346814BB
 for <buildroot@lists.busybox.net>; Sun, 26 Feb 2023 13:55:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD346814BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6KVehEizqnhp for <buildroot@lists.busybox.net>;
 Sun, 26 Feb 2023 13:55:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93045814B6
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 93045814B6
 for <buildroot@buildroot.org>; Sun, 26 Feb 2023 13:55:10 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id l1so597238wry.12
 for <buildroot@buildroot.org>; Sun, 26 Feb 2023 05:55:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QYMNkgp4luxQhGEV2kZVhy7WphjgqKhcjmIU88MVWpk=;
 b=Jw0drgv94FZEBQ2A3SJoaZwVkbpXLkwcq7HSxaYKtH7CATqfQUVeF3K+JOYLgD5z6v
 7DKNIMrAg8uOudEOTwVIF6+efggsMTyjj0138G82kC/IKKQPnmW9zZqI2XRzKC7NzS0F
 L0r5kHjxmblIUdLGdnFPPIWQquwh3K/ZrfIJX+b2roBy1ZV6ENZ4CVALKp42PcMa/9im
 cCzr/X9cJFyYSLr2yUK1Ck0+FBjI1EI1V1DyGYRQf+x9hjwzj622/0bMDPcKlDw+gOHU
 LsEWQrPY/hHXFq1zYmxEZ1vLKzWtXbREsKWD1i3ERhsm6WwvgwdtdJfPbGnXrOQ4kraP
 DuXw==
X-Gm-Message-State: AO0yUKVYffDePeXWG6eCsXocml8YuBr7Tf6+c7v0yevX3l97dASf9Uzo
 1vANgQjeJKudcXz+PFXvySP8uJ4i7uY=
X-Google-Smtp-Source: AK7set8RWBZNvL9K9IH2rJJoKk2uuIe3W7j261Oa3u36ODxkl8LuAmj+6bhVZjqeDvBScnM9ZMgh/g==
X-Received: by 2002:adf:f245:0:b0:2c7:ca2:1a28 with SMTP id
 b5-20020adff245000000b002c70ca21a28mr14210497wrp.68.1677419708416; 
 Sun, 26 Feb 2023 05:55:08 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 e7-20020a5d5947000000b002c5a07e940csm4483290wri.33.2023.02.26.05.55.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 05:55:07 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Feb 2023 14:55:03 +0100
Message-Id: <20230226135503.112605-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QYMNkgp4luxQhGEV2kZVhy7WphjgqKhcjmIU88MVWpk=;
 b=gtjYeAUGqOALB1qdJ+aBRl/emGAWiJq1f8rs0KXzT6tk/Xmstmghn73ZgAfNqSPZYf
 HNwF5ayNCf9u6AdZf+HHgP8v7XZ4dVf7Bd3dT2dobkESbrr9yagdn+ucQOV6QVeK1Fmo
 D39qhTcxNiuCrjF8KAkN1vk4gj/UyUlYB6T9xz+Citc58V3uHGMsPHiGcuT/VV1hmljy
 8w0+RXMzzkpMX0A80UHu+FOdh8mlLXP2+fM1syNE+lpn6Xc0zAYlYmJ3HF1XmeoU/bps
 sE026IEeC4CT+8DztqnV2tI0Q/8+hZwgXrZ2q8jnZtT48rOQo2cQDButOQ2zhfAVB4Rm
 aeEw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gtjYeAUG
Subject: [Buildroot] [PATCH 1/1] package/libpjsip: fix CVE-2022-235{3,4}7
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
 ...ull-request-from-GHSA-9pfh-r8x4-w26w.patch | 99 +++++++++++++++++++
 package/libpjsip/libpjsip.mk                  |  6 ++
 2 files changed, 105 insertions(+)
 create mode 100644 package/libpjsip/0001-Merge-pull-request-from-GHSA-9pfh-r8x4-w26w.patch

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
