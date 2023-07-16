Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE45EB64DD
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 17:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A01340360;
	Sun, 16 Jul 2023 17:01:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A01340360
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gsPB9-diOhx0; Sun, 16 Jul 2023 17:01:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32F91403A9;
	Sun, 16 Jul 2023 17:01:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32F91403A9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C6CFE1BF2F8
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 17:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACA8F606BF
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 17:01:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACA8F606BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GVfsViJGEarM for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 17:01:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4ADAD60692
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4ADAD60692
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 17:01:28 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6917BA4C066D;
 Sun, 16 Jul 2023 19:01:26 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50312)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qL57e-0002Gu-0S;
 Sun, 16 Jul 2023 19:01:26 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 19:01:25 +0200
Message-Id: <20230716170126.438652-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689526886;
 bh=mV/zdV5tqxlsmDjCArHsDKozFyIsuodtAcsBc1Q8Wlo=;
 h=From:To:Cc:Subject:Date:From;
 b=QrPvZWSwA7rPtugKu21NSz7yzQJz2EEL0m+mvfC/AMUoZ7MF+c1c2W1xZ/zg7pzar
 Hr9Q8mL4901mzUXyPaZyEvXGfKfOJwPYl3BG+1agzn7J824YE4IIX9PrMSxzTDJfEE
 3+JMOUT9HT7IgLGC4Ej/6TDWT4TNgYQWGULN9JMt5epVKpr/KVOYEpQlBw4SglY44N
 DHT+S2g+pmeS2nYgxky63ZXttbXmJ3rgu9eI0LNNu1izhfCCJQIYspO06BfJHQ7NQi
 RWHHjv+g5Ds1hRdzrZRT604xKa/GM2BeipVk5UDKvQGYEeKOUUJ8oZ/9XJtSiTB+Dq
 RMMKirkB1OvyQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=QrPvZWSw
Subject: [Buildroot] [PATCH 1/2] package/xscreensaver: fix build
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
Cc: Simon Dawson <spdawson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Patch 0001 fixes the autobuilder error during configure.
Patch 0002 fixes another bug while building the package.

Fixes:
http://autobuild.buildroot.net/results/845/84575eec1d4226c46ac96bfc98963f38fa75a762/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |  2 +
 .../0001-disable-check-for-pam.patch          | 16 +++++
 .../0002-build-Do-not-build-po-files.patch    | 58 +++++++++++++++++++
 package/xscreensaver/xscreensaver.mk          | 10 ++++
 4 files changed, 86 insertions(+)
 create mode 100644 package/xscreensaver/0001-disable-check-for-pam.patch
 create mode 100644 package/xscreensaver/0002-build-Do-not-build-po-files.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 504b96951b..fa557733e8 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1638,6 +1638,8 @@ package/xinetd/0004-configure-rlim_t.patch Upstream
 package/xinetd/0005-CVE-2013-4342-xinetd-ignores-user-and-group-directiv.patch Upstream
 package/xl2tp/xl2tpd TrailingSpace
 package/xml-security-c/0001-fix-build-with-libressl-3.5.0.patch Upstream
+package/xscreensaver/0001-disable-check-for-pam.patch
+package/xscreensaver/0002-build-Do-not-build-po-files.patch
 package/xxhash/0001-fix-man-page-installation.patch Upstream
 package/xxhash/0002-Makefile-add-dedicated-install-targets.patch Upstream
 package/xxhash/0003-do-no-longer-depend-on-assert-h-for-XXH_STATIC_ASSERT.patch Upstream
diff --git a/package/xscreensaver/0001-disable-check-for-pam.patch b/package/xscreensaver/0001-disable-check-for-pam.patch
new file mode 100644
index 0000000000..6d052a53e9
--- /dev/null
+++ b/package/xscreensaver/0001-disable-check-for-pam.patch
@@ -0,0 +1,16 @@
+Fix cross-build
+
+Detecting features of the host does not make sense when cross-compiling.
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+--- a/configure.ac.orig	2022-02-20 22:05:40.029817049 +0100
++++ b/configure.ac	2023-07-16 14:32:57.562198378 +0200
+@@ -4802,7 +4802,6 @@
+   if test -d /etc/pam.d -o -f /etc/pam.conf ; then
+     warn  "Your system seems to have PAM, but PAM is not being used."
+     warn2 "That is probably not going to work out well."
+-    CONF_STATUS=1
+   fi
+ fi
+ 
diff --git a/package/xscreensaver/0002-build-Do-not-build-po-files.patch b/package/xscreensaver/0002-build-Do-not-build-po-files.patch
new file mode 100644
index 0000000000..03674f5d50
--- /dev/null
+++ b/package/xscreensaver/0002-build-Do-not-build-po-files.patch
@@ -0,0 +1,58 @@
+From 6b5d022f6dd9848a2d5ca08a1968929b8c140981 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 16 Jul 2022 09:59:40 -0700
+Subject: [PATCH 2/2] build: Do not build po files
+
+Fixes
+| make[1]: Entering directory '/mnt/b/yoe/master/build/tmp/work/cortexa57-yoe-linux/xscreensaver/6.01-r0/xscreensaver-6.01/po'
+| make[1]: *** No rule to make target 'default'.  Stop.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Downloaded from
+https://cgit.openembedded.org/meta-openembedded/plain/meta-oe/recipes-graphics/xscreensaver/files/0002-build-Do-not-build-po-files.patch
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ Makefile.in        | 5 ++---
+ driver/Makefile.in | 2 +-
+ 2 files changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 9de79b2..1c1d16c 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -6,8 +6,8 @@ srcdir		= @srcdir@
+ VPATH		= @srcdir@
+ 
+ SHELL		= /bin/sh
+-SUBDIRS 	= utils jwxyz hacks/images hacks hacks/glx hacks/fonts \
+-		  driver po
++SUBDIRS 	= utils jwxyz hacks/images hacks hacks/fonts \
++		  driver
+ SUBDIRS2	= $(SUBDIRS) OSX android
+ TARFILES	= README README.hacking INSTALL \
+ 		  configure configure.ac Makefile.in config.h.in \
+@@ -461,4 +461,3 @@ cerebrum::
+ 	--include 'ad2c' \
+ 	--include '*/' \
+ 	--exclude '*'
+-
+diff --git a/driver/Makefile.in b/driver/Makefile.in
+index e1fa1b2..feca6fc 100644
+--- a/driver/Makefile.in
++++ b/driver/Makefile.in
+@@ -211,7 +211,7 @@ TEST_EXES	= test-passwd   test-uid        test-xdpms      test-grab     \
+ 		  xdpyinfo      test-screens    test-yarandom   test-xinput   \
+ 	          test-xkb
+ 
+-EXES		= xscreensaver xscreensaver-command xscreensaver-settings
++EXES		= xscreensaver xscreensaver-command
+ UTIL_EXES	= xscreensaver-gfx @EXES_SYSTEMD@
+ SETUID_EXES	= xscreensaver-auth
+ DEMO_EXES	= @ALL_DEMO_PROGRAMS@
+-- 
+2.37.1
+
diff --git a/package/xscreensaver/xscreensaver.mk b/package/xscreensaver/xscreensaver.mk
index 6cc7e8febe..fed25925cc 100644
--- a/package/xscreensaver/xscreensaver.mk
+++ b/package/xscreensaver/xscreensaver.mk
@@ -13,6 +13,16 @@ XSCREENSAVER_LICENSE_FILES = hacks/screenhack.h hacks/glx/chessmodels.h
 XSCREENSAVER_CPE_ID_VENDOR = xscreensaver_project
 XSCREENSAVER_SELINUX_MODULES = xdg xscreensaver xserver
 
+# 0001-disable-check-for-pam.patch
+# 0002-build-Do-not-build-po-files.patch
+XSCREENSAVER_AUTORECONF = YES
+
+# fix missing config.rpath (needed for autoreconf) in the codebase
+define XSCREENSAVER_TOUCH_CONFIG_RPATH
+	touch $(@D)/config.rpath
+endef
+XSCREENSAVER_PRE_CONFIGURE_HOOKS += XSCREENSAVER_TOUCH_CONFIG_RPATH
+
 XSCREENSAVER_DEPENDENCIES = \
 	gdk-pixbuf \
 	gdk-pixbuf-xlib \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
