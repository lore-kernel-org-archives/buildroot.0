Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C354C4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 22:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E07060C0E;
	Sun, 26 Nov 2023 22:49:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E07060C0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RHRcFsnTroND; Sun, 26 Nov 2023 22:49:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C74760C09;
	Sun, 26 Nov 2023 22:49:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C74760C09
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9D7671BF215
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 22:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C99360C09
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 22:48:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C99360C09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m4-gxLs3UX4J for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 22:48:57 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6BE8760C06
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 22:48:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BE8760C06
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40b30308c67so26680325e9.0
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 14:48:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701038934; x=1701643734;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nuos80PQfNzzeuEUejcqaI2aVbLDRgUsepRYtwZ9f2M=;
 b=Df6FEBRSuI48JzMNebDHaI7FwpD2BKZZWRFer8Bpr1Kv3y8Eh9RHPF0zdEbnD8HMHf
 +Pj+qipvBmM4JRpVwvNZlwLJNRjcrXxihRdWOrGBKH+ZIfA7XarU+S/h8Bx61ILtQreP
 71Bd+35zy8rymWVjQ7gVOYzbShgTwrab3JB/m/1KDqpy8Lo7xrE7g7liNF9nVESAOXiQ
 T1XUgLDG+h7hQQ6dp7QTA68cn66NH1B3751pGyT8ytIvdqYE1F7KIeMygYrePwjF240S
 6SWDE+9sgJMUXZtuyKDj1+kgt9MTLY1BPWqImuUuFgit66Vzpn+NgyPT2CjJCwsw4a0F
 6T8Q==
X-Gm-Message-State: AOJu0YzTr57zDL0bicTdwwuSgGx2Hua4nUjtzulZwElf7YuVof1hJliW
 XXc/m7Sby0nyFok+A63Hyg4XW/SkX8o=
X-Google-Smtp-Source: AGHT+IEGVlQp0sxGOye5/qhC5+SAzUzdk4EJiOse3Nuz/fy+lYb9W4aPY2voxEdw8ppX4Avk5sp3mQ==
X-Received: by 2002:a05:600c:5118:b0:3f6:9634:c8d6 with SMTP id
 o24-20020a05600c511800b003f69634c8d6mr7205293wms.18.1701038934465; 
 Sun, 26 Nov 2023 14:48:54 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 iv8-20020a05600c548800b004063ea92492sm11701409wmb.22.2023.11.26.14.48.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Nov 2023 14:48:53 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Nov 2023 23:48:49 +0100
Message-ID: <20231126224849.321916-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701038934; x=1701643734; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Nuos80PQfNzzeuEUejcqaI2aVbLDRgUsepRYtwZ9f2M=;
 b=K2XZTsf5gvFWIZMaYg3VppDkAGoeH0PJTa1towQ+NRabwtibtbdWameH5uHnLA10bO
 z3mt2+c8dGBjMpfT0p1PSW566W2ZiIZFRpSKMoK+ZsdjKtKCLYJhp0saboud02FD/n08
 K7FIUcqupOh/I210BVhyBThVT78u9KIOqIguw+9LS8MbU5EFd1Aj+AC9Y/JncZ7qFWud
 E8GPj6JUIgVS3lMyBzAVJlUzW7HlL2ROYCyK8fPkaUE1re4Bi4YkFSBQOUjdW6IdKNsZ
 mGGKt3eQuRpnZkSFWDTcTcewPaq3PCPAPJQ2HnNERUKEyJUJzOF9+RTzoE9dEYF2Nz9s
 QKVA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=K2XZTsf5
Subject: [Buildroot] [PATCH 1/1] package/libldns: fix libressl build
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump of libressl to version
3.8.2 in commit 21eca49ed5110872407b76ab9337d2877c4cda24:

./keys.c:167:35: error: 'ENGINE_METHOD_ALL' undeclared (first use in this function)
  167 |         if(!ENGINE_set_default(e, ENGINE_METHOD_ALL)) {
      |                                   ^~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/37cc05b78a7004caa1b45d896121f059a4f8ca00

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...keys.c-fix-build-with-libressl-3.8.1.patch | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/libldns/0001-keys.c-fix-build-with-libressl-3.8.1.patch

diff --git a/package/libldns/0001-keys.c-fix-build-with-libressl-3.8.1.patch b/package/libldns/0001-keys.c-fix-build-with-libressl-3.8.1.patch
new file mode 100644
index 0000000000..c385cc44b9
--- /dev/null
+++ b/package/libldns/0001-keys.c-fix-build-with-libressl-3.8.1.patch
@@ -0,0 +1,40 @@
+From 681cb309620e44d3d4d96494554e19bcab0b6f9d Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 26 Nov 2023 23:38:14 +0100
+Subject: [PATCH] keys.c: fix build with libressl >= 3.8.1
+
+libressl >= 3.8.1 removed ENGINE support:
+"ENGINE support was removed and OPENSSL_NO_ENGINE is set. In spite
+of this, some stub functions are provided to avoid patching some
+applications that do not honor OPENSSL_NO_ENGINE."
+resulting in the following build failure with gost:
+
+./keys.c:167:35: error: 'ENGINE_METHOD_ALL' undeclared (first use in this function)
+  167 |         if(!ENGINE_set_default(e, ENGINE_METHOD_ALL)) {
+      |                                   ^~~~~~~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/37cc05b78a7004caa1b45d896121f059a4f8ca00
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/NLnetLabs/ldns/pull/227
+---
+ keys.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/keys.c b/keys.c
+index 78bea972..59de186e 100644
+--- a/keys.c
++++ b/keys.c
+@@ -132,7 +132,7 @@ ldns_key_new_frm_engine(ldns_key **key, ENGINE *e, char *key_id, ldns_algorithm
+ }
+ #endif
+ 
+-#ifdef USE_GOST
++#if defined(USE_GOST) && !defined(OPENSSL_NO_ENGINE)
+ /** store GOST engine reference loaded into OpenSSL library */
+ ENGINE* ldns_gost_engine = NULL;
+ 
+-- 
+2.42.0
+
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
