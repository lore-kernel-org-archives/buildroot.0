Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABBC8C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Oct 2022 21:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44C0660E26;
	Sun,  9 Oct 2022 21:38:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44C0660E26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pB51uTBIlGib; Sun,  9 Oct 2022 21:38:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89CC860760;
	Sun,  9 Oct 2022 21:38:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89CC860760
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 784861BF376
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 21:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A28180C21
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 21:38:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A28180C21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q3oOy_27WvfA for <buildroot@lists.busybox.net>;
 Sun,  9 Oct 2022 21:38:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24A4880BBF
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 24A4880BBF
 for <buildroot@buildroot.org>; Sun,  9 Oct 2022 21:38:29 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id a3so14564083wrt.0
 for <buildroot@buildroot.org>; Sun, 09 Oct 2022 14:38:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XhsWFuAzEAAQekz6XKFjcAQiYsKbuUpxEvUs4igCFd0=;
 b=XB1nD5xz0cOd6E94krQMQ2MtVYpPhNyXFpFi3UZxw8uVbqxAMch6un5NwO0kEu4MRL
 OWOCUlQpoeTnsM8DPPjJVmId5XrxE33Xl40Lo1lOsg/Kk97jHmbnbytmALY6RB/Oo/Hc
 YPNxwemqB67vLW+LQNAcZJ8RBX8g8hi30gokOvNBmyCTUD+qJhRlPBRdZ4b50Nf0e5nY
 fbqZ/PO23wGm/2wJ9Mk7vnWFijsBtuzNjqCguQU8ukQWKDopi2M3RUFXtNsP7s8dtkv3
 xck5CWH2rFnqNOuFoY6VYvr8dakOxnf0NvT9r3NkmvXp0eJRw7YyhmdG9sn7LH3CQ4JI
 ca+Q==
X-Gm-Message-State: ACrzQf0svqv6HoXw4yOTs9wCkgxfAqhneQxVWc1u04LCtA/Reg2HTIeA
 dHW2Obl/0F/JM7PFIx5EZwd2rikMsU0=
X-Google-Smtp-Source: AMsMyM7eXKe4kuRhklpD6MtaDI9czzF/QpcfTqva+Jd5xhsRfMJ47uGX2XmZ/9NZzyBD2adsUEvoTA==
X-Received: by 2002:a5d:630d:0:b0:22e:7265:b671 with SMTP id
 i13-20020a5d630d000000b0022e7265b671mr9454873wru.421.1665351506775; 
 Sun, 09 Oct 2022 14:38:26 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 c8-20020a05600c0a4800b003b4fdbb6319sm15797340wmq.21.2022.10.09.14.38.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Oct 2022 14:38:26 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Oct 2022 23:38:23 +0200
Message-Id: <20221009213823.116245-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XhsWFuAzEAAQekz6XKFjcAQiYsKbuUpxEvUs4igCFd0=;
 b=RkUiIpv4utSpp4U4aQrig31Vlwj+IutScXgVZQbLNFIbcbBxFqEXisrmfIio/zWrQR
 ISwW1DMCYANQfByUb3KevvkDncYHIZwtlx3r0Eg+qLEIsjUipZgbhf+9bSYq0q5f0Nvd
 +2tK78EwyHDqzm/NYW4bN7haqzDzfVzKfgF5m4C0F4WPCaGf/5nXUYkE5ZWZ/YzzMPTy
 CH+HZNgE7aNQ8xJ6Zixif07Z3jA4nB6I9pqclvaqKJU7Ruqk/Wel7lsc5SBTs2LS3qws
 Yr+WJ3w8eWbOvVRbFQGCVb3ZfE2e240CLlIzKb5O3+Ueox6h0j9I4GBO3CiA8CWrdFhJ
 cHYQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RkUiIpv4
Subject: [Buildroot] [PATCH 1/1] package/freeipmi: bump to version 1.6.10
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch (already in version)

https://github.com/chu11/freeipmi-mirror/blob/freeipmi-1-6-10/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-rename-md2-and-md5-functions-macros.patch | 695 ------------------
 package/freeipmi/freeipmi.hash                |   2 +-
 package/freeipmi/freeipmi.mk                  |   2 +-
 3 files changed, 2 insertions(+), 697 deletions(-)
 delete mode 100644 package/freeipmi/0001-libfreeipmi-rename-md2-and-md5-functions-macros.patch

diff --git a/package/freeipmi/0001-libfreeipmi-rename-md2-and-md5-functions-macros.patch b/package/freeipmi/0001-libfreeipmi-rename-md2-and-md5-functions-macros.patch
deleted file mode 100644
index 0de5b29c9c..0000000000
--- a/package/freeipmi/0001-libfreeipmi-rename-md2-and-md5-functions-macros.patch
+++ /dev/null
@@ -1,695 +0,0 @@
-From 50eeda7f14c4eaa56aa86ba570a47557456544f2 Mon Sep 17 00:00:00 2001
-From: Albert Chu <chu11@llnl.gov>
-Date: Wed, 19 Jan 2022 11:55:55 -0800
-Subject: [PATCH] libfreeipmi: rename md2 and md5 functions / macros
-
-Static compilation with libfreeipmi can lead to problems if
-other software has similarly named md2/md5 functions
-(such as md5_init()).  Prefix all macros and functions with
-'ipmi_' as needed.  Update all callers accordingly.
-
-[Retrieved from:
-https://github.com/chu11/freeipmi-mirror/commit/50eeda7f14c4eaa56aa86ba570a47557456544f2]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- ChangeLog                                     |  11 ++
- libfreeipmi/interface/ipmi-lan-interface.c    |  48 +++----
- .../interface/ipmi-rmcpplus-interface.c       |   2 +-
- libfreeipmi/libcommon/ipmi-md2.c              |  72 +++++------
- libfreeipmi/libcommon/ipmi-md2.h              |  30 ++---
- libfreeipmi/libcommon/ipmi-md5.c              |  64 +++++-----
- libfreeipmi/libcommon/ipmi-md5.h              |  18 +--
- libfreeipmi/util/ipmi-lan-util.c              | 120 +++++++++---------
- 8 files changed, 188 insertions(+), 177 deletions(-)
-
-diff --git a/ChangeLog b/ChangeLog
-index 883a195cf..60bf8c323 100644
---- a/ChangeLog
-+++ b/ChangeLog
-@@ -1,3 +1,14 @@
-+2021-01-19 Albert Chu <chu11@llnl.gov>
-+
-+	* libfreeipmi/libcommon/ipmi-md2.h,
-+	libfreeipmi/libcommon/ipmi-md2.c,
-+	libfreeipmi/libcommon/ipmi-md5.h,
-+	libfreeipmi/libcommon/ipmi-md5.c: Static compilation with
-+	libfreeipmi can lead to problems if other software has similarly
-+	named md2/md5 functions (such as md5_init()).  Prefix all macros
-+	and functions with 'ipmi_' as needed.  Update all callers
-+	accordingly.
-+
- 2022-01-18 Fabrice Fontaine <fontaine.fabrice@gmail.com>
- 
- 	* configure.ac: use pkg-config to find gcrypt
-diff --git a/libfreeipmi/interface/ipmi-lan-interface.c b/libfreeipmi/interface/ipmi-lan-interface.c
-index 20099d770..658be53e1 100644
---- a/libfreeipmi/interface/ipmi-lan-interface.c
-+++ b/libfreeipmi/interface/ipmi-lan-interface.c
-@@ -533,37 +533,37 @@ assemble_ipmi_lan_pkt (fiid_obj_t obj_rmcp_hdr,
- 
-               if (authentication_type == IPMI_AUTHENTICATION_TYPE_MD2)
-                 {
--                  md2_t ctx;
--                  uint8_t digest[MD2_DIGEST_LENGTH];
-+                  ipmi_md2_t ctx;
-+                  uint8_t digest[IPMI_MD2_DIGEST_LENGTH];
- 
--                  assert (IPMI_1_5_MAX_PASSWORD_LENGTH == MD2_DIGEST_LENGTH);
-+                  assert (IPMI_1_5_MAX_PASSWORD_LENGTH == IPMI_MD2_DIGEST_LENGTH);
- 
--                  md2_init (&ctx);
--                  md2_update_data (&ctx, pwbuf, IPMI_1_5_MAX_PASSWORD_LENGTH);
--                  md2_update_data (&ctx, session_id_buf, session_id_len);
--                  md2_update_data (&ctx, msg_data_ptr, msg_data_count);
--                  md2_update_data (&ctx, session_sequence_number_buf, session_sequence_number_len);
--                  md2_update_data (&ctx, pwbuf, IPMI_1_5_MAX_PASSWORD_LENGTH);
--                  md2_finish (&ctx, digest, MD2_DIGEST_LENGTH);
--                  md2_init (&ctx);
-+                  ipmi_md2_init (&ctx);
-+                  ipmi_md2_update_data (&ctx, pwbuf, IPMI_1_5_MAX_PASSWORD_LENGTH);
-+                  ipmi_md2_update_data (&ctx, session_id_buf, session_id_len);
-+                  ipmi_md2_update_data (&ctx, msg_data_ptr, msg_data_count);
-+                  ipmi_md2_update_data (&ctx, session_sequence_number_buf, session_sequence_number_len);
-+                  ipmi_md2_update_data (&ctx, pwbuf, IPMI_1_5_MAX_PASSWORD_LENGTH);
-+                  ipmi_md2_finish (&ctx, digest, IPMI_MD2_DIGEST_LENGTH);
-+                  ipmi_md2_init (&ctx);
- 
-                   memcpy (authentication_code_field_ptr, digest, IPMI_1_5_MAX_PASSWORD_LENGTH);
-                 }
-               else if (authentication_type == IPMI_AUTHENTICATION_TYPE_MD5)
-                 {
--                  md5_t ctx;
--                  uint8_t digest[MD5_DIGEST_LENGTH];
--
--                  assert (IPMI_1_5_MAX_PASSWORD_LENGTH == MD5_DIGEST_LENGTH);
--
--                  md5_init (&ctx);
--                  md5_update_data (&ctx, pwbuf, IPMI_1_5_MAX_PASSWORD_LENGTH);
--                  md5_update_data (&ctx, session_id_buf, session_id_len);
--                  md5_update_data (&ctx, msg_data_ptr, msg_data_count);
--                  md5_update_data (&ctx, session_sequence_number_buf, session_sequence_number_len);
--                  md5_update_data (&ctx, pwbuf, IPMI_1_5_MAX_PASSWORD_LENGTH);
--                  md5_finish (&ctx, digest, MD5_DIGEST_LENGTH);
--                  md5_init (&ctx);
-+                  ipmi_md5_t ctx;
-+                  uint8_t digest[IPMI_MD5_DIGEST_LENGTH];
-+
-+                  assert (IPMI_1_5_MAX_PASSWORD_LENGTH == IPMI_MD5_DIGEST_LENGTH);
-+
-+                  ipmi_md5_init (&ctx);
-+                  ipmi_md5_update_data (&ctx, pwbuf, IPMI_1_5_MAX_PASSWORD_LENGTH);
-+                  ipmi_md5_update_data (&ctx, session_id_buf, session_id_len);
-+                  ipmi_md5_update_data (&ctx, msg_data_ptr, msg_data_count);
-+                  ipmi_md5_update_data (&ctx, session_sequence_number_buf, session_sequence_number_len);
-+                  ipmi_md5_update_data (&ctx, pwbuf, IPMI_1_5_MAX_PASSWORD_LENGTH);
-+                  ipmi_md5_finish (&ctx, digest, IPMI_MD5_DIGEST_LENGTH);
-+                  ipmi_md5_init (&ctx);
- 
-                   memcpy (authentication_code_field_ptr, digest, IPMI_1_5_MAX_PASSWORD_LENGTH);
-                 }
-diff --git a/libfreeipmi/interface/ipmi-rmcpplus-interface.c b/libfreeipmi/interface/ipmi-rmcpplus-interface.c
-index 1f462da7e..d1fd0753a 100644
---- a/libfreeipmi/interface/ipmi-rmcpplus-interface.c
-+++ b/libfreeipmi/interface/ipmi-rmcpplus-interface.c
-@@ -1134,7 +1134,7 @@ _construct_session_trlr_authentication_code (uint8_t integrity_algorithm,
-     {
-       hash_algorithm = IPMI_CRYPT_HASH_MD5;
-       hash_flags = 0;
--      expected_digest_len = MD5_DIGEST_LENGTH;
-+      expected_digest_len = IPMI_MD5_DIGEST_LENGTH;
-       copy_digest_len = IPMI_MD5_128_AUTHENTICATION_CODE_LENGTH;
-     }
-   else /* IPMI_INTEGRITY_ALGORITHM_HMAC_SHA256_128 */
-diff --git a/libfreeipmi/libcommon/ipmi-md2.c b/libfreeipmi/libcommon/ipmi-md2.c
-index 6e9386be7..076b555bd 100644
---- a/libfreeipmi/libcommon/ipmi-md2.c
-+++ b/libfreeipmi/libcommon/ipmi-md2.c
-@@ -101,15 +101,15 @@ static unsigned char S[256] =
-     0xDB, 0x99, 0x8D, 0x33, 0x9F, 0x11, 0x83, 0x14
-   };
- 
--#define L          ctx->l
--#define X          ctx->x
--#define C          ctx->c
--#define M          ctx->m
--#define Mlen       ctx->mlen
--#define MD2_MAGIC  0xf00fd00d
-+#define L               ctx->l
-+#define X               ctx->x
-+#define C               ctx->c
-+#define M               ctx->m
-+#define Mlen            ctx->mlen
-+#define IPMI_MD2_MAGIC  0xf00fd00d
- 
- int
--md2_init (md2_t *ctx)
-+ipmi_md2_init (ipmi_md2_t *ctx)
- {
- 
-   if (ctx == NULL)
-@@ -118,26 +118,26 @@ md2_init (md2_t *ctx)
-       return (-1);
-     }
- 
--  ctx->magic = MD2_MAGIC;
-+  ctx->magic = IPMI_MD2_MAGIC;
- 
-   L = 0;
-   Mlen = 0;
--  memset (X, '\0', MD2_BUFFER_LENGTH);
--  memset (C, '\0', MD2_CHKSUM_LENGTH);
--  memset (M, '\0', MD2_BLOCK_LENGTH);
-+  memset (X, '\0', IPMI_MD2_BUFFER_LENGTH);
-+  memset (C, '\0', IPMI_MD2_CHKSUM_LENGTH);
-+  memset (M, '\0', IPMI_MD2_BLOCK_LENGTH);
- 
-   return (0);
- }
- 
- static void
--_md2_update_digest_and_checksum (md2_t *ctx)
-+_ipmi_md2_update_digest_and_checksum (ipmi_md2_t *ctx)
- {
-   unsigned int j, k;
-   uint8_t c, t;
- 
-   /* Update X */
- 
--  for (j = 0; j < MD2_BLOCK_LENGTH; j++)
-+  for (j = 0; j < IPMI_MD2_BLOCK_LENGTH; j++)
-     {
-       X[16+j] = M[j];
-       X[32+j] = (X[16+j] ^ X[j]);
-@@ -145,9 +145,9 @@ _md2_update_digest_and_checksum (md2_t *ctx)
- 
-   t = 0;
- 
--  for (j = 0; j < MD2_ROUNDS_LENGTH; j++)
-+  for (j = 0; j < IPMI_MD2_ROUNDS_LENGTH; j++)
-     {
--      for (k = 0; k < MD2_BUFFER_LENGTH; k++)
-+      for (k = 0; k < IPMI_MD2_BUFFER_LENGTH; k++)
-         {
-           t = X[k] = (X[k] ^ S[t]);
-         }
-@@ -166,7 +166,7 @@ _md2_update_digest_and_checksum (md2_t *ctx)
-    * Set C[j] to C[j] xor S[c xor L].
-    */
- 
--  for (j = 0; j < MD2_BLOCK_LENGTH; j++)
-+  for (j = 0; j < IPMI_MD2_BLOCK_LENGTH; j++)
-     {
-       c = M[j];
-       C[j] = C[j] ^ S[c ^ L];
-@@ -175,10 +175,10 @@ _md2_update_digest_and_checksum (md2_t *ctx)
- }
- 
- int
--md2_update_data (md2_t *ctx, const void *buf, unsigned int buflen)
-+ipmi_md2_update_data (ipmi_md2_t *ctx, const void *buf, unsigned int buflen)
- {
- 
--  if (ctx == NULL || ctx->magic != MD2_MAGIC || buf == NULL)
-+  if (ctx == NULL || ctx->magic != IPMI_MD2_MAGIC || buf == NULL)
-     {
-       errno = EINVAL;
-       return (-1);
-@@ -187,19 +187,19 @@ md2_update_data (md2_t *ctx, const void *buf, unsigned int buflen)
-   if (buflen == 0)
-     return (0);
- 
--  if ((Mlen + buflen) >= MD2_BLOCK_LENGTH)
-+  if ((Mlen + buflen) >= IPMI_MD2_BLOCK_LENGTH)
-     {
-       unsigned int bufcount;
- 
--      bufcount = (MD2_BLOCK_LENGTH - Mlen);
-+      bufcount = (IPMI_MD2_BLOCK_LENGTH - Mlen);
-       memcpy (M + Mlen, buf, bufcount);
--      _md2_update_digest_and_checksum (ctx);
-+      _ipmi_md2_update_digest_and_checksum (ctx);
- 
--      while ((buflen - bufcount) >= MD2_BLOCK_LENGTH)
-+      while ((buflen - bufcount) >= IPMI_MD2_BLOCK_LENGTH)
-         {
--          memcpy (M, buf + bufcount, MD2_BLOCK_LENGTH);
--          bufcount += MD2_BLOCK_LENGTH;
--          _md2_update_digest_and_checksum (ctx);
-+          memcpy (M, buf + bufcount, IPMI_MD2_BLOCK_LENGTH);
-+          bufcount += IPMI_MD2_BLOCK_LENGTH;
-+          _ipmi_md2_update_digest_and_checksum (ctx);
-         }
- 
-       Mlen = buflen - bufcount;
-@@ -217,33 +217,33 @@ md2_update_data (md2_t *ctx, const void *buf, unsigned int buflen)
- }
- 
- static void
--_md2_append_padding_and_checksum (md2_t *ctx)
-+_ipmi_md2_append_padding_and_checksum (ipmi_md2_t *ctx)
- {
-   unsigned int padlen;
-   int padindex;
- 
--  padlen = MD2_PADDING_LENGTH - Mlen;
-+  padlen = IPMI_MD2_PADDING_LENGTH - Mlen;
-   padindex = padlen - 1;
- 
--  md2_update_data (ctx, padding[padindex], padlen);
-+  ipmi_md2_update_data (ctx, padding[padindex], padlen);
- 
--  md2_update_data (ctx, C, MD2_CHKSUM_LENGTH);
-+  ipmi_md2_update_data (ctx, C, IPMI_MD2_CHKSUM_LENGTH);
- }
- 
- int
--md2_finish (md2_t *ctx, void *digest, unsigned int digestlen)
-+ipmi_md2_finish (ipmi_md2_t *ctx, void *digest, unsigned int digestlen)
- {
--  if (ctx == NULL || ctx->magic != MD2_MAGIC
--      || digest == NULL || digestlen < MD2_DIGEST_LENGTH)
-+  if (ctx == NULL || ctx->magic != IPMI_MD2_MAGIC
-+      || digest == NULL || digestlen < IPMI_MD2_DIGEST_LENGTH)
-     {
-       errno = EINVAL;
-       return (-1);
-     }
- 
--  _md2_append_padding_and_checksum (ctx);
--  memcpy (digest, X, MD2_DIGEST_LENGTH);
-+  _ipmi_md2_append_padding_and_checksum (ctx);
-+  memcpy (digest, X, IPMI_MD2_DIGEST_LENGTH);
- 
--  ctx->magic = ~MD2_MAGIC;
--  return (MD2_DIGEST_LENGTH);
-+  ctx->magic = ~IPMI_MD2_MAGIC;
-+  return (IPMI_MD2_DIGEST_LENGTH);
- }
- 
-diff --git a/libfreeipmi/libcommon/ipmi-md2.h b/libfreeipmi/libcommon/ipmi-md2.h
-index c102fce2c..05328e85e 100644
---- a/libfreeipmi/libcommon/ipmi-md2.h
-+++ b/libfreeipmi/libcommon/ipmi-md2.h
-@@ -34,26 +34,26 @@
- 
- #include <stdint.h>
- 
--#define MD2_BLOCK_LENGTH   16
--#define MD2_BUFFER_LENGTH  48
--#define MD2_CHKSUM_LENGTH  16
--#define MD2_DIGEST_LENGTH  16
--#define MD2_PADDING_LENGTH 16
--#define MD2_ROUNDS_LENGTH  18
--
--typedef struct __md2 {
-+#define IPMI_MD2_BLOCK_LENGTH   16
-+#define IPMI_MD2_BUFFER_LENGTH  48
-+#define IPMI_MD2_CHKSUM_LENGTH  16
-+#define IPMI_MD2_DIGEST_LENGTH  16
-+#define IPMI_MD2_PADDING_LENGTH 16
-+#define IPMI_MD2_ROUNDS_LENGTH  18
-+
-+typedef struct __ipmi_md2 {
-   uint32_t magic;
-   uint8_t l;
-   unsigned int mlen;
--  uint8_t x[MD2_BUFFER_LENGTH];
--  uint8_t c[MD2_CHKSUM_LENGTH];
--  uint8_t m[MD2_BLOCK_LENGTH];
--} md2_t;
-+  uint8_t x[IPMI_MD2_BUFFER_LENGTH];
-+  uint8_t c[IPMI_MD2_CHKSUM_LENGTH];
-+  uint8_t m[IPMI_MD2_BLOCK_LENGTH];
-+} ipmi_md2_t;
- 
--int md2_init (md2_t *ctx);
-+int ipmi_md2_init (ipmi_md2_t *ctx);
- 
--int md2_update_data (md2_t *ctx, const void *buf, unsigned int buflen);
-+int ipmi_md2_update_data (ipmi_md2_t *ctx, const void *buf, unsigned int buflen);
- 
--int md2_finish (md2_t *ctx, void *digest, unsigned int digestlen);
-+int ipmi_md2_finish (ipmi_md2_t *ctx, void *digest, unsigned int digestlen);
- 
- #endif /* IPMI_MD2_H */
-diff --git a/libfreeipmi/libcommon/ipmi-md5.c b/libfreeipmi/libcommon/ipmi-md5.c
-index 17073b85f..c84e350a6 100644
---- a/libfreeipmi/libcommon/ipmi-md5.c
-+++ b/libfreeipmi/libcommon/ipmi-md5.c
-@@ -92,7 +92,7 @@ static uint32_t T[64] =
- #define D               ctx->d
- #define M               ctx->m
- #define Mlen            ctx->mlen
--#define MD5_MAGIC       0xfb0fdb0d
-+#define IPMI_MD5_MAGIC  0xfb0fdb0d
- 
- #define F(x,y,z)  (((x) & (y)) | ((~(x)) & (z)))
- #define G(x,y,z)  (((x) & (z)) | ((y) & (~(z))))
-@@ -126,7 +126,7 @@ static uint32_t T[64] =
-   } while (0)
- 
- int
--md5_init (md5_t *ctx)
-+ipmi_md5_init (ipmi_md5_t *ctx)
- {
-   if (ctx == NULL)
-     {
-@@ -134,13 +134,13 @@ md5_init (md5_t *ctx)
-       return (-1);
-     }
- 
--  ctx->magic = MD5_MAGIC;
-+  ctx->magic = IPMI_MD5_MAGIC;
- 
-   Mlen = 0;
-   ctx->bytes_mod_64 = 0;
-   ctx->bit_count[0] = 0;
-   ctx->bit_count[1] = 0;
--  memset (M, '\0', MD5_BLOCK_LENGTH);
-+  memset (M, '\0', IPMI_MD5_BLOCK_LENGTH);
- 
-   /* initial values are listed low-order byte first */
-   A = 0x67452301;
-@@ -152,16 +152,16 @@ md5_init (md5_t *ctx)
- }
- 
- static void
--_md5_update_digest (md5_t *ctx)
-+_ipmi_md5_update_digest (ipmi_md5_t *ctx)
- {
-   uint32_t AA, BB, CC, DD;
--  uint32_t X[MD5_BLOCK_WORDS_LENGTH];
-+  uint32_t X[IPMI_MD5_BLOCK_WORDS_LENGTH];
-   unsigned int j;
- 
-   /* Note there are no endian issues here, compiler is required to
-    * handle shifts correctly
-    */
--  for (j = 0; j < MD5_BLOCK_WORDS_LENGTH; j++)
-+  for (j = 0; j < IPMI_MD5_BLOCK_WORDS_LENGTH; j++)
-     X[j] = ((uint32_t)M[j*4]
-             | ((uint32_t)M[j*4+1] << 8)
-             | ((uint32_t)M[j*4+2] << 16)
-@@ -251,7 +251,7 @@ _md5_update_digest (md5_t *ctx)
- }
- 
- static void
--_md5_update_count (md5_t *ctx, unsigned int buflen)
-+_ipmi_md5_update_count (ipmi_md5_t *ctx, unsigned int buflen)
- {
- 
-   /* Use two uint32_t integers to hold our 64 bit count.
-@@ -272,10 +272,10 @@ _md5_update_count (md5_t *ctx, unsigned int buflen)
- }
- 
- int
--md5_update_data (md5_t *ctx, const void *buf, unsigned int buflen)
-+ipmi_md5_update_data (ipmi_md5_t *ctx, const void *buf, unsigned int buflen)
- {
- 
--  if (ctx == NULL || ctx->magic != MD5_MAGIC || buf == NULL)
-+  if (ctx == NULL || ctx->magic != IPMI_MD5_MAGIC || buf == NULL)
-     {
-       errno = EINVAL;
-       return (-1);
-@@ -284,28 +284,28 @@ md5_update_data (md5_t *ctx, const void *buf, unsigned int buflen)
-   if (buflen == 0)
-     return (0);
- 
--  if ((Mlen + buflen) >= MD5_BLOCK_LENGTH)
-+  if ((Mlen + buflen) >= IPMI_MD5_BLOCK_LENGTH)
-     {
-       unsigned int bufcount;
- 
--      bufcount = (MD5_BLOCK_LENGTH - Mlen);
-+      bufcount = (IPMI_MD5_BLOCK_LENGTH - Mlen);
-       memcpy (M + Mlen, buf, bufcount);
--      _md5_update_digest (ctx);
--      _md5_update_count (ctx, bufcount);
-+      _ipmi_md5_update_digest (ctx);
-+      _ipmi_md5_update_count (ctx, bufcount);
- 
--      while ((buflen - bufcount) >= MD5_BLOCK_LENGTH)
-+      while ((buflen - bufcount) >= IPMI_MD5_BLOCK_LENGTH)
-         {
--          memcpy (M, buf + bufcount, MD5_BLOCK_LENGTH);
--          bufcount += MD5_BLOCK_LENGTH;
--          _md5_update_digest (ctx);
--          _md5_update_count (ctx, MD5_BLOCK_LENGTH);
-+          memcpy (M, buf + bufcount, IPMI_MD5_BLOCK_LENGTH);
-+          bufcount += IPMI_MD5_BLOCK_LENGTH;
-+          _ipmi_md5_update_digest (ctx);
-+          _ipmi_md5_update_count (ctx, IPMI_MD5_BLOCK_LENGTH);
-         }
- 
-       Mlen = buflen - bufcount;
-       if (Mlen > 0)
-         {
-           memcpy (M, buf + bufcount, Mlen);
--          _md5_update_count (ctx, Mlen);
-+          _ipmi_md5_update_count (ctx, Mlen);
-         }
-     }
-   else
-@@ -313,14 +313,14 @@ md5_update_data (md5_t *ctx, const void *buf, unsigned int buflen)
-       /* Not enough data to update digest, just copy in data */
-       memcpy (M + Mlen, buf, buflen);
-       Mlen += buflen;
--      _md5_update_count (ctx, buflen);
-+      _ipmi_md5_update_count (ctx, buflen);
-     }
- 
-   return (buflen);
- }
- 
- static void
--_md5_append_padding_and_length (md5_t *ctx)
-+_ipmi_md5_append_padding_and_length (ipmi_md5_t *ctx)
- {
-   unsigned int padlen;
-   char length[8];
-@@ -348,23 +348,23 @@ _md5_append_padding_and_length (md5_t *ctx)
-   length[6] = (ctx->bit_count[0] & 0x00ff0000) >> 16;
-   length[7] = (ctx->bit_count[0] & 0xff000000) >> 24;
- 
--  md5_update_data (ctx, padding, padlen);
--  md5_update_data (ctx, length, 8);
-+  ipmi_md5_update_data (ctx, padding, padlen);
-+  ipmi_md5_update_data (ctx, length, 8);
- }
- 
- int
--md5_finish (md5_t *ctx, void *digest, unsigned int digestlen)
-+ipmi_md5_finish (ipmi_md5_t *ctx, void *digest, unsigned int digestlen)
- {
--  uint8_t buf[MD5_DIGEST_LENGTH];
-+  uint8_t buf[IPMI_MD5_DIGEST_LENGTH];
- 
--  if (ctx == NULL || ctx->magic != MD5_MAGIC
--      || digest == NULL || digestlen < MD5_DIGEST_LENGTH)
-+  if (ctx == NULL || ctx->magic != IPMI_MD5_MAGIC
-+      || digest == NULL || digestlen < IPMI_MD5_DIGEST_LENGTH)
-     {
-       errno = EINVAL;
-       return (-1);
-     }
- 
--  _md5_append_padding_and_length (ctx);
-+  _ipmi_md5_append_padding_and_length (ctx);
- 
-   /* Note there are no endian issues here, compiler is required to
-    * handle bitmasks and shifts correctly
-@@ -387,7 +387,7 @@ md5_finish (md5_t *ctx, void *digest, unsigned int digestlen)
-   buf[14] = (D & 0x00ff0000) >> 16;
-   buf[15] = (D & 0xff000000) >> 24;
- 
--  memcpy (digest, buf, MD5_DIGEST_LENGTH);
--  ctx->magic = ~MD5_MAGIC;
--  return (MD5_DIGEST_LENGTH);
-+  memcpy (digest, buf, IPMI_MD5_DIGEST_LENGTH);
-+  ctx->magic = ~IPMI_MD5_MAGIC;
-+  return (IPMI_MD5_DIGEST_LENGTH);
- }
-diff --git a/libfreeipmi/libcommon/ipmi-md5.h b/libfreeipmi/libcommon/ipmi-md5.h
-index 0f86f1754..6b863ef36 100644
---- a/libfreeipmi/libcommon/ipmi-md5.h
-+++ b/libfreeipmi/libcommon/ipmi-md5.h
-@@ -34,11 +34,11 @@
- 
- #include <stdint.h>
- 
--#define MD5_BLOCK_LENGTH       64
--#define MD5_BLOCK_WORDS_LENGTH (MD5_BLOCK_LENGTH/4)
--#define MD5_DIGEST_LENGTH      16
-+#define IPMI_MD5_BLOCK_LENGTH       64
-+#define IPMI_MD5_BLOCK_WORDS_LENGTH (IPMI_MD5_BLOCK_LENGTH/4)
-+#define IPMI_MD5_DIGEST_LENGTH      16
- 
--typedef struct __md5 {
-+typedef struct __ipmi_md5 {
-   uint32_t magic;
-   unsigned int mlen;
-   unsigned int bytes_mod_64;
-@@ -47,13 +47,13 @@ typedef struct __md5 {
-   uint32_t b;
-   uint32_t c;
-   uint32_t d;
--  uint8_t m[MD5_BLOCK_LENGTH];
--} md5_t;
-+  uint8_t m[IPMI_MD5_BLOCK_LENGTH];
-+} ipmi_md5_t;
- 
--int md5_init (md5_t *ctx);
-+int ipmi_md5_init (ipmi_md5_t *ctx);
- 
--int md5_update_data (md5_t *ctx, const void *buf, unsigned int buflen);
-+int ipmi_md5_update_data (ipmi_md5_t *ctx, const void *buf, unsigned int buflen);
- 
--int md5_finish (md5_t *ctx, void *digest, unsigned int digestlen);
-+int ipmi_md5_finish (ipmi_md5_t *ctx, void *digest, unsigned int digestlen);
- 
- #endif /* IPMI_MD5_H */
-diff --git a/libfreeipmi/util/ipmi-lan-util.c b/libfreeipmi/util/ipmi-lan-util.c
-index cd269fcb9..a374acc8d 100644
---- a/libfreeipmi/util/ipmi-lan-util.c
-+++ b/libfreeipmi/util/ipmi-lan-util.c
-@@ -281,33 +281,33 @@ ipmi_lan_check_session_authentication_code (fiid_obj_t obj_lan_session_hdr_rs,
- 
-       if (authentication_type == IPMI_AUTHENTICATION_TYPE_MD2)
-         {
--          md2_t ctx;
--
--          assert (IPMI_1_5_MAX_PASSWORD_LENGTH == MD2_DIGEST_LENGTH);
--
--          md2_init (&ctx);
--          md2_update_data (&ctx, pwbuf, IPMI_1_5_MAX_PASSWORD_LENGTH);
--          md2_update_data (&ctx, session_id_buf, session_id_len);
--          md2_update_data (&ctx, buf, len);
--          md2_update_data (&ctx, session_sequence_number_buf, session_sequence_number_len);
--          md2_update_data (&ctx, pwbuf, IPMI_1_5_MAX_PASSWORD_LENGTH);
--          md2_finish (&ctx, authentication_code_calc, IPMI_1_5_MAX_PASSWORD_LENGTH);
--          md2_init (&ctx);
-+          ipmi_md2_t ctx;
-+
-+          assert (IPMI_1_5_MAX_PASSWORD_LENGTH == IPMI_MD2_DIGEST_LENGTH);
-+
-+          ipmi_md2_init (&ctx);
-+          ipmi_md2_update_data (&ctx, pwbuf, IPMI_1_5_MAX_PASSWORD_LENGTH);
-+          ipmi_md2_update_data (&ctx, session_id_buf, session_id_len);
-+          ipmi_md2_update_data (&ctx, buf, len);
-+          ipmi_md2_update_data (&ctx, session_sequence_number_buf, session_sequence_number_len);
-+          ipmi_md2_update_data (&ctx, pwbuf, IPMI_1_5_MAX_PASSWORD_LENGTH);
-+          ipmi_md2_finish (&ctx, authentication_code_calc, IPMI_1_5_MAX_PASSWORD_LENGTH);
-+          ipmi_md2_init (&ctx);
-         }
-       else if (authentication_type == IPMI_AUTHENTICATION_TYPE_MD5)
-         {
--          md5_t ctx;
--
--          assert (IPMI_1_5_MAX_PASSWORD_LENGTH == MD5_DIGEST_LENGTH);
--
--          md5_init (&ctx);
--          md5_update_data (&ctx, pwbuf, IPMI_1_5_MAX_PASSWORD_LENGTH);
--          md5_update_data (&ctx, session_id_buf, session_id_len);
--          md5_update_data (&ctx, buf, len);
--          md5_update_data (&ctx, session_sequence_number_buf, session_sequence_number_len);
--          md5_update_data (&ctx, pwbuf, IPMI_1_5_MAX_PASSWORD_LENGTH);
--          md5_finish (&ctx, authentication_code_calc, IPMI_1_5_MAX_PASSWORD_LENGTH);
--          md5_init (&ctx);
-+          ipmi_md5_t ctx;
-+
-+          assert (IPMI_1_5_MAX_PASSWORD_LENGTH == IPMI_MD5_DIGEST_LENGTH);
-+
-+          ipmi_md5_init (&ctx);
-+          ipmi_md5_update_data (&ctx, pwbuf, IPMI_1_5_MAX_PASSWORD_LENGTH);
-+          ipmi_md5_update_data (&ctx, session_id_buf, session_id_len);
-+          ipmi_md5_update_data (&ctx, buf, len);
-+          ipmi_md5_update_data (&ctx, session_sequence_number_buf, session_sequence_number_len);
-+          ipmi_md5_update_data (&ctx, pwbuf, IPMI_1_5_MAX_PASSWORD_LENGTH);
-+          ipmi_md5_finish (&ctx, authentication_code_calc, IPMI_1_5_MAX_PASSWORD_LENGTH);
-+          ipmi_md5_init (&ctx);
-         }
-     }
- 
-@@ -451,45 +451,45 @@ ipmi_lan_check_packet_session_authentication_code (const void *pkt,
-       memcpy (pwbuf, authentication_code_data, authentication_code_data_len);
-       if (authentication_type == IPMI_AUTHENTICATION_TYPE_MD2)
-         {
--          md2_t ctx;
--
--          assert (IPMI_1_5_MAX_PASSWORD_LENGTH == MD2_DIGEST_LENGTH);
--
--          md2_init (&ctx);
--          md2_update_data (&ctx, pwbuf, IPMI_1_5_MAX_PASSWORD_LENGTH);
--          md2_update_data (&ctx,
--                           pkt + session_id_offset,
--                           session_id_len);
--          md2_update_data (&ctx,
--                           pkt + data_offset,
--                           pkt_len - data_offset);
--          md2_update_data (&ctx,
--                           pkt + session_sequence_number_offset,
--                           session_sequence_number_len);
--          md2_update_data (&ctx, pwbuf, IPMI_1_5_MAX_PASSWORD_LENGTH);
--          md2_finish (&ctx, authentication_code_buf, IPMI_1_5_MAX_PASSWORD_LENGTH);
--          md2_init (&ctx);
-+          ipmi_md2_t ctx;
-+
-+          assert (IPMI_1_5_MAX_PASSWORD_LENGTH == IPMI_MD2_DIGEST_LENGTH);
-+
-+          ipmi_md2_init (&ctx);
-+          ipmi_md2_update_data (&ctx, pwbuf, IPMI_1_5_MAX_PASSWORD_LENGTH);
-+          ipmi_md2_update_data (&ctx,
-+                                pkt + session_id_offset,
-+                                session_id_len);
-+          ipmi_md2_update_data (&ctx,
-+                                pkt + data_offset,
-+                                pkt_len - data_offset);
-+          ipmi_md2_update_data (&ctx,
-+                                pkt + session_sequence_number_offset,
-+                                session_sequence_number_len);
-+          ipmi_md2_update_data (&ctx, pwbuf, IPMI_1_5_MAX_PASSWORD_LENGTH);
-+          ipmi_md2_finish (&ctx, authentication_code_buf, IPMI_1_5_MAX_PASSWORD_LENGTH);
-+          ipmi_md2_init (&ctx);
-         }
-       else if (authentication_type == IPMI_AUTHENTICATION_TYPE_MD5)
-         {
--          md5_t ctx;
--
--          assert (IPMI_1_5_MAX_PASSWORD_LENGTH == MD5_DIGEST_LENGTH);
--
--          md5_init (&ctx);
--          md5_update_data (&ctx, pwbuf, IPMI_1_5_MAX_PASSWORD_LENGTH);
--          md5_update_data (&ctx,
--                           pkt + session_id_offset,
--                           session_id_len);
--          md5_update_data (&ctx,
--                           pkt + data_offset,
--                           pkt_len - data_offset);
--          md5_update_data (&ctx,
--                           pkt + session_sequence_number_offset,
--                           session_sequence_number_len);
--          md5_update_data (&ctx, pwbuf, IPMI_1_5_MAX_PASSWORD_LENGTH);
--          md5_finish (&ctx, authentication_code_buf, IPMI_1_5_MAX_PASSWORD_LENGTH);
--          md5_init (&ctx);
-+          ipmi_md5_t ctx;
-+
-+          assert (IPMI_1_5_MAX_PASSWORD_LENGTH == IPMI_MD5_DIGEST_LENGTH);
-+
-+          ipmi_md5_init (&ctx);
-+          ipmi_md5_update_data (&ctx, pwbuf, IPMI_1_5_MAX_PASSWORD_LENGTH);
-+          ipmi_md5_update_data (&ctx,
-+                                pkt + session_id_offset,
-+                                session_id_len);
-+          ipmi_md5_update_data (&ctx,
-+                                pkt + data_offset,
-+                                pkt_len - data_offset);
-+          ipmi_md5_update_data (&ctx,
-+                                pkt + session_sequence_number_offset,
-+                                session_sequence_number_len);
-+          ipmi_md5_update_data (&ctx, pwbuf, IPMI_1_5_MAX_PASSWORD_LENGTH);
-+          ipmi_md5_finish (&ctx, authentication_code_buf, IPMI_1_5_MAX_PASSWORD_LENGTH);
-+          ipmi_md5_init (&ctx);
-         }
-     }
-   else /* authentication_type == IPMI_AUTHENTICATION_TYPE_STRAIGHT_PASSWORD_KEY
diff --git a/package/freeipmi/freeipmi.hash b/package/freeipmi/freeipmi.hash
index 05fb50bd4c..bc22d2ff6b 100644
--- a/package/freeipmi/freeipmi.hash
+++ b/package/freeipmi/freeipmi.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  f25e1c35f3d0f1b5a99cc31ecc2353ca83ed46a15163842fba870127dc9c8206  freeipmi-1.6.9.tar.gz
+sha256  fce4a1e401b6189c103d2b1203261d0bfbf45985c6f3fa44c51b186b13fe7a7d  freeipmi-1.6.10.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.bmc-watchdog
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.ipmiconsole
diff --git a/package/freeipmi/freeipmi.mk b/package/freeipmi/freeipmi.mk
index b26ed0c0bf..916f2eb68a 100644
--- a/package/freeipmi/freeipmi.mk
+++ b/package/freeipmi/freeipmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREEIPMI_VERSION = 1.6.9
+FREEIPMI_VERSION = 1.6.10
 FREEIPMI_SITE = https://ftp.gnu.org/gnu/freeipmi
 FREEIPMI_LICENSE = GPL-3.0+, BSD-like (sunbmc)
 FREEIPMI_LICENSE_FILES = \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
