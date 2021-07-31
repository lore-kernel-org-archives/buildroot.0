Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D79BAC4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 21:40:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6812860F39
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 21:40:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6812860F39
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1390E835D9;
	Sat, 31 Jul 2021 21:40:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xiiv-PFbCQ1D; Sat, 31 Jul 2021 21:40:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 485D2832A9;
	Sat, 31 Jul 2021 21:40:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B66D91BF5E6
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 21:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1B2140136
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 21:40:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hm46XP8WGDKb for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 21:40:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 335F8400C3
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 21:40:05 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 h24-20020a1ccc180000b029022e0571d1a0so8666451wmb.5
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 14:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cJzzblax3uvxEvwAfm5mlRVRmTC3C0oTPkzBDqpJyZo=;
 b=LvAga8MfS9rDng9i0okJLVdTfO/6hxS6gZ6LQlx+evmCN9EYmpf4US7SJlRk+5OACY
 0zfLKKE3LY9sx0wYyO9e9mNxScPXsn8cLaAJAIFhwXH1twOSxg4J4/oW7SWImjibpPjC
 17s4IdTnHoL+fcK4hAtcMyKp+sBPTSWx0T51jWSw0NT4utapAY2Cp/cVCGlL0frw9EmQ
 h3tYv7WkPDVTTbD4leMnhAOj3Wuml0QGg0JmD9uoxGJy4+EYbVn+obZhY6yHlndPSLXV
 pstuE2wIXrINtJ9Z4BnvymZIc2ZUhg7tlw9svDS8VdZ5YjHaY3Jk1B6qEt+Ggyqp4LCd
 gJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cJzzblax3uvxEvwAfm5mlRVRmTC3C0oTPkzBDqpJyZo=;
 b=WXpWlVwFHreXPFbCgdFXqp6gVH+Li7PGd+UrAWxkiC7w4fZBKDr3VLn+zD3iX7CO3r
 egdGyZ2Mme3ykGwt5WLLou1GMsbt4ibEs61yTykT5czauFhIrlqZyPcjuyplEa/gBEsq
 MU3TeEwdf7zFGDd9BpLknDHA5TYe9UvvcXVnpqfJWVcEmcdW8FkuwF8xdptm80m9krrF
 /G/3z7GpNNi6ReMJW3qDx/djfq5lUqlXkf6NnOecESC8cNu/dgTxWK4Kl60PKNI6CGnj
 hhYPbdkfgdLybQq8F1erWYZ5zEJys46pnmBxCEBUJeLuMdZsFcoJEEUg0yRZjML+//l6
 +w2Q==
X-Gm-Message-State: AOAM5317HFF5ppk1fpaZDVf9o/YIjd+B/TWeJiz9idYDofPNVr5fO8L9
 ZE1+v1gOl+dD0n2AX00GEWVhGP4nOfay7A==
X-Google-Smtp-Source: ABdhPJxhD2DR/b3d0XD/UMxB6bSmVFWUmtj20HEoEs/X7kzQquF748G/IcgLSZhdA1lkD1zmBiCegg==
X-Received: by 2002:a7b:c84e:: with SMTP id c14mr9233706wml.94.1627767603100; 
 Sat, 31 Jul 2021 14:40:03 -0700 (PDT)
Received: from kali.home (pop.92-184-116-174.mobile.abo.orange.fr.
 [92.184.116.174])
 by smtp.gmail.com with ESMTPSA id w5sm7052390wro.45.2021.07.31.14.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jul 2021 14:40:02 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Jul 2021 23:39:54 +0200
Message-Id: <20210731213954.1750261-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gli: disable tests
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Disable tests to avoid the following build failure with gcc 11:

/srv/storage/autobuild/run/instance-2/output-1/build/gli-559cbe1ec38878e182507d331e0780fbae5baf15/test/core/core_convert.cpp: In function 'bool convert_rgb32f_rgb9e5(const char*, const char*)':
/srv/storage/autobuild/run/instance-2/output-1/build/gli-559cbe1ec38878e182507d331e0780fbae5baf15/test/core/core_convert.cpp:36:45: error: ordered comparison of pointer with integer zero ('const char*' and 'int')
   36 |         if(std::strstr(FilenameDst, ".dds") > 0 || std::strstr(FilenameDst, ".ktx") > 0)
      |            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~

Fixes:
 - http://autobuild.buildroot.org/results/4f1dbb7cf2b071f3b92d00d13984068ef5f5b329

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../gli/0001-Optional-building-tests.patch    | 45 +++++++++++++++++++
 package/gli/gli.mk                            |  2 +
 2 files changed, 47 insertions(+)
 create mode 100644 package/gli/0001-Optional-building-tests.patch

diff --git a/package/gli/0001-Optional-building-tests.patch b/package/gli/0001-Optional-building-tests.patch
new file mode 100644
index 0000000000..c085e5060b
--- /dev/null
+++ b/package/gli/0001-Optional-building-tests.patch
@@ -0,0 +1,45 @@
+From 629fc81ce73114a5925484937df796467adbe8c7 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jo=C3=A3o=20Pereira?= <pereira.john94@gmail.com>
+Date: Fri, 22 Mar 2019 22:58:17 +0000
+Subject: [PATCH] Optional building tests
+
+[Retrieved from:
+https://github.com/g-truc/gli/commit/629fc81ce73114a5925484937df796467adbe8c7]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ CMakeLists.txt      | 1 +
+ test/CMakeLists.txt | 8 +++++---
+ 2 files changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 6eb1a68b..bcff7ef0 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -13,6 +13,7 @@ include(GNUInstallDirs)
+ include(CMakePackageConfigHelpers)
+ 
+ enable_testing()
++option(GLI_TEST_ENABLE "Build unit tests" ON)
+ 
+ add_definitions(-D_CRT_SECURE_NO_WARNINGS)
+ add_definitions(-DSOURCE_DIR="${CMAKE_CURRENT_SOURCE_DIR}")
+diff --git a/test/CMakeLists.txt b/test/CMakeLists.txt
+index 6b1d4826..e51a3181 100644
+--- a/test/CMakeLists.txt
++++ b/test/CMakeLists.txt
+@@ -19,10 +19,12 @@ function(glmCreateTestGTC NAME)
+ 	set(SAMPLE_NAME test-${NAME})
+ 	add_executable(${SAMPLE_NAME} ${NAME}.cpp)
+ 	target_link_libraries(${SAMPLE_NAME} gli)
+-	add_test( 
++	add_test(
+ 		NAME ${SAMPLE_NAME}
+ 		COMMAND $<TARGET_FILE:${SAMPLE_NAME}> )
+ endfunction()
+ 
+-add_subdirectory(bug)
+-add_subdirectory(core)
++if(GLI_TEST_ENABLE)
++	add_subdirectory(bug)
++	add_subdirectory(core)
++endif()
diff --git a/package/gli/gli.mk b/package/gli/gli.mk
index 6a332d0e08..9b9990910a 100644
--- a/package/gli/gli.mk
+++ b/package/gli/gli.mk
@@ -14,4 +14,6 @@ GLI_LICENSE_FILES = manual.md
 GLI_INSTALL_STAGING = YES
 GLI_INSTALL_TARGET = NO
 
+GLI_CONF_OPTS = -DGLI_TEST_ENABLE=OFF
+
 $(eval $(cmake-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
