Return-Path: <SRS0=hSOo=MZ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9BEAC4338F
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 07:58:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50D3760FC1
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 07:58:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 50D3760FC1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A841605E8;
	Mon,  2 Aug 2021 07:58:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id um-BuZfINJIj; Mon,  2 Aug 2021 07:58:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51072605E2;
	Mon,  2 Aug 2021 07:58:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EAAB61BF82D
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 07:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D8DC8605E2
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 07:58:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FMNLEDFLJ1MG for <buildroot@lists.busybox.net>;
 Mon,  2 Aug 2021 07:58:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7F059605C6
 for <buildroot@buildroot.org>; Mon,  2 Aug 2021 07:58:47 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 k38-20020a05600c1ca6b029025af5e0f38bso2014076wms.5
 for <buildroot@buildroot.org>; Mon, 02 Aug 2021 00:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a7hBwfdTEhTjvz9skeZVBPmIIiPC3pY/iEO9xCGPkGU=;
 b=N6kXQCsvdv7M74Z+SS1bmFq8hixbun4amyAoPE1h6A0D9WfFprBNphzHLvbep0wpMn
 +a9yGH7JR2dvT3NIqmfq8uUWBHifB9ltBKn7qTD0Hy4cB4Cuzg7W5c54mIcVLw1z15q3
 VDWH6zaOkqVzCcJE7a/HHclANUpfB+kTNkzvPRk8DjUjrxnSMIYRp+Ou8ocLY4lBhoOc
 ipz6MyUUMxB5MwhASFD71XVZAJNW36SJFd60rmPt37medWortOXOTzV2iIWW6Q1d7d3h
 yIgvEHi4tbDlvti2zfA8nsqWNfF1Qrgcz7mgrjhZcy1ojpKHcggdIh/ouDyUGytCWI3Y
 PBZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a7hBwfdTEhTjvz9skeZVBPmIIiPC3pY/iEO9xCGPkGU=;
 b=YE9+8VTtsQNVwuqA6+nSRfenqyKjwPWv/fZJzCwfXa3Ossxh78UradSAsPjkxO0IAR
 Yuc3N7csVErEQk4io/2NCu4oVEOdEDpeTDOTJ858xGXtWOUNN5btQ+ecuM7FjaFZI0XO
 7Ah3OMn4uP+QVk89P2Y4/rOyI+JopXNh5f7U+nPWZU5ihbJjHuNQJwlVqfJt3X/fOFvH
 9LlX6SBFhxb6hfxT2uIvXayawZshN5Rwwg7m/76fwKfU0oauLpuDw3jpaaN1ZhG4slJi
 CPlBzKBri2KDtindJgOADoKM01Lww4ZbSo6Ma8pTGvluFaqGw9tOpm70uPaLlu1kJPPJ
 sYnA==
X-Gm-Message-State: AOAM532w0lofvmAkkiapFs2B2RmL2kERQcw2AKkxQgXTQ5uHlvsJSsGw
 bslNhpeAOgWKeZPR4PGuW2Zf31Po5+HbBA==
X-Google-Smtp-Source: ABdhPJySAg8/pz9rDndVua4E1Zu5IMEgAB6yEJIX2GswLyF4BIVk9Qkf3gBC4KXdIYETdG9V9MmcPw==
X-Received: by 2002:a05:600c:3656:: with SMTP id
 y22mr9134429wmq.58.1627891125341; 
 Mon, 02 Aug 2021 00:58:45 -0700 (PDT)
Received: from kali.home (pop.92-184-106-138.mobile.abo.orange.fr.
 [92.184.106.138])
 by smtp.gmail.com with ESMTPSA id c10sm2929625wml.44.2021.08.02.00.58.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 00:58:44 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  2 Aug 2021 09:58:41 +0200
Message-Id: <20210802075841.1371561-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/open62541: disable -Werror
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Disable -Werror to avoid the following build failures raised since bump
to version 1.2.2 in commit b436b82411305839abc76bb438fe92661a067526:

/tmp/instance-0/output-1/build/open62541-v1.2.2/arch/network_tcp.c: In function 'connection_recv':
/tmp/instance-0/output-1/build/open62541-v1.2.2/arch/network_tcp.c:96:5: error: conversion to 'unsigned int' from 'int' may change the sign of the result [-Werror=sign-conversion]
   96 |     UA_fd_set(connection->sockfd, &fdset);
      |     ^~~~~~~~~

/tmp/instance-6/output-1/build/open62541-v1.2.2/plugins/ua_pubsub_udp.c: In function 'UA_PubSubChannelUDPMC_receive':
/tmp/instance-6/output-1/build/open62541-v1.2.2/plugins/ua_pubsub_udp.c:477:21: error: conversion to '__suseconds_t' {aka 'int'} from 'UA_UInt32' {aka 'unsigned int'} may change the sign of the result [-Werror=sign-conversion]
  477 |     tmptv.tv_usec = (long int)(timeout % 1000000);
      |                     ^

Fixes:
 - http://autobuild.buildroot.org/results/911811de81d8abb2a31feb8f27af1592641c6fbc
 - http://autobuild.buildroot.org/results/f0187b3f2d62e955fddeef4e90f84ba4fd642bd2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...4-CMakeLists.txt-add-UA_FORCE_WERROR.patch | 54 +++++++++++++++++++
 package/open62541/open62541.mk                |  3 +-
 2 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100644 package/open62541/0004-CMakeLists.txt-add-UA_FORCE_WERROR.patch

diff --git a/package/open62541/0004-CMakeLists.txt-add-UA_FORCE_WERROR.patch b/package/open62541/0004-CMakeLists.txt-add-UA_FORCE_WERROR.patch
new file mode 100644
index 0000000000..f912445b7f
--- /dev/null
+++ b/package/open62541/0004-CMakeLists.txt-add-UA_FORCE_WERROR.patch
@@ -0,0 +1,54 @@
+From a439daafdc98391eed13e23f93ecfca81d71c731 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 2 Aug 2021 09:49:48 +0200
+Subject: [PATCH] CMakeLists.txt: add UA_FORCE_WERROR
+
+Allow the user to disable -Werror to avoid the following build failures:
+
+/tmp/instance-0/output-1/build/open62541-v1.2.2/arch/network_tcp.c: In function 'connection_recv':
+/tmp/instance-0/output-1/build/open62541-v1.2.2/arch/network_tcp.c:96:5: error: conversion to 'unsigned int' from 'int' may change the sign of the result [-Werror=sign-conversion]
+   96 |     UA_fd_set(connection->sockfd, &fdset);
+      |     ^~~~~~~~~
+
+/tmp/instance-6/output-1/build/open62541-v1.2.2/plugins/ua_pubsub_udp.c: In function 'UA_PubSubChannelUDPMC_receive':
+/tmp/instance-6/output-1/build/open62541-v1.2.2/plugins/ua_pubsub_udp.c:477:21: error: conversion to '__suseconds_t' {aka 'int'} from 'UA_UInt32' {aka 'unsigned int'} may change the sign of the result [-Werror=sign-conversion]
+  477 |     tmptv.tv_usec = (long int)(timeout % 1000000);
+      |                     ^
+
+Fixes:
+ - http://autobuild.buildroot.org/results/911811de81d8abb2a31feb8f27af1592641c6fbc
+ - http://autobuild.buildroot.org/results/f0187b3f2d62e955fddeef4e90f84ba4fd642bd2
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/open62541/open62541/pull/4572]
+---
+ CMakeLists.txt | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index bc839f27..963460d0 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -292,6 +292,8 @@ if(UA_FORCE_CPP)
+     add_definitions(-D__STDC_CONSTANT_MACROS) # We need the UINT32_C define
+ endif()
+ 
++option(UA_FORCE_WERROR "Force compilation with -Werror" ON)
++
+ #General PubSub setup
+ option(UA_ENABLE_PUBSUB "Enable the PubSub protocol" OFF)
+ 
+@@ -589,7 +591,9 @@ if(NOT UA_FORCE_CPP AND (CMAKE_COMPILER_IS_GNUCC OR "x${CMAKE_C_COMPILER_ID}" ST
+     check_add_cc_flag("-Wall")      # Warnings
+     check_add_cc_flag("-Wextra")    # More warnings
+     check_add_cc_flag("-Wpedantic") # Standard compliance
+-    check_add_cc_flag("-Werror")    # All warnings are errors
++    if(UA_FORCE_WERROR)
++        check_add_cc_flag("-Werror")    # All warnings are errors
++    endif()
+ 
+     check_add_cc_flag("-Wno-static-in-inline") # Clang doesn't like the use of static inline methods inside static inline methods
+     check_add_cc_flag("-Wno-overlength-strings") # May happen in the nodeset compiler when complex values are directly encoded
+-- 
+2.30.2
+
diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
index 9c6468d443..671ec3b2dc 100644
--- a/package/open62541/open62541.mk
+++ b/package/open62541/open62541.mk
@@ -19,7 +19,8 @@ OPEN62541_CONF_OPTS = \
 	-DCMAKE_BUILD_TYPE=Release \
 	-DGIT_EXECUTABLE=NO \
 	-DOPEN62541_VERSION=$(OPEN62541_VERSION) \
-	-DUA_ENABLE_HARDENING=OFF
+	-DUA_ENABLE_HARDENING=OFF \
+	-DUA_FORCE_WERROR=OFF
 
 ifeq ($(BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_MINIMAL),y)
 OPEN62541_CONF_OPTS += -DUA_NAMESPACE_ZERO=MINIMAL
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
