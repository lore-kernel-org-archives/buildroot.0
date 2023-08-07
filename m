Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE4CC00528
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 14:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C9A481375;
	Mon,  7 Aug 2023 14:59:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C9A481375
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vDrlBxFNiKqq; Mon,  7 Aug 2023 14:59:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C0C781E7D;
	Mon,  7 Aug 2023 14:59:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C0C781E7D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 131921BF2F6
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 14:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9F1440632
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 14:58:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9F1440632
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NHN39bK1kJIj for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 14:58:52 +0000 (UTC)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A7B9840309
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 14:58:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7B9840309
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3175d5ca8dbso3541444f8f.2
 for <buildroot@buildroot.org>; Mon, 07 Aug 2023 07:58:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691420330; x=1692025130;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iCFiKMGUx91waiQDJ/adMpDKTzPOTSpLSR1dwORL9f4=;
 b=Ugh62OyhsoZqa393coZwsEgXcokbYIKiFoPi+PN+b4UOiKPYXcAoj3p1blAexPfll6
 f9bj08ikWnQheitsP4CLRTGjTnwZuJIhrT6IJlYC+2gnxha5j7XUBwTHRnv6H45HK3R2
 L6jBJ/2VOTIcWI2ayT9Au7DzI3SljUkdUxmXw8nsOnjDxpjy68VHMndUNCv5Qn6ECQdf
 NPRzqsL68Q3SFDx7E3jqjLCcaxn9hSUqcxddvFFQRKuUJwikdP0+nBjYwWMuDLimk6fd
 tXHrBl92IgAaNLo6bsgfzSVf5/QHOyYhtbNg9oSEuMEK2+6IHYfIMCgd+I/9B+WWBHOx
 iGWw==
X-Gm-Message-State: AOJu0YxMQGxNBZRILSW7OYPsHikCuW1vhPh2RSeSkd0M7mXwWf4/4jvx
 PVq/x9Eg21Ka6vAsVbrEuEIo8h4c+XTvGQ==
X-Google-Smtp-Source: AGHT+IFNqY+BQW6yZwc5IQCe68ZYORyTDkp5Mk1yDHC01G84hOad8lV+eq0RiSOwt6r3NEfufVOQ6w==
X-Received: by 2002:a05:6000:10c6:b0:317:6fff:c32b with SMTP id
 b6-20020a05600010c600b003176fffc32bmr5230764wrx.53.1691420330214; 
 Mon, 07 Aug 2023 07:58:50 -0700 (PDT)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 r2-20020a5d4942000000b003063a92bbf5sm10784845wrs.70.2023.08.07.07.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 07:58:49 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Mon,  7 Aug 2023 16:58:37 +0200
Message-ID: <20230807145839.2375839-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691420330; x=1692025130;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=iCFiKMGUx91waiQDJ/adMpDKTzPOTSpLSR1dwORL9f4=;
 b=VXJMCa2HDO1iJMc7ZjON+8infkD2qvLcF+u1s6jQgOzikzqeGQy8jLeUD9+H75gKCt
 vZ5ZhE+lj14zxVZ+GmRLdz639D0YhhqhuqslLoHJKI67a+Y0zWcPvhhFjU4kjYy88vHA
 40ytAgSs7I16ZaFHRc+36gKbZCQmUMlJozePLBTfPmBHoKQ/neERwclPoXXmHue2Z75x
 e4i6zZMOdfxJbqPn+K+5qWwwALm12mZcRozh9K3E++5zw0f7fzYs7qme1z6P4b7qbM/P
 ffHluCWkVapbyaOL8zj+BifnPh9Db/9ZofHpPkJCuNyfaz46EHh4VwV0vHATCPu2Ka6n
 uaQA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=VXJMCa2H
Subject: [Buildroot] [PATCH v1 1/3 next] package/qt6/qt6serialport: use the
 CMAKE_NINJA flag
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the newly introduce backend option (4cf79d9b71ff5cf2aede3f21e09ade7c7ac59606)
to specify what cmake backend to use, instead of special-coding it's use.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/qt6/qt6serialport/qt6serialport.mk | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/package/qt6/qt6serialport/qt6serialport.mk b/package/qt6/qt6serialport/qt6serialport.mk
index 497719d4ec..bdb16dd892 100644
--- a/package/qt6/qt6serialport/qt6serialport.mk
+++ b/package/qt6/qt6serialport/qt6serialport.mk
@@ -10,6 +10,8 @@ QT6SERIALPORT_SOURCE = qtserialport-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6SERIALPORT
 QT6SERIALPORT_INSTALL_STAGING = YES
 QT6SERIALPORT_SUPPORTS_IN_SOURCE_BUILD = NO
 
+QT6SERIALPORT_CMAKE_BACKEND = ninja
+
 QT6SERIALPORT_LICENSE = \
 	GPL-2.0+ or LGPL-3.0, \
 	GPL-3.0 with exception (tools), \
@@ -25,7 +27,6 @@ QT6SERIALPORT_LICENSE_FILES = \
 	LICENSES/Qt-GPL-exception-1.0.txt
 
 QT6SERIALPORT_CONF_OPTS = \
-	-GNinja \
 	-DQT_HOST_PATH=$(HOST_DIR) \
 	-DBUILD_WITH_PCH=OFF \
 	-DQT_BUILD_EXAMPLES=OFF \
@@ -33,19 +34,6 @@ QT6SERIALPORT_CONF_OPTS = \
 
 QT6SERIALPORT_DEPENDENCIES = \
 	host-pkgconf \
-	host-ninja \
 	qt6base
 
-define QT6SERIALPORT_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(QT6SERIALPORT_BUILDDIR)
-endef
-
-define QT6SERIALPORT_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) DESTDIR=$(STAGING_DIR) $(BR2_CMAKE) --install $(QT6SERIALPORT_BUILDDIR)
-endef
-
-define QT6SERIALPORT_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) $(BR2_CMAKE) --install $(QT6SERIALPORT_BUILDDIR)
-endef
-
 $(eval $(cmake-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
