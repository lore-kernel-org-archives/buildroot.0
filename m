Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5836C04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 01:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE29241795;
	Thu, 28 Jul 2022 01:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE29241795
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7SHwsdX8bS_P; Thu, 28 Jul 2022 01:44:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBA2941793;
	Thu, 28 Jul 2022 01:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBA2941793
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A0A0F1BF393
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 01:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82ACD81A81
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 01:44:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82ACD81A81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qP_Vk3ZywMbv for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 01:44:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA8CC81778
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CA8CC81778
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 01:44:12 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id o2so436554iof.8
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 18:44:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7ePjTBfM4iUAWkoOiWl/0q6NmCMzJEzZk/3tQU/6XmY=;
 b=3XSX15Dr76wuWEdGJ46HULzfJqODd9f1mef7ayLFPpIozfk2+A0yfGDGukZuqkJ0rk
 m6koTD/3WtM8Ps4VYaxzRi7vqPJ6xs1I0BKwIa8D6HdrktN02qwdBkN1ZvKz3gLqYgO0
 PqhmHRNnVVSk2mLIxD9WVFSCyJ5Zz/os5AqO3IGqnRFoWqemdGDJ3evltLLwWBfy1nUA
 BqP1VMhhB+BqZl49rOU/hF8auNELP8fCxqpdm3USIAV68wwO8b9lmga94updkDzWn1DG
 SX+ZUZEhgMX6HmMixgj6cT3dvZvj5yXAMIInunW7lhf8BnxXwmeXH7LFI89gld2QKwMb
 RvMA==
X-Gm-Message-State: AJIora8gZdxUyrBV/lQQw+l89A8neQ4xYGET/LFGYIFRaI6iaBSGQ+VG
 KsRdAzuMU3hoVjyxAgzdkruLm6Gzm+bz+w==
X-Google-Smtp-Source: AGRyM1t0V9ffXU8MSHxxuD9DNjXOFk1H+KPCdqskt6bYMtJx0+kKKNdrPDtY2JOXM8GI090PF7fzIg==
X-Received: by 2002:a05:6602:26c3:b0:66c:f8b2:53c with SMTP id
 g3-20020a05660226c300b0066cf8b2053cmr8508124ioo.50.1658972651678; 
 Wed, 27 Jul 2022 18:44:11 -0700 (PDT)
Received: from james-x399.localdomain (71-33-133-32.hlrn.qwest.net.
 [71.33.133.32]) by smtp.gmail.com with ESMTPSA id
 i2-20020a6bb802000000b0067bcb28e036sm9037283iof.49.2022.07.27.18.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 18:44:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 19:44:01 -0600
Message-Id: <20220728014402.142320-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7ePjTBfM4iUAWkoOiWl/0q6NmCMzJEzZk/3tQU/6XmY=;
 b=AvrDBMoET23NFbIA/LIKKmT1IZhOfbdbE8CfS/ese6Id29OPPkVm0H6N8pG06DXcHG
 pNs2wZG+5m4bVcnauMWH0jvpsB9rQV3fVNrqX8YCqr7fyHJW3k2nJWvnq2Pl8J2RHr+2
 sFOTLoC/iSLfzlY2/dMHMljnZPZ/WcfH9qnPYL2WwAZis35S0S3w4oUXx/uyaGXMH8am
 it1zqK/i+PSpOLusg9NwxbTuoa1f5LyiYhTIIlXVABMOcOxCOktdfbfSDbe1QIOzldZn
 uBonbyKsAoRFtqZSdyWzyM+1HbF49eJu3lf0dx2oVSO1aNoBqHlp1JceO+szUFRn1v/L
 pA8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=AvrDBMoE
Subject: [Buildroot] [PATCH 1/2] support/misc/toolchainfile.cmake.in: set
 PKG_CONFIG/CMAKE prefix paths
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

These appear to not be getting set correctly and are needed when using
meson's relocatable pkgconfig format.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 support/misc/toolchainfile.cmake.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/support/misc/toolchainfile.cmake.in b/support/misc/toolchainfile.cmake.in
index 5d2b8695b4..2c6adfd02d 100644
--- a/support/misc/toolchainfile.cmake.in
+++ b/support/misc/toolchainfile.cmake.in
@@ -91,6 +91,12 @@ endif()
 if(NOT DEFINED CMAKE_FIND_ROOT_PATH_MODE_INCLUDE)
   set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
 endif()
+if(NOT DEFINED PKG_CONFIG_USE_CMAKE_PREFIX_PATH)
+  set(PKG_CONFIG_USE_CMAKE_PREFIX_PATH ON)
+endif()
+if(NOT DEFINED CMAKE_PREFIX_PATH)
+  set(CMAKE_PREFIX_PATH "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@/usr")
+endif()
 set(ENV{PKG_CONFIG_SYSROOT_DIR} "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@")
 
 # This toolchain file can be used both inside and outside Buildroot.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
