Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58A5C4332F
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 16:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42E3040872;
	Sat,  5 Nov 2022 16:55:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42E3040872
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oQFf2JpgSdVk; Sat,  5 Nov 2022 16:55:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AA28404E8;
	Sat,  5 Nov 2022 16:55:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AA28404E8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB1921BF38C
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 16:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B63A860AC6
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 16:55:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B63A860AC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B4TzuaS7j1YI for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 16:55:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C05BA60A84
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C05BA60A84
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 16:55:27 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id o30so4617821wms.2
 for <buildroot@buildroot.org>; Sat, 05 Nov 2022 09:55:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dsYAgsW6cnQci59U6v93TYnkCb+lSQiWoD4VaUrKWB4=;
 b=yOwsUpVqXB7hXZbQyQYX6WozwBJlGo0jyIyryT9wqVO2mGwwk2OuurpPahTAiZ/iqB
 5drVUcIslfJaOYIZSxK0qko6TmsybqxqymALk4slz5L9GDJNzgINY5sXmRjDCmxdLtaI
 daderFgPExk2Ip7RxhdjWZOtBopKQtG23bQLUgIATNXyACsLUMQZ3EbsLGWAZ+zF0cLi
 p2poXPwwdiw0pdgNOmSHjZSPSjSb4NxBWrc6/MPjUKp2nGvy8VFMwoHz46LiuKZVNhe+
 F8CXPjCjFe1P4arSF9Wt7xOJLzXy2ml0Q+eppXBRF9kpOYvP7dNHCteMSvmw201+jH5R
 MrTQ==
X-Gm-Message-State: ACrzQf1IVxIjtLwdrCeCHw8zp4P8J709sA7mkCHbUMOfCZTMpX2YHTxv
 reRcABhpQJEw8/jHI59L4/l0+h5QaCk=
X-Google-Smtp-Source: AMsMyM5fZen7IAB0vdFxgooN5mvR6zl4UPT6uc+bSVKrhahwAM25a3sy/2FI8Iv4ufrQrQDCW9UyMQ==
X-Received: by 2002:a05:600c:4ed0:b0:3cf:7fb1:e1ec with SMTP id
 g16-20020a05600c4ed000b003cf7fb1e1ecmr17506259wmq.181.1667667325621; 
 Sat, 05 Nov 2022 09:55:25 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:b857:25fc:60e2:657f])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a05600c1d1300b003c3a1d8c8e6sm3208226wms.19.2022.11.05.09.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 09:55:25 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat,  5 Nov 2022 17:55:23 +0100
Message-Id: <20221105165524.747494-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=dsYAgsW6cnQci59U6v93TYnkCb+lSQiWoD4VaUrKWB4=;
 b=ePlKtyOoRN/++BYnWmuAhClZBlnUyiMqqHPV4WsP/mFXP2fCHn200pXRR/s1EjkOan
 H9oVBLjy5QvWBU2agCSly/tZ2FeGznLmidc7HidTG96rfmgK0zmOXAdx8wI/I6RO1xKe
 9oxagt48TcgLztua720mJG+anTR2Eza6Kg+0/yLvWcnqhkUXyGnwA0+w6dXOy8nEhTgZ
 iQE2Xd1HFh3GLuwRldbtYZnjDAWlQC0EvT4QFufKfENTsfeWBKgPuLgI5STCXeaO4UTC
 vFjYCfgMk6Rc4veezRTMDSbegj+vLP8cZzkPTlZvRPpaqV4dekbXGm6Z+wHIxOSBvxIO
 dAAQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ePlKtyOo
Subject: [Buildroot] [PATCH 1/2] package/libopenssl: drop useles option for
 rc5
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
Cc: "GAUTRON, Erwan" <erwan.gautron@bertin.fr>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, "Weber,
 Matthew L Collins" <Matthew.Weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit a83d41867c8d (package/libopenssl: add option to enable some
features) added an option to enabled rc5. However, since commit
1fff94121936 (Fixup non-x86 openssl build), dated 2002-12-30, rc5
has always been forcibly disabled in Buildrrot.

Given that it was unconditionally disabled all those times

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: "GAUTRON, Erwan" <erwan.gautron@bertin.fr>
Cc: "Weber, Matthew L Collins" <Matthew.Weber@collins.com>
---
 Config.in.legacy                 | 7 +++++++
 package/libopenssl/Config.in     | 4 ----
 package/libopenssl/libopenssl.mk | 1 -
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 0e63d59a98..8efc7ea976 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2022.11"
 
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_RC5
+	bool "libopenssl rc5 was never enabled"
+	select BR2_LEGACY
+	help
+	  The libopenssl option for rc5 never actually enabled rc5,
+	  which had always been disabled in Buildroot.
+
 config BR2_KERNEL_HEADERS_5_17
 	bool "kernel headers version 5.17.x are no longer supported"
 	select BR2_LEGACY
diff --git a/package/libopenssl/Config.in b/package/libopenssl/Config.in
index fcead4c11a..00339238fb 100644
--- a/package/libopenssl/Config.in
+++ b/package/libopenssl/Config.in
@@ -44,10 +44,6 @@ config BR2_PACKAGE_LIBOPENSSL_ENABLE_CHACHA
 	bool "enable CHACHA"
 	default y
 
-config BR2_PACKAGE_LIBOPENSSL_ENABLE_RC5
-	bool "enable RC5"
-	default y
-
 config BR2_PACKAGE_LIBOPENSSL_ENABLE_RC2
 	bool "enable RC2"
 	default y
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 50d41a6533..3542b89727 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -85,7 +85,6 @@ define LIBOPENSSL_CONFIGURE_CMDS
 			no-fuzz-afl \
 			no-afalgeng \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_CHACHA),,no-chacha) \
-			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_RC5),,no-rc5) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_RC2),,no-rc2) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4),,no-rc4) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_MD2),,no-md2) \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
