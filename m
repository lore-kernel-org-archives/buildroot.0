Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E312C05027
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 14:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5A9440221;
	Sun, 12 Feb 2023 14:53:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5A9440221
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JWScaSVHRhSr; Sun, 12 Feb 2023 14:53:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B0414022B;
	Sun, 12 Feb 2023 14:53:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B0414022B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1E5FE1BF3B0
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 14:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0123D814A1
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 14:53:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0123D814A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aGHYzmcZJdBa for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 14:53:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5ADC8146E
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E5ADC8146E
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 14:53:17 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 k8-20020a05600c1c8800b003dc57ea0dfeso9598801wms.0
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 06:53:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KZbW/aonraaeKcWmnwIZtKMpR7G1S+54IuIAschI4YY=;
 b=fkl/8J2L6+TA2qzcBU9YyhcuySe6a2ucDzXE/GJmblXj8Vs2VF+XE7uBRxs++YKj7P
 +4toNi4ysw4PC08rKQVI8vTLIHtzkYB7hqvbQ19DBiwpgL40zeat4QyOnWthLujfTVKh
 ZqK+Yrl9G8PkRCSEwSenQrRnu5Xsfs/fVV9y1hAANd/qszhge2+84OB8YXv8mRr5KjJ2
 1alowQDKOIc0GMxE/NCfxUFOAi/dUuItNcT3+nBaCW9XVPAvw43j3wJyKBZ2jvEMWWOT
 hiiF0p+00XzZEHVr81EtUN5k00Uc0O0rChFCIcR/ujseWlwOV0/CXPx0DaDqH3/J/b6l
 nzaQ==
X-Gm-Message-State: AO0yUKUqW6+ToJ+SqtdX1nsQIFB5ns9Fv0gA73vX9vuIjVsrnJjTiDon
 5MwFIdMkYvPuvL64pE0XVR3JcH4LVsU=
X-Google-Smtp-Source: AK7set8OF8dKyDTdRE2miuIHu8wlCs4RFAsEpSXRn1fhXkN4CuSRm4+53YkmYrQ6iBAy5N8UguKBAA==
X-Received: by 2002:a05:600c:4e90:b0:3e1:df8d:e022 with SMTP id
 f16-20020a05600c4e9000b003e1df8de022mr3655950wmq.9.1676213595893; 
 Sun, 12 Feb 2023 06:53:15 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 o5-20020a1c7505000000b003dc48a2f997sm14186409wmc.17.2023.02.12.06.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 06:53:15 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Feb 2023 15:53:12 +0100
Message-Id: <20230212145312.1203134-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KZbW/aonraaeKcWmnwIZtKMpR7G1S+54IuIAschI4YY=;
 b=byy7eXYrW0Q5vKGHJwAmhr1JN7okaGWsyA7S7DjsKSOG787LP6+bSTrPehy9pSTKV/
 Tcpzycr0vsdz0YEB7yi2zz18uAFYNisJ6vlKfY/wXIYhGXS1CSyw9Voo+LNB0glClhde
 b9f1rqhIDqBMCDbr1JyZzuZnrK89Mkxq4bisSVSHooJ674scRpe5p2F1LCpVqMVv/VHK
 QOzBJEDMKtLN5h5HAxkbFDN/jOqia58P06BoB+isATiMXJta7q/hHTQ8R6xsdlVnNL6u
 Q+1ccHSRjXrRRcKQ8YoY4VScDNtAGxzvGoSJ3W56fcNQFn6y+wmFqXSC71Nw9aPweSO/
 cQgA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=byy7eXYr
Subject: [Buildroot] [PATCH 1/1] package/opencv3: bump to version 3.4.19
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This bump will fix the following build failure with gcc >= 12:

/home/thomas/autobuild/instance-1/output-1/build/opencv3-3.4.17/modules/core/src/persistence_base64.cpp: In function 'bool base64::base64_valid(const uint8_t*, size_t, size_t)':
/home/thomas/autobuild/instance-1/output-1/build/opencv3-3.4.17/modules/core/src/persistence_base64.cpp:167:31: error: comparing the result of pointer addition '(src + ((sizetype)off))' and NULL [-Werror=address]
  167 |     if (src == 0 || src + off == 0)
      |                     ~~~~~~~~~~^~~~
cc1plus: some warnings being treated as errors

Update hash of LICENSE file (update in year:
https://github.com/opencv/opencv/commit/f6fe5c07f61eb0bc934672200b2bfd453f2fc41d)

https://github.com/opencv/opencv/wiki/ChangeLog#version3419

Fixes:
 - http://autobuild.buildroot.org/results/cb9c120c15c8042e6919858d6885c1cc4d996c0c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/opencv3/opencv3.hash | 4 ++--
 package/opencv3/opencv3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/opencv3/opencv3.hash b/package/opencv3/opencv3.hash
index 30308188aa..3d6fd2ed8a 100644
--- a/package/opencv3/opencv3.hash
+++ b/package/opencv3/opencv3.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1353eec67849aadb20df71d8bae18b83708e18fc5da080fe5efeabb1e99b2ee8  opencv3-3.4.17.tar.gz
-sha256  9076d3d934839a2f8e7bfe549abda6faea4751f1edd6e9460ff703559890ad5f  LICENSE
+sha256  9b913e74299ce4416a5c94000da577c592bf670fd53bad16220eb115a0821529  opencv3-3.4.19.tar.gz
+sha256  c1fed9cd2f557ba23a1b37a21e2c90629d1a60bdb61e92d0e79369bb6fca3390  LICENSE
diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 8e4c90786e..29fb246e65 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENCV3_VERSION = 3.4.17
+OPENCV3_VERSION = 3.4.19
 OPENCV3_SITE = $(call github,opencv,opencv,$(OPENCV3_VERSION))
 OPENCV3_INSTALL_STAGING = YES
 OPENCV3_LICENSE = BSD-3-Clause
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
