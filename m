Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F17B7C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 23:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 864E84189F;
	Sun, 24 Jul 2022 23:59:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 864E84189F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hQIlrp1mqmg0; Sun, 24 Jul 2022 23:59:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53F6841846;
	Sun, 24 Jul 2022 23:59:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53F6841846
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CE6541BF20B
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 23:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A877540242
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 23:59:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A877540242
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KozJHOBf-2c6 for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 23:59:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E3F4400CC
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E3F4400CC
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 23:59:51 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 p6-20020a17090a680600b001f2267a1c84so11157110pjj.5
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 16:59:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ePHvfR3yCxcn4iybLgJ92rbSMedmuBLpiAeDoPWfN7M=;
 b=sDVQnwCFNNZJx6mETrntgLyFHrIevoZy8vXpJTx2Uak8+kAiqPiSk4naNifec5EzWH
 kFZ0YxeD7KUkAVC6MqZ8mLmZEBmzUB3ril9wp98Ni323Ns1bsg60A5U41VnQJPSqyZXP
 z6ss06dOUueamzB2z+BfPnWuE2jxhB30C3nJAf1WbofSKuoio6yswEfB1JmouARRXJTE
 67qNNRLSyc7JuwmkdE0vC82CTxbFtaV84+MpO3dM+n0PPeHcX7gyp34pTdf47GNjiPu0
 UO2HJ3cQEnaqJszOLg8yn4JhVuz3Gax0rtbW8vuUJ9HywH6pjy69HWVjnb0hGKCHFtWH
 /ZXw==
X-Gm-Message-State: AJIora8vsN+tG/o5OgOW2NGrmMapxbS6UsWcG7cSvB+jmmZYRatgoKFA
 yEOX3Ga3N37H6Lbgh/XO65sXKKA1QiJPEA==
X-Google-Smtp-Source: AGRyM1tdgV24N0sQ30fqFDMVlTl86DlmXDSKvkASFc0qVvz/a/milXETw8dAy2xwvq/15RiiIlLgZg==
X-Received: by 2002:a17:90b:4a90:b0:1f0:4059:b2e5 with SMTP id
 lp16-20020a17090b4a9000b001f04059b2e5mr11241495pjb.241.1658707189886; 
 Sun, 24 Jul 2022 16:59:49 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 203-20020a6214d4000000b0052ba5fe74c8sm8055456pfu.54.2022.07.24.16.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jul 2022 16:59:49 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 16:59:47 -0700
Message-Id: <20220724235947.680436-1-christian@paral.in>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rtl8812au-aircrack-ng: bump to
 latest cab4e4
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump to the latest commit hash as of 2022-06-16.

Fixes the build against kernel 5.18.x.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash | 2 +-
 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
index 667cf34efc..7dfa51f8b3 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  749ba2e77d0364381445e40f7f0b7041d861cf9a356dbe53085e3abaef888c1d  rtl8812au-aircrack-ng-37e27f9165300c89607144b646545fac576ec510.tar.gz
+sha256  20b498bc597e5343ee6c240eabd45c36894db86c76f6bfc100448c8b9c420733  rtl8812au-aircrack-ng-cab4e4ec56884f65e0c279c1b5ceaf70dbe79be0.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
index 55c118a825..3393c5b8fa 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8812AU_AIRCRACK_NG_VERSION = 37e27f9165300c89607144b646545fac576ec510
+RTL8812AU_AIRCRACK_NG_VERSION = cab4e4ec56884f65e0c279c1b5ceaf70dbe79be0
 RTL8812AU_AIRCRACK_NG_SITE = $(call github,aircrack-ng,rtl8812au,$(RTL8812AU_AIRCRACK_NG_VERSION))
 RTL8812AU_AIRCRACK_NG_LICENSE = GPL-2.0
 RTL8812AU_AIRCRACK_NG_LICENSE_FILES = LICENSE
@@ -12,7 +12,7 @@ RTL8812AU_AIRCRACK_NG_LICENSE_FILES = LICENSE
 RTL8812AU_AIRCRACK_NG_MODULE_MAKE_OPTS = \
 	CONFIG_88XXAU=m \
 	KVER=$(LINUX_VERSION_PROBED) \
-	USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN"
+	USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN -Wno-error=array-bounds"
 
 $(eval $(kernel-module))
 $(eval $(generic-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
