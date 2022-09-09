Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D01ECAAA1
	for <buildroot@archiver.kernel.org>; Fri,  9 Sep 2022 05:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A929941607;
	Fri,  9 Sep 2022 05:08:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A929941607
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TRZITepEn6cZ; Fri,  9 Sep 2022 05:08:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85E2B415F6;
	Fri,  9 Sep 2022 05:08:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85E2B415F6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 035901C2744
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 05:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D18F4402E8
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 05:08:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D18F4402E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P9OW1bs-JVG0 for <buildroot@lists.busybox.net>;
 Fri,  9 Sep 2022 05:08:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C45AD402C3
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C45AD402C3
 for <buildroot@buildroot.org>; Fri,  9 Sep 2022 05:08:16 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 u3-20020a4ab5c3000000b0044b125e5d9eso114914ooo.12
 for <buildroot@buildroot.org>; Thu, 08 Sep 2022 22:08:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=VsV4Ewq3uIcv6vHCN55PK+En7afmblICvh6LpAenhNw=;
 b=cA7fCHTgYlJmmS+9n5Gxq5HZ+DJyY7A+ExWPqVd0h2gXPFPmKInhJEm5nJgcp7XDlU
 S616xornPO/P0b5eTUsVihcMhiUQ13CrPlj8MXbPCny9PGy+sbaPf8YwZ0s9MtqTam8U
 UJMCS2NLjoar/AQObjDbUKbvjwlSENupp2s1AIt3443ynZfQy4FfG+30ZxdMe/GKzgQP
 +pL/3DDv7py6IdVR+qT7eq8u1wOx8w3KfRPj5LQLzh1OnDuYL5NI3Mq25QpYBF3pdlr6
 BmnUNtTCSGtBRU/qo1mDC48kA4ybuhdoZvav21M1BYwdrj0x9SLGpfYxU9nFciB+p8gB
 LDKg==
X-Gm-Message-State: ACgBeo0Km73z+rI/8NEUJfJOFlzRm0thzdoIUXC7y2s9kzGqCshKRU2B
 bZ8rLvDNxe6CjRXJl3M0HUzLz+OW+dA=
X-Google-Smtp-Source: AA6agR7MmVtxFav8XgjGvV12QvBid2OVINm6yZ+oKhBiDUGiBRrAJYRqJJhZDJhBsbK4EzueGDbzsA==
X-Received: by 2002:a4a:d0b3:0:b0:44b:5c3d:c75a with SMTP id
 t19-20020a4ad0b3000000b0044b5c3dc75amr4198562oor.30.1662700094027; 
 Thu, 08 Sep 2022 22:08:14 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net.
 [71.33.138.207]) by smtp.gmail.com with ESMTPSA id
 d85-20020a4a5258000000b004320b0cc5acsm283125oob.48.2022.09.08.22.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 22:08:13 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  8 Sep 2022 23:08:00 -0600
Message-Id: <20220909050800.3520691-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220909050800.3520691-1-james.hilliard1@gmail.com>
References: <20220909050800.3520691-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=VsV4Ewq3uIcv6vHCN55PK+En7afmblICvh6LpAenhNw=;
 b=ZCAoNJl25AIOBpsWIMwWxPnFDEW+7RWOguGCZmUe0lhbqUawjJ4/+ABpvVmHuGgRdR
 XddvSGOETqAqwrnz/H4SxqUpKeQ35lE/SqmMz+m2KIYhNFqxN5WRBXfMc8ZhCZjFBj/7
 +pdF6ALZiyfgBlFL75RP+7W0iJamA0YptIh2X0+3NCwWG3bOjRPxGNQp5M7RS8A9UagZ
 kNmooZ/euPenbUPaWKE7rPG3C5WFBenOaw2Gza80Uy9Acgj5/Nx67CP2OUqVoc6groO2
 DHp9ax4SIBjeUI5NrnPhFShdqX4FM1Sv2MX6aewBkADicW7SfhunWP8XFUXbO0WesfEk
 ppEQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZCAoNJl2
Subject: [Buildroot] [PATCH 2/2] package/cog: add weston direct display
 support
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable optional weston direct display support when weston is
available.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/cog/cog.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index 5f7abcab1f..1f24bebee4 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -14,11 +14,17 @@ COG_LICENSE_FILES = COPYING
 COG_CONF_OPTS = \
 	-DCOG_BUILD_PROGRAMS=ON \
 	-DCOG_PLATFORM_HEADLESS=ON \
-	-DCOG_WESTON_DIRECT_DISPLAY=OFF \
 	-DINSTALL_MAN_PAGES=OFF \
 	-DCOG_HOME_URI='$(call qstrip,$(BR2_PACKAGE_COG_PROGRAMS_HOME_URI))' \
 	-DUSE_SOUP2=ON
 
+ifeq ($(BR2_PACKAGE_WESTON),y)
+COG_CONF_OPTS += -DCOG_WESTON_DIRECT_DISPLAY=ON
+COG_DEPENDENCIES += weston
+else
+COG_CONF_OPTS += -DCOG_WESTON_DIRECT_DISPLAY=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_COG_PLATFORM_FDO),y)
 COG_CONF_OPTS += -DCOG_PLATFORM_WL=ON
 COG_DEPENDENCIES += libxkbcommon wayland-protocols
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
