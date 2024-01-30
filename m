Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093ADC46CD2
	for <buildroot@archiver.kernel.org>; Tue, 30 Jan 2024 21:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9959D83EC9;
	Tue, 30 Jan 2024 21:57:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9959D83EC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3GNIUVUVJHYw; Tue, 30 Jan 2024 21:57:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C05CA83D7C;
	Tue, 30 Jan 2024 21:57:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C05CA83D7C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 487DF1BF263
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 21:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 20EA6611F9
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 21:56:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20EA6611F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QGA1xapTW77M for <buildroot@lists.busybox.net>;
 Tue, 30 Jan 2024 21:56:44 +0000 (UTC)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CDECC611E3
 for <buildroot@buildroot.org>; Tue, 30 Jan 2024 21:56:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDECC611E3
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-510faac8c57so271130e87.1
 for <buildroot@buildroot.org>; Tue, 30 Jan 2024 13:56:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706651801; x=1707256601;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XLtBfYHExrOqbN9e5ei0iVGn5d0sVWG/QKQfYWxY4Fc=;
 b=nAoOvwOJebe5rEJeYjKf6RZURTeZEqYoslp8d4eWm+4wcjHbo+WqbvuAHfO1QX920D
 E2ljCNFhqIzijc1ktbaLQSDxEYeIEH9lrlHu/x5Rm8lMTps5HwOEAeLABSFP8DAww+tD
 5QJBwr5oVCLNRO4yLSv42Nvc56Vn/jxFurgn7StQo7NKXnLoK4zbyyxhpN3TEUa/Y2Xe
 c593jhfDdubN48ZPTXJENDa3umYY+6ihPhx5NuvO6We8spL4cPapfQZCyjJ0fPDRvWrp
 aTckk770GVEcs2ZcILRcvjiwV2a1S7CEoTnlvApps6Uhi46boJMO4F2EsivKQEz3t1x3
 OSpw==
X-Gm-Message-State: AOJu0YwSuHrqaD4eiPIJbkHpRXdkZ4Obr5YEUryyEf1XAK6Aa2YT5+It
 Yk4nTTDPh+SZ6zJTJicpgZ+G73kX7xZc/fPAv7IILWJLzKKPT7iluu1GppEC
X-Google-Smtp-Source: AGHT+IHD3JONTDw0C1sDJMKQl1JQtm5krLCPn6EBYmFgDrQbwritCFBgRhvZDcqiS3ZeMmM0wlvf7g==
X-Received: by 2002:a05:6512:2189:b0:511:9d3:c4e4 with SMTP id
 b9-20020a056512218900b0051109d3c4e4mr995000lft.24.1706651801155; 
 Tue, 30 Jan 2024 13:56:41 -0800 (PST)
Received: from luthien.lan ([2001:9b0:214:3500::c2e])
 by smtp.gmail.com with ESMTPSA id
 w28-20020ac2443c000000b0051121ce0ad8sm105435lfl.32.2024.01.30.13.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jan 2024 13:56:40 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 30 Jan 2024 22:56:24 +0100
Message-Id: <20240130215628.884512-2-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240130215628.884512-1-troglobit@gmail.com>
References: <20240130215628.884512-1-troglobit@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706651801; x=1707256601; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XLtBfYHExrOqbN9e5ei0iVGn5d0sVWG/QKQfYWxY4Fc=;
 b=NjBbEtaqL41WQuhBYotio8BXkCKSZfvb+1orF3frx0pt44SW+Sznn8toswTWLv9dfB
 vp6wtU+hJNEuwJOB1jTlHllCX80xdvdrk3sIPTSL+Q2ounlipUUOXLWJVO/lIqgxOfjf
 Cgn6+mWKCph1FhKoBsOOZyDzywk0/jKI8UZhMAjuoIxpjzw/74sON6JHkjLsqAkpUNGM
 I+kfeoE92IP86XzVXeyjJef9ObYRrqi3r/A8mUVQbxlFG1ws4m5je9C4+vG1U/+OI/OT
 CH2EWvSWki8nwkhXDZu25ZAVCQRUGFqgXptYgKIfIZT/K5pokFGmWrCVH581uMZTfVs0
 YLgw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NjBbEtaq
Subject: [Buildroot] [PATCH v2 1/2] package/watchdogd: bump to version 4.0
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
Cc: Joachim Wiberg <troglobit@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For details, see https://github.com/troglobit/watchdogd/releases/tag/4.0

 - Major feature upgrade, command line and .conf files compatible
 - LICENSE hash update due to update in copyright years
 - Enabling system monitor plugins have changed syntax upstream.  The
   `--with-foo=SECONDS` is now just `--with-foo`

This last upstream change require converting affected Config.in options
from int -> bool.  Legacy _WRAP:ers have been added to Config.legacy.in,
modeled on BR2_TARGET_ROOTFS_EXT2_BLOCKS.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 Config.in.legacy                 | 58 ++++++++++++++++++++++++++++++++
 package/watchdogd/Config.in      | 36 +++++++++-----------
 package/watchdogd/watchdogd.hash |  4 +--
 package/watchdogd/watchdogd.mk   | 19 ++++++-----
 4 files changed, 86 insertions(+), 31 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 82387338d9..b6e72d0f24 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -202,6 +202,64 @@ config BR2_KERNEL_HEADERS_6_5
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
+config BR2_PACKAGE_WATCHDOGD_MEMINFO_POLL_WRAP
+	bool
+	default y if BR2_PACKAGE_WATCHDOGD_MEMINFO_POLL != 0
+	select BR2_LEGACY
+
+# Note: BR2_PACKAGE_WATCHDOGD_*_POLL still referenced in package/watchdogd/Config.in
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
index ea033b4e71..2e67c2847e 100644
--- a/package/watchdogd/watchdogd.mk
+++ b/package/watchdogd/watchdogd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WATCHDOGD_VERSION = 3.5
+WATCHDOGD_VERSION = 4.0
 WATCHDOGD_SITE = https://github.com/troglobit/watchdogd/releases/download/$(WATCHDOGD_VERSION)
 WATCHDOGD_LICENSE = ISC
 WATCHDOGD_LICENSE_FILES = LICENSE
@@ -20,28 +20,29 @@ else
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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
