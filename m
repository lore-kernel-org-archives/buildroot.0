Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C7BC6FD19
	for <buildroot@archiver.kernel.org>; Thu, 16 Mar 2023 08:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 960F080D4B;
	Thu, 16 Mar 2023 08:35:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 960F080D4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ax5D5Kw1U9du; Thu, 16 Mar 2023 08:35:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDC4C81F34;
	Thu, 16 Mar 2023 08:35:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDC4C81F34
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 118221BF3D5
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 08:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2445C408D4
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 08:35:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2445C408D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OLuLa0ifBqdl for <buildroot@lists.busybox.net>;
 Thu, 16 Mar 2023 08:35:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AEA84088B
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0AEA84088B
 for <buildroot@buildroot.org>; Thu, 16 Mar 2023 08:35:02 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id v10so441595iol.9
 for <buildroot@buildroot.org>; Thu, 16 Mar 2023 01:35:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678955702;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KwXXl0giUgyKoe5wVt66Qe7L2qfEKr/ue2R/xzeZWxg=;
 b=VPuZjNJTeebrx0xDEWy4He0f4A7uFd50Ohkmkwho5difkump4GEWTwJs3IRAfuWU7/
 OtA3w+XfS+MHoNoK/tfwztTyh/1ciTVrE34HX/qopzNwz1PDyYvGzj++2Jyd4EaYdugp
 Am+zbTR9jhD6L7z9Uw55oL650Dn3R4pJfna23DPAtgm34bY3/+/B+JfaxGnLuPmCf8gs
 KQaLvWweQm/mYDs5BHi8x5k5lskIkxCYP5FuMw3K+weeYt1od1fm5ab4/ye4XMaZ35io
 P8QsXdXcl8+mK2EZPZ9cdAuYI1wOjshJeW67I7PyZHvFHsyqCxy081piibaih0/TqYLF
 3xww==
X-Gm-Message-State: AO0yUKUDyXrzu6Twa4FMLYUarWsALLJ/0XITnbFCJEI2bZIlzF0TbWOp
 5YfhHGQKuzPVx0yz3j3CeCB0VL+d2f8PBQ==
X-Google-Smtp-Source: AK7set+yW8hz4TtCy9YWSGk881MOH3i05jymVtJUUvAXnfw/S4hrmI8omq981sFCd4B+SxQLpWkZRg==
X-Received: by 2002:a6b:b20b:0:b0:753:26e4:4e43 with SMTP id
 b11-20020a6bb20b000000b0075326e44e43mr731000iof.2.1678955701911; 
 Thu, 16 Mar 2023 01:35:01 -0700 (PDT)
Received: from james-x399.localdomain (97-118-149-35.hlrn.qwest.net.
 [97.118.149.35]) by smtp.gmail.com with ESMTPSA id
 y34-20020a029525000000b003b331f0bbdfsm534630jah.97.2023.03.16.01.35.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 01:35:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 16 Mar 2023 02:34:34 -0600
Message-Id: <20230316083440.3466725-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230316083440.3466725-1-james.hilliard1@gmail.com>
References: <20230316083440.3466725-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678955702;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KwXXl0giUgyKoe5wVt66Qe7L2qfEKr/ue2R/xzeZWxg=;
 b=Tfn6h+9eCEMO+2cgKpGcCPOpxY/PJoc2FTc/mn3RrBdioplVqjBWuv0DJs9WNM0WrZ
 XwQcJycgvhegz5hDpkI8CvzmriRWwC8HV+5DVzTtMlq1CGgWvaX/qA7bc2bIX7UiuZeA
 AkbnIGc6iH3Iq3OdZ8+Y0NBDRU9oGqYTSeSfnCJCcLL2UIRnqntgt4pS//vWS2RZxLfW
 BOVRKHZKR8YAfikyoik1S6RqqNc13QtWWc0l+7molfZgFEf6iuFhLEnXaerVgYkz6Anf
 /73zjHEJomk3/0muhsPwp112VgtRQvGxdggqeGbd6rbCMjKkgEm3pesXsCp4eLfJklvd
 xzHg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Tfn6h+9e
Subject: [Buildroot] [PATCH v6 04/10] package/pthreadpool: new package
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
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package is required by tensorflow-lite.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v5 -> v6:
  - update to latest version
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/pthreadpool/Config.in        |  8 +++++++
 package/pthreadpool/pthreadpool.hash |  4 ++++
 package/pthreadpool/pthreadpool.mk   | 33 ++++++++++++++++++++++++++++
 5 files changed, 47 insertions(+)
 create mode 100644 package/pthreadpool/Config.in
 create mode 100644 package/pthreadpool/pthreadpool.hash
 create mode 100644 package/pthreadpool/pthreadpool.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 40df433fbc..b0cabbc4f4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2688,6 +2688,7 @@ F:	package/ti-gfx/
 N:	Stefan Hager <stefan.hager@ginzinger.com>
 F:	package/cpuinfo/
 F:	package/gemmlowp/
+F:	package/pthreadpool/
 F:	package/ruy/
 
 N:	Stefan Ott <stefan@ott.net>
diff --git a/package/Config.in b/package/Config.in
index f506d79b0b..6dafc7cb5c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2143,6 +2143,7 @@ endif
 	source "package/protobuf/Config.in"
 	source "package/protobuf-c/Config.in"
 	source "package/protozero/Config.in"
+	source "package/pthreadpool/Config.in"
 	source "package/qhull/Config.in"
 	source "package/qlibc/Config.in"
 	source "package/reproc/Config.in"
diff --git a/package/pthreadpool/Config.in b/package/pthreadpool/Config.in
new file mode 100644
index 0000000000..194ae33f85
--- /dev/null
+++ b/package/pthreadpool/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PTHREADPOOL
+	bool "pthreadpool"
+	select BR2_PACKAGE_FXDIV
+	help
+	  Pthreadpool is a portable and efficient thread pool
+	  implementation.
+
+	  https://github.com/Maratyszcza/pthreadpool
diff --git a/package/pthreadpool/pthreadpool.hash b/package/pthreadpool/pthreadpool.hash
new file mode 100644
index 0000000000..8f15132595
--- /dev/null
+++ b/package/pthreadpool/pthreadpool.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  6b0018ce7c926b718ed3ecbed1e48c8a083df60529b33ef2c7232260d3c32f61  pthreadpool-edeb5d6b967bef092ff195ab40e216fa5ac11f61.tar.gz
+# License files, locally calculated
+sha256  57814a606b4d0fb087d9a534919084b6c11b58a4174cb5a4aef200187780dc3a  LICENSE
diff --git a/package/pthreadpool/pthreadpool.mk b/package/pthreadpool/pthreadpool.mk
new file mode 100644
index 0000000000..75327951df
--- /dev/null
+++ b/package/pthreadpool/pthreadpool.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# pthreadpool
+#
+################################################################################
+
+PTHREADPOOL_VERSION = edeb5d6b967bef092ff195ab40e216fa5ac11f61
+PTHREADPOOL_SITE = $(call github,Maratyszcza,pthreadpool,$(PTHREADPOOL_VERSION))
+PTHREADPOOL_LICENSE = BSD-2-Clause
+PTHREADPOOL_LICENSE_FILES = LICENSE
+PTHREADPOOL_INSTALL_STAGING = YES
+PTHREADPOOL_DEPENDENCIES = fxdiv
+
+PTHREADPOOL_CFLAGS = $(TARGET_CFLAGS)
+PTHREADPOOL_CXXFLAGS = $(TARGET_CXXFLAGS)
+
+ifeq ($(BR2_PACKAGE_CPUINFO),y)
+PTHREADPOOL_DEPENDENCIES += cpuinfo
+PTHREADPOOL_CFLAGS += -DPTHREADPOOL_USE_CPUINFO=1
+PTHREADPOOL_CXXFLAGS += -DPTHREADPOOL_USE_CPUINFO=1
+else
+PTHREADPOOL_CFLAGS += -DPTHREADPOOL_USE_CPUINFO=0
+PTHREADPOOL_CXXFLAGS += -DPTHREADPOOL_USE_CPUINFO=0
+endif
+
+PTHREADPOOL_CONF_OPTS = \
+	-DCMAKE_C_FLAGS="$(PTHREADPOOL_CFLAGS)" \
+	-DCMAKE_CXX_FLAGS="$(PTHREADPOOL_CXXFLAGS)" \
+	-DFXDIV_SOURCE_DIR="$(FXDIV_DIR)" \
+	-DPTHREADPOOL_BUILD_TESTS=OFF \
+	-DPTHREADPOOL_BUILD_BENCHMARKS=OFF
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
