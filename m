Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED329C4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 17:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 895BA60B6A;
	Sun, 26 Nov 2023 17:46:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 895BA60B6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oYInL6T09PXo; Sun, 26 Nov 2023 17:46:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D711960ABA;
	Sun, 26 Nov 2023 17:46:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D711960ABA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7942C1BF28A
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 17:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5ED5B81206
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 17:46:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5ED5B81206
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qXjfgW3ZxxLa for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 17:46:05 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D88881257
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 17:46:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D88881257
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40b402c36c4so7352185e9.1
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 09:46:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701020762; x=1701625562;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sjKJoak/nsvkDJujNBoUnukimeS2l6NEi8UNzlC+JoA=;
 b=NWAaqBnFyKeD6DpZjgdV5SB/TqWuel9DMcWs37OPpdm40AQ1ydyyJgpo7FoVEdZGey
 32ehwQ110SoJnTxTdbCuHOyYYF4DajJhNDeRvw/okwuj1a47ijKWtzUS3MkmGTqP0P95
 nLrdpMHPFhOMNpVnA8ZsT7vVvmK0FPeix9pK2aPfRNomdsCnDsRop0aufd/sBNJWiXsz
 /Aa5DeseViPU1rpOfet65EKVCHKwrF0DwoJbcjC7SPJh4fyyAjCy+2pODngCfqiGeBD1
 yPzZdpzR4qxCzxKnmeczJ0uxx7+d4YhSBru8NOvXbWhDXFAK3/udeTp18/TymPmgAhfw
 x7PQ==
X-Gm-Message-State: AOJu0YzusIbJOMdiN+V/oWSz26TJGuO+1IMYkusOKGtnv5Hnaj+NZ+Bj
 AHx1LbCn7z3cPvj3//zl+Ud3+TGSy3s=
X-Google-Smtp-Source: AGHT+IFvBhrfAvd0hXH3yh3IJ9Or41C4N5+9AqDNMfpT7EBpJvab6Nx/qDwcy/rQ0xI9uP3MrvZ0vQ==
X-Received: by 2002:a05:600c:3b16:b0:40b:4007:11f1 with SMTP id
 m22-20020a05600c3b1600b0040b400711f1mr2848588wms.11.1701020762033; 
 Sun, 26 Nov 2023 09:46:02 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 e15-20020a056000120f00b0032da35baf7bsm9736829wrx.113.2023.11.26.09.46.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Nov 2023 09:46:01 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Nov 2023 18:45:58 +0100
Message-ID: <20231126174558.24896-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701020762; x=1701625562; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sjKJoak/nsvkDJujNBoUnukimeS2l6NEi8UNzlC+JoA=;
 b=U4Wt9TXuDtOKscePKy3jiT2SGj4oS5os0ejIgF47NTF1A6Sjdvq9a6z+VyU/XUpXUb
 tbQkrYi9JsQPIo3RzgfBkAQ93Oa9khSrdKAS+b8E1hCpXsteMiRlGH9S64P6gpRp2Kll
 ib1iqCyRcIUeVpqUX44QkFiveLyuG6X5/6UGFgb4kcfXPflyaRZKStPhJL2ysgDiBivs
 hYAdSzxIk+GLJahEartitq/m4fEj13vs2RH2/UzV/P05yFmzHTgFv5uPt5zr1+FsMp+P
 7dcF1mMsHGs4UqjPdSQlqA9G13aPajUw+eBkcxFsSlBYUoo8/5X0YZwroB0WXWI71nkf
 nroQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=U4Wt9TXu
Subject: [Buildroot] [PATCH 1/1] package/opensc: fix libressl build
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

Fix the following build failure with libressl >= 3.8 raised since bump
of libressl to version 3.8.2 in commit
21eca49ed5110872407b76ab9337d2877c4cda24:

In file included from card-westcos.c:37:
/home/autobuild/autobuild/instance-11/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/openssl/evp.h:627:32: error: macro "EVP_sha3_224" passed 1 arguments, but takes just 0
  627 | const EVP_MD *EVP_sha3_224(void);
      |                                ^

Fixes:
 - http://autobuild.buildroot.org/results/cecee659371f370bf4bd2b27a4752bf20ceff326

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...L-does-provide-EVP_sha3_-after-3-7-3.patch | 32 +++++++++++++++++++
 ...ixed-detection-of-SHA3-compatibility.patch | 27 ++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 package/opensc/0005-LibreSSL-does-provide-EVP_sha3_-after-3-7-3.patch
 create mode 100644 package/opensc/0006-fixed-detection-of-SHA3-compatibility.patch

diff --git a/package/opensc/0005-LibreSSL-does-provide-EVP_sha3_-after-3-7-3.patch b/package/opensc/0005-LibreSSL-does-provide-EVP_sha3_-after-3-7-3.patch
new file mode 100644
index 0000000000..80c19a3f5f
--- /dev/null
+++ b/package/opensc/0005-LibreSSL-does-provide-EVP_sha3_-after-3-7-3.patch
@@ -0,0 +1,32 @@
+From e015242590ad9131e124232cc5a2fd02d525ef2c Mon Sep 17 00:00:00 2001
+From: Klemens Nanni <kn@openbsd.org>
+Date: Thu, 29 Jun 2023 02:41:43 +0300
+Subject: [PATCH] LibreSSL does provide EVP_sha3_*() after 3.7.3
+
+Support was added in 16.04.2023.
+
+Compile- and run-tested on OpenBSD/amd64 7.3-current.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/OpenSC/OpenSC/commit/e015242590ad9131e124232cc5a2fd02d525ef2c
+---
+ src/libopensc/sc-ossl-compat.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/libopensc/sc-ossl-compat.h b/src/libopensc/sc-ossl-compat.h
+index df0cebbce2..8012cd4c0f 100644
+--- a/src/libopensc/sc-ossl-compat.h
++++ b/src/libopensc/sc-ossl-compat.h
+@@ -50,10 +50,12 @@ extern "C" {
+ #if LIBRESSL_VERSION_NUMBER < 0x30500000L
+ #define FIPS_mode()                             (0)
+ #endif
++#ifndef EVP_sha3_224
+ #define EVP_sha3_224()                          (NULL)
+ #define EVP_sha3_256()                          (NULL)
+ #define EVP_sha3_384()                          (NULL)
+ #define EVP_sha3_512()                          (NULL)
++#endif
+ #if LIBRESSL_VERSION_NUMBER < 0x3070000fL
+ #define EVP_PKEY_new_raw_public_key(t, e, p, l) (NULL)
+ #define EVP_PKEY_get_raw_public_key(p, pu, l)   (0)
diff --git a/package/opensc/0006-fixed-detection-of-SHA3-compatibility.patch b/package/opensc/0006-fixed-detection-of-SHA3-compatibility.patch
new file mode 100644
index 0000000000..3d8aa7e4ef
--- /dev/null
+++ b/package/opensc/0006-fixed-detection-of-SHA3-compatibility.patch
@@ -0,0 +1,27 @@
+From 33351d91aa22fa8077847ba3f19abb5a00b04600 Mon Sep 17 00:00:00 2001
+From: Frank Morgner <frankmorgner@gmail.com>
+Date: Tue, 15 Aug 2023 17:58:21 +0200
+Subject: [PATCH] fixed detection of SHA3 compatibility
+
+fixes https://github.com/OpenSC/OpenSC/issues/2836
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/OpenSC/OpenSC/commit/33351d91aa22fa8077847ba3f19abb5a00b04600
+---
+ src/libopensc/sc-ossl-compat.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/libopensc/sc-ossl-compat.h b/src/libopensc/sc-ossl-compat.h
+index 8012cd4c0f..96ec4bd736 100644
+--- a/src/libopensc/sc-ossl-compat.h
++++ b/src/libopensc/sc-ossl-compat.h
+@@ -50,7 +50,8 @@ extern "C" {
+ #if LIBRESSL_VERSION_NUMBER < 0x30500000L
+ #define FIPS_mode()                             (0)
+ #endif
+-#ifndef EVP_sha3_224
++/* OpenSSL 1.1.1 has EVP_sha3_* */
++#if defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30800000L
+ #define EVP_sha3_224()                          (NULL)
+ #define EVP_sha3_256()                          (NULL)
+ #define EVP_sha3_384()                          (NULL)
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
