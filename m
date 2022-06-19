Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE52C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 16:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D885400CC;
	Sun, 19 Jun 2022 16:52:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D885400CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l0fTnSZ5a4wZ; Sun, 19 Jun 2022 16:52:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E583408EA;
	Sun, 19 Jun 2022 16:52:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E583408EA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2A0C11BF4E7
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0483D60B15
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:52:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0483D60B15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wGkC-3eEmbeo for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 16:52:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B190A60A90
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B190A60A90
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 16:52:53 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id k22so5224260wrd.6
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 09:52:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ASQIjbFYybCCDqTjtgVMzB4PeC1QnRfB0KGc8i4iFOo=;
 b=f4zfIeowVyQ4TJbfvdwioWb+1KPw84gWdxKmKvg+CmcGbKXQk43FeQ7tkwjLkJdCA7
 VxhLM/zV4mEeKL2GZa9J25R0D4JV8PNa5C1nXqWBE/aygf9xbnbRu1bezEPS3FkGweqg
 ntLfx31sZNc3jcg0de4aAD30Y+rz/C1B/wFZ6PyrD33t9jdBMNaZOcEk5Gx4V7hWmqR0
 Kt6r5BkJ3IPf/fBRdw/nURU9jgNUcerYEPU5H5jyUYMYdtXn3SdACMLNdNvql+Nu48Od
 P7jTw2mAd1Lk84H1myq9A38w1u65qvqJsZEkwuCRglyTdR3Z8syymcYscgW1pbALbVoq
 ND3w==
X-Gm-Message-State: AJIora+cE8hnDJ1AWxnm2M9FapsvkRWDbnqhMT92p2JMH1XosO03FlNq
 e9B2ZMyHPdEb1fW5ZCmDcMMrnRgUEq8=
X-Google-Smtp-Source: AGRyM1vVCeX5j4F7VmUQNv4a5nSbFmqBfHaWS0tQMFc4yMa/STcLkW/4DJB6QTydbjs4IZEXSFH7jA==
X-Received: by 2002:a05:6000:1142:b0:21b:844e:27cb with SMTP id
 d2-20020a056000114200b0021b844e27cbmr8783004wrx.306.1655657571775; 
 Sun, 19 Jun 2022 09:52:51 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 bw7-20020a0560001f8700b0020d0f111241sm9917072wrb.24.2022.06.19.09.52.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 09:52:51 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 18:50:09 +0200
Message-Id: <20220619165009.651205-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ASQIjbFYybCCDqTjtgVMzB4PeC1QnRfB0KGc8i4iFOo=;
 b=JAW3EwCPI2Ey0gsYyOzLhHhq8/hVTNijYkhvR7riiVC/dIu/8f0IR1Q+gpcUcumGaz
 wrT4Fq5jFnTzrxG2N8ZX0gWpRasBrP5RrvPGDQ3wZXSiotbpemCaBPT8n59q4+pfIA6V
 2xWqH3D32iTDoJFsMgxgLGwksTR+7X0waLgoEFe1iJQQBOfeEepSh6qrB6klFxvAuGJb
 mUScbP8x3YSlqd/8xLWwvEiI5FAnCATyHErDDFsxzm9IYZcapfFscfvkHFvZygO1AeK6
 LsHz4WvQmUcDT2juHnBUplH3lBTNyQ9XmCLSMs8NLdbtfL/DjAaIROEOqkAXOF383iu1
 FOzQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JAW3EwCP
Subject: [Buildroot] [PATCH 1/1] package/libminiupnpc: bump to version 2.2.3
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update hash of license file (update in year)

http://miniupnp.free.fr/files/changelog.php?file=miniupnpc-2.2.3.tar.gz

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...akeLists-txt-fix-install-for-headers.patch | 43 +++++++++++++++++++
 package/libminiupnpc/libminiupnpc.hash        |  4 +-
 package/libminiupnpc/libminiupnpc.mk          |  6 +--
 3 files changed, 46 insertions(+), 7 deletions(-)
 create mode 100644 package/libminiupnpc/0001-miniupnpc-CMakeLists-txt-fix-install-for-headers.patch

diff --git a/package/libminiupnpc/0001-miniupnpc-CMakeLists-txt-fix-install-for-headers.patch b/package/libminiupnpc/0001-miniupnpc-CMakeLists-txt-fix-install-for-headers.patch
new file mode 100644
index 0000000000..2e4c8a69e6
--- /dev/null
+++ b/package/libminiupnpc/0001-miniupnpc-CMakeLists-txt-fix-install-for-headers.patch
@@ -0,0 +1,43 @@
+From f82b0563a72e33800f5918ead68c41bcda1fd4c1 Mon Sep 17 00:00:00 2001
+From: heitbaum <rudi@heitbaum.com>
+Date: Fri, 1 Oct 2021 00:00:27 +1000
+Subject: [PATCH] miniupnpc/CMakeLists.txt: fix install for headers
+
+[Retrieved from:
+https://github.com/miniupnp/miniupnp/commit/f82b0563a72e33800f5918ead68c41bcda1fd4c1]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ miniupnpc/CMakeLists.txt | 20 ++++++++++----------
+ 1 file changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 0553eeb3..6b0904c0 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -221,16 +221,16 @@ endif ()
+ 
+ if (NOT UPNPC_NO_INSTALL)
+   install (FILES
+-    miniupnpc.h
+-    miniwget.h
+-    upnpcommands.h
+-    igd_desc_parse.h
+-    upnpreplyparse.h
+-    upnperrors.h
+-    upnpdev.h
+-    miniupnpctypes.h
+-    portlistingparse.h
+-    miniupnpc_declspec.h
++    include/miniupnpc.h
++    include/miniwget.h
++    include/upnpcommands.h
++    include/igd_desc_parse.h
++    include/upnpreplyparse.h
++    include/upnperrors.h
++    include/upnpdev.h
++    include/miniupnpctypes.h
++    include/portlistingparse.h
++    include/miniupnpc_declspec.h
+     DESTINATION include/miniupnpc
+   )
+ 
diff --git a/package/libminiupnpc/libminiupnpc.hash b/package/libminiupnpc/libminiupnpc.hash
index 758ea29f59..4714dd6f48 100644
--- a/package/libminiupnpc/libminiupnpc.hash
+++ b/package/libminiupnpc/libminiupnpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  69f72fe355f911b807915f78dcfc0af772c0f22bc7ab1157e70f334e37db7d39  miniupnpc-2.1.20201016.tar.gz
-sha256  0b476c395af6dd21eeb54c40a21d22e1c11a751fbd2dd17a41ce26e370be88d5  LICENSE
+sha256  dce41b4a4f08521c53a0ab163ad2007d18b5e1aa173ea5803bd47a1be3159c24  miniupnpc-2.2.3.tar.gz
+sha256  90bb92bf524970569296022fea562c85a4ec4d99a16f3aef2144d13d7087b631  LICENSE
diff --git a/package/libminiupnpc/libminiupnpc.mk b/package/libminiupnpc/libminiupnpc.mk
index 52fe9849f2..f3661396ca 100644
--- a/package/libminiupnpc/libminiupnpc.mk
+++ b/package/libminiupnpc/libminiupnpc.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-LIBMINIUPNPC_VERSION_MAJOR = 2.1
-LIBMINIUPNPC_VERSION_MINOR = 20201016
-LIBMINIUPNPC_VERSION = $(LIBMINIUPNPC_VERSION_MAJOR).$(LIBMINIUPNPC_VERSION_MINOR)
+LIBMINIUPNPC_VERSION = 2.2.3
 LIBMINIUPNPC_SOURCE = miniupnpc-$(LIBMINIUPNPC_VERSION).tar.gz
 LIBMINIUPNPC_SITE = http://miniupnp.free.fr/files
 LIBMINIUPNPC_INSTALL_STAGING = YES
@@ -14,8 +12,6 @@ LIBMINIUPNPC_LICENSE = BSD-3-Clause
 LIBMINIUPNPC_LICENSE_FILES = LICENSE
 LIBMINIUPNPC_CPE_ID_VENDOR = miniupnp_project
 LIBMINIUPNPC_CPE_ID_PRODUCT = miniupnpc
-LIBMINIUPNPC_CPE_ID_VERSION = $(LIBMINIUPNPC_VERSION_MAJOR)
-LIBMINIUPNPC_CPE_ID_UPDATE = $(LIBMINIUPNPC_VERSION_MINOR)
 LIBMINIUPNPC_CONF_OPTS = -DUPNPC_BUILD_SAMPLE=OFF -DUPNPC_BUILD_TESTS=OFF
 
 ifeq ($(BR2_STATIC_LIBS),y)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
