Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC76C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 08:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1AB460F0D;
	Fri, 22 Jul 2022 08:54:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1AB460F0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s3ZqvhUPHAz9; Fri, 22 Jul 2022 08:54:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9739660F05;
	Fri, 22 Jul 2022 08:54:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9739660F05
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 48D431BF34F
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 08:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23BA240A1B
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 08:54:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23BA240A1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UZnBpBN8yTY1 for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 08:54:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 213F740A30
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 213F740A30
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 08:54:40 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id ez10so7343920ejc.13
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 01:54:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J6XQNOM4XY1OvZ3CfSuE/tzVstJr5jDnOzUOb/N4Yis=;
 b=RVDcalo5YGJSNMJZ+DGsv5NiV30Vf9dtpKBJULjs7thR5KOlvLyniz0dcbBSxID8Qs
 T/ioF+RAeHFtfp8XuC8bm7NaZ6KHnPo5kI7f4ZVrlXqv/OEUoaVqXPmjXYN6fVCqBW+K
 JiIDRgYDx/TOwQj1GRgEBLLBL/o4IE7ciFBrdVFRxHqfpbFGxg+92gxhslbGq6HfQ2cN
 +fvNUiY4K15QIHelocOci9bSdpAG5KeBE5o5GI5kH0xgl15A/rYhA3Om8ShB7UUUD6jz
 VWTCuvJAbm6VJ0uF1ElhX+sLeqBbzOFYC87Kqbbc9G32D5junO6dJMHXZylpcBd3FVMT
 IkqA==
X-Gm-Message-State: AJIora9YaDHQB4BLlshyCit9sVATNb6f1OgvxFxxEg3itskuskajrL+Y
 bPeeMYr5KlE6PUlsxU8HEwGxCBS5JtPuvuAx
X-Google-Smtp-Source: AGRyM1tBmNIpGPv7zSSun/QgfD/ShuDxNJdZPmdUIkDSkyj819uvyc5ebLSQHZTHLdViqjvGTcPfRA==
X-Received: by 2002:a17:907:7f04:b0:72b:4ae6:7e1b with SMTP id
 qf4-20020a1709077f0400b0072b4ae67e1bmr2252917ejc.393.1658480079100; 
 Fri, 22 Jul 2022 01:54:39 -0700 (PDT)
Received: from lmecxl1178.lme.st.com
 ([2a04:cec0:10fe:4180:33f2:cfe8:3447:ab97])
 by smtp.gmail.com with ESMTPSA id
 t25-20020aa7d719000000b0043a6c9e50f4sm2205718edq.29.2022.07.22.01.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 01:54:38 -0700 (PDT)
From: Etienne Carriere <etienne.carriere@linaro.org>
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 10:53:45 +0200
Message-Id: <20220722085348.645793-2-etienne.carriere@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220722085348.645793-1-etienne.carriere@linaro.org>
References: <20220722085348.645793-1-etienne.carriere@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J6XQNOM4XY1OvZ3CfSuE/tzVstJr5jDnOzUOb/N4Yis=;
 b=xMxAOCmfruYwfQIZZXns2c4M8gst8geCvlZ64yMO8DDnnofkc97J9XWqUSzSfmw+rW
 5YV7UrxoLoOUA0yf/6anHvFBCzViEmGOqiMqkh8DITHFS5GkkNdjQBldtC93wzkjGtK9
 +muAwLWRyO7yDgunHuu75MaBbex3arm4o1Dav5okUszYfEuO8xACXtZ20pXG+YWsVRow
 qdTiLL+BmQHKc2ue6lgddbhzElmNjZl9AzmYYJ46s/zWn0BCGMiLAe6q1YX9NyuWnxEt
 ELjMONsHMD6CUT4hktKhM9G1hl3J9BnaqpR7MuXgtbx+4CPGVDYTKUwNwPj9lsWqheT/
 dYyA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=xMxAOCmf
Subject: [Buildroot] [PATCH 2/5] package/optee-client: bump to version 3.18.0
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
Cc: Etienne Carriere <etienne.carriere@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bumps OP-TEE Client package version to OP-TEE release 3.18.0.
Removes patch that has been merged between OP-TEE tags 3.17.0 and 3.18.0.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 ...rc-tee_supplicant.c-fix-build-withou.patch | 39 -------------------
 package/optee-client/optee-client.hash        |  4 +-
 package/optee-client/optee-client.mk          |  2 +-
 3 files changed, 3 insertions(+), 42 deletions(-)
 delete mode 100644 package/optee-client/0001-tee-supplicant-src-tee_supplicant.c-fix-build-withou.patch

diff --git a/package/optee-client/0001-tee-supplicant-src-tee_supplicant.c-fix-build-withou.patch b/package/optee-client/0001-tee-supplicant-src-tee_supplicant.c-fix-build-withou.patch
deleted file mode 100644
index e41c9138ee..0000000000
--- a/package/optee-client/0001-tee-supplicant-src-tee_supplicant.c-fix-build-withou.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From f2a7c942393c6383ac89d9264999cd9c93a70b80 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 14 May 2022 19:33:57 +0200
-Subject: [PATCH] tee-supplicant/src/tee_supplicant.c: fix build without
- plugins
-
-Fix the following build failure with CFG_TEE_SUPP_PLUGINS != y raised
-since version 3.17.0 and commit [1].
-
-/home/giuliobenetti/autobuild/run/instance-2/output-1/build/optee-client-3.17.0/tee-supplicant/src/tee_supplicant.c:104:22: error: 'TEE_PLUGIN_LOAD_PATH' undeclared here (not in a function); did you mean 'TEEC_LOAD_PATH'?
-  104 |  .plugin_load_path = TEE_PLUGIN_LOAD_PATH,
-      |                      ^~~~~~~~~~~~~~~~~~~~
-      |                      TEEC_LOAD_PATH
-
-Link: [1] https://github.com/OP-TEE/optee_client/commit/876b1ae719e12890ddd96e85cd4e9862dab46448
-Fixes: http://autobuild.buildroot.org/results/384e0ca894dbc0ec72cea76141de890f1ce484db
-Reviewed-by: Jerome Forissier <jerome.forissier@linaro.org>
-Reviewed-by: Etienne Carriere <etienne.carriere@linaro.org>
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/OP-TEE/optee_client/commit/f2a7c942393c6383ac89d9264999cd9c93a70b80]
----
- tee-supplicant/src/tee_supplicant.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/tee-supplicant/src/tee_supplicant.c b/tee-supplicant/src/tee_supplicant.c
-index 7b186ed9..53c29a26 100644
---- a/tee-supplicant/src/tee_supplicant.c
-+++ b/tee-supplicant/src/tee_supplicant.c
-@@ -101,7 +101,9 @@ static struct tee_shm *shm_head;
- 
- struct tee_supplicant_params supplicant_params = {
- 	.ta_dir = "optee_armtz",
-+#ifdef TEE_PLUGIN_LOAD_PATH
- 	.plugin_load_path = TEE_PLUGIN_LOAD_PATH,
-+#endif
- 	.fs_parent_path  = TEE_FS_PARENT_PATH,
- };
- 
diff --git a/package/optee-client/optee-client.hash b/package/optee-client/optee-client.hash
index d2efb1043a..8e55bf5725 100644
--- a/package/optee-client/optee-client.hash
+++ b/package/optee-client/optee-client.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_client/archive/3.17.0/optee-client-3.17.0.tar.gz
-sha256  bf62ceaac59e8a650abf7632e702b5929335f4974f3173f8c51900cb0f91660f  optee-client-3.17.0.tar.gz
+# From https://github.com/OP-TEE/optee_client/archive/3.18.0/optee-client-3.18.0.tar.gz
+sha256  ecc0f04fdd5398aa52fea50427fbd624f7f90274aec7bbf2cc8a5bd16758202b  optee-client-3.18.0.tar.gz
 # Locally computed
 sha256  fda8385993f112d7ca61b88b54ba5b4cbeec7e43a0f9b317d5186703c1985e8f  LICENSE
diff --git a/package/optee-client/optee-client.mk b/package/optee-client/optee-client.mk
index aaf072b40f..252841ba10 100644
--- a/package/optee-client/optee-client.mk
+++ b/package/optee-client/optee-client.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_CLIENT_VERSION = 3.17.0
+OPTEE_CLIENT_VERSION = 3.18.0
 OPTEE_CLIENT_SITE = $(call github,OP-TEE,optee_client,$(OPTEE_CLIENT_VERSION))
 OPTEE_CLIENT_LICENSE = BSD-2-Clause
 OPTEE_CLIENT_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
