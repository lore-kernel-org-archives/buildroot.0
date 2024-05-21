Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2ADDC25B74
	for <buildroot@archiver.kernel.org>; Tue, 21 May 2024 18:26:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64AB3608FE;
	Tue, 21 May 2024 18:26:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v2yrK2riLhuo; Tue, 21 May 2024 18:26:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BCA860906
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BCA860906;
	Tue, 21 May 2024 18:26:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 71D0F1C5452
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 18:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5EE5A60906
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 18:26:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hL1X8rLsbAnw for <buildroot@lists.busybox.net>;
 Tue, 21 May 2024 18:26:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BB91E608FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB91E608FE
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BB91E608FE
 for <buildroot@buildroot.org>; Tue, 21 May 2024 18:26:10 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-354b722fe81so3432984f8f.3
 for <buildroot@buildroot.org>; Tue, 21 May 2024 11:26:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716315968; x=1716920768;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Gc35/J78+8AUCLtNpoZr3/pFqShYtZS4Z77ze7NM3bI=;
 b=clTlH/GTQZlhYmiK17HS5hqa3H0XFRxgaCzLRLP/75ZP8Wou5/LSnVnFSeeuOctJF3
 kbaXVG1Hf8cyl/C+WUC+3G06ZH0h5crm4SdHG8vycDWp0qqx0rcjQs9PAiRNc4xMK4uc
 ASBqfHrlOAUUrkZLDKBJ4Jeu0L9hia3CFvYVUEQRWrOoQZMyvEL3YVanU4aG5a6gpUyT
 M+5uNEfUZvjoE5eQ95AIOEm+jTE3Ze4jd8cJhfH6SqyEFRN2HJmWlpT79e+B1CCXIHCK
 EkwKmJjEPo8utv1Ch0UUc1cYXKVSOyaslDEII8oBESEV9qC8anLg5F/W90V09HGMDl/Z
 SBzQ==
X-Gm-Message-State: AOJu0Yxmdc1iTfPv6/KY0Mn2DF0kDtThc7KH3nkvOhyvFS8E1hXg2aCS
 BHUVaMV7uJ66YVZnku8uI/GTXMXW7iwNZOSRO5fdvQUvNfgK1E02euhroQ==
X-Google-Smtp-Source: AGHT+IGzo+/jbxrh1J4V6K47xllfw5zWvvD9DIVzS/EKR627RkPNeFT+I+/UEVDlbfFSQeH9T0a/dQ==
X-Received: by 2002:a5d:43c2:0:b0:354:d437:1e67 with SMTP id
 ffacd0b85a97d-354d4371f48mr500876f8f.27.1716315967832; 
 Tue, 21 May 2024 11:26:07 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-354d0dae938sm2028143f8f.9.2024.05.21.11.26.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 May 2024 11:26:07 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 May 2024 20:25:59 +0200
Message-ID: <20240521182559.5676-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716315968; x=1716920768; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Gc35/J78+8AUCLtNpoZr3/pFqShYtZS4Z77ze7NM3bI=;
 b=OudCcMFBary8fFEvN+oAQ4uaqsLeKXL/koh9rVFp3gwlh1E5WzSPyPsBh3cUmYSKCk
 0kmfjk2iNmAZ0a3mvfT6P2rgrjAf/jZ0sSNE5TUGsmSUWZwyFTjKBPUmm5aXq347pwA6
 ZhLgf4Be/RSvDd2ILbvzVOdZT9707bZXTNaeu4Jv68Rv4V8g3pPgdybv7WrAT12KNVuK
 +/He53VB3txVZu2DVX1seUdg/zmAZrFNg5ObErlhiOTbH5IrIOOxbdLKSYrfId8I2jJ6
 aJc92pr1RjYZc4j81BRgM02dgxQksK3NRzrFhY4jtJ607ilbaPijLNLXqPL20XrX7CkX
 3Uzg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OudCcMFB
Subject: [Buildroot] [PATCH 1/1] package/lmdb: fix CFLAGS handling
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

By passing TARGET_CONFIGURE_OPTS to make, the following usptream CFLAGS
are completely overriden:

CFLAGS	= $(THREADS) $(OPT) $(W) $(XCFLAGS)

As a result, setting XCFLAGS is a no-op and -pthread is not passed
resulting in the following build failure since the addition of the
package in commit eb60c4054c25129d78651a66d1e7554aff04767f:

//binhome//.buildroot.//autobuildlib//rungcc//instancepowerpc64--3buildroot/-outputlinux--1gnu//host9.3.0//opt./.ext/-.toolchain.//bin./../../.lib//powerpc64gcc-/buildrootpowerpc64--linuxbuildroot--gnulinux/-bingnu//ld9.3.0:/ .mdb.c.:/(...text/+.0x1a44.)/:. .undefined/ powerpc64reference- buildrootto `pthread_setspecific'

Fixes: eb60c4054c25129d78651a66d1e7554aff04767f
 - http://autobuild.buildroot.org/results/d67c5a99b7d58826e544f1210fa36bb3bc180739

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lmdb/lmdb.mk | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/package/lmdb/lmdb.mk b/package/lmdb/lmdb.mk
index 06c8f6bbb1..86d72e1abc 100644
--- a/package/lmdb/lmdb.mk
+++ b/package/lmdb/lmdb.mk
@@ -18,15 +18,21 @@ else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
 LMDB_ILBIBS +=  liblmdb.a liblmdb.so
 endif
 
+LMDB_MAKE_OPTS += \
+	AR="$(TARGET_AR)" \
+	CC="$(TARGET_CC)" \
+	ILIBS="$(LMDB_ILBIBS)" \
+	LDFLAGS="$(TARGET_LDFLAGS)" \
+	OPT="" \
+	XCFLAGS="$(TARGET_CFLAGS)"
+
 define LMDB_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/libraries/liblmdb \
-		ILIBS="$(LMDB_ILBIBS)" \
-		XCFLAGS="$(TARGET_CFLAGS)"
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libraries/liblmdb $(LMDB_MAKE_OPTS)
 endef
 
 define LMDB_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libraries/liblmdb \
-		ILIBS="$(LMDB_ILBIBS)" \
+		$(LMDB_MAKE_OPTS) \
 		DESTDIR="$(STAGING_DIR)" \
 		prefix=/usr \
 		install
@@ -34,7 +40,7 @@ endef
 
 define LMDB_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libraries/liblmdb \
-		ILIBS="$(LMDB_ILBIBS)" \
+		$(LMDB_MAKE_OPTS) \
 		DESTDIR="$(TARGET_DIR)" \
 		prefix=/usr \
 		install
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
