Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C167DC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 12:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 183294039D;
	Mon, 27 Dec 2021 12:45:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rXhZhlZ63P5e; Mon, 27 Dec 2021 12:45:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D17AC40414;
	Mon, 27 Dec 2021 12:45:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 33BA01BF4D8
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 12:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3100C402E1
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 12:45:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hYBpmD3SRzcg for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 12:45:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ACDCE402C9
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 12:45:09 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 v10-20020a05600c214a00b00345e59928eeso4367051wml.0
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 04:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uc+6WUU92cXU3aY9M1lqL0REYdnvddZwePPv/rLUt58=;
 b=NxBqeYjyude2tedCKlN0X7kB3EYLhGIJQfaFbTdA7BfzKJA3wDKxxyWNo+zXwIdK9d
 Vi1eXrTjZbOIDlz4+xsFKR82Lyidkd1DvIRAeNFipjyitnw8JIcvALqEwVU2PZ5bdryJ
 CMylCrV+VPQb+rtpaAEHW8QqUCfDTLKxPsQlgIV9CV1qp1wJ6dI9K/qZMCyoqqspMDJU
 Aq6TBF5rPgr40DDpOhhYEIJJKCa8c7+uKsHeMEO/qQwy69qUnGc9VTQl50Ux3hMgvZ7N
 wUV551pilmAfAvM7JPx1GifQ91EGQ2FmQ+a4OU9HprghreqaK0abimrGIXkfSWmkLP4g
 182A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uc+6WUU92cXU3aY9M1lqL0REYdnvddZwePPv/rLUt58=;
 b=5ulUD2NweRWyFWxDbarO+5KQFR/MQAuwWVYX6Uw0AdAwvFFxPR9t2ZqiMhFCB3to61
 zEWyBhGIOcPoqX/mQqUMoVhidm0n/uSbVUb9vZUwQIB8ovte3e2Ety4L9CqYyIxgXhwU
 mWX5hQE95f3fz/pQXcJZgfElPVpkV1Jy1amUpaa/3IBV94OrV3afyIApuBm1ztqinR6P
 BteYmYJqilW0r4h2UkKbmh5e7i54ihh9fZUnTqnXBXfgP5tU0CqR7MavHPLGYsCNdm6E
 3KkF7b7EUI8yGjyi5MEoonl6fq8zjMJO48ELzilTmP1wXEOhEea2HVNjVw17Lqq29NMh
 5Fqg==
X-Gm-Message-State: AOAM53074xUR18dz8Csj2QLfL5FewAqvdacPst1eWqnlFGSndBWkinqN
 H+Z4MbARAWyF0BqG4P+xix/hZzsPjKQ5jA==
X-Google-Smtp-Source: ABdhPJx+FAHw8OLP2Vw0x0BvOcoLfDMIBBvojlCvrurbOkWHQjPJ3vT6AKcUezG3y6h9GuZz4MgCjQ==
X-Received: by 2002:a1c:1dd0:: with SMTP id
 d199mr13336160wmd.150.1640609107578; 
 Mon, 27 Dec 2021 04:45:07 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id i9sm16208189wrb.84.2021.12.27.04.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 04:45:06 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 13:44:17 +0100
Message-Id: <20211227124417.1509743-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/freeipmi: new package
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

FreeIPMI provides in-band and out-of-band IPMI software based on the
IPMI v1.5/2.0 specification.

The IPMI specification defines a set of interfaces for platform
management and is implemented by a number vendors for system management.
The features of IPMI that most users will be interested in are sensor
monitoring, system event monitoring, power control, and serial-over-LAN
(SOL).

https://www.gnu.org/software/freeipmi/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 package/freeipmi/0001-fix-build-on-musl.patch | 49 +++++++++++++++++++
 package/freeipmi/Config.in                    | 20 ++++++++
 package/freeipmi/freeipmi.hash                | 15 ++++++
 package/freeipmi/freeipmi.mk                  | 35 +++++++++++++
 6 files changed, 121 insertions(+)
 create mode 100644 package/freeipmi/0001-fix-build-on-musl.patch
 create mode 100644 package/freeipmi/Config.in
 create mode 100644 package/freeipmi/freeipmi.hash
 create mode 100644 package/freeipmi/freeipmi.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 99876cb76e..c5fec09b87 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -853,6 +853,7 @@ F:	package/daq3/
 F:	package/duktape/
 F:	package/expat/
 F:	package/flatbuffers/
+F:	package/freeipmi/
 F:	package/gerbera/
 F:	package/gtksourceview/
 F:	package/gssdp/
diff --git a/package/Config.in b/package/Config.in
index 8a620bfa4d..86f219a7ba 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -478,6 +478,7 @@ endmenu
 	source "package/fconfig/Config.in"
 	source "package/flashrom/Config.in"
 	source "package/fmtools/Config.in"
+	source "package/freeipmi/Config.in"
 	source "package/freescale-imx/Config.in"
 	source "package/fxload/Config.in"
 	source "package/gcnano-binaries/Config.in"
diff --git a/package/freeipmi/0001-fix-build-on-musl.patch b/package/freeipmi/0001-fix-build-on-musl.patch
new file mode 100644
index 0000000000..0a570b8841
--- /dev/null
+++ b/package/freeipmi/0001-fix-build-on-musl.patch
@@ -0,0 +1,49 @@
+From 6295c96ae54cb16efe41e53f526a4dc19cd719f2 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 30 Oct 2021 00:26:40 +0200
+Subject: [PATCH] fix build on musl
+
+musl doesn't provide getmsg or putmsg even if stropts.h is available
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/chu11/freeipmi-mirror/commit/6295c96ae54cb16efe41e53f526a4dc19cd719f2]
+---
+ configure.ac                            | 1 +
+ libfreeipmi/driver/ipmi-sunbmc-driver.c | 4 ++--
+ 2 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 562dd624e..711b27674 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -479,6 +479,7 @@ AC_CHECK_FUNCS([flockfile fputs_unlocked fwrite_unlocked])
+ AC_CHECK_FUNCS([iopl])
+ AC_CHECK_FUNCS([asprintf])
+ AC_CHECK_FUNCS([cbrt])
++AC_CHECK_FUNCS([getmsg putmsg])
+ 
+ dnl sighandler_t apparently not defined in Apple/OS X
+ AC_CHECK_TYPES([sighandler_t], [], [], [[#include <signal.h>]])
+diff --git a/libfreeipmi/driver/ipmi-sunbmc-driver.c b/libfreeipmi/driver/ipmi-sunbmc-driver.c
+index 05caca8b6..4ae8c5719 100644
+--- a/libfreeipmi/driver/ipmi-sunbmc-driver.c
++++ b/libfreeipmi/driver/ipmi-sunbmc-driver.c
+@@ -423,7 +423,7 @@ _sunbmc_write (ipmi_sunbmc_ctx_t ctx,
+   assert (ctx->io_init);
+   assert (ctx->putmsg_intf);
+ 
+-#if defined(HAVE_SYS_STROPTS_H)
++#if defined(HAVE_SYS_STROPTS_H) && defined(HAVE_PUTMSG)
+   memset (&sbuf, '\0', sizeof (struct strbuf));
+ 
+   /* Due to API differences, we need to extract the cmd out of the
+@@ -573,7 +573,7 @@ _sunbmc_read (ipmi_sunbmc_ctx_t ctx,
+       return (-1);
+     }
+ 
+-#if defined(HAVE_SYS_STROPTS_H)
++#if defined(HAVE_SYS_STROPTS_H) && defined(HAVE_GETMSG)
+   if (getmsg (ctx->device_fd, NULL, &sbuf, &flags) < 0)
+     {
+       SUNBMC_ERRNO_TO_SUNBMC_ERRNUM (ctx, errno);
diff --git a/package/freeipmi/Config.in b/package/freeipmi/Config.in
new file mode 100644
index 0000000000..8ef2e137fa
--- /dev/null
+++ b/package/freeipmi/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_FREEIPMI
+	bool "freeipmi"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
+	help
+	  FreeIPMI provides in-band and out-of-band IPMI software based
+	  on the IPMI v1.5/2.0 specification.
+
+	  The IPMI specification defines a set of interfaces for
+	  platform management and is implemented by a number vendors
+	  for system management. The features of IPMI that most users
+	  will be interested in are sensor monitoring, system event
+	  monitoring, power control, and serial-over-LAN (SOL).
+
+	  https://www.gnu.org/software/freeipmi/
+
+comment "freeipmi needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/freeipmi/freeipmi.hash b/package/freeipmi/freeipmi.hash
new file mode 100644
index 0000000000..f73b4a25fe
--- /dev/null
+++ b/package/freeipmi/freeipmi.hash
@@ -0,0 +1,15 @@
+# Locally computed:
+sha256  4aa46a269ecc1bbff9412451f17b5408f64395e7dc45b713edf5eb5362700a71  freeipmi-1.6.8.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.bmc-watchdog
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.ipmiconsole
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.ipmi-dcmi
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.ipmidetect
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.ipmi-fru
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.ipmimonitoring
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.ipmiping
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.ipmipower
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.ipmiseld
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.pstdout
+sha256  48f44386b3f359e70d7e4a5d7f1d529d8591a7c64c47df3f4abdf2ad45a6d537  COPYING.sunbmc
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.ZRESEARCH
diff --git a/package/freeipmi/freeipmi.mk b/package/freeipmi/freeipmi.mk
new file mode 100644
index 0000000000..b25ef0a4c6
--- /dev/null
+++ b/package/freeipmi/freeipmi.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# freeipmi
+#
+################################################################################
+
+FREEIPMI_VERSION = 1.6.8
+FREEIPMI_SITE = https://ftp.gnu.org/gnu/freeipmi
+FREEIPMI_LICENSE = GPL-3.0+, BSD-like (sunbmc)
+FREEIPMI_LICENSE_FILES = \
+	COPYING COPYING.bmc-watchdog COPYING.ipmiconsole COPYING.ipmi-dcmi \
+	COPYING.ipmidetect COPYING.ipmi-fru COPYING.ipmimonitoring \
+	COPYING.ipmiping COPYING.ipmipower COPYING.ipmiseld COPYING.pstdout \
+	COPYING.sunbmc COPYING.ZRESEARCH
+FREEIPMI_DEPENDENCIES = host-pkgconf
+FREEIPMI_INSTALL_STAGING = YES
+# We're patching configure.ac
+FREEIPMI_AUTORECONF = YES
+# Disable checking for /dev/urandom and /dev/random through AC_CHECK_FILE
+FREEIPMI_CONF_OPTS = --without-random-device
+
+# Work around for uClibc or musl toolchains which lack argp_*()
+# functions.
+ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
+FREEIPMI_DEPENDENCIES += argp-standalone
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
+FREEIPMI_CONF_OPTS += --with-encryption
+FREEIPMI_DEPENDENCIES += libgcrypt
+else
+FREEIPMI_CONF_OPTS += --without-encryption
+endif
+
+$(eval $(autotools-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
