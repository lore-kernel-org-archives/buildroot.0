Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B935C433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 22:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2441383EA4;
	Tue, 26 Apr 2022 22:00:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7A10aFUqa4QG; Tue, 26 Apr 2022 22:00:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4038F83E41;
	Tue, 26 Apr 2022 22:00:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 751FE1BF3A6
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 22:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 634AE60BD4
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 22:00:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YwMNMV6W-lbm for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 22:00:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3E4F460B03
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 22:00:05 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id d5so12095664wrb.6
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 15:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OrtVbkJYsFYUyT9yBbE2CCTfUiLITvEk+EIjBO9gEUY=;
 b=LQt3Birrj6uKCCpfjMZCzX0Ly0R9+phXz4Xh+KIhHHPnv0TmeSqAgAkwgl/QQIfAUC
 uARvvYGmqg8GKBnNSM5ZYBfZbnmkm/J5ccKNDc+/065JZyDnBaszBvWFxTJYjfDnkjOQ
 vFCfdza9RC4nK7lVn/b8QwLUsrV19sYnVklytVqCfys0RfkAiKlEStehf7Qsmee/lg6s
 PCQirCFvafYgNkKfJNj+eGaT8zcdTAUCdDb8Mcftac8AclKljT/vQcT/z1018C35cNjG
 +Hb0cHmNa3C2fHb9BSC1a9E47//wXR39eoRrzD+Qbg27PXOnBie6Utt1kzd1Q7RHjnaO
 44Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OrtVbkJYsFYUyT9yBbE2CCTfUiLITvEk+EIjBO9gEUY=;
 b=n2hImpQYFkm2WY2M+4wnoEJZ9Qhd+nZhI8RqEuaFi6axqEHgvm8OpJaMxN1+XBCTG9
 +uR8NZsjIONeuCyaGZlgOjkcJVUOnzOScO7wv35eEHhM0dDxriAOl5babf6wNYAHvGLc
 x2XssUEgQhjeJMi6LQw3I1IxO3Wh+Qu6RIWxW3CbRVwAGGppUatm9JvdMSA/X1R2XnkM
 nER1JPs/0Pl7MzJZMuTrkJnsJ0dGpg4ctLGWnMI3vJpc27deBvewgApj/2j6V6VKrCGg
 kOP7TkRGOcmTd3C0hbQkELWdf8D5gN218GqwCxgolL7TvoWZOmBj1CScI3MGslfC1CXe
 MxXQ==
X-Gm-Message-State: AOAM531JtAcIPhDKxX3RQXrvGL6w0uGzfOzBdInebs6/joau1Wo70OS/
 PUoaUC6ZMf/NjFTcc+wZyyc6imAMhDM=
X-Google-Smtp-Source: ABdhPJy5UO4XtKzbFGBgpKqOJjfSq/sEuX8Coo5XJS2LoT6BGC65Mr58pLZAPVhnMcBYgpbktPcn1A==
X-Received: by 2002:a05:6000:10a:b0:20a:e2aa:6848 with SMTP id
 o10-20020a056000010a00b0020ae2aa6848mr5215165wrx.464.1651010403123; 
 Tue, 26 Apr 2022 15:00:03 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 s26-20020adfa29a000000b0020ad8b99d5dsm7499300wra.109.2022.04.26.15.00.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 15:00:02 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Apr 2022 23:57:54 +0200
Message-Id: <20220426215755.782961-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libsrtp: fix build with libressl >=
 3.5.0
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
Cc: Gregory Dymarek <gregd72002@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with libressl raised since bump to
version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:

crypto/hash/hmac_ossl.c: In function 'srtp_hmac_alloc':
crypto/hash/hmac_ossl.c:88:55: error: invalid application of 'sizeof' to incomplete type 'HMAC_CTX' {aka 'struct hmac_ctx_st'}
   88 |         pointer = (uint8_t *)srtp_crypto_alloc(sizeof(HMAC_CTX) +
      |                                                       ^~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/c346780ed664c9fe8c7112e4c256cfe8080a7af5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...legacy-OpenSSL-to-fix-LibreSSL-build.patch | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 package/libsrtp/0001-Remove-compatibility-code-for-legacy-OpenSSL-to-fix-LibreSSL-build.patch

diff --git a/package/libsrtp/0001-Remove-compatibility-code-for-legacy-OpenSSL-to-fix-LibreSSL-build.patch b/package/libsrtp/0001-Remove-compatibility-code-for-legacy-OpenSSL-to-fix-LibreSSL-build.patch
new file mode 100644
index 0000000000..68bfb085f7
--- /dev/null
+++ b/package/libsrtp/0001-Remove-compatibility-code-for-legacy-OpenSSL-to-fix-LibreSSL-build.patch
@@ -0,0 +1,86 @@
+From 16483b18a9980575bee23898b2dbfbe2a4675d84 Mon Sep 17 00:00:00 2001
+From: Klemens Nanni <kn@openbsd.org>
+Date: Sat, 15 Jan 2022 23:19:35 +0300
+Subject: [PATCH] Remove compatibility code for legacy OpenSSL to fix LibreSSL
+ build
+
+In current LibreSSL, `HMAC_CTX` aka. `struct hmac_ctx_st` is an opaque
+structure as of LibreSSL hmac.h revision 1.15 (14.01.2022) [0], thus
+`sizeof(HMAC_CTX)` fails to compile.
+
+The non-legacy code path should compile with LibreSSL versions as old
+as 2.7.0 (21.03.2018).
+
+Found while building https://github.com/desktop-app/tg_owt which bundles
+libsrtp 2.2.0 [1] on OpenBSD 7.0 -CURRENT/with latest LibreSSL.
+
+Suggestion to remove the legacy code from Theo Buehler, thanks.
+
+0: http://cvsweb.openbsd.org/cgi-bin/cvsweb/src/lib/libcrypto/hmac/hmac.h?rev=1.15&content-type=text/x-cvsweb-markup
+1: https://github.com/desktop-app/tg_owt/blob/6708e0d31a73e64fe12f54829bf4060c41b2658e/src/third_party/libsrtp/crypto/hash/hmac_ossl.c#L85
+
+[Retrieved from:
+https://github.com/cisco/libsrtp/commit/16483b18a9980575bee23898b2dbfbe2a4675d84]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ crypto/hash/hmac_ossl.c | 29 -----------------------------
+ 1 file changed, 29 deletions(-)
+
+diff --git a/crypto/hash/hmac_ossl.c b/crypto/hash/hmac_ossl.c
+index ee6b0b58..c23c7f21 100644
+--- a/crypto/hash/hmac_ossl.c
++++ b/crypto/hash/hmac_ossl.c
+@@ -78,26 +78,6 @@ static srtp_err_status_t srtp_hmac_alloc(srtp_auth_t **a,
+         return srtp_err_status_bad_param;
+     }
+ 
+-/* OpenSSL 1.1.0 made HMAC_CTX an opaque structure, which must be allocated
+-   using HMAC_CTX_new.  But this function doesn't exist in OpenSSL 1.0.x. */
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L || LIBRESSL_VERSION_NUMBER
+-    {
+-        /* allocate memory for auth and HMAC_CTX structures */
+-        uint8_t *pointer;
+-        HMAC_CTX *new_hmac_ctx;
+-        pointer = (uint8_t *)srtp_crypto_alloc(sizeof(HMAC_CTX) +
+-                                               sizeof(srtp_auth_t));
+-        if (pointer == NULL) {
+-            return srtp_err_status_alloc_fail;
+-        }
+-        *a = (srtp_auth_t *)pointer;
+-        (*a)->state = pointer + sizeof(srtp_auth_t);
+-        new_hmac_ctx = (HMAC_CTX *)((*a)->state);
+-
+-        HMAC_CTX_init(new_hmac_ctx);
+-    }
+-
+-#else
+     *a = (srtp_auth_t *)srtp_crypto_alloc(sizeof(srtp_auth_t));
+     if (*a == NULL) {
+         return srtp_err_status_alloc_fail;
+@@ -109,7 +89,6 @@ static srtp_err_status_t srtp_hmac_alloc(srtp_auth_t **a,
+         *a = NULL;
+         return srtp_err_status_alloc_fail;
+     }
+-#endif
+ 
+     /* set pointers */
+     (*a)->type = &srtp_hmac;
+@@ -126,18 +105,10 @@ static srtp_err_status_t srtp_hmac_dealloc(srtp_auth_t *a)
+ 
+     hmac_ctx = (HMAC_CTX *)a->state;
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L || LIBRESSL_VERSION_NUMBER
+-    HMAC_CTX_cleanup(hmac_ctx);
+-
+-    /* zeroize entire state*/
+-    octet_string_set_to_zero(a, sizeof(HMAC_CTX) + sizeof(srtp_auth_t));
+-
+-#else
+     HMAC_CTX_free(hmac_ctx);
+ 
+     /* zeroize entire state*/
+     octet_string_set_to_zero(a, sizeof(srtp_auth_t));
+-#endif
+ 
+     /* free memory */
+     srtp_crypto_free(a);
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
