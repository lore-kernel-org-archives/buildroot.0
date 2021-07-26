Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD6ACC4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 18:51:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A9A560F6F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 18:51:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5A9A560F6F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06D9440264;
	Mon, 26 Jul 2021 18:51:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KenODHqB7UIZ; Mon, 26 Jul 2021 18:51:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2917740182;
	Mon, 26 Jul 2021 18:51:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C88871BF2F2
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 18:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B21B882AB6
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 18:51:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3EJl2z0mnI6o for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 18:51:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 52F0582A7F
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 18:51:14 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id y200so13249057iof.1
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 11:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bk6bP1+mma50RA2033DmQG6HYPdr2T/asHwpCjdLfyg=;
 b=QUDagH2vCfdI70MqM8Ks58o3CcH8yPMLUfgGFVy8FQD2cVYEGOe4AfbCxIyo1J9G2f
 Wl5PKZzHSoOSJpdw0cRVyQwsvLlCLCb+smzWFLsheZ8hyUO1rHDh904+QTwleG2itIvl
 T54gzs8PnHqg3kGb9CbaiQy4Gx0yFatshbL0UW8WgprnaK0W3lqSQI7mik/kXuz1ZY9S
 oRr58r3kS8oaAY8lMMTIRaM/KUlI5BxDhpX2pxyc5aHmA2hUo2ctDFwxJ76jEfybC3yh
 4wCTVxiNfOF16NDYcMCOcXIR6KVwu7LjMZSNtTpNVoqRC7m4cr9n+SKMaA+cOH21qPQ+
 ErkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bk6bP1+mma50RA2033DmQG6HYPdr2T/asHwpCjdLfyg=;
 b=QD8tDLatMG0Qkc+oSDQBB9IClmrT6rLLDgV3EEcujPcs96za+AVrvDZPri6z3rvSMc
 aguLwAiB68+lvjdQR+Lo+SRv01bOv/wfZ6+LOa3gVr+za+Mb4rAqIiFgLmEnaeQrohmI
 qOeRTaErAWelL76lpEWWC3Ouu93YS2OVrWccxY7Zck3JdNfOE+H2wJJafxFCaNtrUNfe
 mvZbaRmxxCOkpzssVl4TF+azciP7FutBP1h6x8DANyKtNwXF6XyUBx+rtOBi48+MJIGw
 uPIbs1+d3b+ceMDkdRnWbXQHiWfP6r/WsprxMsk9zwNf2kK6Fz1yOGmsi/QZIou/vv6Y
 pJng==
X-Gm-Message-State: AOAM530LWa/vbvCVx1k9VPIeuFf0XtfIKtgVn4Vh3ZuqBu3H5SaKGG0y
 fQsTB73m3qo40Nslld0mZzQxsgd/w3E=
X-Google-Smtp-Source: ABdhPJyDdvOYhbDTN3LUXoNQK8H3rRNs+MD0l7neHWr6yoRMkGBr6LYvGbaswJX/g83VlPppgI84OQ==
X-Received: by 2002:a05:6602:2245:: with SMTP id
 o5mr16188154ioo.20.1627325473049; 
 Mon, 26 Jul 2021 11:51:13 -0700 (PDT)
Received: from james-x399.localdomain (97-118-178-184.hlrn.qwest.net.
 [97.118.178.184])
 by smtp.gmail.com with ESMTPSA id k4sm265288ilu.67.2021.07.26.11.51.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 11:51:12 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 12:51:10 -0600
Message-Id: <20210726185110.3333950-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/system-config-printer: new
 package
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
Changes v1 -> v2:
  - update patch to merged upstream version
---
 package/Config.in                             |  1 +
 ...n-to-disable-xmlto-manual-generation.patch | 73 +++++++++++++++++++
 package/system-config-printer/Config.in       |  7 ++
 .../system-config-printer.hash                |  3 +
 .../system-config-printer.mk                  | 32 ++++++++
 5 files changed, 116 insertions(+)
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
index 0000000000..e2cf395811
--- /dev/null
+++ b/package/system-config-printer/0001-Add-option-to-disable-xmlto-manual-generation.patch
@@ -0,0 +1,73 @@
+From 731c8d7e1f9edb527785d61f74031a5e5846554b Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Sun, 25 Jul 2021 16:30:59 -0600
+Subject: [PATCH] Add option to disable xmlto manual generation.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1@gmail.com: backport from upstream commit
+95e0b461f5a46c74b00287aca65732ea2fc9d69b]
+---
+ Makefile.am  | 7 ++++++-
+ configure.ac | 5 +++++
+ 2 files changed, 11 insertions(+), 1 deletion(-)
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
+index 811f897a..a2a66889 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -75,6 +75,11 @@ if test "x$with_systemdsystemunitdir" != xno; then
+ fi
+ AM_CONDITIONAL(HAVE_SYSTEMD, [test -n "$with_systemdsystemunitdir" -a "x$with_systemdsystemunitdir" != xno ])
+ 
++AC_ARG_WITH(xmlto,
++        [AC_HELP_STRING([--with-xmlto],
++                [Enable xmlto manual generation @<:@default=yes@:>@])])
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
