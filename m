Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33FEFC4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 05:02:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C30FF60F02
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 05:02:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C30FF60F02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63F3640448;
	Mon, 26 Jul 2021 05:02:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MhG87gM3ToX3; Mon, 26 Jul 2021 05:02:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A76E740357;
	Mon, 26 Jul 2021 05:02:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E49641BF255
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 05:02:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D39FE40357
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 05:02:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p_8Uto8jQ0l6 for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 05:02:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E89134029F
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 05:02:02 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 q17-20020a17090a2e11b02901757deaf2c8so12662865pjd.0
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 22:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+/oTIQNCGcScxJc7XtLvJaqlXf2Z+OQCH6R4aKJZSMo=;
 b=cNscX71dIQ0xcrde9ktNprJkpCCDdeH7AoPPMDI11+p8r7F8RYsbzzOt955Q4yJ9GZ
 ySauzN7YxRpZGdibsiN9heQFW11LU/PKKT6M0rcErSUq8hOi0ZszFOqZEfF4G4Y8UlDJ
 oM6nF0XMlxU8lJ0ARjoP2HiH81ijDLmoX0SEMWd1jAevSiMnvLuD4qMqNgzj73bs1zPY
 5CyyReFmY68CguMbodGDIq0UVez3wNB9C7VDXF4k7KSEVFvcf8HgyfXoKV5NaCiH4ou8
 /9D/tcrGz+Hbc2+Bk+5pC3KGYlDiAiiKW1PRwu8byG4JUwo1eqsRahI/EjNCfGjyOWHA
 rwSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+/oTIQNCGcScxJc7XtLvJaqlXf2Z+OQCH6R4aKJZSMo=;
 b=WX77GbSCPFINTH1xgh/9RKasEDGNR6eDzZlfa2Qz6QNmp8QZlJT8U7aG5MBj5EODDM
 EtyQQd5UTNdtLA9hg70P7inKDTO/qwuZmhpGZCSqwBbYnIlV59ADXhAERJ9KTLVlhhDE
 R/Xh0a3NaAkEhPeeRwKlu50WULbMGHvttAaVti9h9lRdo9lsO+2MMb92Qkcc5zKSGst4
 fVcqJ4SNxiFkvlnVkbcvjzvtSty0RTYHKpofniinX+xVFsXci4BtHcw/l901DUHhguWb
 q87I/ICzblU8lMCfZ7lJFTdnXCLwOGFK2ypEJv1O1VFNY7+h55R76p2jwE3i8YHdDisk
 64Zg==
X-Gm-Message-State: AOAM531kSJFxcM+4btbihNzMOmA1bVgFCAjSZ1wWUER9tNUS8I5k5djU
 yyMuW07m3fo4U1P1IEJ5qFpYD3gePFqXD7hT
X-Google-Smtp-Source: ABdhPJwpF+pT0gYKCkZKyRV0cTyeoQlpp02L/bWA8uuZKVf1Y3q85DRDiJM6fDwQiZ6SfxuDKYZVLg==
X-Received: by 2002:a63:36cb:: with SMTP id
 d194mr16438530pga.224.1627275721821; 
 Sun, 25 Jul 2021 22:02:01 -0700 (PDT)
Received: from localhost (144.34.178.25.16clouds.com. [144.34.178.25])
 by smtp.gmail.com with ESMTPSA id y28sm35117967pff.137.2021.07.25.22.02.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 22:02:01 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 13:01:51 +0800
Message-Id: <20210726050152.120322-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/open62541: bump version to 1.2.2
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Scott Fan <fancp2007@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 ...arch-posix-CMakeLists.txt-fix-build-without-threads.patch | 2 +-
 package/open62541/open62541.hash                             | 2 +-
 package/open62541/open62541.mk                               | 5 ++---
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/open62541/0002-arch-posix-CMakeLists.txt-fix-build-without-threads.patch b/package/open62541/0002-arch-posix-CMakeLists.txt-fix-build-without-threads.patch
index 94ee76ad92..bdf3608041 100644
--- a/package/open62541/0002-arch-posix-CMakeLists.txt-fix-build-without-threads.patch
+++ b/package/open62541/0002-arch-posix-CMakeLists.txt-fix-build-without-threads.patch
@@ -29,7 +29,7 @@ index bb24757c..a53c9f2c 100644
            ua_architecture_append_to_library(m)
 -          #TODO - Error on first make run if pthread is included conditional?
 -          ua_architecture_append_to_library(pthread)
-           if(UA_ENABLE_MULTITHREADING OR UA_BUILD_UNIT_TESTS)
+           if(UA_MULTITHREADING OR UA_BUILD_UNIT_TESTS)
              ua_architecture_append_to_library(pthread)
            endif()
 -- 
diff --git a/package/open62541/open62541.hash b/package/open62541/open62541.hash
index 3da8c8f5fb..5aa340ac18 100644
--- a/package/open62541/open62541.hash
+++ b/package/open62541/open62541.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  36273793e5247586fadaa73c0edad89be610100cbc839d1fb5f567f20c3cbc44  open62541-1.0-br1.tar.gz
+sha256  c59c85b519a18350f5014b6e7b7545ee144ceeb15094e75b0b7ecec7dce43dd0  open62541-v1.2.2-br1.tar.gz
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
index 3f75196817..9c6468d443 100644
--- a/package/open62541/open62541.mk
+++ b/package/open62541/open62541.mk
@@ -4,8 +4,7 @@
 #
 ################################################################################
 
-OPEN62541_VERSION = 1.0
-OPEN62541_DL_VERSION = v$(OPEN62541_VERSION)
+OPEN62541_VERSION = v1.2.2
 OPEN62541_SITE_METHOD = git
 OPEN62541_SITE = git://github.com/open62541/open62541.git
 OPEN62541_GIT_SUBMODULES = YES
@@ -19,7 +18,7 @@ OPEN62541_LICENSE_FILES = LICENSE
 OPEN62541_CONF_OPTS = \
 	-DCMAKE_BUILD_TYPE=Release \
 	-DGIT_EXECUTABLE=NO \
-	-DOPEN62541_VERSION=v$(OPEN62541_VERSION) \
+	-DOPEN62541_VERSION=$(OPEN62541_VERSION) \
 	-DUA_ENABLE_HARDENING=OFF
 
 ifeq ($(BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_MINIMAL),y)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
