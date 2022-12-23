Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E3FFC4332F
	for <buildroot@archiver.kernel.org>; Fri, 23 Dec 2022 17:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7F3941761;
	Fri, 23 Dec 2022 17:14:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7F3941761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sa43sZYsCtGa; Fri, 23 Dec 2022 17:14:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B1604177D;
	Fri, 23 Dec 2022 17:13:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B1604177D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D0FF41BF3F7
 for <buildroot@lists.busybox.net>; Fri, 23 Dec 2022 17:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A837F4026E
 for <buildroot@lists.busybox.net>; Fri, 23 Dec 2022 17:13:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A837F4026E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sO6_DMbu1i_Q for <buildroot@lists.busybox.net>;
 Fri, 23 Dec 2022 17:13:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57C67401CC
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 57C67401CC
 for <buildroot@buildroot.org>; Fri, 23 Dec 2022 17:13:57 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id z10so5088489wrh.10
 for <buildroot@buildroot.org>; Fri, 23 Dec 2022 09:13:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7bnQrc+UgTQTSkb5yieTODxhBonv2t65gop7brOLjbE=;
 b=WSt7u2WO0dzcSTp3eOV64mURU3QXMEfQpAJJ+HpOvKAhNZYwTQFNkk34udkIRUMBSF
 14R67nsyigtNnMziJ+RFIEmCGEohjIzIqzTxdq1qJ7Ni6z1FkQ2SoyA2UQW3rh45cPpi
 sz9Q9a0GesEMugAjur5Zkzdr9Lv935ST1mzdfYh0XQJ8FHttx27AlnVaoRP4mO1xEGBh
 EeQGJOLjDrbQtUopYNzfbElwwPC9LTz3JMIQyek05tP4NUKD/2lRuDO9EPuRLIWm6lrd
 5bn6QQdgbTemkyjdtmmY2HUAuT8kf7aDV+45ngHxnj6Uc9goEGPqMBkHi3DTK/zkvlGI
 WATA==
X-Gm-Message-State: AFqh2kqn6RA1g67zonQ6o9PMHYJAKqRvhdh63cmfu7pYkHaeSmbB16Ra
 bCz+GFlpHg9uxxud+1jHSCxVqwmVoJI=
X-Google-Smtp-Source: AMrXdXvczW7rg5cAKowCf7FMQxFAKmddvxFtX0Onf25I5OfwtFqwdRpxOmlM3xSnsCLFOJh6zO1VeA==
X-Received: by 2002:a5d:5c12:0:b0:242:800:9a7f with SMTP id
 cc18-20020a5d5c12000000b0024208009a7fmr7151517wrb.65.1671815635167; 
 Fri, 23 Dec 2022 09:13:55 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 w12-20020a5d680c000000b002302dc43d77sm3432847wru.115.2022.12.23.09.13.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Dec 2022 09:13:54 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Dec 2022 18:13:51 +0100
Message-Id: <20221223171351.24867-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7bnQrc+UgTQTSkb5yieTODxhBonv2t65gop7brOLjbE=;
 b=GGea8v7sjmeTGV34izKtgtxPckB0GHV/splxyKhKrNzDlmcKQUD2AtyhvKcc5Yh1cm
 z9iZY98rS5XO0Qu3YtFC0vny/56m4pVyrxsF79Cm1FFZsaz/scdEFOrPJm08jLoJ+fHO
 Lr2FHE7ZJCOK/KOm4oU+2gmV/qwQDbtU+ou5cBEnLLQ44650eRzVg/Bk2WPa4Rz3xAsW
 O8Ui35TeXDqdMMm6MaUiEqGLWqJBFqO2eCNwLCjkzDtqXBzID8uvhR53uWof3+g2KFAB
 QaJCOul6tydBveH1kPu9OSR1FE/V3AupRBrPvCFxwxVkYVYmquWF4rIxYATXnEq8PLnQ
 hENg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GGea8v7s
Subject: [Buildroot] [PATCH 1/1] package/libvncserver: bump to version 0.9.14
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

- Drop patches (already in version)
- examples and tests can be disabled since
  https://github.com/LibVNC/libvncserver/commit/0b8990784a81823eecc9089263ac1966d17bf399

https://github.com/LibVNC/libvncserver/releases/tag/LibVNCServer-0.9.14

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...enssl.c-fix-build-with-libressl-3.5..patch | 66 -------------------
 ...ee-vncRec-memory-in-rfbClientCleanup.patch | 28 --------
 package/libvncserver/libvncserver.hash        |  2 +-
 package/libvncserver/libvncserver.mk          |  9 ++-
 4 files changed, 5 insertions(+), 100 deletions(-)
 delete mode 100644 package/libvncserver/0001-common-crypto_openssl.c-fix-build-with-libressl-3.5..patch
 delete mode 100644 package/libvncserver/0002-libvncclient-free-vncRec-memory-in-rfbClientCleanup.patch

diff --git a/package/libvncserver/0001-common-crypto_openssl.c-fix-build-with-libressl-3.5..patch b/package/libvncserver/0001-common-crypto_openssl.c-fix-build-with-libressl-3.5..patch
deleted file mode 100644
index 110976c4bb..0000000000
--- a/package/libvncserver/0001-common-crypto_openssl.c-fix-build-with-libressl-3.5..patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 97fbbd678b2012e64acddd523677bc55a177bc58 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 12 May 2022 20:41:50 +0200
-Subject: [PATCH] common/crypto_openssl.c: fix build with libressl >= 3.5.0
- (#522)
-
-Fix the following build failure with libressl >= 3.5.0:
-
-/nvmedata/autobuild/instance-26/output-1/build/libvncserver-0.9.13/common/crypto_openssl.c: In function 'dh_generate_keypair':
-/nvmedata/autobuild/instance-26/output-1/build/libvncserver-0.9.13/common/crypto_openssl.c:149:7: error: dereferencing pointer to incomplete type 'DH' {aka 'struct dh_st'}
-  149 |     dh->p = BN_bin2bn(prime, keylen, NULL);
-      |       ^~
-
-Fixes:
- - http://autobuild.buildroot.org/results/49b3940b9d0432cb5fb0c5d22dfa017b18c6e233
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/LibVNC/libvncserver/commit/97fbbd678b2012e64acddd523677bc55a177bc58]
----
- common/crypto_openssl.c | 12 ++++++++----
- 1 file changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/common/crypto_openssl.c b/common/crypto_openssl.c
-index 60d4bd4df..51d7ec2d9 100644
---- a/common/crypto_openssl.c
-+++ b/common/crypto_openssl.c
-@@ -138,14 +138,16 @@ int dh_generate_keypair(uint8_t *priv_out, uint8_t *pub_out, const uint8_t *gen,
- {
-     int result = 0;
-     DH *dh;
--#if OPENSSL_VERSION_NUMBER >= 0x10100000L
-+#if OPENSSL_VERSION_NUMBER >= 0x10100000L || \
-+	(defined (LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER >= 0x30500000)
-     const BIGNUM *pub_key = NULL;
-     const BIGNUM *priv_key = NULL;
- #endif
- 
-     if(!(dh = DH_new()))
- 	goto out;
--#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined LIBRESSL_VERSION_NUMBER
-+#if OPENSSL_VERSION_NUMBER < 0x10100000L || \
-+	(defined (LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000)
-     dh->p = BN_bin2bn(prime, keylen, NULL);
-     dh->g = BN_bin2bn(gen, gen_len, NULL);
- #else
-@@ -154,7 +156,8 @@ int dh_generate_keypair(uint8_t *priv_out, uint8_t *pub_out, const uint8_t *gen,
- #endif
-     if(!DH_generate_key(dh))
- 	goto out;
--#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined LIBRESSL_VERSION_NUMBER
-+#if OPENSSL_VERSION_NUMBER < 0x10100000L || \
-+	(defined (LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000)
-     if(BN_bn2bin(dh->priv_key, priv_out) == 0)
- 	goto out;
-     if(BN_bn2bin(dh->pub_key, pub_out) == 0)
-@@ -181,7 +184,8 @@ int dh_compute_shared_key(uint8_t *shared_out, const uint8_t *priv, const uint8_
- 
-     if(!(dh = DH_new()))
- 	goto out;
--#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined LIBRESSL_VERSION_NUMBER
-+#if OPENSSL_VERSION_NUMBER < 0x10100000L || \
-+	(defined LIBRESSL_VERSION_NUMBER && LIBRESSL_VERSION_NUMBER < 0x30500000)
-     dh->p = BN_bin2bn(prime, keylen, NULL);
-     dh->priv_key = BN_bin2bn(priv, keylen, NULL);
- #else
diff --git a/package/libvncserver/0002-libvncclient-free-vncRec-memory-in-rfbClientCleanup.patch b/package/libvncserver/0002-libvncclient-free-vncRec-memory-in-rfbClientCleanup.patch
deleted file mode 100644
index 7658c112f3..0000000000
--- a/package/libvncserver/0002-libvncclient-free-vncRec-memory-in-rfbClientCleanup.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From bef41f6ec4097a8ee094f90a1b34a708fbd757ec Mon Sep 17 00:00:00 2001
-From: Christian Beier <info@christianbeier.net>
-Date: Sat, 21 Nov 2020 12:52:31 +0100
-Subject: [PATCH] libvncclient: free vncRec memory in rfbClientCleanup()
-
-Otherwise we leak memory. Spotted by Ramin Farajpour Cami
-<ramin.blackhat@gmail.com>, thanks!
-
-[Retrieved from:
-https://github.com/LibVNC/libvncserver/commit/bef41f6ec4097a8ee094f90a1b34a708fbd757ec]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- libvncclient/vncviewer.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/libvncclient/vncviewer.c b/libvncclient/vncviewer.c
-index d6b91f02b..0a1bdcf6a 100644
---- a/libvncclient/vncviewer.c
-+++ b/libvncclient/vncviewer.c
-@@ -534,6 +534,8 @@ void rfbClientCleanup(rfbClient* client) {
-     client->clientData = next;
-   }
- 
-+  free(client->vncRec);
-+
-   if (client->sock != RFB_INVALID_SOCKET)
-     rfbCloseSocket(client->sock);
-   if (client->listenSock != RFB_INVALID_SOCKET)
diff --git a/package/libvncserver/libvncserver.hash b/package/libvncserver/libvncserver.hash
index 8e61a3d0ea..225c42e46a 100644
--- a/package/libvncserver/libvncserver.hash
+++ b/package/libvncserver/libvncserver.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  0ae5bb9175dc0a602fe85c1cf591ac47ee5247b87f2bf164c16b05f87cbfa81a  LibVNCServer-0.9.13.tar.gz
+sha256  83104e4f7e28b02f8bf6b010d69b626fae591f887e949816305daebae527c9a5  LibVNCServer-0.9.14.tar.gz
 sha256  4d23c8c814e5baf007d854f01d8502e77dc56a41144934e003fb32c4e052d20f  COPYING
diff --git a/package/libvncserver/libvncserver.mk b/package/libvncserver/libvncserver.mk
index 8f24e2d098..700e26a8d6 100644
--- a/package/libvncserver/libvncserver.mk
+++ b/package/libvncserver/libvncserver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVNCSERVER_VERSION = 0.9.13
+LIBVNCSERVER_VERSION = 0.9.14
 LIBVNCSERVER_SOURCE = LibVNCServer-$(LIBVNCSERVER_VERSION).tar.gz
 LIBVNCSERVER_SITE = https://github.com/LibVNC/libvncserver/archive
 LIBVNCSERVER_LICENSE = GPL-2.0+
@@ -14,14 +14,13 @@ LIBVNCSERVER_INSTALL_STAGING = YES
 LIBVNCSERVER_DEPENDENCIES = host-pkgconf lzo
 LIBVNCSERVER_CONF_OPTS = -DWITH_LZO=ON
 
-# 0002-libvncclient-free-vncRec-memory-in-rfbClientCleanup.patch
-LIBVNCSERVER_IGNORE_CVES += CVE-2020-29260
-
 # only used for examples
 LIBVNCSERVER_CONF_OPTS += \
+	-DWITH_EXAMPLES=OFF \
 	-DWITH_FFMPEG=OFF \
 	-DWITH_GTK=OFF \
-	-DWITH_SDL=OFF
+	-DWITH_SDL=OFF \
+	-DWITH_TESTS=OFF
 
 ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 LIBVNCSERVER_CONF_OPTS += -DWITH_THREADS=ON
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
