Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E798DC05027
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 21:33:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DFF260B0F;
	Sun, 29 Jan 2023 21:33:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DFF260B0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P2DLTnbCleBK; Sun, 29 Jan 2023 21:33:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B468660BAA;
	Sun, 29 Jan 2023 21:33:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B468660BAA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4F9781BF576
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 21:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29A8840102
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 21:33:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29A8840102
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tr0NEmRoEgb3 for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 21:33:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B790C400CC
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B790C400CC
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 21:33:02 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id m8so36903edd.10
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 13:33:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IQPYoGsWCg5Gwf1QxmoXP6f6tLNu3vUA3envPCgV8rk=;
 b=KcExPernc6t5Bp25wnnVnjn2YeW90MhwfVwaNhzQtZ+mrvVXKlj8kkwU0irN6daD/S
 e66BXNelHa5Ky+hrF7NdvtRkdNC/+Ol4OMM38xlEwXETaGVGuFBFG0bmYFLiEi2QIDJn
 nDuDgTnDBGiRXQfi6JLHJfs9sPHJTXzOSGyzNzKGlRtU/eMIRf5cg4NH5sNBL/ysm3h7
 qKKeQ98RsIFibrQFlNJ8SL8UdixWe+AlK4710yiFPCoUV780TCzK8bMCEUauTDamKILC
 HZy7roA3BkQ/MaNpOHbieV3fCzhn+me8km3u6IPGSAsFoZBxN1+iG5nKMjTy4JU1v5Zz
 HSbg==
X-Gm-Message-State: AO0yUKVb6ZuUxDxg2n6AuqpoK2bl8Oh+QfeJ8W8W6YtjTbRT53HtU8HS
 lw5ctXrk2pIr6yqlSxKlcvU8ktBPfvZ3Vi/+
X-Google-Smtp-Source: AK7set88m/+0TUmpZHL+8+3mB69/svq1KiT/bjOabfat9Bm+3lV/PV+MZ2X/GlJAHvHW5gYrZdF5Jw==
X-Received: by 2002:a05:6402:540a:b0:4a2:20ba:71e5 with SMTP id
 ev10-20020a056402540a00b004a220ba71e5mr7951339edb.26.1675027980668; 
 Sun, 29 Jan 2023 13:33:00 -0800 (PST)
Received: from devlab.lan (93-43-212-100.ip93.fastwebnet.it. [93.43.212.100])
 by smtp.gmail.com with ESMTPSA id
 q6-20020a1709064cc600b0084d494b24dcsm5815894ejt.161.2023.01.29.13.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 13:33:00 -0800 (PST)
From: Alessandro Partesotti <a.partesotti@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 Jan 2023 22:32:56 +0100
Message-Id: <20230129213256.1028798-1-a.partesotti@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230128094119.10660-1-a.partesotti@gmail.com>
References: <20230128094119.10660-1-a.partesotti@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IQPYoGsWCg5Gwf1QxmoXP6f6tLNu3vUA3envPCgV8rk=;
 b=omaDTfkr3C02+2tlYnD3+6fLlqF3zcxtbNIyRDJl3lz+wkTNYZa2Q2Ea3pCsMNQivq
 lUDAkUFiNA8rr0uSKm6zZpb5xNohRets1R574UhVIPyjvEwzPsJo62ejTUKSNjbQNuLd
 8j5aF/FeXqz0e18d9ncG0tjd5xdfVtaejPuf1Q7TeEJXA27YYddabLZkbEEif66KlIF9
 KDFS+9yJYmHp3ffMtI1dVRUempQlz0nGYApjbVfe8kAoVWhmSXhUQ/FGt7/QuzumryLO
 quuYBwf8zD/bT9Be1OyV0osVveEoyREO1fyIu4wvVfsO5trhVsy0QQjUhJfy3zwrFywo
 DuTA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=omaDTfkr
Subject: [Buildroot] [PATCH v2 1/1] package/oatpp:: new package
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
Cc: Alessandro Partesotti <a.partesotti@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 "YANN E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package introduce oatpp in BR buildsystem.
Oatpp must be used as static library as upstreaam suggest.

Signed-off-by: Alessandro Partesotti <a.partesotti@gmail.com>
---
Changes v1 -> v2
- indentation and spaces (suggested by Yann E. MORIN)
- generic macro changes (suggested by Yann E. MORIN)

Signed-off-by: Alessandro Partesotti <a.partesotti@gmail.com>
---
 package/Config.in        |  1 +
 package/oatpp/Config.in  | 13 +++++++++++++
 package/oatpp/oatpp.hash |  2 ++
 package/oatpp/oatpp.mk   | 16 ++++++++++++++++
 4 files changed, 32 insertions(+)
 create mode 100644 package/oatpp/Config.in
 create mode 100644 package/oatpp/oatpp.hash
 create mode 100644 package/oatpp/oatpp.mk

diff --git a/package/Config.in b/package/Config.in
index 995dae2c57..c7394ae53d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1941,6 +1941,7 @@ menu "Networking"
 	source "package/nss-mdns/Config.in"
 	source "package/nss-myhostname/Config.in"
 	source "package/nss-pam-ldapd/Config.in"
+	source "package/oatpp/Config.in"
 	source "package/omniorb/Config.in"
 	source "package/open-isns/Config.in"
 	source "package/open62541/Config.in"
diff --git a/package/oatpp/Config.in b/package/oatpp/Config.in
new file mode 100644
index 0000000000..44f0fabed8
--- /dev/null
+++ b/package/oatpp/Config.in
@@ -0,0 +1,13 @@
+comment "Oat++ needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_OATPP
+	bool "Oat++"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  Oat++ is an open-source C++ web framework for highly
+	  scalable and resource-efficient web applications.
+	  It provides all the necessary components for
+	  production-grade development.
+	  See https://oatpp.io/docs/start
diff --git a/package/oatpp/oatpp.hash b/package/oatpp/oatpp.hash
new file mode 100644
index 0000000000..fadea2a05f
--- /dev/null
+++ b/package/oatpp/oatpp.hash
@@ -0,0 +1,2 @@
+# Hash from: https://github.com/oatpp/oatpp/archive/1.3.0/oatpp-1.3.0.tar.gz
+sha512  4fe8587efe1b4ecae14554ec8edb209e5558a3e4a4e6ff49bbfaaf06d2cc12f2cc306c5edc43b8dafc465aff53098ad4bebb9971694761b91a553730d5acb59a  oatpp-1.3.0.tar.gz
diff --git a/package/oatpp/oatpp.mk b/package/oatpp/oatpp.mk
new file mode 100644
index 0000000000..d146d05d53
--- /dev/null
+++ b/package/oatpp/oatpp.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# oatpp
+#
+################################################################################
+
+OATPP_VERSION = 1.3.0
+OATPP_LICENSE = Apache-2.0
+OATPP_LICENSE_FILES = LICENSE
+OATPP_SITE = $(call github,oatpp,oatpp,$(OATPP_VERSION))
+OATPP_CMAKE_OPTS = -DBUILD_SHARED_LIBS=OFF
+OATPP_INSTALL_STAGING= YES
+# Only builds a static lib:
+OATPP_INSTALL_TARGET= NO
+
+$(eval $(cmake-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
