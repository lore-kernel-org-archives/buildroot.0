Return-Path: <SRS0=drHZ=PV=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0550BC433EF
	for <buildroot@archiver.kernel.org>; Tue,  2 Nov 2021 14:19:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7393760EE3
	for <buildroot@archiver.kernel.org>; Tue,  2 Nov 2021 14:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7393760EE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 169D580BD0;
	Tue,  2 Nov 2021 14:18:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FNBUi_GqaLEd; Tue,  2 Nov 2021 14:18:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 627A280BA5;
	Tue,  2 Nov 2021 14:18:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A35921BF3C9
 for <buildroot@lists.busybox.net>; Tue,  2 Nov 2021 14:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9343580B9C
 for <buildroot@lists.busybox.net>; Tue,  2 Nov 2021 14:18:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lxU1QNvf6bkz for <buildroot@lists.busybox.net>;
 Tue,  2 Nov 2021 14:18:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B96180AFE
 for <buildroot@buildroot.org>; Tue,  2 Nov 2021 14:18:55 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id s5so8122282pfg.2
 for <buildroot@buildroot.org>; Tue, 02 Nov 2021 07:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YFq4yo+sUb/sOenquKCXyF9pZK9Y+xw+iKuDJ2rdpjs=;
 b=C0Xuu6i1pzOwvOdnsmG7hcMvWXB3xiYfLyFBurMsvEFrm/v6J4VHHJhKuIBvYSBDQ+
 74yDbDwJYBEvN7QVK0Cnh1GEW9bKVWzYCuAwYY2Gy8/iFCHJ+r7dSmg0aApdpNvOkHtl
 jBjs9srqHvxeqURZ07iQGwpc+2qH7d1U/rBbdoLgK3pZ1cm1wwEsruxR97nlEie/7g0r
 h+29LuDNjP3UEzOIkapGHXPhB/lCcD+88kWlRGcjIQWSi1LriUPMFR0RrTu4ivln+JL3
 2tUo4REqIHfHc+jwqHAEgjE79rpo7xQjG5TtGLqCxVfjs59/FjDxrgon5E28QMeK3Q3k
 IeOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YFq4yo+sUb/sOenquKCXyF9pZK9Y+xw+iKuDJ2rdpjs=;
 b=OLKktydzwZoF64begOYvGA6z6AwGoiGFtR67a3ccux2DtwmPYyir+baONEKXchMMIZ
 tR9vKoEk3RjdAtFUX/E3iGdZd04fjwxBuL37t5RN74IYPnmefT9496VOJaVmWNxowZe4
 heCEPYQSMTv8msAtfxBZaKcZNgIXGT2GiqStMkx6Hv0ZP+oRpu9W12fJgRXWg+FYRarD
 WpIDyQlV2CuTXAJGMKlsVX0XcZB+lx/lFf1ju+Vj6sxp9N/+fJpshUHv7lRhZXmv8lew
 JKoXZZD3TFPDmmwkByXDavoiZCMFpWnYTqlcnXgKQwvZIG3Fa0P4pSDP6oQ49Owt+Mr4
 ETww==
X-Gm-Message-State: AOAM532quqbT7zxEaoIMvJXyjZ+70GIJd6R4yOQbeTgDlWmj4HQi9Aqm
 acUy0voIfW6Cz9Hyb0VEqy+4Md/36TgY8O6I
X-Google-Smtp-Source: ABdhPJxM1zbxhjV8D/OpMkIh0W5OPVyLflyg+0UtgQfW00T0FWXNrnaE0KtXKONwvyK7TSF3kk5AEg==
X-Received: by 2002:a63:7447:: with SMTP id e7mr28166919pgn.468.1635862734522; 
 Tue, 02 Nov 2021 07:18:54 -0700 (PDT)
Received: from localhost.localdomain ([43.225.10.148])
 by smtp.gmail.com with ESMTPSA id d24sm18629196pfn.62.2021.11.02.07.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 07:18:54 -0700 (PDT)
From: chenxy <field.xue@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  2 Nov 2021 22:18:47 +0800
Message-Id: <20211102141848.364177-1-field.xue@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] feat: add siitool package
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
Cc: fieldxy <field.xue@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: fieldxy <field.xue@gmail.com>

- Siitool generates your SII/EEPROM files from the ESI/XML description files of
  your EtherCAT devices. The program is also capable of interpreting a raw SII/EEPROM
  file and print it in a human-friendly syntax.
- git web https://github.com/synapticon/siitool
---
 package/Config.in                             |  1 +
 ...makefile-xmllib-and-ld-command-error.patch | 47 +++++++++++++++++++
 package/siitool/Config.in                     |  9 ++++
 package/siitool/siitool.mk                    | 23 +++++++++
 4 files changed, 80 insertions(+)
 create mode 100644 package/siitool/0001-fix-makefile-xmllib-and-ld-command-error.patch
 create mode 100644 package/siitool/Config.in
 create mode 100644 package/siitool/siitool.mk

diff --git a/package/Config.in b/package/Config.in
index c23755a421..752c935ea1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -599,6 +599,7 @@ endmenu
 	source "package/wipe/Config.in"
 	source "package/xorriso/Config.in"
 	source "package/xr819-xradio/Config.in"
+	source "package/siitool/Config.in"
 endmenu
 
 menu "Interpreter languages and scripting"
diff --git a/package/siitool/0001-fix-makefile-xmllib-and-ld-command-error.patch b/package/siitool/0001-fix-makefile-xmllib-and-ld-command-error.patch
new file mode 100644
index 0000000000..27b334f65a
--- /dev/null
+++ b/package/siitool/0001-fix-makefile-xmllib-and-ld-command-error.patch
@@ -0,0 +1,47 @@
+From 1b9b9b25b9fcf039a0566879d42e85d8941ea38d Mon Sep 17 00:00:00 2001
+From: chenxueyuan <chenxueyuan@hcfa.cn>
+Date: Mon, 1 Nov 2021 15:02:14 +0800
+Subject: [PATCH] fix: makefile xmllib and ld command error
+
+---
+ Makefile | 11 ++++-------
+ 1 file changed, 4 insertions(+), 7 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 17229b7..1872df2 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,9 +1,6 @@
+ # project file for siitool
+ 
+-CC = gcc
+-LD = gcc
+-
+-INSTALL = install
++prefix = $(STAGING_DIR)
+ 
+ WARNINGS = -Wall -Wextra
+ OPTIMIZATION = -O2
+@@ -25,8 +22,8 @@ endif
+ endif
+ 
+ # add libxml specific flags
+-CFLAGS += `xml2-config --cflags`
+-LDFLAGS += `xml2-config --libs`
++CFLAGS += `$(prefix)/usr/bin/xml2-config --cflags`
++LDFLAGS += `$(prefix)/usr/bin/xml2-config --libs`
+ 
+ H2MFLAGS = --help-option "-h" --version-option "-v" --no-discard-stderr --no-info
+ 
+@@ -53,7 +50,7 @@ all: $(TARGET)
+ man: $(TARGET).1
+ 
+ $(TARGET): $(OBJECTS)
+-	$(LD) -o $@ $^ $(LDFLAGS)
++	$(CC) -o $@ $^ $(LDFLAGS)
+ 
+ $(TARGET).1:
+ 	help2man -o $@ $(H2MFLAGS) -i misc/mansections.txt ./${TARGET}
+-- 
+2.25.1
+
diff --git a/package/siitool/Config.in b/package/siitool/Config.in
new file mode 100644
index 0000000000..23b338b9fb
--- /dev/null
+++ b/package/siitool/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_SIITOOL
+	bool "siitool"
+	depends on BR2_PACKAGE_LIBXML2
+	help
+	  Siitool generates your SII/EEPROM files from the 
+          ESI/XML description files of your EtherCAT devices.
+
+	  https://github.com/synapticon/siitool/
+
diff --git a/package/siitool/siitool.mk b/package/siitool/siitool.mk
new file mode 100644
index 0000000000..46eacea6cc
--- /dev/null
+++ b/package/siitool/siitool.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# siitool
+#
+################################################################################
+
+SIITOOL_VERSION = v1.4
+SIITOOL_SITE = $(call github,synapticon,siitool,$(SIITOOL_VERSION))
+SIITOOL_SITE_METHOD=git
+SIITOOL_LICENSE = GPL-2.0
+SIITOOL_LICENSE_FILES = LICENSE COPYING
+
+SIITOOL_MAKE_ENV = CC="$(TARGET_CC)" LD="$(TARGET_CC)"
+
+define SIITOOL_BUILD_CMDS
+	$(TARGET_MAKE_ENV)  $(TARGET_CONFIGURE_OPTS)  $(MAKE) -C $(@D)
+endef
+
+define SIITOOL_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/siitool $(TARGET_DIR)/usr/bin/siitool
+endef
+
+$(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
