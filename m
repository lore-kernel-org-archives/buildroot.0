Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4576BC43334
	for <buildroot@archiver.kernel.org>; Sun, 10 Jul 2022 17:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1D53606FF;
	Sun, 10 Jul 2022 17:56:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1D53606FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qw_CvS-EA307; Sun, 10 Jul 2022 17:56:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C099560E42;
	Sun, 10 Jul 2022 17:56:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C099560E42
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EF5301BF405
 for <buildroot@lists.busybox.net>; Sun, 10 Jul 2022 17:56:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1A0C84114
 for <buildroot@lists.busybox.net>; Sun, 10 Jul 2022 17:56:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1A0C84114
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oF8JfiOi_ahD for <buildroot@lists.busybox.net>;
 Sun, 10 Jul 2022 17:56:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDEF983F52
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BDEF983F52
 for <buildroot@buildroot.org>; Sun, 10 Jul 2022 17:56:39 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 9-20020a1c0209000000b003a2dfdebe47so1019764wmc.3
 for <buildroot@buildroot.org>; Sun, 10 Jul 2022 10:56:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=480/WdqLmBu1s0t8kwCSYFa1+hgtcFB0O2uHHUU2WNE=;
 b=c1aQf4nrX6vOLzRd51aP4LsKMlCMjmsYdcnGXq5mmzxw/jutur6syViBZWmU4TNe8Z
 zogescf9RVqKNFaPNXihtWiujLcb0TX4rhp0o4DbPGmvGAKU7/qicHFqmqWtL4eZWh7R
 3PBcwQm6hLAAuYkqV0tfko2vKt1f4wDvgBO+hUTu/f41JG1lX+50RvIf8r+FRO73gDf2
 98g7DIlycLYeeFDmuIDkfAUxotGIIeEdhCMC9PR82/6IYuYJ+2/Hr1PvR5xMpjVaNL1f
 vSQzfJZ+KMMwYHMUKqDYaWZa3TnlgCHk6gRl8rTcWCgG6RSvn5ozbJd24/WQPj26pmfd
 yHSQ==
X-Gm-Message-State: AJIora8+anfw2s7QFq3DtZCw/soKDIgYexNc6FBP31mLVWW0+S0fSTLs
 Zizyvn8V2cBYtk8agBihiMAhnQBNOks=
X-Google-Smtp-Source: AGRyM1st4hKrIF7zcxZUbnkuGKX5miEZy7KgYsXXEdmy7B+B68gsgcngLpQ+Wj9mx4RqNMJH27ogWA==
X-Received: by 2002:a05:600c:4fc8:b0:3a1:987c:82d4 with SMTP id
 o8-20020a05600c4fc800b003a1987c82d4mr11656711wmq.26.1657475796761; 
 Sun, 10 Jul 2022 10:56:36 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a5d6941000000b00210bac248c8sm4057445wrw.11.2022.07.10.10.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 10:56:36 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 10 Jul 2022 19:53:34 +0200
Message-Id: <20220710175334.423426-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=480/WdqLmBu1s0t8kwCSYFa1+hgtcFB0O2uHHUU2WNE=;
 b=Ww4zZE3a1W84ZeGLHXMqL75UBcUU+DHwVKDnISn6lQZf8XY8bncR+B8w4yE3ZFuPA5
 5CehXwTGzm3MS4f9JhHe0Df+Mb+qdyuhZchNSYwF7jxP7qghpy9AZUUcl2j1N3TlwDDQ
 R34X25XbGSGbknO2jcpxLBxdQ+nv9qe92OrUbgp64vBSf9K6v/0VQSqyQ4KJvoYbZc8a
 KtFOpvUdbNYnZvDtW1uiTt8BdgrGn1ojIYtGZbbqO60MTzEHS89LeR+4X6mqjyHZLVow
 isz5CtDX2ff2yKAjzTs5ChRy9T0yq8MD0kqMmPx1PAXpi67Ulbl96efhukzy0aa/FDmn
 pvmg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Ww4zZE3a
Subject: [Buildroot] [PATCH 1/1] package/flatbuffers: bump to version 2.0.6
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

FLATBUFFERS_FLATC_EXECUTABLE must be set since
https://github.com/google/flatbuffers/commit/a592f4c89ebb688d4f9c9997f53baf1fad0de4c8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/flatbuffers/flatbuffers.hash | 2 +-
 package/flatbuffers/flatbuffers.mk   | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/flatbuffers/flatbuffers.hash b/package/flatbuffers/flatbuffers.hash
index b05b9e7b4b..6b54dbde92 100644
--- a/package/flatbuffers/flatbuffers.hash
+++ b/package/flatbuffers/flatbuffers.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  9ddb9031798f4f8754d00fca2f1a68ecf9d0f83dfac7239af1311e4fd9a565c4  flatbuffers-2.0.0.tar.gz
+sha256  e2dc24985a85b278dd06313481a9ca051d048f9474e0f199e372fea3ea4248c9  flatbuffers-2.0.6.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/flatbuffers/flatbuffers.mk b/package/flatbuffers/flatbuffers.mk
index 280834c2d4..2cbd68c346 100644
--- a/package/flatbuffers/flatbuffers.mk
+++ b/package/flatbuffers/flatbuffers.mk
@@ -4,16 +4,18 @@
 #
 ################################################################################
 
-FLATBUFFERS_VERSION = 2.0.0
+FLATBUFFERS_VERSION = 2.0.6
 FLATBUFFERS_SITE = $(call github,google,flatbuffers,v$(FLATBUFFERS_VERSION))
 FLATBUFFERS_LICENSE = Apache-2.0
 FLATBUFFERS_LICENSE_FILES = LICENSE.txt
 FLATBUFFERS_CPE_ID_VENDOR = google
 FLATBUFFERS_INSTALL_STAGING = YES
+FLATBUFFERS_DEPENDENCIES = host-flatbuffers
 
 FLATBUFFERS_CONF_OPTS += \
 	-DCMAKE_CXX_FLAGS="-std=c++11" \
-	-DFLATBUFFERS_BUILD_TESTS=OFF
+	-DFLATBUFFERS_BUILD_TESTS=OFF \
+	-DFLATBUFFERS_FLATC_EXECUTABLE=$(HOST_DIR)/bin/flatc
 
 ifeq ($(BR2_STATIC_LIBS),y)
 FLATBUFFERS_CONF_OPTS += -DFLATBUFFERS_BUILD_SHAREDLIB=OFF
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
