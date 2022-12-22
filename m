Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F111BC4332F
	for <buildroot@archiver.kernel.org>; Thu, 22 Dec 2022 13:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E0C4820A3;
	Thu, 22 Dec 2022 13:32:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E0C4820A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QJjAeCnGXmXc; Thu, 22 Dec 2022 13:32:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8903A8209F;
	Thu, 22 Dec 2022 13:32:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8903A8209F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 63FF91BF96B
 for <buildroot@lists.busybox.net>; Thu, 22 Dec 2022 13:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BD1741767
 for <buildroot@lists.busybox.net>; Thu, 22 Dec 2022 13:32:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BD1741767
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zx7ppHBmO1KM for <buildroot@lists.busybox.net>;
 Thu, 22 Dec 2022 13:32:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6DDF4177F
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A6DDF4177F
 for <buildroot@buildroot.org>; Thu, 22 Dec 2022 13:32:52 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id y8so1619756wrl.13
 for <buildroot@buildroot.org>; Thu, 22 Dec 2022 05:32:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PSqvttcWhLIg2ev4/6SFkxhJnbQprVqeH+g2Rrj73oQ=;
 b=M78GZWjzuEkj9FIkSSAFfG3dJwY7nUbpf4eMaucSZkdfU3vR2aXxaufZTcf2zAbKSv
 4qNzXgQ3V94GEDYHOil886F2YqRHHgA3lV8e4gTAe6Ad/+aOuCF44XkArnPZ0RYN3oSH
 J8P2RO2hmIyduDjUQsnzis+x/o5jMzxOtRtIuSQ/pF7Ezr5BEg0226+IhyZ+ExMXj/aj
 agGLCDuSW1yfbN5sLZp65XlkXcdasjK2zZHWUfxY+rxl1HngopR62Z/WN2w7lnCrAhUe
 feWihIMru9pLpoiY4zdcHb4d5TBPONG+JvUsekpKn4e60XKY5XO9j5RPfBAoohWKhGbM
 M2wg==
X-Gm-Message-State: AFqh2kr3OsE7IqbIapLnbaTH4qrJ/qYOrABsusBaBXdhDVIdmucp/hdM
 qqmBRB++BpFuxonNhOafRjBqcuDXVJI=
X-Google-Smtp-Source: AMrXdXt8MykRh1i87O0W4ntPdQEPlMTLatOKbFT/LH6npfye+wUEFvMFWwKtSl2Hc6pgRr7dojyYAA==
X-Received: by 2002:a05:6000:16c4:b0:242:86d:9d70 with SMTP id
 h4-20020a05600016c400b00242086d9d70mr3800848wrf.71.1671715970236; 
 Thu, 22 Dec 2022 05:32:50 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 q8-20020adff788000000b0024258722a7fsm593013wrp.37.2022.12.22.05.32.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 05:32:49 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 22 Dec 2022 14:32:47 +0100
Message-Id: <20221222133247.85785-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PSqvttcWhLIg2ev4/6SFkxhJnbQprVqeH+g2Rrj73oQ=;
 b=chmTaxfFaDPPHWZ3CFVC4LjZH+rn+ZsHci3sBkYUnDUk7MRazjFSBsMSn0p2pOGOjO
 Fx9Yaaiz9wTFYGQ7kvOreKKSLjyPVbHQQrqFElMQcpAGobzqhhBRdWrKvJDDmUQX4PJA
 jSilZpyWjMEBr/zQGCTAyd+0i0OCeiS699TnhKzNMu7ZTgSTzIArywB69LDsWlvBR51K
 vPxMyWe49ZC+gldrU8wKaCnOGyB50erCi8SQxqBehm++2liiXKvsy9idpgz+V0uhaGDc
 YMlvO8u5fXgP5RqBK/zkvZReY+uogGXJTHAG6tSxADQg3qNjtsItK4fFuCpUtmFjYWyI
 WoUg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=chmTaxfF
Subject: [Buildroot] [PATCH 1/1] package/tiff: security bump to version 4.5.0
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

Fix CVE-2022-2056, CVE-2022-2057, CVE-2022-2058, CVE-2022-2519,
CVE-2022-2520, CVE-2022-2521, CVE-2022-2953, CVE-2022-34526,
CVE-2022-3570, CVE-2022-3597, CVE-2022-3598, CVE-2022-3599,
CVE-2022-3626, CVE-2022-3627 and CVE-2022-3970

- COPYRIGHT renamed to LICENSE.md and year updated with
  https://gitlab.com/libtiff/libtiff/-/commit/fa1d6d787fc67a1eeb3abccb790b5bee969d424b
- Use new --{en,dis}able options added by
  https://gitlab.com/libtiff/libtiff/-/commit/1ab0e2696a368a556b793a0941b5365e4d9f56ef

http://www.simplesystems.org/libtiff/releases/v4.5.0.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tiff/tiff.hash |  4 ++--
 package/tiff/tiff.mk   | 16 +++++++++-------
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/package/tiff/tiff.hash b/package/tiff/tiff.hash
index 6bd28a0f59..73732892a5 100644
--- a/package/tiff/tiff.hash
+++ b/package/tiff/tiff.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  917223b37538959aca3b790d2d73aa6e626b688e02dcda272aec24c2f498abed  tiff-4.4.0.tar.gz
-sha256  fbd6fed7938541d2c809c0826225fc85e551fdbfa8732b10f0c87e0847acafd7  COPYRIGHT
+sha256  c7a1d9296649233979fa3eacffef3fa024d73d05d589cb622727b5b08c423464  tiff-4.5.0.tar.gz
+sha256  0780558a8bfba0af1160ec1ff11ade4f41c0d7deafd6ecfc796b492a788e380d  LICENSE.md
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 525712c9e9..7981bdf2c9 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -4,16 +4,18 @@
 #
 ################################################################################
 
-TIFF_VERSION = 4.4.0
+TIFF_VERSION = 4.5.0
 TIFF_SITE = http://download.osgeo.org/libtiff
 TIFF_LICENSE = tiff license
-TIFF_LICENSE_FILES = COPYRIGHT
+TIFF_LICENSE_FILES = LICENSE.md
 TIFF_CPE_ID_VENDOR = libtiff
 TIFF_CPE_ID_PRODUCT = libtiff
 TIFF_INSTALL_STAGING = YES
 
 TIFF_CONF_OPTS = \
+	--disable-contrib \
 	--disable-cxx \
+	--disable-tests \
 	--without-x
 
 TIFF_DEPENDENCIES = host-pkgconf
@@ -23,7 +25,8 @@ HOST_TIFF_CONF_OPTS = \
 	--without-x \
 	--disable-zlib \
 	--disable-lzma \
-	--disable-jpeg
+	--disable-jpeg \
+	--disable-tests
 HOST_TIFF_DEPENDENCIES = host-pkgconf
 
 ifneq ($(BR2_PACKAGE_TIFF_CCITT),y)
@@ -84,12 +87,11 @@ ifneq ($(BR2_PACKAGE_TIFF_JBIG),y)
 TIFF_CONF_OPTS += --disable-jbig
 endif
 
-TIFF_SUBDIRS = port libtiff
 ifeq ($(BR2_PACKAGE_TIFF_UTILITIES),y)
-TIFF_SUBDIRS += tools
+TIFF_CONF_OPTS += --enable-tools
+else
+TIFF_CONF_OPTS += --disable-tools
 endif
 
-TIFF_MAKE = $(MAKE) SUBDIRS="$(TIFF_SUBDIRS)"
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
