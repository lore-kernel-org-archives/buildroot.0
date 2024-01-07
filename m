Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC67C47073
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 17:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7A1C41687;
	Sun,  7 Jan 2024 17:22:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7A1C41687
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6kAfdNlHDgTR; Sun,  7 Jan 2024 17:22:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C95B4169C;
	Sun,  7 Jan 2024 17:22:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C95B4169C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0C2B91BF3C0
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 17:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D83F4416B4
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 17:22:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D83F4416B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tsIJs2GeYQ4M for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 17:22:09 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3CFDE4176B
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 17:22:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CFDE4176B
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40e4582ed74so4110775e9.1
 for <buildroot@buildroot.org>; Sun, 07 Jan 2024 09:22:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704648124; x=1705252924;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2pNWG42mumPXTK3P8NNVOaipj0qpyOJT1qNBBzNgKQE=;
 b=iVlN83worAIdFHsLdG2N1B56Aax+Bbcsl6tMwwivsalOvtcqJlmFnYPGn/O2ul+aMw
 HczilwfdO0vHTa2b6J1l46+XiG/bIijj4in2jFNMHC5fDilxO+EBtEux7BM6QaAY5g5p
 arEbufi6RMQy/R5IwE0aPS1bZLbI3wNi0/MmMEVj/cmoP5DCdVXx1LfH4+srNpSq8Zgs
 4te9JN0LCJZuJlTVIirl+aMekdjWvyf1GK3u55BveQQLBdCedhTrwHVf4MiqCSF/bKQS
 9uZX0/H1n8n7TREtLvK8AkMbP8Ti9CX/RPOf/ZiJnTgkoWTydQ5oUiCiN8C0wo+zSVev
 l4PQ==
X-Gm-Message-State: AOJu0YziNeeMOhtrG38BbAbNMl55Mz5Nv4ANl2oLlhwTf0DHUirUNiE+
 ccYmtycYuz9zpcVKS53xa981uH557cs=
X-Google-Smtp-Source: AGHT+IFDz+2Dj02jGpcrCj+i+bRYP5CeSfWM9z5OZLzTop9dBh/TTyxPsG4ocI6HEtsOlHspr5wNkg==
X-Received: by 2002:a05:600c:1553:b0:40d:6217:c99d with SMTP id
 f19-20020a05600c155300b0040d6217c99dmr698700wmg.48.1704648124163; 
 Sun, 07 Jan 2024 09:22:04 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p5-20020a05600c358500b0040d39d61a94sm4228713wmq.1.2024.01.07.09.22.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jan 2024 09:22:03 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Jan 2024 18:22:01 +0100
Message-ID: <20240107172201.734515-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704648124; x=1705252924; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2pNWG42mumPXTK3P8NNVOaipj0qpyOJT1qNBBzNgKQE=;
 b=JuIieIkxuimBsGu1ROi5rFmB0+4htrR6jS6bvyxy61i/SgqJ1YFCWneFjzJMQOV/mx
 xtxfMoO8kzRKePoEyCiUfdVhHdFZLnbT/mHp48jYfR6wcd+8pYRvN3kVRFV1YhefWhZ5
 aVGyFv317jkWr/xi4lX4nRE/gTyS0RXadFsBVc68FT/8+9gbawLAru2woR8QFbTIz8CR
 6GGp7CZCe/wQ3YFQaQdm2x1+NuJa6U9eCjrmTyjmOGc3+h25tzw1iygsuuntMKYEQJUT
 kw+f9Blj1wS1QnTPDIxXuSonBvTcFL8BhICgSThV8U2RvLx6BYc1+Vyr2rgCwfScjgtQ
 YNiA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JuIieIkx
Subject: [Buildroot] [PATCH 1/1] package/stunnel: fix build without psk
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure without psk raised since bump to version
5.71 in commit 059259eabbd8d15c1e60c0c3b8631d0c02b93898:

ocsp.c: In function 'ocsp_init':
ocsp.c:112:20: error: 'SERVICE_OPTIONS' {aka 'struct service_options_struct'} has no member named 'psk_keys'
  112 |         if(!section->psk_keys) {
      |                    ^~

Fixes:
 - http://autobuild.buildroot.org/results/1707beea413a8da8713ad2dc59db947329da45d2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ocsp.c-fix-build-with-OPENSSL_NO_PSK.patch | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/stunnel/0001-src-ocsp.c-fix-build-with-OPENSSL_NO_PSK.patch

diff --git a/package/stunnel/0001-src-ocsp.c-fix-build-with-OPENSSL_NO_PSK.patch b/package/stunnel/0001-src-ocsp.c-fix-build-with-OPENSSL_NO_PSK.patch
new file mode 100644
index 0000000000..a8edc1d465
--- /dev/null
+++ b/package/stunnel/0001-src-ocsp.c-fix-build-with-OPENSSL_NO_PSK.patch
@@ -0,0 +1,45 @@
+From 93e5cdd68b13cc3161d9b0094b0f331bdaf07cbc Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 6 Jan 2024 17:28:20 +0100
+Subject: [PATCH] src/ocsp.c: fix build with OPENSSL_NO_PSK
+
+Fix the following build failure with OPENSSL_NO_PSK:
+
+ocsp.c: In function 'ocsp_init':
+ocsp.c:112:20: error: 'SERVICE_OPTIONS' {aka 'struct service_options_struct'} has no member named 'psk_keys'
+  112 |         if(!section->psk_keys) {
+      |                    ^~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/1707beea413a8da8713ad2dc59db947329da45d2
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/mtrojnar/stunnel/pull/18
+---
+ src/ocsp.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/ocsp.c b/src/ocsp.c
+index 5073ded..12792af 100644
+--- a/src/ocsp.c
++++ b/src/ocsp.c
+@@ -109,12 +109,16 @@ int ocsp_init(SERVICE_OPTIONS *section) {
+         s_log(LOG_DEBUG, "OCSP: Client OCSP stapling enabled");
+     } else {
+ #if OPENSSL_VERSION_NUMBER>=0x10002000L
++#ifndef OPENSSL_NO_PSK
+         if(!section->psk_keys) {
++#endif
+             if(SSL_CTX_set_tlsext_status_cb(section->ctx, ocsp_server_cb)==TLSEXT_STATUSTYPE_ocsp)
+                 s_log(LOG_DEBUG, "OCSP: Server OCSP stapling enabled");
++#ifndef OPENSSL_NO_PSK
+         } else {
+             s_log(LOG_NOTICE, "OCSP: Server OCSP stapling is incompatible with PSK");
+         }
++#endif
+ #else /* OpenSSL version 1.0.2 or later */
+         s_log(LOG_NOTICE, "OCSP: Server OCSP stapling not supported");
+ #endif /* OpenSSL version 1.0.2 or later */
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
