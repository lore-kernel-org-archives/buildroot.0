Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBEA9C4167B
	for <buildroot@archiver.kernel.org>; Fri,  1 Dec 2023 21:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F826847F8;
	Fri,  1 Dec 2023 21:06:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F826847F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P8aUsIrGxJzY; Fri,  1 Dec 2023 21:06:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E033884850;
	Fri,  1 Dec 2023 21:06:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E033884850
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B33A21BF35F
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 21:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A5736FADE
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 21:06:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A5736FADE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zvXOgfic2wYg for <buildroot@lists.busybox.net>;
 Fri,  1 Dec 2023 21:06:51 +0000 (UTC)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3505C6FAC9
 for <buildroot@buildroot.org>; Fri,  1 Dec 2023 21:06:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3505C6FAC9
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3316d09c645so2276166f8f.0
 for <buildroot@buildroot.org>; Fri, 01 Dec 2023 13:06:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701464809; x=1702069609;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Fk9hjdv9attA/EEB3N9PCVXsNeyZFPiK5BX81599EkU=;
 b=DBIBbyHcYUfzfleFApqhGw4Jegsuu5f2Vdhga4R585NsKbWNF+TtYiG3n4dpS9Gbfm
 cV3DK1aEGjG2NUwiL8j5Hy/o0VxjkHKPmM0Qc1rBiec0Zfv2nKLcimYO872OtXYPrpDh
 qxurt1bIz3LriF0IR2TGXHyPWHeOZuz9GFCI/d3kcy2IR63x18Imhw4nFGZ6vNKAN3kZ
 xlQxSBhSfXR5WsKyDNEVMKN8OuGMsPgcKFvHa35rayv1WDGg3Xf9KLFasQQmdg8nkBWS
 kcETjWtN3D7qhFDNeL3cGpdi7lW2U2g2dIqslNu892mOE5mzxLUjnJ5qJegzH2mu8lyX
 5GjQ==
X-Gm-Message-State: AOJu0YxvsZ2lbEawhY+Oz8nV0sZ+tV1PlvSsAk7eZbPca0L7clUMQ4Hk
 2Rm2GhgvUuTYtveqr0dbpwKzd59npZ4=
X-Google-Smtp-Source: AGHT+IGCCOte9nx1xi0qNr6PjjK4IujUaFIiJkfSQ4z1Or3eSBZb+zTKQK3gixMkqbReuoiqWVI/9Q==
X-Received: by 2002:a5d:4b10:0:b0:333:1907:c2a7 with SMTP id
 v16-20020a5d4b10000000b003331907c2a7mr1253942wrq.37.1701464808767; 
 Fri, 01 Dec 2023 13:06:48 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 t3-20020adfe443000000b00332fcdafc22sm5131854wrm.70.2023.12.01.13.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 13:06:48 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Dec 2023 22:06:45 +0100
Message-ID: <20231201210645.781257-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701464809; x=1702069609; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Fk9hjdv9attA/EEB3N9PCVXsNeyZFPiK5BX81599EkU=;
 b=R/FxA6e3Ut0OtpXJpX3hroHDx2aCNjgWTMLrWpneVidy3ZUJT3lJHUYbfp+FdAGsTI
 GxG2btxbZX/eNxTGgAC+wE7zm8XZ15QwivG0W0tQgLutVcsw25HLzwm994r7J1jVJ767
 3h25Fx8GAuE/1XtDeJyWat+mWrO6UAofU0x2Ad7pnspBFWFGG0LlnoPa5fyZVHltZzrR
 Ics+XvEzWqjgULYzjWiS94SkXcMQPx/MpnfrzKadxAn9CFBS3UVo4JYyY4zIG2TCd+Fw
 CyTKQI+TfJZBIOPb9uiAoAx7s9aSJjB/9HO7I6/pBHKVgmkszPF4rLZvnu5Jlvg0NMd2
 XPrA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=R/FxA6e3
Subject: [Buildroot] [PATCH v2, 1/1] package/monit: fix openssl static build
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--with-ssl-dir will exclusively search for dynamic library so use
--with-ssl-static to fix the following openssl static build failure
raised since bump to version 5.33.0 in commit
8cedb39764f70f9d467bf0cc1acc99a8bbb963d6:

checking for static SSL support... disabled
checking for SSL support... enabled
checking for SSL include directory... /home/buildroot/autobuild/instance-2/output-1/host/mipsel-buildroot-linux-uclibc/sysroot/usr/include
checking for SSL library directory... /lib64

[...]

mipsel-buildroot-linux-uclibc-gcc: ERROR: unsafe header/library path used in cross-compilation: '-L/lib64'

Fixes:
 - http://autobuild.buildroot.org/results/4189decbafb5d28c11d89ddac792b4610abeaff1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Yann E. Morin):
 - Only pass --with-ssl when building dynamically as this flag is
   ignored when building --with-ssl-static

 package/monit/monit.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/monit/monit.mk b/package/monit/monit.mk
index 4766ce3d9e..c709f903e6 100644
--- a/package/monit/monit.mk
+++ b/package/monit/monit.mk
@@ -27,7 +27,11 @@ MONIT_CONF_OPTS += \
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 MONIT_CONF_ENV += LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
+ifeq ($(BR2_STATIC_LIBS),y)
+MONIT_CONF_OPTS += --with-ssl-static=$(STAGING_DIR)/usr
+else
 MONIT_CONF_OPTS += --with-ssl --with-ssl-dir=$(STAGING_DIR)/usr
+endif
 MONIT_DEPENDENCIES += host-pkgconf openssl
 else
 MONIT_CONF_OPTS += --without-ssl
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
