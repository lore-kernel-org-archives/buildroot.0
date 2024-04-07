Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9EFCD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 14:25:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 176B46066F;
	Sun,  7 Apr 2024 14:25:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ib-svRBoYU7b; Sun,  7 Apr 2024 14:25:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1391E608B0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1391E608B0;
	Sun,  7 Apr 2024 14:25:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AADEC1BF30F
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 14:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3FC94078D
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 14:25:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zWVmK0ROUsW0 for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 14:25:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 42EBF40780
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42EBF40780
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 42EBF40780
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 14:25:19 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-41650de9e1eso2628245e9.1
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 07:25:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712499917; x=1713104717;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tf/rsxheG+7ynngoUpfaVLSe1xZq1kIEe9QeVGLwLdk=;
 b=H+bNm3H9iJV/Jc6Y7ftxityMbiLHAQlQOujo3GZSFolh3nveD2d6gRCBS72jpAEb/t
 IV1CQoHKvLIAivyu16J39GOWEGg5aYOuRZYrNAUFtdSbkPe6bE88bEG+DGk4aNI8o46/
 CE+bNAl8BaCBKEH/pPX05KSAaXRsfFQFdGAjJ6/pSzhmeP3OQHo0vPL1Ii51ODRBzvgE
 u1gqrEueffP4EmM1H/17+yjPSAcy2vA9jd8pJwZENn5/knNjYbVx2gmkHzttOzU+pu24
 C2nJ76EMWWDXutOBv7Rlv18ZwPJHFuDVJo1tmwK7EOoZR116T86hDaFPVXo+SnjcqmDU
 tQJw==
X-Gm-Message-State: AOJu0YzaoFMK1YhiA7nLEVJd+nol/4dP0v9CYk882LCTCArt7asOqBIJ
 8rh2FDwTrdVKsM9qhERxtXDevHwS1z2kfPDLiDxpAcLpJcRb/Bu+qbdDjpm4
X-Google-Smtp-Source: AGHT+IHQnY/PbVo2aNIxzkojlD1SynCcC3m0SuBzNmlREpp7oPGrDfdi/4/PMylmJ+pT91RRxsIf6w==
X-Received: by 2002:a05:600c:4448:b0:414:8ffb:a6bf with SMTP id
 v8-20020a05600c444800b004148ffba6bfmr6397632wmn.18.1712499916956; 
 Sun, 07 Apr 2024 07:25:16 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 n10-20020a05600c4f8a00b0041493aae77esm13560706wmq.23.2024.04.07.07.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 07:25:16 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 16:25:12 +0200
Message-ID: <20240407142512.1882797-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712499917; x=1713104717; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Tf/rsxheG+7ynngoUpfaVLSe1xZq1kIEe9QeVGLwLdk=;
 b=JsJfIshFjLFHSYY++IIuo6diaSMj/1cwJMrXChFsWPCQXBX0ylS6yY1qm6Kx20MDYw
 A1AR37INHqXA02jTLaKyflhnF9ENKPkenMRDVeBmHGySgYfarcS7Ezh+LHQns/cybNbx
 DS/Cur9HMtdtoCLmGJ9OuwsBooDX1f2gj9GyUG99VejG1VBQFQ4xwaDegiQamlrVC3x9
 mBzdfSjdHSFo5JxtvUHkarUL2v6IjXuTvC4Vzb0KAOW+TIKMTaiErq5JKdlQFPoaTSv/
 R3RnWnEaQABkuA+khR8s/pr4IHsfZNkb6a4OkVv3o5MTokbIlwHTJOvP99wDsK9mSpjL
 cbug==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JsJfIshF
Subject: [Buildroot] [PATCH 1/1] package/monit: add libxcrypt optional
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

/home/buildroot/autobuild/instance-0/output-1/host/lib/gcc/powerpc-buildroot-linux-gnu/13.2.0/../../../../powerpc-buildroot-linux-gnu/bin/ld: src/util.o: in function `Util_checkCredentials':
util.c:(.text+0x32e8): undefined reference to `crypt'

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/12b2c6665280dcb813a58d9b025038bacc3b8d51

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/monit/Config.in | 1 +
 package/monit/monit.mk  | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/monit/Config.in b/package/monit/Config.in
index 9f80858f8a..d177fe183c 100644
--- a/package/monit/Config.in
+++ b/package/monit/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_MONIT
 	bool "monit"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Monit is a free open source utility for managing and
 	  monitoring, processes, programs, files, directories and
diff --git a/package/monit/monit.mk b/package/monit/monit.mk
index c709f903e6..e3a4fac936 100644
--- a/package/monit/monit.mk
+++ b/package/monit/monit.mk
@@ -25,6 +25,10 @@ MONIT_CONF_OPTS += \
 	--without-pam \
 	--with-largefiles
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+MONIT_DEPENDENCIES += libxcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 MONIT_CONF_ENV += LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 ifeq ($(BR2_STATIC_LIBS),y)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
