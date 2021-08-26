Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 759FDC4320A
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 14:03:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A78D6054E
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 14:03:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2A78D6054E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C530E6143C;
	Thu, 26 Aug 2021 14:03:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i1iNq8a39WZ4; Thu, 26 Aug 2021 14:03:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5810E6143D;
	Thu, 26 Aug 2021 14:03:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AD0A81BF41D
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 14:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A514E406DA
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 14:03:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=googlemail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m2TKYlk26fGp for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 14:03:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C505D400C9
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 14:03:05 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id z19so4819645edi.9
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 07:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=NSlCqRHvTajMEwkfAA+Gd2Ht8IAOZ0Y4MuiqxszbePA=;
 b=LGDzk2bpMJRaXWexX1Pe4qODutkVX7PMtW0AYMtNJtfrhM5JmHxFbvEHZSGRiWdgl5
 A2D3knQuUyiZ88sdFYnM3TeVgUj1s9yvskwBROi6OmZgNu781WUn/IqCtQxcc/gE92vi
 GdVtVRV4ifY+ERrB7XJiEyrSoBlVrwSS7tXeMSvTkjfKpGsV1xbIpjF0nA5xbxgYIuXe
 Lw9WdXq4st4Na1EZN6ASLAfFRVtaClZ0MJ4u+CIjaiGq/C5E2N+cUZUOYeMXst0x2edS
 44pqe4DnzJfgyn7d9SKXuraLCV0+F9qphX4BH5oaQcV2yzMb+61um8LjI3rtv7V06n5x
 axBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=NSlCqRHvTajMEwkfAA+Gd2Ht8IAOZ0Y4MuiqxszbePA=;
 b=XsK2XkTURM1APFU7fkFF8WzOnLDp2E5DllvQtt0lmVMH5ZVAHoxgCctgcTiotTSe+E
 TLIzEaaihZLGTjIfa/beh+R2+vFLDfbamV8jha3i/fc2i9v/YqZsIsS5hl8ZuzdLq9x7
 f42BdRD618wCVaD0A3d/vQETyEidrL6ekiTYI4TZWqzeT2y8gTVMDtLbRAUob5h4G+a1
 OOE8eTU6UYrFa2obqj1SdCFaXrDeRe2qQEGC/Vqv01wTKjrKUn+5089kYvPoG28frFFW
 x6DTJDR7QGn/1gWCnh5d/HEFhr5z0GMnUqCmu4EzZT5srG3+jCl4EptpGnaV235kFMgK
 NJYQ==
X-Gm-Message-State: AOAM532LrqzvBfSJncnedisPv1mQZUX91Q2SUoPe889ppz8a8oUK0neI
 krxeBKw61xgDgBtaqG9kB3vFcedFT0U=
X-Google-Smtp-Source: ABdhPJxd807TPamL8x1awADxcMzKG9TaIDdHcq+mUBzbMc34r4la445XZgRbqH8kCFrM3DAgDLwyEA==
X-Received: by 2002:a05:6402:52:: with SMTP id
 f18mr4359181edu.338.1629986583693; 
 Thu, 26 Aug 2021 07:03:03 -0700 (PDT)
Received: from development1.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202])
 by smtp.gmail.com with ESMTPSA id qt23sm1499129ejb.26.2021.08.26.07.03.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 26 Aug 2021 07:03:03 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 26 Aug 2021 16:02:58 +0200
Message-Id: <20210826140258.8435-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
Subject: [Buildroot] [PATCH v4] package/libqmi: bump to version 1.30.0
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
 Matt Weber <matthew.weber@collins.com>,
 Aleksander Morgado <aleksander@aleksander.es>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

From: Yegor Yefremov <yegorslists@googlemail.com>

This release introduces meson build system support.

As meson files are only available in git, switch the location to
https://gitlab.freedesktop.org.

Add support for bash-completion.

Add an upstream patch fixing the compilation without gobject-intorspection.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes v1 -> v2:
  - add a patch fixing the compilation without gobject-intorspection (Aleksander Morgado)
Changes v2 -> v3:
  - rebase against next branch (Thomas Petazzoni)
Changes v3 -> v4:
  - remove comments about the build fixing in the commit log (Thomas Petazzoni)

 ...build-meson-fix-introspection-option.patch | 33 +++++++++++++++++
 package/libqmi/libqmi.hash                    |  2 +-
 package/libqmi/libqmi.mk                      | 37 ++++++++++++-------
 3 files changed, 58 insertions(+), 14 deletions(-)
 create mode 100644 package/libqmi/0001-build-meson-fix-introspection-option.patch

diff --git a/package/libqmi/0001-build-meson-fix-introspection-option.patch b/package/libqmi/0001-build-meson-fix-introspection-option.patch
new file mode 100644
index 0000000000..0528868025
--- /dev/null
+++ b/package/libqmi/0001-build-meson-fix-introspection-option.patch
@@ -0,0 +1,33 @@
+From bfb066419f288764edbade1e27e93a5dda59a5f4 Mon Sep 17 00:00:00 2001
+From: Aleksander Morgado <aleksander@aleksander.es>
+Date: Fri, 6 Aug 2021 10:32:22 +0200
+Subject: [PATCH] build,meson: fix introspection option
+
+Using -Dintrospection=false would actually not disable it. There is no
+longer an "auto" option for the introspection support, it will be
+either enabled or disabled depending on what the user asks
+for (default enabled).
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ meson.build | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index b25bca57..d28e5601 100644
+--- a/meson.build
++++ b/meson.build
+@@ -218,7 +218,10 @@ version_conf.set10('QMI_QRTR_SUPPORTED', enable_qrtr)
+ version_conf.set10('QMI_RMNET_SUPPORTED', enable_rmnet)
+
+ # introspection support
+-enable_gir = dependency('gobject-introspection-1.0', version: '>= 0.9.6', required: get_option('introspection')).found()
++enable_gir = get_option('introspection')
++if enable_gir
++  dependency('gobject-introspection-1.0', version: '>= 0.9.6')
++endif
+
+ random_number = qmi_minor_version + meson.version().split('.').get(1).to_int()
+
+--
+2.17.0
diff --git a/package/libqmi/libqmi.hash b/package/libqmi/libqmi.hash
index 0bfc63f4a4..0373bb4e75 100644
--- a/package/libqmi/libqmi.hash
+++ b/package/libqmi/libqmi.hash
@@ -1,4 +1,4 @@
 # Locally computed:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
-sha256  cbb890893de1dee06ea5ebdac2d22f0469314a6f93f15f61f2f1206a1c9ae5fd  libqmi-1.28.6.tar.xz
+sha256  c0421684c12697c448077dd5c0a66c6f745deab3558af578e3f10307c8a0c564  libqmi-1.30.0.tar.gz
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index 35a41e5bd0..05fd3ae9af 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-LIBQMI_VERSION = 1.28.6
-LIBQMI_SITE = http://www.freedesktop.org/software/libqmi
-LIBQMI_SOURCE = libqmi-$(LIBQMI_VERSION).tar.xz
+LIBQMI_VERSION = 1.30.0
+LIBQMI_SITE = https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/archive/$(LIBQMI_VERSION)
 LIBQMI_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
 LIBQMI_LICENSE_FILES = COPYING COPYING.LIB
 LIBQMI_CPE_ID_VENDOR = libqmi_project
@@ -14,40 +13,52 @@ LIBQMI_INSTALL_STAGING = YES
 
 LIBQMI_DEPENDENCIES = libglib2
 
-LIBQMI_CONF_OPTS = --disable-Werror
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+LIBQMI_DEPENDENCIES += gobject-introspection
+LIBQMI_CONF_OPTS += -Dintrospection=true
+else
+LIBQMI_CONF_OPTS += -Dintrospection=false
+endif
 
 # if libgudev available, request udev support for a better
 # qmi-firmware-update experience
 ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
 LIBQMI_DEPENDENCIES += libgudev
-LIBQMI_CONF_OPTS += --with-udev
+LIBQMI_CONF_OPTS += -Dudev=true
 else
-LIBQMI_CONF_OPTS += --without-udev
+LIBQMI_CONF_OPTS += -Dudev=false
 endif
 
 # if libmbim available, request QMI-over-MBIM support
 ifeq ($(BR2_PACKAGE_LIBMBIM),y)
 LIBQMI_DEPENDENCIES += libmbim
-LIBQMI_CONF_OPTS += --enable-mbim-qmux
+LIBQMI_CONF_OPTS += -Dmbim_qmux=true
 else
-LIBQMI_CONF_OPTS += --disable-mbim-qmux
+LIBQMI_CONF_OPTS += -Dmbim_qmux=false
 endif
 
 # if libqrtr-glib available, enable support for QMI over QRTR
 ifeq ($(BR2_PACKAGE_LIBQRTR_GLIB),y)
 LIBQMI_DEPENDENCIES += libqrtr-glib
-LIBQMI_CONF_OPTS += --enable-qrtr
+LIBQMI_CONF_OPTS += -Dqrtr=true
 else
-LIBQMI_CONF_OPTS += --disable-qrtr
+LIBQMI_CONF_OPTS += -Dqrtr=false
 endif
 
 # if ModemManager available, enable MM runtime check in
 # qmi-firmware-update (note that we don't need to build-depend on
 # anything else)
 ifeq ($(BR2_PACKAGE_MODEM_MANAGER),y)
-LIBQMI_CONF_OPTS += --enable-mm-runtime-check
+LIBQMI_CONF_OPTS += -Dmm_runtime_check=true
+else
+LIBQMI_CONF_OPTS += -Dmm_runtime_check=false
+endif
+
+ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
+LIBQMI_DEPENDENCIES += bash-completion
+LIBQMI_CONF_OPTS += -Dbash_completion=true
 else
-LIBQMI_CONF_OPTS += --disable-mm-runtime-check
+LIBQMI_CONF_OPTS += -Dbash_completion=false
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.17.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
