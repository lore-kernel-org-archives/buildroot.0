Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A543CA0ED3
	for <buildroot@archiver.kernel.org>; Wed,  4 Sep 2024 08:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B89F80F89;
	Wed,  4 Sep 2024 08:51:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tiJ-ibHTLnXO; Wed,  4 Sep 2024 08:51:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 469CC80F09
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 469CC80F09;
	Wed,  4 Sep 2024 08:51:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 326721BF356
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 08:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 202E7606D6
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 08:51:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zPNqjI17GKd0 for <buildroot@lists.busybox.net>;
 Wed,  4 Sep 2024 08:51:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::544; helo=mail-ed1-x544.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B2BAA606C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2BAA606C4
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B2BAA606C4
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 08:51:47 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id
 4fb4d7f45d1cf-5c26e5d05d3so225155a12.0
 for <buildroot@buildroot.org>; Wed, 04 Sep 2024 01:51:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725439905; x=1726044705;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aLSDoBRXv3+3yPVtgbHcPyW3PLfr3YCF7Mn/IK5a+Z8=;
 b=dHaBudWUTfOrADjjvNGNT2s8/5whvT0mlJuFZIlntO6pCOpqqkXlV+lqF58FLIJdzy
 KRxTC92MXbvgEayAhmmgXQaY3pEXIQbrMMgNtD4E/d0Pg5O3YY1yzlhtEtJl5JE6wH/a
 YeSc4eie29o20LF5G2kUS07Tmj+LDp5j7GtBhgGiA2+z1lomfFCZZw6tin3nq9Z4yW7K
 +EUyU3BrWd1N6Ojr6OfY/2nqewyHhhFXpjsj/rMHbF+8qszY1uFNP0qYWGbjge3zuVGt
 N6PJvSSKe8AI4XZGMreTGawi6ncd/tPoHSH+7J/94mxxAoo78SAT2oyg4+LKE49ZCSZG
 gUQQ==
X-Gm-Message-State: AOJu0YwMLCPy73rJ46H8bjjlcb0J+VCEenAx4cyykgKu9Bfiy2WBtQL5
 QjRg+8z+PPunIrkhz50f4tQMuATPH7umKZMEy5ZQXZ2oDgQczL5K9gmymfnvLUFTxQuqktXxbGR
 29rHiMBT0
X-Google-Smtp-Source: AGHT+IH9DaZyDpZyERjSWlXcb27XIWk0mMj7xAyhbH91fZAGkewvloIKNxwHwZnSZbxsLUKaYpC3FA==
X-Received: by 2002:a05:6402:50c9:b0:5c2:6f74:782f with SMTP id
 4fb4d7f45d1cf-5c26f7479aemr1792939a12.5.1725439904469; 
 Wed, 04 Sep 2024 01:51:44 -0700 (PDT)
Received: from adam-laptop.ipgroup.local (212-57-59-66.xdsl.deanconnect.nl.
 [212.57.59.66]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226c7c2aesm7429566a12.51.2024.09.04.01.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 01:51:44 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  4 Sep 2024 10:51:40 +0200
Message-ID: <20240904085140.1307904-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1725439905; x=1726044705;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aLSDoBRXv3+3yPVtgbHcPyW3PLfr3YCF7Mn/IK5a+Z8=;
 b=GqTzPuQruVnWqboE0bP17DF0hC44FJ6mWAHV+Ad6BYhBZgAlaxW2BUgOO//FjuTi4R
 opymbXSTLZowvMe4Ilub8ts1tO/ZzE02CAgG94NucnM5IFknVwCw7k6v6OMJ9Uj2Y6VW
 iNKwVEzmRJGHg1gCOcHZ4g3u3IXkO3zk1+/Pg=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=GqTzPuQr
Subject: [Buildroot] [PATCH 1/1] package/openjdk{-bin}: bump versions to
 17.0.12+7 and 21.0.4+7
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

./support/testing/run-tests tests.package.test_openjdk.TestOpenJdk.test_run
passed without issue.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/openjdk-bin/{17.0.9_9 => 17.0.12_7}/openjdk-bin.hash | 4 ++--
 package/openjdk-bin/{21.0.1_12 => 21.0.4_7}/openjdk-bin.hash | 4 ++--
 package/openjdk-bin/openjdk-bin.mk                           | 4 ++--
 package/openjdk/openjdk.hash                                 | 4 ++--
 package/openjdk/openjdk.mk                                   | 4 ++--
 5 files changed, 10 insertions(+), 10 deletions(-)
 rename package/openjdk-bin/{17.0.9_9 => 17.0.12_7}/openjdk-bin.hash (53%)
 rename package/openjdk-bin/{21.0.1_12 => 21.0.4_7}/openjdk-bin.hash (53%)

diff --git a/package/openjdk-bin/17.0.9_9/openjdk-bin.hash b/package/openjdk-bin/17.0.12_7/openjdk-bin.hash
similarity index 53%
rename from package/openjdk-bin/17.0.9_9/openjdk-bin.hash
rename to package/openjdk-bin/17.0.12_7/openjdk-bin.hash
index 29f39c5d36..4a7c84eb87 100644
--- a/package/openjdk-bin/17.0.9_9/openjdk-bin.hash
+++ b/package/openjdk-bin/17.0.12_7/openjdk-bin.hash
@@ -1,6 +1,6 @@
 # https://github.com/adoptium/temurin17-binaries/releases
-sha256  7b175dbe0d6e3c9c23b6ed96449b018308d8fc94a5ecd9c0df8b8bc376c3c18a  OpenJDK17U-jdk_x64_linux_hotspot_17.0.9_9.tar.gz
-sha256  e2c5e26f8572544b201bc22a9b28f2b1a3147ab69be111cea07c7f52af252e75  OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.9_9.tar.gz
+sha256  9d4dd339bf7e6a9dcba8347661603b74c61ab2a5083ae67bf76da6285da8a778  OpenJDK17U-jdk_x64_linux_hotspot_17.0.12_7.tar.gz
+sha256  8257de06bf37f0c8f19f8d542e2ab5a4e17db3ca5f29d041bd0b02ab265db021  OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.12_7.tar.gz
 
 # Locally calculated
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
diff --git a/package/openjdk-bin/21.0.1_12/openjdk-bin.hash b/package/openjdk-bin/21.0.4_7/openjdk-bin.hash
similarity index 53%
rename from package/openjdk-bin/21.0.1_12/openjdk-bin.hash
rename to package/openjdk-bin/21.0.4_7/openjdk-bin.hash
index 35be28bb4f..a73bea1a77 100644
--- a/package/openjdk-bin/21.0.1_12/openjdk-bin.hash
+++ b/package/openjdk-bin/21.0.4_7/openjdk-bin.hash
@@ -1,6 +1,6 @@
 # From https://github.com/adoptium/temurin21-binaries/releases
-sha256  1a6fa8abda4c5caed915cfbeeb176e7fbd12eb6b222f26e290ee45808b529aa1  OpenJDK21U-jdk_x64_linux_hotspot_21.0.1_12.tar.gz
-sha256  e184dc29a6712c1f78754ab36fb48866583665fa345324f1a79e569c064f95e9  OpenJDK21U-jdk_aarch64_linux_hotspot_21.0.1_12.tar.gz
+sha256  51fb4d03a4429c39d397d3a03a779077159317616550e4e71624c9843083e7b9  OpenJDK21U-jdk_x64_linux_hotspot_21.0.4_7.tar.gz
+sha256  d768eecddd7a515711659e02caef8516b7b7177fa34880a56398fd9822593a79  OpenJDK21U-jdk_aarch64_linux_hotspot_21.0.4_7.tar.gz
 
 # Locally calculated
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index 0280151fba..17056e80b7 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -6,10 +6,10 @@
 
 ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_21),y)
 HOST_OPENJDK_BIN_VERSION_MAJOR = 21
-HOST_OPENJDK_BIN_VERSION_MINOR = 0.1_12
+HOST_OPENJDK_BIN_VERSION_MINOR = 0.4_7
 else
 HOST_OPENJDK_BIN_VERSION_MAJOR = 17
-HOST_OPENJDK_BIN_VERSION_MINOR = 0.9_9
+HOST_OPENJDK_BIN_VERSION_MINOR = 0.12_7
 endif
 
 ifeq ($(HOSTARCH),x86_64)
diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
index 949a62e527..209004a292 100644
--- a/package/openjdk/openjdk.hash
+++ b/package/openjdk/openjdk.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  9943e3814d3c1a31f1449f09a8b67df54841944f855a1d372be892c5e6b19217  openjdk-21.0.1+12.tar.gz
-sha256  836adb5fec5a58ce2f49a0faeaf9e69a3cb89865f4d855c6098f0264843672ad  openjdk-17.0.9+9.tar.gz
+sha256  b8b37fa6fcc284d91e7458c703ca4c893a1dd5a6e0f6b9e198e7d13cd8efd24d  openjdk-21.0.4+7.tar.gz
+sha256  ccb7d37c24f9f5808f9d25419d93680570dc600f292e68944032338cb4b2c51e  openjdk-17.0.12+7.tar.gz
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index f4e1920e6c..446e4aa3c2 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -6,10 +6,10 @@
 
 ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_21),y)
 OPENJDK_VERSION_MAJOR = 21
-OPENJDK_VERSION_MINOR = 0.1+12
+OPENJDK_VERSION_MINOR = 0.4+7
 else
 OPENJDK_VERSION_MAJOR = 17
-OPENJDK_VERSION_MINOR = 0.9+9
+OPENJDK_VERSION_MINOR = 0.12+7
 endif
 OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)
 OPENJDK_SITE = $(call github,openjdk,jdk$(OPENJDK_VERSION_MAJOR)u,jdk-$(OPENJDK_VERSION))
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
