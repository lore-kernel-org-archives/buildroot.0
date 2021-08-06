Return-Path: <SRS0=2n7N=M5=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA692C4338F
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 08:01:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F2B561164
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 08:01:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4F2B561164
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A3FA60886;
	Fri,  6 Aug 2021 08:01:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A3SQHii7LTQd; Fri,  6 Aug 2021 08:01:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43BBF605FF;
	Fri,  6 Aug 2021 08:01:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D23EC1BF409
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 08:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD58A40463
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 08:01:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=googlemail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a9xsUp-KkOKU for <buildroot@lists.busybox.net>;
 Fri,  6 Aug 2021 08:01:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A38B54031C
 for <buildroot@buildroot.org>; Fri,  6 Aug 2021 08:01:32 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id zb12so9009309ejb.5
 for <buildroot@buildroot.org>; Fri, 06 Aug 2021 01:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=pCMDBd2UpSQFN6KdK3B2B5j+RAvAEPi69dkaHDQwauU=;
 b=O0GODTMCoWTNgQZ3aWcxAVP+QRxAHPtHX4PkqwyA4Egw01R8lek3SYlvX35hLB+aJY
 DpQoQd/XD/+3Va3byWn3aSBkEVXES+JLyvAmq0BrrkNyKTwa4YLe1WWMHw5nmUF3NApk
 5sj2IYRu3j+msZtYUfhPwJqozbO7axvvyHTfDmga9lXJk2ZZPi4/szt6X6c7YjZHR7Vh
 nlf0gSQ7IZYz76pEvnOR5V63K3jJ8K6MEots64GY0f3TJiKzOyKuzdEoORtZg7AJnM7l
 VXDUzHW5Iu5iV5DFvDX/hSipEc4OXLjmLDqUbehHjK6VJd7xFnwVVKvjPGn3vEDp82T9
 tiMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=pCMDBd2UpSQFN6KdK3B2B5j+RAvAEPi69dkaHDQwauU=;
 b=H5ItFi6RQLyZxF2rNvl4ujsdvie99vvZeZM8kLIsJ9lMoHYJyB1u38QEZBqlsAnLct
 7zMPa/NyP9rZWRSCTZ2b6eH2hhfNNHVO0jf+c/SP7JifSndTAwEBMErza+cH98X9iZJH
 Xzs/gBxhuNyTnYO/tRs5HMOFMGqZ1PunHX79Mtgz9Y5zsrnhMARlFuznHB4jL96KHPH9
 LugwWuwe46V/yB4ggP12IuXcqzUFVRXPcIuI2lbFluvsJmvNTjmATx1X/ZnTvyfpyFsX
 hwHWmILsYzbnqwwsmUCexWnbrJandcjq3V9LJ+otXEwEaj3CxbeUxC9rm/1s06MGvCmL
 sXlQ==
X-Gm-Message-State: AOAM530JS0vfx/Lu6wYVkF7kN625K7Oc+1DJ4Qr7k8Yt5uVqKZOIvFcU
 XVzhUzJE219VhJbffI2Rcp4oxGryHbMUbg==
X-Google-Smtp-Source: ABdhPJwfLQ1qAAutwSjsK/MSP8PD7gN7TFI9JYk8RH9+paUgwjbEyQXCEr9rCN6ShBV3w+PvvGAdHg==
X-Received: by 2002:a17:906:2990:: with SMTP id
 x16mr8477895eje.554.1628236890458; 
 Fri, 06 Aug 2021 01:01:30 -0700 (PDT)
Received: from development1.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202])
 by smtp.gmail.com with ESMTPSA id bm1sm2602013ejb.38.2021.08.06.01.01.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 06 Aug 2021 01:01:29 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri,  6 Aug 2021 10:01:17 +0200
Message-Id: <20210806080117.14544-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
Subject: [Buildroot] [PATCH] package/libqmi: bump to version 1.30.0
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

This release introduces meson build system support that fixes
gobject-intorspection issue with autotools.

As meson files are only available in git, switch the location to
https://gitlab.freedesktop.org.

Add support for bash-completion.

Fixes:
http://autobuild.buildroot.net/results/c13877a5700445253900e312bc87904152be429a

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libqmi/libqmi.hash |  2 +-
 package/libqmi/libqmi.mk   | 36 ++++++++++++++++++++----------------
 2 files changed, 21 insertions(+), 17 deletions(-)

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
index 7b1d76a0c1..05fd3ae9af 100644
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
@@ -14,47 +13,52 @@ LIBQMI_INSTALL_STAGING = YES
 
 LIBQMI_DEPENDENCIES = libglib2
 
-LIBQMI_CONF_OPTS = --disable-Werror
-
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 LIBQMI_DEPENDENCIES += gobject-introspection
-LIBQMI_CONF_OPTS += --enable-introspection
+LIBQMI_CONF_OPTS += -Dintrospection=true
 else
-LIBQMI_CONF_OPTS += --disable-introspection
+LIBQMI_CONF_OPTS += -Dintrospection=false
 endif
 
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
