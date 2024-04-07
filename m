Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C5D0CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 13:00:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CC7B60686;
	Sun,  7 Apr 2024 13:00:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zhi6F4_LxTGl; Sun,  7 Apr 2024 13:00:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D80B608B0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D80B608B0;
	Sun,  7 Apr 2024 13:00:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E58CD1BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 13:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE8424062B
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 13:00:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id drZpnWZwtZxl for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 13:00:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 86ECD40622
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86ECD40622
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 86ECD40622
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 13:00:18 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-344047ac7e4so631786f8f.0
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 06:00:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712494817; x=1713099617;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=neCHqBr5jvmR6rNk0u8eBmntS+FHU+hNVO9WuiIBEl0=;
 b=md3nK4UKkJD50GSq4VO72w1INu0Mbh0Wc3i0QqiHrsOUQ77nNwGozUfvdNMZZs9+iG
 ZmVRtMXr4suYODSH0uAXSeJu9fPLwGLOGLs3dfB9+sCynWNnOCo3Sz1EjQGjSQS8c7Yq
 CSeSUuMeS+kMznqur99R2tFby0kJUfZoxzv47CRxKcc2XN6UQKlyvbY6b30FoDPclxgl
 a9JW1JvoCpuvfq2dFAUWjlTseGtBQccRu0502j9LVRqe+Dt+aas8Vh9IhKdtwWC3gU9Y
 hAaK43ErycAOwRBhrYXMpP6n130pIJsMYrPrUmCGrgKdDL/XE6B/7MEapLJZgMVng7Xw
 YAhw==
X-Gm-Message-State: AOJu0YwbQN8U4j8qXvYs4yJYYtTJM3MEXv+l51H1w+ZifyituQdfvr3u
 n7z537G9t8y1bAvT3cOXEJ/+CssnAFUZwrgRSd529hcw9D3Le/8b33A/NPJa
X-Google-Smtp-Source: AGHT+IHHgS9qvS9ts8XCcaqk4RHWa2+8s/0kxbj8Ry7QskvTB2qba04Sco5f93z/DJe15cFnqHteaQ==
X-Received: by 2002:a5d:498c:0:b0:33e:5970:e045 with SMTP id
 r12-20020a5d498c000000b0033e5970e045mr7152460wrq.21.1712494816705; 
 Sun, 07 Apr 2024 06:00:16 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 g6-20020a05600c4ec600b004148d7b889asm13602765wmq.8.2024.04.07.06.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 06:00:16 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 15:00:14 +0200
Message-ID: <20240407130014.1352444-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712494817; x=1713099617; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=neCHqBr5jvmR6rNk0u8eBmntS+FHU+hNVO9WuiIBEl0=;
 b=d3PBzKMRViVT4Tfan+tY8Y4wyJoms1hSJaJFDcIn2z1GJcpE0qigmXBlTwjWdJedhY
 /MokVu4GKDEgLm0z68zm2qzbIz+Dt+yA82Vockve8pFIgs4CVHFcOBEFF8XLdUTkRor8
 foZJX9QazjHlWMzFnmRD5ruCrQdBWhkcJTzBIHO4QXpQ6ADonkCC3YSYEENABSPrNXln
 Wc6VmIeQyZ0rrmhNr2qlTgA0u0uaBUDPAoUzgznO8baEmDWpFwztAo6T74qh5M/AYQ3t
 uasT58JGL2Sr8lWRg6VOuyeJlYEeEN4owGxrbNxvfIZeoRIkQ3d//g65OatOIK4DgZSc
 EcCA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=d3PBzKMR
Subject: [Buildroot] [PATCH 1/1] package/freeradius-client: add libxcrypt
 optional dependency
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
 David Bender <codehero@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

/home/autobuild/autobuild/instance-13/output-1/host/lib/gcc/riscv32-buildroot-linux-gnu/12.3.0/../../../../riscv32-buildroot-linux-gnu/bin/ld: local.o: in function `auth_local':
local.c:(.text+0xe8): undefined reference to `crypt'

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/207bba3df700108839382007020be56c4629ef75

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/freeradius-client/Config.in            | 1 +
 package/freeradius-client/freeradius-client.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/freeradius-client/Config.in b/package/freeradius-client/Config.in
index 773adb8a09..36a74c3a6d 100644
--- a/package/freeradius-client/Config.in
+++ b/package/freeradius-client/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_FREERADIUS_CLIENT
 	bool "freeradius-client"
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  FreeRADIUS Client is a framework and library for
 	  writing RADIUS Clients.
diff --git a/package/freeradius-client/freeradius-client.mk b/package/freeradius-client/freeradius-client.mk
index 981ed163e0..b113643415 100644
--- a/package/freeradius-client/freeradius-client.mk
+++ b/package/freeradius-client/freeradius-client.mk
@@ -12,6 +12,10 @@ FREERADIUS_CLIENT_INSTALL_STAGING = YES
 
 FREERADIUS_CLIENT_DEPENDENCIES = host-pkgconf
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+FREERADIUS_CLIENT_DEPENDENCIES += libxcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_NETTLE),y)
 FREERADIUS_CLIENT_DEPENDENCIES += nettle
 FREERADIUS_CLIENT_CONF_OPTS += --with-nettle=yes
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
