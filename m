Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD155C001DB
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 15:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 743EF81DFF;
	Mon,  7 Aug 2023 15:00:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 743EF81DFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qx0vSZV3yqVF; Mon,  7 Aug 2023 15:00:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2FA781371;
	Mon,  7 Aug 2023 15:00:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2FA781371
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2E0F01BF2F6
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 15:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA68D400F2
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 14:59:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA68D400F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6bkj1MMpfn0P for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 14:59:00 +0000 (UTC)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2272140A51
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 14:59:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2272140A51
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-314172bac25so3545518f8f.3
 for <buildroot@buildroot.org>; Mon, 07 Aug 2023 07:58:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691420338; x=1692025138;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DpCNqLtxSdlvbJDuYrogRoCT0mpF4tW6l71F8gx7W8I=;
 b=I5C3aMtASJMy0lLj70alCtogHMgwXuPs3IKVwTURe5se1A/zFnHT+0MS6Gpl8K2do4
 BT8u0Yq7zUYed+TZIq31cLCjbprVBDVlb3QEQU/hgpV2el6OPK45kp5oOGq4IRWUJhxk
 FGgDkaC5ddGXlSfgJK1w+2fu67F3TynaFDGT57ZJC39KgHf49ooIJzM1qHKTqBMEd8ma
 aVqzzlgkbsicT7/sDxqfpyPdbXSY9gk4SUv79TiIKofr9PgMDmxrN8lMVVyCmAnKufYd
 nRXJHdlpy54xlhFAvJUXQlH9ozZ1b2eaV0sRXA1X57pgV7NxNYxsXO+1vxo/9mYhmNnd
 6j1g==
X-Gm-Message-State: AOJu0Yw5HsXb+FJ9oF4VKQz8J/niFIMq6bMMkJhjInnryg7RHGIezpSI
 oVTcK9ZCFUYckWVvC5MGclgu1E/k9k5x1A==
X-Google-Smtp-Source: AGHT+IGLgjJq9FCBJgpalQNTQAzxy6RvqWncF1Wd4LJYzAjnIsAY1y1SHnVV34QYsxmYkxY+LTLlFQ==
X-Received: by 2002:a5d:6844:0:b0:313:eaf5:515 with SMTP id
 o4-20020a5d6844000000b00313eaf50515mr4980551wrw.6.1691420337881; 
 Mon, 07 Aug 2023 07:58:57 -0700 (PDT)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 r2-20020a5d4942000000b003063a92bbf5sm10784845wrs.70.2023.08.07.07.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 07:58:57 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Mon,  7 Aug 2023 16:58:38 +0200
Message-ID: <20230807145839.2375839-2-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230807145839.2375839-1-thomas.devoogdt@barco.com>
References: <20230807145839.2375839-1-thomas.devoogdt@barco.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691420338; x=1692025138;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DpCNqLtxSdlvbJDuYrogRoCT0mpF4tW6l71F8gx7W8I=;
 b=CU0VNwjvoEH1jVxcfD7SLA/mXiUAPx9g4e5DRD4VM3cfgb3t6s0YtnK8egfVFYBlyM
 QrGjYH+9DTlgIzOMb6FeRxzSrwE5ZP2PLihoRq2OWk0oRPbZIEpQE95Ubq+qhIK6aEwH
 bJqE5VEAwFBvyRn5Jy+63hw1FKbfDrfaXGRtcS06h3GyrphqrI0YVcBiIkz31w/93etH
 quxPbwssStID5uupQ4igyuJwBg166otybVxG1wPxoCxPbccABVOPCdokle7ZTlKVhYaB
 ZnQVVxJh7DOl3j5V/Zuzkf1Vgl+v1VvVxz+XEVJGE5YmgCUFpUkWe8M3HadRDvgBr7cB
 dV4w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=CU0VNwjv
Subject: [Buildroot] [PATCH v1 2/3 next] package/qt6/qt6serialbus: use the
 CMAKE_NINJA flag
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the newly introduce backend option (4cf79d9b71ff5cf2aede3f21e09ade7c7ac59606)
to specify what cmake backend to use, instead of special-coding it's use.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/qt6/qt6serialbus/qt6serialbus.mk | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/package/qt6/qt6serialbus/qt6serialbus.mk b/package/qt6/qt6serialbus/qt6serialbus.mk
index 0717736387..631531e14f 100644
--- a/package/qt6/qt6serialbus/qt6serialbus.mk
+++ b/package/qt6/qt6serialbus/qt6serialbus.mk
@@ -10,6 +10,8 @@ QT6SERIALBUS_SOURCE = qtserialbus-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6SERIALBUS_VE
 QT6SERIALBUS_INSTALL_STAGING = YES
 QT6SERIALBUS_SUPPORTS_IN_SOURCE_BUILD = NO
 
+QT6SERIALBUS_CMAKE_BACKEND = ninja
+
 QT6SERIALBUS_LICENSE = \
 	GPL-2.0+ or LGPL-3.0, \
 	GPL-3.0, GFDL-1.3 no invariants (docs)
@@ -21,7 +23,6 @@ QT6SERIALBUS_LICENSE_FILES = \
 	LICENSES/GFDL-1.3-no-invariants-only.txt
 
 QT6SERIALBUS_CONF_OPTS = \
-	-GNinja \
 	-DQT_HOST_PATH=$(HOST_DIR) \
 	-DBUILD_WITH_PCH=OFF \
 	-DQT_BUILD_EXAMPLES=OFF \
@@ -30,16 +31,4 @@ QT6SERIALBUS_CONF_OPTS = \
 QT6SERIALBUS_DEPENDENCIES = \
 	qt6serialport
 
-define QT6SERIALBUS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(QT6SERIALBUS_BUILDDIR)
-endef
-
-define QT6SERIALBUS_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) DESTDIR=$(STAGING_DIR) $(BR2_CMAKE) --install $(QT6SERIALBUS_BUILDDIR)
-endef
-
-define QT6SERIALBUS_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) $(BR2_CMAKE) --install $(QT6SERIALBUS_BUILDDIR)
-endef
-
 $(eval $(cmake-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
