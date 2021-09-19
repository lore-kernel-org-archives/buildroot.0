Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34F91C433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 20:20:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA7E460E9C
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 20:20:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AA7E460E9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69B8760794;
	Sun, 19 Sep 2021 20:20:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aVYcS13mxdoF; Sun, 19 Sep 2021 20:20:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C769E6073D;
	Sun, 19 Sep 2021 20:20:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5FB271BF4D5
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 20:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F4C3403B6
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 20:20:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O7U9Pq_5YN4t for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 20:20:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5AE8140311
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 20:20:27 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id w17so16800224wrv.10
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 13:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=srqPUI9gdmyTT5NuWcLgeFffjzupkFBQvP2DAOmJgfA=;
 b=hHukkAknNNPjJM0EoLY/bCGgormV+bOMD331Y5AsVWq0+8vZW6RFCuVaa8GMTSCh72
 AlvwFciT2YWnmgWdG9JjSug+i8/K1epoEuJ/fks6RXUXESA+mKvWm07sdchOBls9oPng
 DzG+M/5Em87XF+tYqfcMCwO7/0C0qG81NtWulomRMoeph0Tzly0zZSvyb5ujp2c5jlgk
 RJBwNcXAd/+r2PnZ9Z2pWHTK1/vGJBAeIOHv+Agyb4+PrhccsqF8//FZLdtraGaTXrDi
 sbBwrEwAuP/eFLy3rhzUVM0utzzkG7pCQc+RmA6luvr1tQ+KnF0P7atOgiIfQ+c4Bv32
 FodA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=srqPUI9gdmyTT5NuWcLgeFffjzupkFBQvP2DAOmJgfA=;
 b=jn8eyuN0lzddStNkW50qzlm6sqQrCBCSZgMi2ZZ1ETOoL98dBu0xdhytZ7Jl5c+ewk
 KvQC7cTJTuUGF5KVBvImGL/DMp0mm84DQILB9KUWeVUpZuMrhBYm3gbVoyL+j5D8+SM5
 hDYtu+Pc4KO1InSJSaeGLRfs7vv3hpn47KTHrMD/ZW3S/HEZWVw1n5y6ILhOYnfYP0DL
 4/Mx2YupcFxFugTI9A/+SJ8rODu34N6p0dTt70Fg4PDorzUYjbsAP1zgAg26P47ue1tW
 xud/mZYHGn3jtzuWfoQrAjVKuHP5DU7dtvJ3sfEwcvrR1oWkp8F3AOuDkMeCpJtrhjkf
 yOQA==
X-Gm-Message-State: AOAM531ru6744GfI+X9A6f21t3RF3Tfy39Ppy7tZAY03c3JsPolsZevQ
 sg74ZLgfz59w3y8NELSIAusWrfSFGNo=
X-Google-Smtp-Source: ABdhPJxQwoDHKlhQx4RhQRpKy6bTBT0/ldyIz+uTR1vA0OEmxsMgq/KCv6zvGZXG7gtaLAvKRJBrzg==
X-Received: by 2002:a5d:43ca:: with SMTP id v10mr25222632wrr.139.1632082825272; 
 Sun, 19 Sep 2021 13:20:25 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id g131sm12472852wme.22.2021.09.19.13.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 13:20:24 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Sep 2021 22:20:10 +0200
Message-Id: <20210919202010.64464-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libsysfs: bump to version 2.1.1
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

- Switch to github to get latest release
- Update hash of license files (gnu.org license files are used since
  https://github.com/linux-ras/sysfsutils/commit/b69c2046ce8307804e91403643d43baad086feb3)

https://github.com/linux-ras/sysfsutils/releases/tag/v2.1.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libsysfs/Config.in     | 2 +-
 package/libsysfs/libsysfs.hash | 6 +++---
 package/libsysfs/libsysfs.mk   | 7 ++++---
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/libsysfs/Config.in b/package/libsysfs/Config.in
index 2cbebaa530..076490ec42 100644
--- a/package/libsysfs/Config.in
+++ b/package/libsysfs/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_LIBSYSFS
 	  These are a set of utilities built upon sysfs, a filesystem in
 	  Linux 2.6 kernels that exposes a system's device tree.
 
-	  http://linux-diag.sourceforge.net/Sysfsutils.html
+	  https://github.com/linux-ras/sysfsutils
diff --git a/package/libsysfs/libsysfs.hash b/package/libsysfs/libsysfs.hash
index 5d32300ad1..3d2d03fcdd 100644
--- a/package/libsysfs/libsysfs.hash
+++ b/package/libsysfs/libsysfs.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  e865de2c1f559fff0d3fc936e660c0efaf7afe662064f2fb97ccad1ec28d208a  sysfsutils-2.1.0.tar.gz
-sha256  88ced477f0659c5a4df22df3b65de2f12ea3a9c7b5e4750fdc757bc11e97aa79  cmd/GPL
-sha256  4eb1c0ea980e7e4c7fac34e025be0423f5e7ca7df501e1da7ef31f32f14d6cf9  lib/LGPL
+sha256  f7f669d27c997d3eb3f3e014b4c0aa1aa4d07ce4d6f9e41fa835240f2bf38810  libsysfs-2.1.1.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  cmd/GPL
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  lib/LGPL
diff --git a/package/libsysfs/libsysfs.mk b/package/libsysfs/libsysfs.mk
index 6cff8bf5fe..94de9e4314 100644
--- a/package/libsysfs/libsysfs.mk
+++ b/package/libsysfs/libsysfs.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-LIBSYSFS_VERSION = 2.1.0
-LIBSYSFS_SITE = http://downloads.sourceforge.net/project/linux-diag/sysfsutils/$(LIBSYSFS_VERSION)
-LIBSYSFS_SOURCE = sysfsutils-$(LIBSYSFS_VERSION).tar.gz
+LIBSYSFS_VERSION = 2.1.1
+LIBSYSFS_SITE = $(call github,linux-ras,sysfsutils,v$(LIBSYSFS_VERSION))
 LIBSYSFS_INSTALL_STAGING = YES
 LIBSYSFS_LICENSE = GPL-2.0 (utilities), LGPL-2.1+ (library)
 LIBSYSFS_LICENSE_FILES = cmd/GPL lib/LGPL
 LIBSYSFS_CPE_ID_VENDOR = sysfsutils_project
 LIBSYSFS_CPE_ID_PRODUCT = sysfsutils
+# From git
+LIBSYSFS_AUTORECONF = YES
 
 $(eval $(autotools-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
