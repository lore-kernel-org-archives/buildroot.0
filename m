Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC87C04FFE
	for <buildroot@archiver.kernel.org>; Mon, 20 May 2024 08:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 114E040A39;
	Mon, 20 May 2024 08:07:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nDK4uGTmw3lc; Mon, 20 May 2024 08:07:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F9D740AA5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F9D740AA5;
	Mon, 20 May 2024 08:07:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B92D41BF379
 for <buildroot@lists.busybox.net>; Mon, 20 May 2024 08:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A59BC81EEE
 for <buildroot@lists.busybox.net>; Mon, 20 May 2024 08:07:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q6NbV3qAYFaG for <buildroot@lists.busybox.net>;
 Mon, 20 May 2024 08:07:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6CD9381DF7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CD9381DF7
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6CD9381DF7
 for <buildroot@buildroot.org>; Mon, 20 May 2024 08:07:15 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-34dc129accaso1771798f8f.0
 for <buildroot@buildroot.org>; Mon, 20 May 2024 01:07:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716192432; x=1716797232;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r0XONwXtnFB2mi637ifIFgWSE205/DYHjTcFXwzyF1I=;
 b=RlijGW0Ozt+9YJiWavjkEuctxM6Ypim3vkzQnBRD4PtmD+CCkOzwNioirL45IlVXEF
 DFuFUbQotX5cITPiztKtvOrjEIc/CNgOFaavkzS/HoS3suyYBt+rf7N3phF85Zb7d6NX
 VUXO3HdkLzOInpSm4AUNpGMvRkrLdCybbKznh6297EcYxA15YK8kFEuZzpl1bLuHCD43
 eKN4v0wS3tcvf+ZjxKm6tXsU+uZ2h1EyDSiWgEIuZKva9xK7s4VqMklublaFqL+UOZs/
 xXdt7t2gJohap9fazRVjmQWBaH1L4WKyjF1t64T9KVySXaTh9Au1hBwNrIwTNWAwRaYq
 bBNQ==
X-Gm-Message-State: AOJu0Yxy8xJ3+NMFv8ef25SHO6m0dmzTUZgilGBZxBCowyJwtfigJp3A
 OsIrxPbBcJKfyjNGnXPkGlTWwPwe2qzknq6RxpSqMMHXgAYPWRiY9bwapQ==
X-Google-Smtp-Source: AGHT+IGXXMg9r58di8hMoPuNbfxs2RfDGfz1LyAEjIYJbDNNDbtj7TTG8UuaB/iF7PQswyiBsYXWbw==
X-Received: by 2002:adf:f683:0:b0:351:d2e6:9296 with SMTP id
 ffacd0b85a97d-351d2e69673mr8962910f8f.41.1716192432271; 
 Mon, 20 May 2024 01:07:12 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502baad04dsm28520470f8f.81.2024.05.20.01.07.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 May 2024 01:07:11 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 May 2024 10:07:06 +0200
Message-ID: <20240520080706.32223-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716192432; x=1716797232; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=r0XONwXtnFB2mi637ifIFgWSE205/DYHjTcFXwzyF1I=;
 b=QwuSziQLq08ucBzWsq3VegP6dd1MXpjf0HR1+cxPzysbnHD/6qqgaV2xpH71cTq//g
 7pXJzJ2nUAzWBAvLMqRKGi5tBf0BnDM3QTbCSss/GgO/kxzIy85UOV+PHjhe+hhlcggu
 noP7HL7YRpDqja45tSWN02Ww/DQb+Z+1YFTIB5qIMLtFJCbp5HcyurTJKPktxSxKkU6q
 Rc0RNQJViseIZICVpHxxHsrIY/DGlv0qlnhPOUjMHGMEBamwSGJ1yrFMtFbufe4S+Kwn
 G0o8BHy7QrZth8O5Wy2EXZvhWor6k2l/x7FP8Fs0BLh2VR9e+Rt3nuwhvoeBvM/HRJxc
 dfIA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QwuSziQL
Subject: [Buildroot] [PATCH 1/1] package/lmdb: fix static build
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

Fix the following static build failure raised since the addition of the
package in commit eb60c4054c25129d78651a66d1e7554aff04767f:

__uClibc_main.c:(.text+0x15c): undefined reference to `__fini_array_start'

Fixes: eb60c4054c25129d78651a66d1e7554aff04767f
 - http://autobuild.buildroot.org/results/e2bc8c35a10b6513c5605954e93b5b8a1ec7654b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lmdb/lmdb.mk | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/package/lmdb/lmdb.mk b/package/lmdb/lmdb.mk
index dafe7332cb..13e3235267 100644
--- a/package/lmdb/lmdb.mk
+++ b/package/lmdb/lmdb.mk
@@ -10,21 +10,31 @@ LMDB_LICENSE = OLDAP-2.8
 LMDB_LICENSE_FILES = libraries/liblmdb/LICENSE
 LMDB_INSTALL_STAGING = YES
 
+ifeq ($(BR2_STATIC_LIBS),y)
+LMBD_ILBIBS += liblmdb.a
+else ifeq ($(BR2_SHARED_LIBS),y)
+LMBD_ILBIBS += liblmdb.so
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+LMBD_ILBIBS +=  liblmdb.a liblmdb.so
+endif
+
+LMDB_MAKE_OPTS += ILIBS="$(LMBD_ILBIBS)"
+
 define LMDB_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/libraries/liblmdb \
-		XCFLAGS="$(TARGET_CFLAGS)"
+		$(LMDB_MAKE_OPTS) XCFLAGS="$(TARGET_CFLAGS)"
 endef
 
 define LMDB_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libraries/liblmdb \
-		DESTDIR="$(STAGING_DIR)" \
+		$(LMDB_MAKE_OPTS) DESTDIR="$(STAGING_DIR)" \
 		prefix=/usr \
 		install
 endef
 
 define LMDB_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libraries/liblmdb \
-		DESTDIR="$(TARGET_DIR)" \
+		$(LMDB_MAKE_OPTS) DESTDIR="$(TARGET_DIR)" \
 		prefix=/usr \
 		install
 endef
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
