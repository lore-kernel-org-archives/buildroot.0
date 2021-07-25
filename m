Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ADDAC4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 22:53:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4141C60E78
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 22:53:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4141C60E78
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7BCF60759;
	Sun, 25 Jul 2021 22:53:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f3y8SRKeRJvF; Sun, 25 Jul 2021 22:53:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1313460752;
	Sun, 25 Jul 2021 22:53:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B7CC81BF2E5
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 22:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A782B83474
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 22:53:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 30hv1yrxC0mk for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 22:53:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F3D5F83449
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 22:53:17 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id l126so9555399ioa.12
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 15:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8HnfccTX/PGPgzslNdiqnrKSDFfv3ARmFkDtaycj5Dc=;
 b=ggai9P3dJbA7luwzQpNPR3W2UUodcmKZ4V/gxfCWRmVVtm2I4T1SJj9eev2BV102AM
 tfaqgwP4leLMhRXHL4cyziCQXhDNN4DmnFTnk496HZmW7b2RNYbSr5lSJdl2P9AasYTn
 sJbPCpkpU1p+zVSLdq76O2ygoF3HG4SWsEQcdZJfgv8uR/mDPHXRlt7gWv1clUWmLEuk
 vuWLkD1DLUYRFcyBeNOgDlazb+OCBFpHyCNH5aHGLVN6rI67Q/etZpLT/Pe4SO1Jz48Z
 ExACdaMKbFAZCFI0axZplP/il7sb0gntNLCb5Z68ocAP7odFypT2JfvMxKz0FVJMmoqI
 tReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8HnfccTX/PGPgzslNdiqnrKSDFfv3ARmFkDtaycj5Dc=;
 b=aQ8zbcMneaE7AhfmuM9wkYKh/WeSK6Jjj8Gl7BA5dcoPM2OV+8Cby/izrx8D+O2/I9
 GwuXQL2oXj5oeLpYmBOrv24Ak6ryphqWgV9iLTRddLowuvvSS+3/2nRev6sFWiprmuAy
 68fWga7uXvxmsYco2UiC96j5a8Y/jm6dFF/m8mEQPmrqr/Aj20IvhRryvZ3Fo4RoPn4y
 Ubl7Zsrbrx9yYfqh0xkpSccGIuQPwWDBIv3GX6bBnXYwcNDqVu6hszMxNgT1T+5Zfb/M
 kI6aAxJlB5yvtUK71KrcsbHadc5nbdmTnPi9McGnH+MeYLU1xzW0FtW2tQG79WfxIzAo
 rO3Q==
X-Gm-Message-State: AOAM5333idJQ+ho4oKJSs2YGJsnTbevYjREiyjI8W8/KJ32kT8QufqsQ
 Nm4ugkKHSzeSzv1cvBh9eY8PJo7Mgsg=
X-Google-Smtp-Source: ABdhPJzxWlwBJ61mYNxRdwCizzTueNzCDHAuNZE3wasEqGBy1TG1Z4LJdHxxaZWHRDnQGIS0m3oaNw==
X-Received: by 2002:a5e:c109:: with SMTP id v9mr12433830iol.76.1627253596862; 
 Sun, 25 Jul 2021 15:53:16 -0700 (PDT)
Received: from james-x399.localdomain (97-118-178-184.hlrn.qwest.net.
 [97.118.178.184])
 by smtp.gmail.com with ESMTPSA id e14sm19305338ilc.47.2021.07.25.15.53.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 15:53:16 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 16:53:14 -0600
Message-Id: <20210725225314.1656725-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/system-config-printer: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

This package has some udev tools to assist with printer autodetection.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                             |  1 +
 ...n-to-disable-xmlto-manual-generation.patch | 75 +++++++++++++++++++
 package/system-config-printer/Config.in       |  7 ++
 .../system-config-printer.hash                |  3 +
 .../system-config-printer.mk                  | 32 ++++++++
 5 files changed, 118 insertions(+)
 create mode 100644 package/system-config-printer/0001-Add-option-to-disable-xmlto-manual-generation.patch
 create mode 100644 package/system-config-printer/Config.in
 create mode 100644 package/system-config-printer/system-config-printer.hash
 create mode 100644 package/system-config-printer/system-config-printer.mk

diff --git a/package/Config.in b/package/Config.in
index 12b1323fc2..2bd507c993 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2116,6 +2116,7 @@ menu "Networking applications"
 	source "package/ctorrent/Config.in"
 	source "package/cups/Config.in"
 	source "package/cups-filters/Config.in"
+	source "package/system-config-printer/Config.in"
 	source "package/dante/Config.in"
 	source "package/darkhttpd/Config.in"
 	source "package/dehydrated/Config.in"
diff --git a/package/system-config-printer/0001-Add-option-to-disable-xmlto-manual-generation.patch b/package/system-config-printer/0001-Add-option-to-disable-xmlto-manual-generation.patch
new file mode 100644
index 0000000000..2930912be1
--- /dev/null
+++ b/package/system-config-printer/0001-Add-option-to-disable-xmlto-manual-generation.patch
@@ -0,0 +1,75 @@
+From e437343b0174392e08642343e126eb58554f42b7 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Sun, 25 Jul 2021 16:30:59 -0600
+Subject: [PATCH] Add option to disable xmlto manual generation.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://github.com/OpenPrinting/system-config-printer/pull/232]
+---
+ Makefile.am  | 7 ++++++-
+ configure.ac | 7 +++++++
+ 2 files changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 843ba30d..7facab94 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -209,9 +209,11 @@ else
+ systemd_CLEANFILES=
+ endif
+ 
++if XMLTO
+ man_MANS=					\
+ 	man/system-config-printer.1		\
+ 	man/system-config-printer-applet.1
++endif
+ 
+ dbus_DATA =					\
+ 	dbus/com.redhat.NewPrinterNotification.conf		\
+@@ -274,7 +276,6 @@ EXTRA_DIST=\
+ 	$(bin_SCRIPTS) \
+ 	setup.py \
+ 	$(EXPORT_MODULES) \
+-	man/system-config-printer.xml \
+ 	$(dbus_DATA) \
+ 	$(dbusinterfaces_DATA) \
+ 	$(dbusservices_DATA) \
+@@ -297,12 +298,16 @@ EXTRA_DIST=\
+ 	test_PhysicalDevice.py \
+ 	$(appdata_in_files)
+ 
++if XMLTO
++EXTRA_DIST+=man/system-config-printer.xml
++
+ # The man pages are generated from DocBook XML.
+ .stamp-man-pages-built: $(top_srcdir)/man/system-config-printer.xml
+ 	xmlto man -o man $<
+ 	touch .stamp-man-pages-built
+ 
+ $(man_MANS): .stamp-man-pages-built
++endif
+ 
+ html:	$(EXPORT_MODULES) $(EXPORT_MODULES_GEN)
+ 	rm -rf html
+diff --git a/configure.ac b/configure.ac
+index 811f897a..1c0f8ff3 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -75,6 +75,13 @@ if test "x$with_systemdsystemunitdir" != xno; then
+ fi
+ AM_CONDITIONAL(HAVE_SYSTEMD, [test -n "$with_systemdsystemunitdir" -a "x$with_systemdsystemunitdir" != xno ])
+ 
++AC_ARG_WITH(xmlto,
++        [AC_HELP_STRING([--with-xmlto],
++                [Enable xmlto manual generation @<:@default=yes@:>@])],
++        [],
++        [with_xmlto=no])
++AM_CONDITIONAL([XMLTO], [test x$with_xmlto != xno])
++
+ ALL_LINGUAS="ar as ast bg bn_IN bn br bs ca cs cy da de el en_GB es et fa fi fr fur gu he hi hr hu id is it ja kn ko lt lv mai ml mr ms nb nds nl nn oc or pa pl pt_BR pt ro ru si sk sl sr@latin sr sv ta te th tr uk vi zh_CN zh_TW"
+ AC_CONFIG_FILES([
+ Makefile
+-- 
+2.25.1
+
diff --git a/package/system-config-printer/Config.in b/package/system-config-printer/Config.in
new file mode 100644
index 0000000000..8ebc4d060c
--- /dev/null
+++ b/package/system-config-printer/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_SYSTEM_CONFIG_PRINTER
+	bool "system-config-printer"
+	depends on BR2_PACKAGE_CUPS
+	help
+	  Graphical user interface for CUPS administration
+
+	  https://github.com/OpenPrinting/system-config-printer
diff --git a/package/system-config-printer/system-config-printer.hash b/package/system-config-printer/system-config-printer.hash
new file mode 100644
index 0000000000..56b7e47650
--- /dev/null
+++ b/package/system-config-printer/system-config-printer.hash
@@ -0,0 +1,3 @@
+# Locally calculated:
+sha256  fbd226ce215bf014213dded81b43b9d4d90470524f5bf7cd21ecc71d4aefa689  system-config-printer-1.5.15.tar.xz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/system-config-printer/system-config-printer.mk b/package/system-config-printer/system-config-printer.mk
new file mode 100644
index 0000000000..5a796515e3
--- /dev/null
+++ b/package/system-config-printer/system-config-printer.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# system-config-printer
+#
+################################################################################
+
+SYSTEM_CONFIG_PRINTER_VERSION = 1.5.15
+SYSTEM_CONFIG_PRINTER_SOURCE = system-config-printer-$(SYSTEM_CONFIG_PRINTER_VERSION).tar.xz
+SYSTEM_CONFIG_PRINTER_SITE = https://github.com/OpenPrinting/system-config-printer/releases/download/v$(SYSTEM_CONFIG_PRINTER_VERSION)
+SYSTEM_CONFIG_PRINTER_LICENSE = GPL-2.0
+SYSTEM_CONFIG_PRINTER_LICENSE_FILES = COPYING
+SYSTEM_CONFIG_PRINTER_DEPENDENCIES = cups
+
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+SYSTEM_CONFIG_PRINTER_DEPENDENCIES += libglib2
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGLIB2)$(BR2_PACKAGE_LIBUSB)$(BR2_PACKAGE_HAS_UDEV),yyy)
+SYSTEM_CONFIG_PRINTER_CONF_OPTS = --with-udev-rules=yes
+SYSTEM_CONFIG_PRINTER_DEPENDENCIES += libusb udev
+else
+SYSTEM_CONFIG_PRINTER_CONF_OPTS = --with-udev-rules=no
+endif
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+SYSTEM_CONFIG_PRINTER_CONF_OPTS += --with-systemdsystemunitdir=/usr/lib/systemd/system
+SYSTEM_CONFIG_PRINTER_DEPENDENCIES += systemd
+else
+SYSTEM_CONFIG_PRINTER_CONF_OPTS += --with-systemdsystemunitdir=no
+endif
+
+$(eval $(autotools-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
