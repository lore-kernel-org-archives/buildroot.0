Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E73C00140
	for <buildroot@archiver.kernel.org>; Fri, 12 Aug 2022 21:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10C1660B97;
	Fri, 12 Aug 2022 21:01:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10C1660B97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qHDJ6HufOJgr; Fri, 12 Aug 2022 21:01:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DF0760B74;
	Fri, 12 Aug 2022 21:01:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DF0760B74
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 76FF41BF354
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 21:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F71260B86
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 21:01:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F71260B86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QhYYEjPmuzJc for <buildroot@lists.busybox.net>;
 Fri, 12 Aug 2022 21:01:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 353CD60B6B
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 353CD60B6B
 for <buildroot@buildroot.org>; Fri, 12 Aug 2022 21:01:52 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 s11-20020a1cf20b000000b003a52a0945e8so1055217wmc.1
 for <buildroot@buildroot.org>; Fri, 12 Aug 2022 14:01:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=nqL5MvHUXzbeKhXBMAca/iHWuOxoBEqNTStks+pvz3A=;
 b=msnVaV1faatLyY0YUQ3iUKpMwGgwMHyUfNpBWICeZ3VFZ1jcO7rzQLoX3wv6aiaBYk
 iSsPvLG+VQgdtvbwpNp4bdRvJe973/ONiiIG3uMoi7AS0SWgRhNXfQSKuoBQH/696wFd
 WCzdTUXnC/uMDQvccuGmNrEPbnSIWEzct2Vj6FgOTqYvzVjl9kauS8R8eefMVE0xbthl
 X0RMvSCYEjH+85sJTla9thBYRojn+uEQbTnnV8PezWn5ygx63VEkh2LgzKTuOZgU80aS
 DLDdwLohjOIuYiXsbFR8tWuMiZrL5CYnAN0DxqywbeW6cDDkm/gO+FE9+y98KlPMEA8L
 U0kw==
X-Gm-Message-State: ACgBeo2X2RKLafxLrEOF/gTW6MpRC0WwQ1vM3ZbLKRavXpS0fT509iUb
 gLiiQDAnl2sAo8Rs+Xpusnf+jqsas1g=
X-Google-Smtp-Source: AA6agR4HMOSk2RncWt7CamxLkgg0UrrJ+QXP6PxEtOfk+Id+kdXg6SpuRkfW6efNiapW5KjEe5Ak3A==
X-Received: by 2002:a05:600c:600a:b0:3a5:b621:9d1b with SMTP id
 az10-20020a05600c600a00b003a5b6219d1bmr9235357wmb.42.1660338110083; 
 Fri, 12 Aug 2022 14:01:50 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b0001a8063f329e0108.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:1a8:63f:329e:108])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a05600c4f8600b003a5bd9448e5sm631742wmq.28.2022.08.12.14.01.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 14:01:49 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 12 Aug 2022 23:01:47 +0200
Message-Id: <20220812210147.178027-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=nqL5MvHUXzbeKhXBMAca/iHWuOxoBEqNTStks+pvz3A=;
 b=GejDuZteJKp8V9aBNmkNLasCwH3jaUFkCsWa2aeHAuuLE+9NDBnNGKZkR7L14sOiff
 Y5ubGkhLs9ujsF2kr1SvmfqhPcxpFplEFrQRqeZhnByyoNEmjRb5yi6F65EcbrjuJosO
 lbivhsu35TZBXzNXBzS9Ern5QlABeVBLhXd57doI1mPigJiCjAFecmjDU/AJ6wzMmlNy
 j8pjmW7uljRR43Tj75YtXR85TXMpt3RfjlfpRb0aPdnzaNAxdNMzHUNGIdRDB8u5HU0x
 1+csYuxeKGkx796U4IYDtJPPLq1kvn2Ona4e97oDG+6+K0cQKQhJkgF09Jzyvv2ZWq8S
 vcgA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GejDuZte
Subject: [Buildroot] [PATCH 1/1] package/ocrad: fix static build
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
Cc: Gilles Talis <gilles.talis@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following static build failure raised since bump to version 0.28
in commit 1b677db703dc0b976a707942bbc94ecd3f7b4b4b:

/home/buildroot/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/buildroot/autobuild/run/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libpng.a(png.o): in function `png_reset_crc':
png.c:(.text+0x738): undefined reference to `crc32'

Fixes:
 - http://autobuild.buildroot.org/results/97543d8df5c40818e05622490e4aad60b48934a6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ocrad/ocrad.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/ocrad/ocrad.mk b/package/ocrad/ocrad.mk
index 78638b770a..5a68427bfb 100644
--- a/package/ocrad/ocrad.mk
+++ b/package/ocrad/ocrad.mk
@@ -10,12 +10,14 @@ OCRAD_SITE = $(BR2_GNU_MIRROR)/ocrad
 OCRAD_LICENSE = GPL-2.0+
 OCRAD_LICENSE_FILES = COPYING
 OCRAD_INSTALL_STAGING = YES
-OCRAD_DEPENDENCIES = libpng
+OCRAD_DEPENDENCIES = host-pkgconf libpng
+OCRAD_LIBS = `$(PKG_CONFIG_HOST_BINARY) --libs libpng`
 
 # This is not a true autotools package.
 define OCRAD_CONFIGURE_CMDS
 	cd $(@D) && \
-	$(TARGET_MAKE_ENV) ./configure --prefix=/usr --sysconfdir=/etc $(TARGET_CONFIGURE_OPTS)
+	$(TARGET_MAKE_ENV) ./configure --prefix=/usr --sysconfdir=/etc \
+		LIBS="$(OCRAD_LIBS)" $(TARGET_CONFIGURE_OPTS)
 endef
 
 define OCRAD_BUILD_CMDS
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
