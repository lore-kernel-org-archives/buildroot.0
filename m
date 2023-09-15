Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ECBFCD37AA
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 22:16:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6C8A613F7;
	Fri, 15 Sep 2023 22:16:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6C8A613F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y24ReyprARcf; Fri, 15 Sep 2023 22:16:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0016613F0;
	Fri, 15 Sep 2023 22:16:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0016613F0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 858A51BF3EA
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 22:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B556405DD
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 22:16:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B556405DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5sPwZNAoH05I for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 22:16:29 +0000 (UTC)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E84B540545
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 22:16:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E84B540545
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-31fa666000dso2415038f8f.2
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 15:16:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694816186; x=1695420986;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=122V7YcBGHMYfCPglk/otoV3EhYPdi4UCo9N2Dxtn1s=;
 b=J+HoqDtFdNAX9I8tNEtdAFbrEiVAp3bRDizd/ukfMl8SNxIlBS0Rpi5kVvuU21u5eX
 p5sKAtm5djr3pbXoLU+ccjl/beM7FuVEaWlcvCDVYdUeTn7+Oda2KPoUdyRAEEXmlyVz
 tgpdPI0XyBkOuH5X2EOSZfD6mPYrmxCx4S9jMQvJ5+EVCK5BSY3LrZPq/2luEZIaFeme
 9Dp7Zlce4XQftAmtewkNHaLrrSnY/hWEXL18kBY5s0JfhVjA3LqYsv0DQMbYYgK8c5ht
 E1kk02fJwO5ukfrG2fAP23NOKwQ76tUFU6Kqnsaokh5pbGKDIRKF+xdjbXB30O1mlF7s
 AflQ==
X-Gm-Message-State: AOJu0YxDoGR6yBPDSGfcTyu6G6XZWvIX7jBgS3e7S+zI4OWUqX24wOp0
 /UXRsDBokpaEdwBuwEvf45uB6OpNfv8=
X-Google-Smtp-Source: AGHT+IGtzi1bixQPtFrj3QaOQgAOM1FyFb8zfH0IO/COtzyPKEpGq0rmKParzHGOqMkAIw5dJqGJAg==
X-Received: by 2002:a05:6000:38e:b0:31f:fdd8:7d56 with SMTP id
 u14-20020a056000038e00b0031ffdd87d56mr535718wrf.12.1694816186534; 
 Fri, 15 Sep 2023 15:16:26 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 k8-20020a5d4288000000b0031431fb40fasm5421512wrq.89.2023.09.15.15.16.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Sep 2023 15:16:26 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 16 Sep 2023 00:16:22 +0200
Message-Id: <20230915221622.207938-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694816186; x=1695420986; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=122V7YcBGHMYfCPglk/otoV3EhYPdi4UCo9N2Dxtn1s=;
 b=HY/7i3ZsixeqgKMmy9nGiRJ3T42Yb+hktJPpEtK+U52/VZ9cE4nb3EMDwgZkHtgOo7
 GlxiICIM4KJ1pV2niM2E1oC4bm8At4Jlses/kDDSEOlwytKXSTNVKPdG6U17D8dRHSyX
 hxZrZ58z62k7Rq5h0kKxbblRrlwQLYbqkP7ut8hOXh4Y4hcvLmf2Ghtrtahj5AunsDMK
 eZvX2+eC5MltMEy+JnKYea8tTOtzpM+zBfj3/MnXvc3TbLElRN3t40vSW35IdcE+0IiU
 /L8urQQKJCLLODr+sCWbCCT4+mnW0RUiH4AI6PASU4+vt3jMH1i5M8FiXhfI+eyttn7U
 RnEA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HY/7i3Zs
Subject: [Buildroot] [PATCH 1/1] package/freerdp: security bump to version
 2.11.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Fix CVE-2023-39350 to CVE-2023-39354, CVE-2023-39356, CVE-2023-40181,
  CVE-2023-40186, CVE-2023-40188, CVE-2023-40567, CVE-2023-40569 and
  CVE-2023-40589
- Drop fourth patch (already in version)

https://github.com/FreeRDP/FreeRDP/releases/tag/2.11.0
https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-rrrv-3w42-pffh
https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-q9x9-cqjc-rgwq
https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-whwr-qcf2-2mvj
https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-hg53-9j9h-3c8f
https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-c3r2-pxxp-f8r6
https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-q5v5-qhj5-mh6m
https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-mxp4-rx7x-h2g8
https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-hcj4-3c3r-5j3v
https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-9w28-wwj5-p4xq
https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-2w9f-8wg4-8jfp
https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-hm8c-rcjg-c8qp
https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-gc34-mw6m-g42x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |  1 -
 ...e-sha3-and-shake-hashes-for-libressl.patch | 38 -------------------
 package/freerdp/freerdp.hash                  |  4 +-
 package/freerdp/freerdp.mk                    |  2 +-
 4 files changed, 3 insertions(+), 42 deletions(-)
 delete mode 100644 package/freerdp/0004-Fix-8702-Disable-sha3-and-shake-hashes-for-libressl.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index dfeaaf46eb..73a00d610c 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -446,7 +446,6 @@ package/freeradius-client/0001-fix-for-nettle.patch Upstream
 package/freerdp/0001-Fix-variable-declaration-in-loop.patch Upstream
 package/freerdp/0002-Fixed-variable-declaration-in-loop.patch Upstream
 package/freerdp/0003-winpr-include-winpr-file.h-fix-build-on-uclibc.patch Upstream
-package/freerdp/0004-Fix-8702-Disable-sha3-and-shake-hashes-for-libressl.patch Upstream
 package/freescale-imx/imx-kobs/0001-Fix-musl-build.patch Upstream
 package/freescale-imx/imx-kobs/0002-Fix-build-for-recent-toolchains.patch Upstream
 package/freescale-imx/imx-uuc/S80imx-uuc Indent Shellcheck Variables
diff --git a/package/freerdp/0004-Fix-8702-Disable-sha3-and-shake-hashes-for-libressl.patch b/package/freerdp/0004-Fix-8702-Disable-sha3-and-shake-hashes-for-libressl.patch
deleted file mode 100644
index 14f615e2e7..0000000000
--- a/package/freerdp/0004-Fix-8702-Disable-sha3-and-shake-hashes-for-libressl.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From bd093454fe126163634c00b7484ab7fee6ffe670 Mon Sep 17 00:00:00 2001
-From: akallabeth <akallabeth@posteo.net>
-Date: Mon, 20 Feb 2023 16:23:39 +0100
-Subject: [PATCH] Fix #8702: Disable sha3 and shake hashes for libressl
-
-[Retrieved (and backported) from:
-https://github.com/FreeRDP/FreeRDP/pull/8708/commits/bd093454fe126163634c00b7484ab7fee6ffe670]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- libfreerdp/crypto/x509_utils.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libfreerdp/crypto/crypto.c b/libfreerdp/crypto/crypto.c
-index 6e87a88b8d8..62cf2939be7 100644
---- a/libfreerdp/crypto/crypto.c
-+++ b/libfreerdp/crypto/crypto.c
-@@ -748,7 +748,7 @@ WINPR_MD_TYPE x509_utils_get_signature_alg(const X509* xcert)
- 			return WINPR_MD_SHA512;
- 		case NID_ripemd160:
- 			return WINPR_MD_RIPEMD160;
--#if (OPENSSL_VERSION_NUMBER >= 0x1010101fL) || defined(LIBRESSL_VERSION_NUMBER)
-+#if (OPENSSL_VERSION_NUMBER >= 0x1010101fL) && !defined(LIBRESSL_VERSION_NUMBER)
- 		case NID_sha3_224:
- 			return WINPR_MD_SHA3_224;
- 		case NID_sha3_256:
-@@ -757,11 +757,11 @@ WINPR_MD_TYPE x509_utils_get_signature_alg(const X509* xcert)
- 			return WINPR_MD_SHA3_384;
- 		case NID_sha3_512:
- 			return WINPR_MD_SHA3_512;
--#endif
- 		case NID_shake128:
- 			return WINPR_MD_SHAKE128;
- 		case NID_shake256:
- 			return WINPR_MD_SHAKE256;
-+#endif
- 		case NID_undef:
- 		default:
- 			return WINPR_MD_NONE;
diff --git a/package/freerdp/freerdp.hash b/package/freerdp/freerdp.hash
index 55314cfdd3..02268f55ea 100644
--- a/package/freerdp/freerdp.hash
+++ b/package/freerdp/freerdp.hash
@@ -1,5 +1,5 @@
-# From https://pub.freerdp.com/releases/freerdp-2.10.0.tar.gz.sha256
-sha256  a673d3fc21911dd9f196834f2f3a23c3ebc7e5e4deab2f7686fcec879279e2c1  freerdp-2.10.0.tar.gz
+# From https://pub.freerdp.com/releases/freerdp-2.11.0.tar.gz.sha256
+sha256  8d08e638df21e67c3761462b4efb9e596576f58bd6886f902e6021cdd17d396e  freerdp-2.11.0.tar.gz
 
 # Locally calculated
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 01c511819d..6f71ef796f 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREERDP_VERSION = 2.10.0
+FREERDP_VERSION = 2.11.0
 FREERDP_SITE = https://pub.freerdp.com/releases
 FREERDP_DEPENDENCIES = libglib2 openssl zlib
 FREERDP_LICENSE = Apache-2.0
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
