Return-Path: <SRS0=nMnf=MU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A357C4338F
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 07:46:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BE5060F9D
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 07:46:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9BE5060F9D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56D1D6084A;
	Wed, 28 Jul 2021 07:46:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lHyoa8o5gKTU; Wed, 28 Jul 2021 07:46:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3D646083B;
	Wed, 28 Jul 2021 07:46:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 35A991BF94B
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 07:46:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25004405B8
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 07:46:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=googlemail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9XTALw6_KDUP for <buildroot@lists.busybox.net>;
 Wed, 28 Jul 2021 07:46:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2A73E405A9
 for <buildroot@buildroot.org>; Wed, 28 Jul 2021 07:46:01 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id x11so2132382ejj.8
 for <buildroot@buildroot.org>; Wed, 28 Jul 2021 00:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=GPuG/GpJFMhuGUwyrSyUuDS/qNEybVGpywFUaauFB5U=;
 b=kSQ5QTS32NtamO2GsXdxSdJmnxy0smw9QVjCLQ/hkRBm70gfmWzyORTmoQojgOk/P4
 XO6EhaZ6qPXmfzCFxrfuHWaxxLriQdJkUqEiCfb3rneww4MoUR6/TcSwxqP986UxRhEy
 DRw8PMF5KzR79rNYhdo/864hsKlM06qgMpH2dldHfyxMDhmbvBU8jxeQ9nAlUWpQ/l1v
 7Au4uXmi56+yuGi/Flvx85NdUxTWqfbuYx9wDpNar12kFN0oeS7+kC95Eouo2+rHjeiL
 mi5jy551lBHpFkWPBxRr7RuDKH5JjvOl7gEvQ4bA6Qgu6lBxZ55E4oK8VV1mpPCi5WSk
 mTUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=GPuG/GpJFMhuGUwyrSyUuDS/qNEybVGpywFUaauFB5U=;
 b=ZkCU8jEO0rDtvgq3g+X8/J/Dw0h2n/VRfYE4VbASBPEYYYgHbuQswlINHdG93YUc7Q
 r25ZaLO/gl+6rqghKjJrX29yeFWkuIPw1MNTBiA3a/fzdRx/9XKE3SN2cCc0Oi/JlYFm
 q3xPoGDOYNtQKIEnHw/Qy/6L4/u/EDO8hDkPcDfsGlG/6DuWg37Hz7nq6on/+oVJQ/26
 6WzEUXd1I6lFTSN0rMMqJGPYNPGjajSj6Wb5fvXPuMJCg8E5xa53sfOrzV/JM7slEjqZ
 kpamAyNRGC09ZOEng6ObRfVnOsvzxn998Kwx3Nhjr3DRpI7J59YP4lLT2Ef8/PoSPY/p
 1BNQ==
X-Gm-Message-State: AOAM531WOGrWox77sdXQDTvkBOzrvM3KMM6dGW7WHm2D0Jzomt8aEkhE
 5AEOeI6x8eW2k/PNMC9wOZ7mcmuCgtsacw==
X-Google-Smtp-Source: ABdhPJzBKp2Qxzo2LaMD7C+udVsyHeuITcD3EGTbOFlaiJn4M/NlmGALfYbKJ5u3Fj2XxDpe1FZkbw==
X-Received: by 2002:a17:906:86c4:: with SMTP id
 j4mr16511046ejy.431.1627458359157; 
 Wed, 28 Jul 2021 00:45:59 -0700 (PDT)
Received: from development1.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202])
 by smtp.gmail.com with ESMTPSA id d23sm2250472edt.39.2021.07.28.00.45.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Jul 2021 00:45:58 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 28 Jul 2021 09:45:50 +0200
Message-Id: <20210728074550.523-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
Subject: [Buildroot] [PATCH] package/libmbim: bump to version 1.26.0
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
From: yegorslists--- via buildroot <buildroot@busybox.net>
Reply-To: yegorslists@googlemail.com
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Aleksander Morgado <aleksander@aleksander.es>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

From: Yegor Yefremov <yegorslists@googlemail.com>

This release introduces meson build system support that fixes
gobject-intorspection issue with autotools.

As meson files are only available in git, switch the location to
https://gitlab.freedesktop.org.

Since 1.26.0 libgudev is not required anymore so drop this dependency.

Add support for bash-completion.

Fixes:
http://autobuild.buildroot.net/results/f8a81aad0e262a567a2b31712575472ae92e5518

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libmbim/libmbim.hash |  2 +-
 package/libmbim/libmbim.mk   | 23 ++++++++++++++---------
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/package/libmbim/libmbim.hash b/package/libmbim/libmbim.hash
index 2779be1e96..07cfd69163 100644
--- a/package/libmbim/libmbim.hash
+++ b/package/libmbim/libmbim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  02590736163fff10e5732191fccc1b9920969616ddc59613a003052a116a3c25  libmbim-1.24.8.tar.xz
+sha256  63b53db0196dadea673f04524b0683ce40282f25bfd513d398e2a10b992cac01  libmbim-1.26.0.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index b343dec238..cdc3fabedb 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-LIBMBIM_VERSION = 1.24.8
-LIBMBIM_SITE = https://www.freedesktop.org/software/libmbim
-LIBMBIM_SOURCE = libmbim-$(LIBMBIM_VERSION).tar.xz
+LIBMBIM_VERSION = 1.26.0
+LIBMBIM_SITE = https://gitlab.freedesktop.org/mobile-broadband/libmbim/-/archive/$(LIBMBIM_VERSION)
 LIBMBIM_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
 LIBMBIM_LICENSE_FILES = COPYING COPYING.LIB
 LIBMBIM_CPE_ID_VENDOR = freedesktop
@@ -14,12 +13,18 @@ LIBMBIM_INSTALL_STAGING = YES
 
 LIBMBIM_DEPENDENCIES = libglib2
 
-# if libgudev available, request udev support
-ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
-LIBMBIM_DEPENDENCIES += libgudev
-LIBMBIM_CONF_OPTS += --with-udev
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+LIBMBIM_DEPENDENCIES += gobject-introspection
+LIBMBIM_CONF_OPTS += -Dintrospection=true
 else
-LIBMBIM_CONF_OPTS += --without-udev
+LIBMBIM_CONF_OPTS += -Dintrospection=false
 endif
 
-$(eval $(autotools-package))
+ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
+LIBMBIM_DEPENDENCIES += bash-completion
+LIBMBIM_CONF_OPTS += -Dbash_completion=true
+else
+LIBMBIM_CONF_OPTS += -Dbash_completion=false
+endif
+
+$(eval $(meson-package))
-- 
2.17.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
