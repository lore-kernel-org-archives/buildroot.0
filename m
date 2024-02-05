Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A59F7C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 22:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 525ED407D7;
	Mon,  5 Feb 2024 22:18:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 525ED407D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GfM-fyqeW54O; Mon,  5 Feb 2024 22:18:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 304A141A88;
	Mon,  5 Feb 2024 22:18:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 304A141A88
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 885EC1BF319
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 22:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F08641A84
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 22:17:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F08641A84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ro4xH4hbfBhD for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 22:17:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 501FB407D7
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 22:17:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 501FB407D7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3AAD786E4A; Mon,  5 Feb 2024 22:17:45 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 23:10:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 61295f5ced0749db34095bfbe8b34ed86a692828
X-Git-Newrev: 7371cb294df4792147fcf1da51139aafb759784a
X-Patchwork-Hint: ignore
Message-Id: <20240205221745.3AAD786E4A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/watchdogd: bump to version 4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=7371cb294df4792147fcf1da51139aafb759784a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details, see https://github.com/troglobit/watchdogd/releases/tag/4.0

 - Major feature upgrade, command line and .conf files compatible
 - LICENSE hash update due to update in copyright years
 - Enabling system monitor plugins have changed syntax upstream.  The
   `--with-foo=SECONDS` is now just `--with-foo`

This last upstream change require converting affected Config.in options
from int -> bool.  Legacy _WRAP:ers have been added to Config.legacy.in,
modeled on BR2_TARGET_ROOTFS_EXT2_BLOCKS.

Forcibly disable new monitors; they'll be enabled in a followup commit.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
[yann.morin.1998@free.fr:
  - forcibly disable new monitors
  - minor tweaks in Config.in.legacy
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                 | 60 ++++++++++++++++++++++++++++++++++++++++
 package/watchdogd/Config.in      | 36 +++++++++++-------------
 package/watchdogd/watchdogd.hash |  4 +--
 package/watchdogd/watchdogd.mk   | 27 +++++++++++-------
 4 files changed, 95 insertions(+), 32 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 82387338d9..9421d07aa1 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -202,6 +202,66 @@ config BR2_KERNEL_HEADERS_6_5
 	  Version 6.5.x of the Linux kernel headers are no longer
 	  maintained upstream and are now removed.
 
+config BR2_PACKAGE_WATCHDOGD_GENERIC_POLL
+	int "watchdogd generic poll has been replaced"
+	default 0
+	help
+	  The generic script poll interval has been replaced upstream
+	  with a boolean on/off.  Your configuration has been migrated.
+
+	  Set this legacy option to 0 here to remove the warning.
+
+# Note: BR2_PACKAGE_WATCHDOGD_*_POLL_WRAP referenced in package/watchdogd/Config.in
+config BR2_PACKAGE_WATCHDOGD_GENERIC_POLL_WRAP
+	bool
+	default y if BR2_PACKAGE_WATCHDOGD_GENERIC_POLL != 0
+	select BR2_LEGACY
+
+config BR2_PACKAGE_WATCHDOGD_LOADAVG_POLL
+	int "watchdogd loadavg poll has been replaced"
+	default 0
+	help
+	  The CPU load average poll interval has been replaced upstream
+	  with a boolean on/off.  Your configuration has been migrated.
+
+	  Set this legacy option to 0 here to remove the warning.
+
+# Note: BR2_PACKAGE_WATCHDOGD_*_POLL_WRAP referenced in package/watchdogd/Config.in
+config BR2_PACKAGE_WATCHDOGD_LOADAVG_POLL_WRAP
+	bool
+	default y if BR2_PACKAGE_WATCHDOGD_LOADAVG_POLL != 0
+	select BR2_LEGACY
+
+config BR2_PACKAGE_WATCHDOGD_FILENR_POLL
+	int "watchdogd filenr poll has been replaced"
+	default 0
+	help
+	  The file descriptor leak poll has been replaced upstream with
+	  a boolean on/off.  Your configuration has been migrated.
+
+	  Set this legacy option to 0 here to remove the warning.
+
+# Note: BR2_PACKAGE_WATCHDOGD_*_POLL_WRAP referenced in package/watchdogd/Config.in
+config BR2_PACKAGE_WATCHDOGD_FILENR_POLL_WRAP
+	bool
+	default y if BR2_PACKAGE_WATCHDOGD_FILENR_POLL != 0
+	select BR2_LEGACY
+
+config BR2_PACKAGE_WATCHDOGD_MEMINFO_POLL
+	int "watchdogd meminfo poll has been replaced"
+	default 0
+	help
+	  The memleak detector poll interval has been replaced upstream
+	  with a boolean on/off.  Your configuration has been migrated.
+
+	  Set this legacy option to 0 here to remove the warning.
+
+# Note: BR2_PACKAGE_WATCHDOGD_*_POLL_WRAP referenced in package/watchdogd/Config.in
+config BR2_PACKAGE_WATCHDOGD_MEMINFO_POLL_WRAP
+	bool
+	default y if BR2_PACKAGE_WATCHDOGD_MEMINFO_POLL != 0
+	select BR2_LEGACY
+
 comment "Legacy options removed in 2023.11"
 
 config BR2_PACKAGE_PYTHON_PYXB
diff --git a/package/watchdogd/Config.in b/package/watchdogd/Config.in
index ca5933848d..0b0480ea27 100644
--- a/package/watchdogd/Config.in
+++ b/package/watchdogd/Config.in
@@ -27,32 +27,28 @@ config BR2_PACKAGE_WATCHDOGD_TEST_SUITE
 	  They can be used to verify correct operation of watchdogd and
 	  the kernel watchdog driver.
 
-config BR2_PACKAGE_WATCHDOGD_GENERIC_POLL
-	int "Generic script monitor poll interval (sec)"
-	default "300"
+config BR2_PACKAGE_WATCHDOGD_GENERIC
+	bool "Generic script monitor"
+	default y if BR2_PACKAGE_WATCHDOGD_GENERIC_POLL_WRAP # legacy 2024.02
 	help
-	  Poll interval for generic script monitor, in seconds.  A value
-	  of zero (0) disables the monitor.
+	  Enable generic script monitor.
 
-config BR2_PACKAGE_WATCHDOGD_LOADAVG_POLL
-	int "CPU load average monitor poll interval (sec)"
-	default "300"
+config BR2_PACKAGE_WATCHDOGD_LOADAVG
+	bool "CPU load average monitor"
+	default y if BR2_PACKAGE_WATCHDOGD_LOADAVG_POLL_WRAP # legacy 2024.02
 	help
-	  Poll interval for CPU load average monitor, in seconds.  A
-	  value of zero (0) disables the monitor.
+	  Enable CPU load average monitor.
 
-config BR2_PACKAGE_WATCHDOGD_FILENR_POLL
-	int "File descriptor leak monitor poll interval (sec)"
-	default "300"
+config BR2_PACKAGE_WATCHDOGD_FILENR
+	bool "File descriptor leak monitor"
+	default y if BR2_PACKAGE_WATCHDOGD_FILENR_POLL_WRAP # legacy 2024.02
 	help
-	  Poll interval for file descriptor leak monitor, in seconds.  A
-	  value of zero (0) disables the monitor.
+	  Enable file descriptor leak monitor.
 
-config BR2_PACKAGE_WATCHDOGD_MEMINFO_POLL
-	int "Memory leak monitor poll interval (sec)"
-	default "300"
+config BR2_PACKAGE_WATCHDOGD_MEMINFO
+	bool "Memory leak monitor"
+	default y if BR2_PACKAGE_WATCHDOGD_MEMINFO_POLL_WRAP # legacy 2024.02
 	help
-	  Poll interval for memory leak monitor, in seconds.  A value of
-	  zero (0) disables the monitor.
+	  Enable memory leak monitor.
 
 endif
diff --git a/package/watchdogd/watchdogd.hash b/package/watchdogd/watchdogd.hash
index 4ff1a3485b..0c228666bd 100644
--- a/package/watchdogd/watchdogd.hash
+++ b/package/watchdogd/watchdogd.hash
@@ -1,5 +1,5 @@
 # Upstream .sha256 from GitHub
-sha256  33ec4edc8cb4ada7a4d8324a27d897d33aae5e83257ed64d3d37508825c11237  watchdogd-3.5.tar.gz
+sha256  7f38bc691353a51fc6feb2ccab60417c0284dd3f4d55c50d8b1781fda70d8101  watchdogd-4.0.tar.gz
 
 # Locally calculated
-sha256  fd685e20931174308c45a26418a7ce34d66704c4e4b92ab1d8299deb255cd676  LICENSE
+sha256  e233c56d807c74c67f2eff47ad03c216144cdd374d8d7578b996c28c260eadda  LICENSE
diff --git a/package/watchdogd/watchdogd.mk b/package/watchdogd/watchdogd.mk
index ea033b4e71..56816de94f 100644
--- a/package/watchdogd/watchdogd.mk
+++ b/package/watchdogd/watchdogd.mk
@@ -4,44 +4,51 @@
 #
 ################################################################################
 
-WATCHDOGD_VERSION = 3.5
+WATCHDOGD_VERSION = 4.0
 WATCHDOGD_SITE = https://github.com/troglobit/watchdogd/releases/download/$(WATCHDOGD_VERSION)
 WATCHDOGD_LICENSE = ISC
 WATCHDOGD_LICENSE_FILES = LICENSE
 WATCHDOGD_CPE_ID_VENDOR = troglobit
 WATCHDOGD_INSTALL_STAGING = YES
 WATCHDOGD_DEPENDENCIES = host-pkgconf libconfuse libite libuev
-WATCHDOGD_CONF_OPTS = --disable-compat --disable-examples --disable-test-mode
 WATCHDOGD_SELINUX_MODULES = watchdog
 
+WATCHDOGD_CONF_OPTS = \
+	--disable-compat \
+	--disable-examples \
+	--disable-test-mode \
+	--without-fsmon \
+	--without-tempmon
+
 ifneq ($(BR2_PACKAGE_WATCHDOGD_TEST_SUITE),y)
 WATCHDOGD_CONF_OPTS += --disable-builtin-tests
 else
 WATCHDOGD_CONF_OPTS += --enable-builtin-tests
 endif
 
-ifeq ($(BR2_PACKAGE_WATCHDOGD_GENERIC_POLL),0)
+ifneq ($(BR2_PACKAGE_WATCHDOGD_GENERIC),y)
 WATCHDOGD_CONF_OPTS += --without-generic
 else
-WATCHDOGD_CONF_OPTS += --with-generic=$(BR2_PACKAGE_WATCHDOGD_GENERIC_POLL)
+WATCHDOGD_CONF_OPTS += --with-generic
 endif
 
-ifeq ($(BR2_PACKAGE_WATCHDOGD_LOADAVG_POLL),0)
+ifneq ($(BR2_PACKAGE_WATCHDOGD_LOADAVG),y)
 WATCHDOGD_CONF_OPTS += --without-loadavg
 else
-WATCHDOGD_CONF_OPTS += --with-loadavg=$(BR2_PACKAGE_WATCHDOGD_LOADAVG_POLL)
+WATCHDOGD_CONF_OPTS += --with-loadavg
 endif
 
-ifeq ($(BR2_PACKAGE_WATCHDOGD_FILENR_POLL),0)
+ifneq ($(BR2_PACKAGE_WATCHDOGD_FILENR),y)
 WATCHDOGD_CONF_OPTS += --without-filenr
 else
-WATCHDOGD_CONF_OPTS += --with-filenr=$(BR2_PACKAGE_WATCHDOGD_FILENR_POLL)
+WATCHDOGD_CONF_OPTS += --with-filenr
 endif
 
-ifeq ($(BR2_PACKAGE_WATCHDOGD_MEMINFO_POLL),0)
+ifneq ($(BR2_PACKAGE_WATCHDOGD_MEMINFO),y)
 WATCHDOGD_CONF_OPTS += --without-meminfo
 else
-WATCHDOGD_CONF_OPTS += --with-meminfo=$(BR2_PACKAGE_WATCHDOGD_MEMINFO_POLL)
+WATCHDOGD_CONF_OPTS += --with-meminfo
+endif
 endif
 
 define WATCHDOGD_INSTALL_INIT_SYSV
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
