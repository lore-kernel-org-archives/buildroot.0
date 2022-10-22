Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6C7C433FE
	for <buildroot@archiver.kernel.org>; Sat, 22 Oct 2022 21:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 434D94013B;
	Sat, 22 Oct 2022 21:44:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 434D94013B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0nLzU44815u8; Sat, 22 Oct 2022 21:44:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 41647400DD;
	Sat, 22 Oct 2022 21:44:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41647400DD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 49E711BF3BC
 for <buildroot@lists.busybox.net>; Sat, 22 Oct 2022 21:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3040D607B4
 for <buildroot@lists.busybox.net>; Sat, 22 Oct 2022 21:44:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3040D607B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qo14DJWjNxs2 for <buildroot@lists.busybox.net>;
 Sat, 22 Oct 2022 21:44:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C911A6079B
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C911A6079B
 for <buildroot@buildroot.org>; Sat, 22 Oct 2022 21:44:48 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 r8-20020a1c4408000000b003c47d5fd475so7511025wma.3
 for <buildroot@buildroot.org>; Sat, 22 Oct 2022 14:44:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pOimMhETlZEa9DMYCa87ORgM1lBFfep38D6PQLFy6+s=;
 b=UqT6iSKtKumsiB8DBZFro1CtnxIn/nmz0b757rkgMb3/Bc6k5gok/ggOSiQ0XJxnWt
 mbnxoWJ1t/DaIUatOJkCPGRb1Qz/LafrJaVqP4y9anZx27CJ+QiE/f/yCHEz7D7bkG8b
 yKg9VKq9fi6xMPbbn+KxY7NNtIOj6ZR3H8u/hzct4WGKH7umLJaErmUbUX1JjOeFIc3x
 lecUboczhir7S4V1HRexGMmjQvdnBSarXnlGeRjY51DvtUnDJykFu/nwtBckPd8BPscn
 UVryEoFWv+atZoPdWeqgAm5wxsESC8fCj0NH15LvSlKCBgTenh44DXaI0fs5tDeUwmki
 deFw==
X-Gm-Message-State: ACrzQf3BrtTIXay81mwcIzbPYhKDYSgSZkF6y4/5GLbRnZ0SfijIuBBj
 d126Xk2fY38uJ9Ch3o6Hn0Lr5ZsUXyo=
X-Google-Smtp-Source: AMsMyM4IP96UK+Ft3hQNZgCprBddVfKOhNfUfvoa9UEC1kt2GCeGDUPrYn3UYTl6GGcfDI7JM3RExw==
X-Received: by 2002:a05:600c:214d:b0:3c7:1182:4874 with SMTP id
 v13-20020a05600c214d00b003c711824874mr9722493wml.4.1666475086491; 
 Sat, 22 Oct 2022 14:44:46 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 l34-20020a05600c1d2200b003c6edc05159sm3893278wms.1.2022.10.22.14.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 14:44:46 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 22 Oct 2022 23:44:39 +0200
Message-Id: <20221022214439.174830-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pOimMhETlZEa9DMYCa87ORgM1lBFfep38D6PQLFy6+s=;
 b=JBpt5ULPCrXNI72wbK5BcTAF8UuKS2bpXfuBsUM4L8YjDsDdefIvlUqFbZw11xOYb5
 TtUYFSk40zmnPMVgBR6uI8Ks5tMyS6YxQ2cUSScgbQkwQGrQVNZbuBRsTU3D5kmybo1x
 CVk4QlF/RyM/FqiOczADKm+ZxHfXrhhABldS+UgxJssGP7J9LkTWdXDdKeWnhDwtLZw1
 3JuIRF5SS/lYl+y0QqZKKEUudTaK8nWK6GdHCw8Q5ddQQavn+hvxhlY6a3Ue8dWbIi0Z
 GKeKTkGHr9R76oyFHva43rn3FG3JvrE/ssSbOODT7/Qnexdv4aeVtLdJGmIM/uyMRZfZ
 0mvw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JBpt5ULP
Subject: [Buildroot] [PATCH v2, 1/1] package/usbredir: bump to version 0.13.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

usbredirserver was dropped by
https://gitlab.freedesktop.org/spice/usbredir/-/commit/f4ffdce329305da2803684776f7659083a530819

Add an option to enable tools (and usbredirect binary) as a replacement
to usbredirserver

https://gitlab.freedesktop.org/spice/usbredir/-/blob/usbredir-0.13.0/ChangeLog.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Peter Seiderer):
 - Add an option to enable tools

 Config.in.legacy               |  9 +++++++++
 package/usbredir/Config.in     | 11 ++++++-----
 package/usbredir/usbredir.hash |  4 ++--
 package/usbredir/usbredir.mk   | 21 +++++++--------------
 4 files changed, 24 insertions(+), 21 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 0e63d59a98..efe35fde36 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,15 @@ endif
 
 comment "Legacy options removed in 2022.11"
 
+config BR2_PACKAGE_USBREDIR_SERVER
+	bool "usbredirserver removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_USBREDIR_TOOLS
+	help
+	  usbredirserver has been dropped by upstream since version
+	  0.13.0. usbredir tools (which include usbredirect binary) has
+	  been selected instead.
+
 config BR2_KERNEL_HEADERS_5_17
 	bool "kernel headers version 5.17.x are no longer supported"
 	select BR2_LEGACY
diff --git a/package/usbredir/Config.in b/package/usbredir/Config.in
index 8ce180a884..d546ac1025 100644
--- a/package/usbredir/Config.in
+++ b/package/usbredir/Config.in
@@ -15,18 +15,19 @@ config BR2_PACKAGE_USBREDIR
 	  protocol.
 
 	  Note: only the library is installed, not the utilities. Say
-	  'y' below if you want the server too.
+	  'y' below if you want the tools too.
 
 	  http://www.spice-space.org/page/UsbRedir
 
 if BR2_PACKAGE_USBREDIR
 
-config BR2_PACKAGE_USBREDIR_SERVER
-	bool "usbredirserver on target"
+config BR2_PACKAGE_USBREDIR_TOOLS
+	bool "Enable tools"
 	help
 	  If you want to serve usbredir requests on your target, say
-	  'y' here to have the usbredir server on the target.
+	  'y' here to have the tools built and installed on the target
+	  (including usbredirect binary).
 
-	  Note: the server is not required to use the library.
+	  Note: the tools are not required to use the library.
 
 endif
diff --git a/package/usbredir/usbredir.hash b/package/usbredir/usbredir.hash
index f738c36690..577e08efba 100644
--- a/package/usbredir/usbredir.hash
+++ b/package/usbredir/usbredir.hash
@@ -1,5 +1,5 @@
-# https://spice-space.org/download/usbredir/usbredir-0.12.0.tar.xz.sha256sum
-sha256  fbb44025bf55e1ce8d84afc7596bfa47c8a36cd603c6fa440f9102c1c9761e6d  usbredir-0.12.0.tar.xz
+# https://spice-space.org/download/usbredir/usbredir-0.13.0.tar.xz.sha256sum
+sha256  4ba6faa02c0ae6deeb4c53883d66ab54b3a5899bead42ce4ded9568b9a7dc46e  usbredir-0.13.0.tar.xz
 
 # Hash for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/usbredir/usbredir.mk b/package/usbredir/usbredir.mk
index 6792a3e758..172f0d52a0 100644
--- a/package/usbredir/usbredir.mk
+++ b/package/usbredir/usbredir.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USBREDIR_VERSION = 0.12.0
+USBREDIR_VERSION = 0.13.0
 USBREDIR_SOURCE = usbredir-$(USBREDIR_VERSION).tar.xz
 USBREDIR_SITE = http://spice-space.org/download/usbredir
 USBREDIR_LICENSE = LGPL-2.1+ (libraries)
@@ -14,21 +14,14 @@ USBREDIR_DEPENDENCIES = host-pkgconf libusb
 USBREDIR_CONF_OPTS = \
 	-Dgit_werror=disabled \
 	-Dstack_protector=disabled \
-	-Dtests=disabled \
-	-Dtools=disabled
-
-ifeq ($(BR2_PACKAGE_USBREDIR_SERVER),y)
+	-Dtests=disabled
 
+ifeq ($(BR2_PACKAGE_USBREDIR_TOOLS),y)
 USBREDIR_LICENSE += , GPL-2.0+ (program)
 USBREDIR_LICENSE_FILES += COPYING
-
-else # BR2_PACKAGE_USBREDIR_SERVER != y
-
-define USBREDIR_POST_INSTALL_TARGET_RM_SERVER
-	rm -f $(TARGET_DIR)/usr/sbin/usbredirserver
-endef
-USBREDIR_POST_INSTALL_TARGET_HOOKS += USBREDIR_POST_INSTALL_TARGET_RM_SERVER
-
-endif # BR2_PACKAGE_USBREDIR_SERVER
+USBREDIR_CONF_OPTS += -Dtools=enabled
+else
+USBREDIR_CONF_OPTS += -Dtools=disabled
+endif
 
 $(eval $(meson-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
