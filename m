Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 117B8CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 13:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1D194075E;
	Sun,  7 Apr 2024 13:46:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NbCBOByh-avx; Sun,  7 Apr 2024 13:46:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7922C40760
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7922C40760;
	Sun,  7 Apr 2024 13:46:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F1E7C1BF34A
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 13:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE03D40760
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 13:46:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c_JVhxYI1SCn for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 13:46:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7D63B4075E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D63B4075E
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D63B4075E
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 13:46:39 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-344117bee49so1271432f8f.1
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 06:46:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712497597; x=1713102397;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OvOhS7sSkkjGW8PZr4JIJWykwZWkgZr7DX7jfCnPZyg=;
 b=Tpt3+Q5E06DzS7oPCHre0YAGSpeEuCcFxVKvQGPpi41SNdotobDuNO82qlSr29vh5h
 SnT4Yr8FLc8jVkNVMhkljaUS2FWWNjKYymNGSxOTgtCLxa5p3SPH3LrQZ7qp96HG3uv/
 HGJIpubEOW+nkpkmiqVcnbYZ7qRElXDfg5QvvldAJS+5yRv3uAhHdUbIwyA+STs9+pTe
 fdgWktqHmDnxhwq3dHzjIXMEsgMlatQdHZ78nPpJjB4pF1kHQuXQf/DpJM/omNIgoUPk
 I7u0R32NaOIysH3jYvICR4K424e31+aTK86vEv7+xlEPDV21RMRruC7dICwLyFOLPUGW
 wdlw==
X-Gm-Message-State: AOJu0YzD2QtFGW20lPjNrU2nfofS5GO1hI+h7eXMbaf0jfNXZk8iZRsW
 R9jcqJBtdi8vhF3jnn3I8x5yss43Unv0KnJFsgt7pPVUnIqcowz8cI11lttK
X-Google-Smtp-Source: AGHT+IHTgQMhkiHKFICPvNRvSfeIb0s2kk9gnAECRgX8iGm0mT8cLkg56o2dvLSxydznknralEMnqQ==
X-Received: by 2002:a5d:570e:0:b0:33e:7a7c:a058 with SMTP id
 a14-20020a5d570e000000b0033e7a7ca058mr5457930wrv.18.1712497597032; 
 Sun, 07 Apr 2024 06:46:37 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 i14-20020a5d558e000000b003434b41c83fsm6702941wrv.81.2024.04.07.06.46.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 06:46:36 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 15:46:32 +0200
Message-ID: <20240407134632.1838539-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712497597; x=1713102397; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OvOhS7sSkkjGW8PZr4JIJWykwZWkgZr7DX7jfCnPZyg=;
 b=dMBxlnllTQ1PvrXo63bCbNuP3mSFxSgD9t/hZdEELX7VGi0XYD+QW2fh4ReoQEBL/A
 HWBfZTewzmQ137mfzMIQK2HCKFasz8KAeHkm43J9mUfQpL3OJsLX6CtG/BsTxDNn9wPO
 hRvrZSbyEhvO1CpoP2fNu5zoXT8tFxAIyYPOt73rrKjUWpitz2Q4/XKi/sU8UJUFX4XC
 N7bts+E1WjFSUu6g5A9fOJmDugB0J189ur1ZaAUcM/UJBdR6JgPQRQQ5PPIKMtCvSt/K
 y8+dwUQ8V7YyEUlPzT+Sg2cUlaNXGU5Iq8/eGf4J8ElABOjDiI6znCJ8gYlbbqLCzG0d
 eXag==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dMBxlnll
Subject: [Buildroot] [PATCH 1/1] package/polkit: add libxcrypt optional
 dependency
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Marek Belisko <marek.belisko@open-nandra.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

../output-1/build/polkit-123/meson.build:267:18: ERROR: C shared or static library 'crypt' not found

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/59926191d274b25e32e6bbd708f5aadb346d3171

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/polkit/Config.in | 1 +
 package/polkit/polkit.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/polkit/Config.in b/package/polkit/Config.in
index ca3323931c..fda6c984d7 100644
--- a/package/polkit/Config.in
+++ b/package/polkit/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_POLKIT
 	select BR2_PACKAGE_DUKTAPE
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  PolicyKit is a toolkit for defining and handling
 	  authorizations. It is used for allowing unprivileged
diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index e393672c1e..cdbbf8f9b0 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -30,6 +30,10 @@ else
 POLKIT_CONF_OPTS += -Dintrospection=false
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+POLKIT_DEPENDENCIES += libxcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 POLKIT_DEPENDENCIES += linux-pam
 POLKIT_CONF_OPTS += -Dauthfw=pam
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
