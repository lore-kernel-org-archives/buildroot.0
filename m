Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F3EDC6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 17:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D073C405BD;
	Sun, 24 Mar 2024 17:35:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uoxAZ5Emk7YE; Sun, 24 Mar 2024 17:35:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A93F405BE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A93F405BE;
	Sun, 24 Mar 2024 17:35:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3C8131BF40A
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 17:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35C4A405BE
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 17:35:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ElO_fAU1nbbd for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 17:35:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9296B405BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9296B405BD
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9296B405BD
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 17:35:34 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2d21cdbc85bso50205071fa.2
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 10:35:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711301732; x=1711906532;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yaeSvOOv+BNwvQTF6BU45uIYiGvsh4RkMxQt2p4Krf8=;
 b=lw/ThUxUKUBIHg4axAi+i9Lrh0RR+AtTq/N75YICvk7bnQXgSaGUJHXXZEDFSGqBQL
 CXFSP79MoPQGm9I076O/+m9tMjwSLU28stE5rA5SS4WSIM7cDtWK0slLkRblyLAQhZMC
 cLMsQbAFDUJqi/i2m1lmsuLv2cvatLInn8noo8BRJAJj8Th3awVs4VE9HhQADtJotMZI
 xP2Vu9GWjSFZQg+BA1OLOw5eQnvBcIIfnrSQSZRe5KzE54JIwfp2PkcKlBCcapJTTFBQ
 b1Nw++M380Fe+10RFQeZ5s2gFMtG6FhVyckYq8aHfN9mFWGszA0H83G34tdZDtf9nvIj
 HhJQ==
X-Gm-Message-State: AOJu0YzjW6kTptD87J3DhWPLyXrGtK6ryNTxGils1W5lO+/YV3dUQ2i7
 /GFvBXjbamEyC/yi73bCPpmg7sXFuUVmt5ZnkDJ/YJEGcBavM8M25Nh6zjnc
X-Google-Smtp-Source: AGHT+IEaplT8N82VQvKRfNh69w5hLIoQcXoo6RuMGE2BQketOqY6kXyiEK40jt9DeJow1NzCu0TmsA==
X-Received: by 2002:a2e:3615:0:b0:2d4:3b15:5561 with SMTP id
 d21-20020a2e3615000000b002d43b155561mr3056199lja.40.1711301731603; 
 Sun, 24 Mar 2024 10:35:31 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 g4-20020a05600c310400b0041462294fe3sm5740389wmo.42.2024.03.24.10.35.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Mar 2024 10:35:31 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 18:35:19 +0100
Message-ID: <20240324173519.61770-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711301732; x=1711906532; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yaeSvOOv+BNwvQTF6BU45uIYiGvsh4RkMxQt2p4Krf8=;
 b=fFR60QhMb76i+9w01ubRXT6MhPJPO4l9zsJJ7wAoZWUbxGX8Dx8Cb+qbj3auJGwyhz
 aqNRt7An8puztrcVHhSTNxpDVUsfV4BLkD2Su+aRJuDCwr0jTWePvg376jN8FEaEAM5H
 cOgtd2DVRYMNjWrmD08C/M0VFMOInf5L48T2r+HmPRB3z2igkPe1HXEtddY8FlkgEatI
 t9wxSZKirUreM8GVi7NOEZiw1JdU+B3UVFIP7p2FAMW3dLLnGOpGy05r4MdCsAWMiGlM
 BPXebzG/yrw1tlCFUrtAOfZIjhDKv5vr6wwYlHpdT2EIs9WwATWNuaYZ3jxqMHHTQkIp
 E+0Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fFR60QhM
Subject: [Buildroot] [PATCH 1/1] package/paho-mqtt-cpp: bump to version 1.3.2
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
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>, Daniel Lang <dalang@gmx.at>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License updated to EPL-2.0 with
https://github.com/eclipse/paho.mqtt.cpp/commit/a7e9b1204296b16ddf2b5dbe23bc150cb1a04d5e

https://github.com/eclipse/paho.mqtt.cpp/blob/v1.3.2/CHANGELOG.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/paho-mqtt-cpp/paho-mqtt-cpp.hash | 4 ++--
 package/paho-mqtt-cpp/paho-mqtt-cpp.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/paho-mqtt-cpp/paho-mqtt-cpp.hash b/package/paho-mqtt-cpp/paho-mqtt-cpp.hash
index d9b86ce207..a35cd102b3 100644
--- a/package/paho-mqtt-cpp/paho-mqtt-cpp.hash
+++ b/package/paho-mqtt-cpp/paho-mqtt-cpp.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  435e97e4d5b1da13daa26cadd3e83fe9d154930abaa78b8ff1b8c854b5345d8b  paho-mqtt-cpp-1.2.0.tar.gz
+sha256  c271d521287f417102b447b3d1e8d17be0e0f6a3b0b653334ebcd2ccd20d1e46  paho-mqtt-cpp-1.3.2.tar.gz
 sha256  83bbba033dc985487e321b6dfde111772affb73460be48726299fed3da684b1c  edl-v10
-sha256  44277b2bec6093e4ac313afec251a4de599d24c4e768f8574d95b13a9d2d97b5  epl-v10
+sha256  0becf16567beb77fa252b7664631dd177c8f9a1889e48995b45379c7130e5303  epl-v20
diff --git a/package/paho-mqtt-cpp/paho-mqtt-cpp.mk b/package/paho-mqtt-cpp/paho-mqtt-cpp.mk
index 827946605a..2e0f409b96 100644
--- a/package/paho-mqtt-cpp/paho-mqtt-cpp.mk
+++ b/package/paho-mqtt-cpp/paho-mqtt-cpp.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PAHO_MQTT_CPP_VERSION = 1.2.0
+PAHO_MQTT_CPP_VERSION = 1.3.2
 PAHO_MQTT_CPP_SITE = $(call github,eclipse,paho.mqtt.cpp,v$(PAHO_MQTT_CPP_VERSION))
-PAHO_MQTT_CPP_LICENSE = EPL-1.0 or BSD-3-Clause
-PAHO_MQTT_CPP_LICENSE_FILES = epl-v10 edl-v10
+PAHO_MQTT_CPP_LICENSE = EPL-2.0 or BSD-3-Clause
+PAHO_MQTT_CPP_LICENSE_FILES = epl-v20 edl-v10
 PAHO_MQTT_CPP_INSTALL_STAGING = YES
 PAHO_MQTT_CPP_DEPENDENCIES = paho-mqtt-c
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
