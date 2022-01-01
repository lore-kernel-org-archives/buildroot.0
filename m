Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C81C433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 11:00:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C204400D9;
	Sat,  1 Jan 2022 11:00:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id meqSy_XnaJqj; Sat,  1 Jan 2022 11:00:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 449564012F;
	Sat,  1 Jan 2022 11:00:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D23C21BF5A8
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 11:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD7DD404B6
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 11:00:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XXLR_E1hRLCf for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 11:00:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D8F940493
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 11:00:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 6819782628; Sat,  1 Jan 2022 10:54:45 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Jan 2022 12:00:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d6dfb23a407f5c8c5cf6678554f39a8bd32a26d5
X-Git-Newrev: 663f39c88c01593855c18355a4decdceeffd884b
X-Patchwork-Hint: ignore
Message-Id: <20220101105445.6819782628@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeipmi: new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=663f39c88c01593855c18355a4decdceeffd884b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

FreeIPMI provides in-band and out-of-band IPMI software based on the
IPMI v1.5/2.0 specification.

The IPMI specification defines a set of interfaces for platform
management and is implemented by a number vendors for system management.
The features of IPMI that most users will be interested in are sensor
monitoring, system event monitoring, power control, and serial-over-LAN
(SOL).

https://www.gnu.org/software/freeipmi/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 package/freeipmi/0001-fix-build-on-musl.patch | 49 +++++++++++++++++++++++++++
 package/freeipmi/Config.in                    | 20 +++++++++++
 package/freeipmi/freeipmi.hash                | 15 ++++++++
 package/freeipmi/freeipmi.mk                  | 35 +++++++++++++++++++
 6 files changed, 121 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 78e41b7d7c..21e4f2a84c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -858,6 +858,7 @@ F:	package/daq3/
 F:	package/duktape/
 F:	package/expat/
 F:	package/flatbuffers/
+F:	package/freeipmi/
 F:	package/gerbera/
 F:	package/gtksourceview/
 F:	package/gssdp/
diff --git a/package/Config.in b/package/Config.in
index ce12e5f3c5..d3d0717535 100644
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
index 0000000000..ff7425d221
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
+https://git.savannah.gnu.org/cgit/freeipmi.git/commit/?id=6295c96ae54cb16efe41e53f526a4dc19cd719f2]
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
