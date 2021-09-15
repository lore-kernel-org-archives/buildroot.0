Return-Path: <SRS0=vgbW=OF=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A53F3C433F5
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 19:15:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B6456113E
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 19:15:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2B6456113E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED3C860B52;
	Wed, 15 Sep 2021 19:15:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f9uoXRzPNmRj; Wed, 15 Sep 2021 19:15:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B07E60C06;
	Wed, 15 Sep 2021 19:15:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F080D1BF30F
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 19:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFAE740645
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 19:15:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Js6GLhB3yiIi for <buildroot@lists.busybox.net>;
 Wed, 15 Sep 2021 19:15:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 47B5F4063B
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 19:15:22 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id u18so3806218wrg.5
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 12:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FgdOWprbVkH7KiH2trVff7sC9BD/z5qk4e7rXSzemm0=;
 b=ViFYMILBR4+zeUuoa8+MQvrHtefh69QJUcaRSyaaIQrlDt6in3XhY+1b5rWXfU2V/I
 w7tghcxjA7pwsO7NP5Wkxo8EZwOJriXCQrISDrmaAJYySITncQNdi97XbOnEWAvvCe3b
 IhmD5DgV5AmH6nfAQyWLdqQSOzJS2X5i3PDFu7VcPLOzEaTgfYh++YssaQa7bg0vh+yG
 bBHARDHREjrfQsCM2PXXikQNI6rsMDvB4jcv9VmWokITOIXU/OTgP124LyyICT6z9S/Y
 xiMzdQXJIK488TT+A50I+TCetwiqcMAXjNO3eqYtUm5tqTnHZBBNOS/hqFPfyJmSCR06
 QoNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FgdOWprbVkH7KiH2trVff7sC9BD/z5qk4e7rXSzemm0=;
 b=jMmo7DUk/ugda3IXoHGd9jwCLdVUznWIkWp16xwcb2Fq4paz2PJTJQuUsA/hdc6obS
 gsKOT7KR5OvRj5opMCli89y2tF2bzJCAaFc1TRDtIii+G1+jMWTsjGf0lOA+ncc57OSu
 qK1sm2o8yPvpaLRbtFjrOmD/yC4a67qerVNDNXkXvvUz3+Ml4vjJ00I8ooXSLx4xjLoA
 6S4zrFowWG/czSmSrRnpzzs44LBz0kaEpLKq7Tq1jD9LJpABJE2x0likzyuDGD1IsoTG
 5QdB3+e/eZPlg1mramOoS+Mfm9glnwFKEaM5YDqizhvsdyNZqiIfTMoU/iOwSEPMfwwA
 6GDg==
X-Gm-Message-State: AOAM532fI2CXQfqvoKuOY09zg02ngu8PiZDYsf8WKctRzZ+ZpElqvNDB
 iGwdcbXj+7zhRoNdBYMnpxIj2ObbFu4=
X-Google-Smtp-Source: ABdhPJwTDg1+daAWaK3L4t1gLZXMIB5D+BfnnG8RHkwEA9Fp7LtCQ0C+J1tWvBXbut8BNMsdSOBckA==
X-Received: by 2002:adf:9f4d:: with SMTP id f13mr1741345wrg.169.1631733320439; 
 Wed, 15 Sep 2021 12:15:20 -0700 (PDT)
Received: from dell5510.suse.de (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id r25sm848042wra.76.2021.09.15.12.15.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 12:15:19 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 15 Sep 2021 21:15:13 +0200
Message-Id: <20210915191513.14918-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libqmi: bump version to 1.30.2
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
Cc: Aleksander Morgado <aleksander@aleksander.es>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Drop patch from this release.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 ...build-meson-fix-introspection-option.patch | 33 -------------------
 package/libqmi/libqmi.hash                    |  2 +-
 package/libqmi/libqmi.mk                      |  2 +-
 3 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 package/libqmi/0001-build-meson-fix-introspection-option.patch

diff --git a/package/libqmi/0001-build-meson-fix-introspection-option.patch b/package/libqmi/0001-build-meson-fix-introspection-option.patch
deleted file mode 100644
index 0528868025..0000000000
--- a/package/libqmi/0001-build-meson-fix-introspection-option.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From bfb066419f288764edbade1e27e93a5dda59a5f4 Mon Sep 17 00:00:00 2001
-From: Aleksander Morgado <aleksander@aleksander.es>
-Date: Fri, 6 Aug 2021 10:32:22 +0200
-Subject: [PATCH] build,meson: fix introspection option
-
-Using -Dintrospection=false would actually not disable it. There is no
-longer an "auto" option for the introspection support, it will be
-either enabled or disabled depending on what the user asks
-for (default enabled).
-
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
----
- meson.build | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index b25bca57..d28e5601 100644
---- a/meson.build
-+++ b/meson.build
-@@ -218,7 +218,10 @@ version_conf.set10('QMI_QRTR_SUPPORTED', enable_qrtr)
- version_conf.set10('QMI_RMNET_SUPPORTED', enable_rmnet)
-
- # introspection support
--enable_gir = dependency('gobject-introspection-1.0', version: '>= 0.9.6', required: get_option('introspection')).found()
-+enable_gir = get_option('introspection')
-+if enable_gir
-+  dependency('gobject-introspection-1.0', version: '>= 0.9.6')
-+endif
-
- random_number = qmi_minor_version + meson.version().split('.').get(1).to_int()
-
---
-2.17.0
diff --git a/package/libqmi/libqmi.hash b/package/libqmi/libqmi.hash
index 0373bb4e75..1f2da45ac0 100644
--- a/package/libqmi/libqmi.hash
+++ b/package/libqmi/libqmi.hash
@@ -1,4 +1,4 @@
 # Locally computed:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
-sha256  c0421684c12697c448077dd5c0a66c6f745deab3558af578e3f10307c8a0c564  libqmi-1.30.0.tar.gz
+sha256  2eb7c7971b91a64ad830643b0170cff692a69bf0f093ca61d72d3f466a0272d4  libqmi-1.30.2.tar.gz
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index 05fd3ae9af..cd2c2719f9 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBQMI_VERSION = 1.30.0
+LIBQMI_VERSION = 1.30.2
 LIBQMI_SITE = https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/archive/$(LIBQMI_VERSION)
 LIBQMI_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
 LIBQMI_LICENSE_FILES = COPYING COPYING.LIB
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
