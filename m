Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E0BC433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 21:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B11982B1B;
	Wed, 27 Apr 2022 21:06:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2xpQAAhfsERm; Wed, 27 Apr 2022 21:06:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40DCA80B21;
	Wed, 27 Apr 2022 21:06:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C42751BF2C7
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 21:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A41F140A59
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 21:06:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dfglVvc120TX for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 21:06:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A10594010D
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 21:06:18 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 1-20020a05600c248100b00393fbf11a05so3146375wms.3
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 14:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hSA10mEXaPBA+JGw8SHw1qmCbAalV8LO6egAaYEIHIc=;
 b=MKdxlo/TfJuVvxfb561Y8N858bWGlVA+8bUNYsCxFraGJR9BZPTd4lPxWBhzmgAF07
 Ye7Y6BbPqf0zmrqZq8UuekunKxDjJAihUUqzXuGHfpYRJXQfe9R6kowBUGl8CSV2FWuG
 I+Is5ufXZVknWhnIDwXZtbtJvkbxdWtq+6ZHBBISeJFi3IQ+QWZMPPF0IW0lh/hqh7Hy
 cxUyQVJzoMPbmJL4osC4GQzJYh5/6tI6zIOKF06LXz15Lgu+TECBLVTUE4vEn4BQiPuS
 Vzjkr6WnWMruX37BWfBLqaRJLei+dOh++M5UyVktjPR/oHyAFxN5H3HmRB9HqBQR7s1H
 3RMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hSA10mEXaPBA+JGw8SHw1qmCbAalV8LO6egAaYEIHIc=;
 b=Kg0glByzx4BTyfjiiIoWtjjGSJZCl3eCPNQEDADTY/QA8scWZ0nLV4eNjEMc3ae9Qs
 GtTh66bDOl7Gf2hqNX8fSFnVdHp0UoeWCq0vB/52IUtytPlKK5Ns1EBHCqqW1jYXl2Dk
 sSN5to0VpoHrr30izjIs94sYO8o9BLynZ8HjJMkem+qXjbt7MspN+2JPL2C+HYfuWXUv
 FGUIf68M4tr43C/MhpRSDRXLXGleuN7j9Ixh7ALaCOB1m8nIwI7ymxY2M5nKHBLjPAuM
 KSzCeDtbPh3U83IZ4mlvrKrLrJ85ScbB1PR6JteDfO9Sl7alFbf/I8Co1gd4/bYGpQK5
 CK0w==
X-Gm-Message-State: AOAM532yRAu71FJhnzpaz3KS8Xj7dVnJ0h93BCzwBr5iNnAXUtZJoGQ/
 6YMiEflnvZTwTjza+rS8DHKBabww5wk=
X-Google-Smtp-Source: ABdhPJwTFweo7nlvyvR4PvjG/BCoQTqDxPrpLjE2NsuFma6boxggUYTmnlF2Z8WZfhkNvgyudxj0LA==
X-Received: by 2002:a05:600c:3b85:b0:393:edbb:ab9d with SMTP id
 n5-20020a05600c3b8500b00393edbbab9dmr13868157wms.126.1651093576479; 
 Wed, 27 Apr 2022 14:06:16 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 n68-20020a1c2747000000b0038e6b4d5395sm2546870wmn.16.2022.04.27.14.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 14:06:16 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Apr 2022 23:04:19 +0200
Message-Id: <20220427210419.1432804-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libssh2: fix build with libressl >=
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with libressl raised since bump to
version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:

crypt.c:71:25: error: field 'h' has incomplete type
   71 |     _libssh2_cipher_ctx h;
      |                         ^

Fixes:
 - http://autobuild.buildroot.org/results/47f492ccd4888fe4a150b36e12c88f1e068d46b6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-Opaque-structs-in-LibreSSL-3-5.patch | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/libssh2/0001-Opaque-structs-in-LibreSSL-3-5.patch

diff --git a/package/libssh2/0001-Opaque-structs-in-LibreSSL-3-5.patch b/package/libssh2/0001-Opaque-structs-in-LibreSSL-3-5.patch
new file mode 100644
index 0000000000..2e1fd8871c
--- /dev/null
+++ b/package/libssh2/0001-Opaque-structs-in-LibreSSL-3-5.patch
@@ -0,0 +1,27 @@
+From 7f55a033e5054529e5e69f06725dd02a573329b6 Mon Sep 17 00:00:00 2001
+From: Charlie Li <git@vishwin.info>
+Date: Wed, 2 Mar 2022 19:50:56 -0500
+Subject: [PATCH] Opaque structs in LibreSSL 3.5
+
+[Retrieved (and backported) from:
+https://github.com/libssh2/libssh2/pull/682/commits/7f55a033e5054529e5e69f06725dd02a573329b6]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/openssl.h | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/openssl.h b/src/openssl.h
+index 3eef02368..c13542481 100644
+--- a/src/openssl.h
++++ b/src/openssl.h
+@@ -94,8 +94,8 @@
+ #include <openssl/pem.h>
+ #include <openssl/rand.h>
+ 
+-#if OPENSSL_VERSION_NUMBER >= 0x10100000L && \
+-    !defined(LIBRESSL_VERSION_NUMBER)
++#if (OPENSSL_VERSION_NUMBER >= 0x10100000L && !defined(LIBRESSL_VERSION_NUMBER)) || \
++    (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER >= 0x30500000L)
+ # define HAVE_OPAQUE_STRUCTS 1
+ #endif
+ 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
