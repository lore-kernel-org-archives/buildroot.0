Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7BE8C54EE9
	for <buildroot@archiver.kernel.org>; Sun,  4 Sep 2022 20:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E34C60F3E;
	Sun,  4 Sep 2022 20:33:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E34C60F3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 68TehyVAy0FF; Sun,  4 Sep 2022 20:33:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0096860F15;
	Sun,  4 Sep 2022 20:33:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0096860F15
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7593C1BF38B
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 20:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 50AA760F15
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 20:33:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50AA760F15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 55LI8RuAYq8I for <buildroot@lists.busybox.net>;
 Sun,  4 Sep 2022 20:33:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AF396058F
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3AF396058F
 for <buildroot@buildroot.org>; Sun,  4 Sep 2022 20:33:23 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 v7-20020a1cac07000000b003a6062a4f81so6735306wme.1
 for <buildroot@buildroot.org>; Sun, 04 Sep 2022 13:33:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=Y+t3UagQ1b9dyd4CRUyALD7O9PFzdGfQR0HecuRi0W0=;
 b=2+gVfrHx+Jk4u1dQlm2i5QOHIXvEOD6ZHJwZBn0C27xUtGIpB3lGo4WBesqn8vryZx
 pl3OTnmjxOZWYn7IDVkxddmqJQtfEKrdj8WdcMHIbqbWaER3ilaFBcKq2CGaXKRQO2zR
 7I9TOLnIPuOTqmPoTZFIWXXgrHZoMXnECi8QrpaMq6IOBxyfuR4ORkSX1at/UkMUv4Yj
 KUnd28PPLQOdXccq2z4P7x+wzZvkKcK1YHzquEByoRtxxARgAJmQFGj2TF7eEGK7dySC
 E38251W+/W9jVA/nHStans38Gqu5fMJ4yr/3RGwYVaWVJ8WU8RYok9LUZ5bQxcQQGF/i
 K+cw==
X-Gm-Message-State: ACgBeo0TCWViD74z1jWalEJxj8WR2Kpz0o+/qu6U1/V95z+u3uz8GMqN
 xDK/bUBJeKdKD/kVaOpEuvudOdjC1Gc=
X-Google-Smtp-Source: AA6agR7ylbqr24xZSfjdr0MdIPkkaa3tb9tJDIbmW6jjM8MoIsa+QxLVvzWTkUh4u/m8KcUYiavaMA==
X-Received: by 2002:a05:600c:1e08:b0:3a8:39bc:d416 with SMTP id
 ay8-20020a05600c1e0800b003a839bcd416mr8664962wmb.202.1662323601086; 
 Sun, 04 Sep 2022 13:33:21 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 q13-20020a05600000cd00b002288a532003sm1434101wrx.90.2022.09.04.13.33.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 13:33:20 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Sep 2022 22:32:35 +0200
Message-Id: <20220904203235.7300-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=Y+t3UagQ1b9dyd4CRUyALD7O9PFzdGfQR0HecuRi0W0=;
 b=JTQxk+QNeVPQiLdN4sYZc6oNhBOzwq8Sd7k5d/e6pyraT+1zwG7OepEZY+/2uWqoHV
 3Ov+WPbB5cvi4IQzUrcxgpXwbYKnonMw56TtZ/d7VY08qfIvSkl8X84nzW+VwOKsYAMw
 NRAJeOzgz2sXO274DWS1v2jtCn19rCKsZDOUcPuRje9lz/MEk7zOg8EJdk2LV2a1KN0X
 e6SwcKcqCWY9actd1ye0XDdQJoJ4LnjO5eFQLoolBy9ccan+PgX+CUTkiBuLUNAoxZfK
 xOBgCUkoLD5i18tJbTARsL5m4jx7M8IwHTY/TR0yWoJOpeBynVoh/gOclHSIxIVw59Sw
 vQuA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JTQxk+QN
Subject: [Buildroot] [PATCH/next 1/1] package/yaml-cpp: bump to version 0.7.0
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

Handling YAML_BUILD_SHARED_LIBS is not needed since
https://github.com/jbeder/yaml-cpp/commit/52a1378e48e15d42a0b755af7146394c6eff998c

https://github.com/jbeder/yaml-cpp/releases/tag/yaml-cpp-0.7.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/yaml-cpp/yaml-cpp.hash | 2 +-
 package/yaml-cpp/yaml-cpp.mk   | 8 +-------
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/package/yaml-cpp/yaml-cpp.hash b/package/yaml-cpp/yaml-cpp.hash
index 2f7a6fc639..9ad9041439 100644
--- a/package/yaml-cpp/yaml-cpp.hash
+++ b/package/yaml-cpp/yaml-cpp.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  77ea1b90b3718aa0c324207cb29418f5bced2354c2e483a9523d98c3460af1ed  yaml-cpp-0.6.3.tar.gz
+sha256  43e6a9fcb146ad871515f0d0873947e5d497a1c9c60c58cb102a97b47208b7c3  yaml-cpp-0.7.0.tar.gz
 sha256  aa6fcc27be034e41e21dd832f9175bfe694a48491d9e14ff0fa278e19ad14f1b  LICENSE
diff --git a/package/yaml-cpp/yaml-cpp.mk b/package/yaml-cpp/yaml-cpp.mk
index 895072ec45..d65298ffb9 100644
--- a/package/yaml-cpp/yaml-cpp.mk
+++ b/package/yaml-cpp/yaml-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-YAML_CPP_VERSION = 0.6.3
+YAML_CPP_VERSION = 0.7.0
 YAML_CPP_SITE = $(call github,jbeder,yaml-cpp,yaml-cpp-$(YAML_CPP_VERSION))
 YAML_CPP_INSTALL_STAGING = YES
 YAML_CPP_LICENSE = MIT
@@ -16,10 +16,4 @@ YAML_CPP_CONF_OPTS += \
 	-DYAML_CPP_BUILD_TESTS=OFF \
 	-DYAML_CPP_BUILD_TOOLS=OFF
 
-ifeq ($(BR2_STATIC_LIBS),y)
-YAML_CPP_CONF_OPTS += -DYAML_BUILD_SHARED_LIBS=OFF
-else
-YAML_CPP_CONF_OPTS += -DYAML_BUILD_SHARED_LIBS=ON
-endif
-
 $(eval $(cmake-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
