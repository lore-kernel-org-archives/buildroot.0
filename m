Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D654C76195
	for <buildroot@archiver.kernel.org>; Mon, 27 Mar 2023 16:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0D1B400F0;
	Mon, 27 Mar 2023 16:55:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0D1B400F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FJxKAEG23JgY; Mon, 27 Mar 2023 16:54:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 860E4401B3;
	Mon, 27 Mar 2023 16:54:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 860E4401B3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 348371BF29A
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 16:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E38860F47
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 16:54:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E38860F47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a2y5prjYkiGN for <buildroot@lists.busybox.net>;
 Mon, 27 Mar 2023 16:54:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B36160F3C
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9B36160F3C
 for <buildroot@buildroot.org>; Mon, 27 Mar 2023 16:54:54 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id w9so38972154edc.3
 for <buildroot@buildroot.org>; Mon, 27 Mar 2023 09:54:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679936092;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=180mIz6zrj2AtIlnNrBgAxqlp3eeyFYCDOcSb9I5z34=;
 b=tbRLKtmYzZQMpht8xFlredpJ4Pa3Mmv8sykiJs9o0eooqoc+sJkbRvZwznrHPyX0DL
 42GG5X78FMHxiJTkJIm7NejdRKL9RY4otRvEYQqcWQMM75AzPU5mwDrQW+PIbqKAZwHd
 qncSkhWSLJlAa0cn+en6AKjbF+jLHDkSQlJkXUbXtXjb8O7dFPNXCa60vlMCIrXtMMry
 Sojdca/afVGOYoLBYpitdpmlZEZGAl1v0AONqio2TrPxAwNBIpqHrjaHMBXbXMvhx9zB
 csZwqgU1FUa+DxL1tPtuj7O3AjPnmw3G6Dn+TVxweijlk43tq8flH8YI8sP0DPOd4ymI
 D77A==
X-Gm-Message-State: AAQBX9c1ZAxtSV4elhgt6h7DX/sQYoNP3tTWSo8asi4oAsM2Gn/xh6xO
 e5RWZPwIg8t4a3Atzw4RSdlw8IQJURU=
X-Google-Smtp-Source: AKy350YF/Cb6MQGfII7otre52QSqXD2/ZOcpAqJhZtOQzvizpsHatIZZocn1ojNvGptxRGjDSPldJA==
X-Received: by 2002:a17:906:9c84:b0:932:3ca:e228 with SMTP id
 fj4-20020a1709069c8400b0093203cae228mr16014720ejc.0.1679936092224; 
 Mon, 27 Mar 2023 09:54:52 -0700 (PDT)
Received: from localhost.localdomain ([176.221.215.212])
 by smtp.gmail.com with ESMTPSA id
 g25-20020a50d0d9000000b00501c2a9e16dsm11981459edf.74.2023.03.27.09.54.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 09:54:51 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Mar 2023 19:54:23 +0300
Message-Id: <20230327165423.1059953-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679936092;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=180mIz6zrj2AtIlnNrBgAxqlp3eeyFYCDOcSb9I5z34=;
 b=c5zLqonlOMPr+V5R6oScb942j9JspapdIwosJSATj1D+itRmBXmKplFFAqzsKimGYB
 LVD4mqt4YOckhO1gEFXLpT3WvVzxx0/fDGRGk7sYAdwZP09Jah7nrf0lIOhf1ImrD5/G
 EekRjaVq24fzc4mpqvVxlWilIOEIuVewnqL4SDWSm8qtWinFhEgqOby8RXpWj25BBycd
 gnzUVplr76Nf4OR78XghPLRv6BMmDlov1MJNmsTKRznF5wxNTqu9zGu2lZ0Bd0Bp0SqI
 6WhiX6qLGkmjfB1AZO33/5nEpMfQR89gUlHFpeatLewxoLJ2nNZr2zk+r0ogjKHu4AJd
 G4fA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=c5zLqonl
Subject: [Buildroot] [PATCH] package/ledmon: new package
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Maksim Kiselev <bigunclemax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enclosure LED Utilities

ledmon and ledctl are userspace tools designed to control storage
enclosure LEDs. The user must have root privileges to use these tools.

These tools use the SGPIO and SES-2 protocols to monitor and control LEDs.
They been verified to work with Intel(R) storage controllers (i.e. the
Intel(R) AHCI controller) and have not been tested with storage controllers of
other vendors (especially SAS/SCSI controllers).

For backplane enclosures attached to ISCI controllers, support is limited to
Intel(R) Intelligent Backplanes.

Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
---
 package/Config.in                             |  1 +
 .../ledmon/0001-Add-disable-doc-option.patch  | 57 +++++++++++++++++++
 package/ledmon/Config.in                      | 11 ++++
 package/ledmon/ledmon.hash                    |  3 +
 package/ledmon/ledmon.mk                      | 14 +++++
 5 files changed, 86 insertions(+)
 create mode 100644 package/ledmon/0001-Add-disable-doc-option.patch
 create mode 100644 package/ledmon/Config.in
 create mode 100644 package/ledmon/ledmon.hash
 create mode 100644 package/ledmon/ledmon.mk

diff --git a/package/Config.in b/package/Config.in
index 0f8dab3e71..3c2f98bdda 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -525,6 +525,7 @@ endmenu
 	source "package/iucode-tool/Config.in"
 	source "package/kbd/Config.in"
 	source "package/lcdproc/Config.in"
+	source "package/ledmon/Config.in"
 	source "package/libiec61850/Config.in"
 	source "package/libmanette/Config.in"
 	source "package/libubootenv/Config.in"
diff --git a/package/ledmon/0001-Add-disable-doc-option.patch b/package/ledmon/0001-Add-disable-doc-option.patch
new file mode 100644
index 0000000000..4803c37698
--- /dev/null
+++ b/package/ledmon/0001-Add-disable-doc-option.patch
@@ -0,0 +1,57 @@
+From 4c356662faaa5aa2dc0b0eb713dc5134a70eb3b0 Mon Sep 17 00:00:00 2001
+From: Maksim Kiselev <bigunclemax@gmail.com>
+Date: Mon, 27 Mar 2023 17:45:15 +0300
+Subject: [PATCH] Add '--disable-doc' option
+
+Introduce a configure option to disable documentation installation in case if it is not required.
+
+Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
+---
+ Makefile.am  | 8 ++++++--
+ configure.ac | 8 +++++++-
+ 2 files changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index d2b6f3a..f021768 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -20,6 +20,10 @@ if SYSTEMD_CONDITION
+   OPTIONAL_SUBDIR = systemd
+ endif
+ 
+-SUBDIRS = doc src $(OPTIONAL_SUBDIR)
++if DOC_CONDITION
++  DOC_SUBDIR = doc
++  dist_doc_DATA = README.md
++endif
++
++SUBDIRS = src $(DOC_SUBDIR) $(OPTIONAL_SUBDIR)
+ EXTRA_DIST = config/config.h systemd/ledmon.service.in
+-dist_doc_DATA = README.md
+diff --git a/configure.ac b/configure.ac
+index 001a049..510bb85 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -71,6 +71,12 @@ AS_IF([test "x$enable_systemd" = xyes], [SYSTEMD_STR=yes], [SYSTEMD_STR=no])
+ 
+ AM_CONDITIONAL([SYSTEMD_CONDITION], [test "$SYSTEMD_STR" = yes])
+ 
++AC_ARG_ENABLE(doc, AS_HELP_STRING([--disable-doc], [do not install ledmon documentaion]),,[enable_doc=yes])
++
++AS_IF([test "x$enable_doc" = xyes], [DOC_STR=yes], [DOC_STR=no])
++
++AM_CONDITIONAL([DOC_CONDITION], [test "$DOC_STR" = yes])
++
+ # target directory for ledmon service file
+ AC_SUBST([SYSTEMD_PATH], "$(pkg-config systemd --variable=systemdsystemunitdir)")
+ 
+@@ -86,5 +92,5 @@ $PACKAGE_NAME $VERSION configuration:
+   Preprocessor flags:      ${AM_CPPFLAGS} ${CPPFLAGS}
+   C compiler flags:        ${AM_CFLAGS} ${CFLAGS}
+   Common install location: ${prefix}
+-  configure parameters:    --enable-systemd=${SYSTEMD_STR}
++  configure parameters:    --enable-systemd=${SYSTEMD_STR} --enable-doc=${DOC_STR}
+ ])
+-- 
+2.39.2
+
diff --git a/package/ledmon/Config.in b/package/ledmon/Config.in
new file mode 100644
index 0000000000..467a75fa56
--- /dev/null
+++ b/package/ledmon/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LEDMON
+	bool "ledmon"
+	depends on BR2_PACKAGE_PCIUTILS
+	depends on BR2_PACKAGE_SG3_UTILS
+	depends on BR2_PACKAGE_HAS_UDEV
+	help
+	  Enclosure LED Utilities. The ledmon application is
+	  a daemon process used to monitor a state of software
+	  RAID devices (md only) or a state of block devices.
+
+	  https://github.com/intel/ledmon
diff --git a/package/ledmon/ledmon.hash b/package/ledmon/ledmon.hash
new file mode 100644
index 0000000000..5c0c183ddc
--- /dev/null
+++ b/package/ledmon/ledmon.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  97534302a60f03b90e69228a6a56096cf3fdfc8eb31fea52a974445268fdf5d9  ledmon-v0.96.tar.gz
+sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/ledmon/ledmon.mk b/package/ledmon/ledmon.mk
new file mode 100644
index 0000000000..dba8a99b8c
--- /dev/null
+++ b/package/ledmon/ledmon.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# ledmon
+#
+################################################################################
+
+LEDMON_VERSION = v0.96
+LEDMON_SITE = $(call github,intel,ledmon,$(LEDMON_VERSION))
+LEDMON_DEPENDENCIES = pciutils sg3_utils udev
+LEDMON_LICENSE = GPL-2.0
+LEDMON_LICENSE_FILES = COPYING
+LEDMON_AUTORECONF = YES
+
+$(eval $(autotools-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
