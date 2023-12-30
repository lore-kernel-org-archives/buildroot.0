Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2041FC46CD2
	for <buildroot@archiver.kernel.org>; Sat, 30 Dec 2023 16:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A00C481098;
	Sat, 30 Dec 2023 16:39:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A00C481098
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M_mMhlQ_7E9s; Sat, 30 Dec 2023 16:39:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E05A581092;
	Sat, 30 Dec 2023 16:39:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E05A581092
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DA3141BF2F8
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 16:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C03C5414C9
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 16:39:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C03C5414C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rt98-aBSi6FL for <buildroot@lists.busybox.net>;
 Sat, 30 Dec 2023 16:39:17 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 851B94137D
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 16:39:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 851B94137D
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40d604b4b30so15712635e9.1
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 08:39:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703954355; x=1704559155;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9I7Ygf96/OMdgz3ozYDP9wvdzHUWeKG+vyuFn0QNvmY=;
 b=A+srMfrLbTQ0qp8udcd4GMtq3onEzWt+azoKCVFBZa8JHX0nQ/oXRoAJpOvzu4RgCu
 fsl/vETV48724dJ8vIrUUzVheg2IANUqK0PQiSOIAQhS7JX0IMD20MMYsNWDvop0o7tX
 9bQemPAfSllxGwpAd0KC+NbivYoAcoBq39WlzBsHCfrJ/usBhC0zJj3hmLm0IQNSE4hQ
 7sgixWu9Pn6X9ezFTA0VyCCgakeOFq5e3+ZPPGblTptIYrJSAwXrOVz5FIj9lBGZgEPP
 6FDPspBozpcTS2xZYk8Kerbq6nsP6Ngq+Ic4mLJtg7xYIQWu1L2CleXpjJd8v070DQ0J
 yVjw==
X-Gm-Message-State: AOJu0YyRH0rHlH/Q0YBPC7SVcjgzL6u9gGrNzEei2pDhG5z+yQ/pi/Po
 +K4aliKyHc7mpOAoocG3Tq1fCKXNX4c=
X-Google-Smtp-Source: AGHT+IFcKIAn0gzPOuyMqIFYrSCDVjYT4rE9sBMDNOccMJKBBtLO4IdRxscCxqs2PvF6+c1nyKB71g==
X-Received: by 2002:a7b:ca5a:0:b0:40d:285e:1d96 with SMTP id
 m26-20020a7bca5a000000b0040d285e1d96mr6857195wml.107.1703954354877; 
 Sat, 30 Dec 2023 08:39:14 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 hn34-20020a05600ca3a200b0040d1bd0e716sm34237811wmb.9.2023.12.30.08.39.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Dec 2023 08:39:14 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Dec 2023 17:38:44 +0100
Message-ID: <20231230163844.497714-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703954355; x=1704559155; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9I7Ygf96/OMdgz3ozYDP9wvdzHUWeKG+vyuFn0QNvmY=;
 b=gA3/HfqoJngv9nlugYX3E/q3UHFzMVfHM4S3gw0cMoMOx+45M0KJ4yixOmGheC6MMJ
 Q1QDqbFH6304aTuQm/2PKvi0vh2Axej98cmAIsyNwYc88Rq32U8a+hvsW/H0kHWEtrAI
 ifMbq7ZnYd/W7Vv2f+XpRhDeg9t2/0CgqV8ztgjJaV+2i0Ea9PPNQ5zbKj6qQlQpkhKz
 e7k27SIHp61T7r4tBnLCCNd+tip+4mAPJWTovlEU05AcncQEt8nwRhf7asPMJ+XWLEpD
 SgKFahQUin8jNDkFv9Q1cfxwlHuy1elxDoqq/aOmo91WhPXeQkCJdXZE4redBi6Y/dZw
 gs0Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gA3/Hfqo
Subject: [Buildroot] [PATCH 1/1] package/cracklib: bump to version 2.9.11
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/cracklib/cracklib/blob/v2.9.11/src/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cracklib/cracklib.hash | 4 ++--
 package/cracklib/cracklib.mk   | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/cracklib/cracklib.hash b/package/cracklib/cracklib.hash
index ff527d517a..a97818cbdd 100644
--- a/package/cracklib/cracklib.hash
+++ b/package/cracklib/cracklib.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  1f9d34385ea3aa7cd7c07fa388dc25810aea9d3c33e260c713a3a5873d70e386  cracklib-2.9.8.tar.bz2
-sha256  ec25ac4a474588c58d901715512d8902b276542b27b8dd197e9c2ad373739ec4  cracklib-words-2.9.8.bz2
+sha256  2c83a91dd21d035eab98bded764eb4579b73fd837b683e1a447b11ef604ee130  cracklib-2.9.11.tar.xz
+sha256  b3d1e0e0ae9bc7ffed65c0042d7c68bdb903368aa6b918f94572453c6ea874dc  cracklib-words-2.9.11.xz
 sha256  f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa  COPYING.LIB
diff --git a/package/cracklib/cracklib.mk b/package/cracklib/cracklib.mk
index bb7c18d5be..c1834b4730 100644
--- a/package/cracklib/cracklib.mk
+++ b/package/cracklib/cracklib.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CRACKLIB_VERSION = 2.9.8
-CRACKLIB_SOURCE = cracklib-$(CRACKLIB_VERSION).tar.bz2
+CRACKLIB_VERSION = 2.9.11
+CRACKLIB_SOURCE = cracklib-$(CRACKLIB_VERSION).tar.xz
 CRACKLIB_SITE = https://github.com/cracklib/cracklib/releases/download/v$(CRACKLIB_VERSION)
 CRACKLIB_LICENSE = LGPL-2.1
 CRACKLIB_LICENSE_FILES = COPYING.LIB
@@ -34,8 +34,8 @@ endif
 HOST_CRACKLIB_CONF_OPTS += --without-python --without-zlib
 
 ifeq ($(BR2_PACKAGE_CRACKLIB_FULL_DICT),y)
-CRACKLIB_EXTRA_DOWNLOADS = cracklib-words-$(CRACKLIB_VERSION).bz2
-CRACKLIB_DICT_SOURCE = $(CRACKLIB_DL_DIR)/cracklib-words-$(CRACKLIB_VERSION).bz2
+CRACKLIB_EXTRA_DOWNLOADS = cracklib-words-$(CRACKLIB_VERSION).xz
+CRACKLIB_DICT_SOURCE = $(CRACKLIB_DL_DIR)/cracklib-words-$(CRACKLIB_VERSION).xz
 else
 CRACKLIB_DICT_SOURCE = $(@D)/dicts/cracklib-small
 endif
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
