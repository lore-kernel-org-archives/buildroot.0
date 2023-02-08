Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 218A7C05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 10:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AF2D40992;
	Wed,  8 Feb 2023 10:07:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AF2D40992
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TqyZ1zWF91UX; Wed,  8 Feb 2023 10:07:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 374A3409FE;
	Wed,  8 Feb 2023 10:07:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 374A3409FE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 55A791BF38B
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 10:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C015409FE
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 10:07:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C015409FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x4CERTeFUdWi for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 10:07:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC10C40992
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BC10C40992
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 10:07:10 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id u10so9881865wmj.3
 for <buildroot@buildroot.org>; Wed, 08 Feb 2023 02:07:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KcG/jmj4ciC5aITb8hytq7macNJx0X7oaQiWJpYCgCQ=;
 b=f9w5HIHOqiTYWXiaDD8WjTg9BlgodQWyBee73iRW0LLDvTmvC2SAu1qqxtM2VMrTtA
 ASUrSd1eu5MhLe4XVBHfcZp2HFiZYdFsp7S158dQC/HU8o+tRMUWBhFQnnNBHbjWqAZl
 UXpCNj3requ0OFPbQnnJSczlVCKUxJcuJ3I2uneJzggv1pWCUEnPrhSCnZUv8GtowqjU
 LAzSTJ5IO7X9Wjrq++5Ula6/0yl8E5EYi35nNLFZHGDZIl/ZKpj94Gw5ATRx6MYNeV9O
 kwEBtCmW1dKLlnrTvHk0AMdv883SOl9ikMAefKjDc/ZYUqCzJC0hEqC8BUS8Mw/bVaqq
 vB6g==
X-Gm-Message-State: AO0yUKU66kL6ZXpFBm1VgPW8v3394g/BeyBgd764Fag2edQC8FbevOUS
 HZMCH3ewRvLonFEHzbkdqyFZsxc2QgBfvDeKP9OPNw==
X-Google-Smtp-Source: AK7set8gDW4QcDOO5TWIjtWnLUGqApN7WZwWYC7wpNd+NLPlM6Wms08H3nR+6HsHUboEHOtyt0of0Q==
X-Received: by 2002:a05:600c:4a8f:b0:3dc:50bc:da70 with SMTP id
 b15-20020a05600c4a8f00b003dc50bcda70mr6002618wmp.10.1675850828426; 
 Wed, 08 Feb 2023 02:07:08 -0800 (PST)
Received: from localhost.localdomain ([84.198.244.197])
 by smtp.gmail.com with ESMTPSA id
 n19-20020a05600c3b9300b003daf7721bb3sm1637432wms.12.2023.02.08.02.07.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 02:07:07 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  8 Feb 2023 11:07:04 +0100
Message-Id: <20230208100704.68093-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KcG/jmj4ciC5aITb8hytq7macNJx0X7oaQiWJpYCgCQ=;
 b=OaTvxMUpm8l/km9oUqp1D+f/1yJua9VthdtkxcEXIPPRvjpGw3sPX3lK9BXBeQdud7
 9o1UJQPj700EO+d8fRvFlqI07SgvSKQyyn5Gk3S2dnBZZo/sZpEErcN/D/am34nyFOr/
 LJlRLh1PWcmV8kzb/ArSYeK6XcSTf7LSu8PKA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=OaTvxMUp
Subject: [Buildroot] [PATCH v6] package/gtkiostream: new package
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
Cc: Matt Flax <flatmax@flatmax.com>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Matt Flax <flatmax@flatmax.com>

This package provides many useful software engineering and signal
processing libraries.

Signed-off-by: Matt Flax <flatmax@flatmax.com>
Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
v4:                             
* Bumped to 1.8.0                                                
* Added myself to DEVELOPERS                                     
* Added dependency on octave when enable instead of use
  --disable-octave configure option                                                                                               
* Fixes from check-package                                                                                                        
v5:                                                              
* Fixed wrong syntax (Romain)                                    
* Added optional dependency on sox (Matt) 
v6:
* Fixing fomatting (Thmos P.)
* Adding optional flag for openmp
* Adding patch to disable testing compilation:
  build wasfailing for some incompatible linking option in one of the
  tests. Tests are not useful for the buildroot usecase therefore they
  are disabled.

 DEVELOPERS                                    |  4 +++
 package/Config.in                             |  1 +
 .../0001-Makefile.am-disable-tests.patch      | 29 +++++++++++++++++
 package/gtkiostream/Config.in                 | 16 ++++++++++
 package/gtkiostream/gtkiostream.hash          |  3 ++
 package/gtkiostream/gtkiostream.mk            | 31 +++++++++++++++++++
 6 files changed, 84 insertions(+)
 create mode 100644 package/gtkiostream/0001-Makefile.am-disable-tests.patch
 create mode 100644 package/gtkiostream/Config.in
 create mode 100644 package/gtkiostream/gtkiostream.hash
 create mode 100644 package/gtkiostream/gtkiostream.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d7c4d03c4c..5355d6d5ac 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -165,6 +165,7 @@ F:	package/cups/
 F:	package/cups-filters/
 F:	package/fail2ban/
 F:	package/grep/
+F:	package/gtkiostream/
 F:	package/htpdate/
 F:	package/i2c-tools/
 F:	package/jq/
@@ -1978,6 +1979,9 @@ F:	board/technologic/ts4900/
 F:	configs/ts4900_defconfig
 F:	package/ts4900-fpga/
 
+N:	Matt Flax <flatmax@flatmax.org>
+F:	package/gtkiostream/
+
 N:	Matt Weber <matthew.weber@collins.com>
 F:	board/freescale/p*
 F:	board/freescale/t*
diff --git a/package/Config.in b/package/Config.in
index 06d0a05854..70e446be47 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1389,6 +1389,7 @@ menu "Audio/Sound"
 	source "package/bcg729/Config.in"
 	source "package/caps/Config.in"
 	source "package/fdk-aac/Config.in"
+	source "package/gtkiostream/Config.in"
 	source "package/libao/Config.in"
 	source "package/libasplib/Config.in"
 	source "package/libbroadvoice/Config.in"
diff --git a/package/gtkiostream/0001-Makefile.am-disable-tests.patch b/package/gtkiostream/0001-Makefile.am-disable-tests.patch
new file mode 100644
index 0000000000..26e229a58e
--- /dev/null
+++ b/package/gtkiostream/0001-Makefile.am-disable-tests.patch
@@ -0,0 +1,29 @@
+From b242a56ddaefdcf356cffdfb45f6518c9ce0809e Mon Sep 17 00:00:00 2001
+From: Angelo Compagnucci <angelo@amarulasolutions.com>
+Date: Wed, 8 Feb 2023 10:58:20 +0100
+Subject: [PATCH] Makefile.am: disable tests
+
+Tests are not interesting for buildroot use case, thus disabling
+entirely.
+
+Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 3cc0944..4f12708 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -20,7 +20,7 @@ AUTOMAKE_OPTIONS = foreign subdir-objects
+ SUBDIRS = src api include
+ 
+ if !HAVE_EMSCRIPTEN
+-SUBDIRS += applications test
++SUBDIRS += applications
+ endif
+ 
+ ACLOCAL_AMFLAGS = -I m4
+-- 
+2.25.1
+
diff --git a/package/gtkiostream/Config.in b/package/gtkiostream/Config.in
new file mode 100644
index 0000000000..58c22ecbcb
--- /dev/null
+++ b/package/gtkiostream/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_GTKIOSTREAM
+	bool "gtkiostream"
+	depends on BR2_INSTALL_LIBSTDCPP # eigen
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_EIGEN
+	select BR2_PACKAGE_FFTW
+	select BR2_PACKAGE_FFTW_DOUBLE
+	select BR2_PACKAGE_FFTW_SINGLE
+	help
+	  This package provides many useful software engineering and
+	  signal processing includes and linkable library.
+
+	  https://github.com/flatmax/gtkiostream
+
+comment "gtkiostream needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/gtkiostream/gtkiostream.hash b/package/gtkiostream/gtkiostream.hash
new file mode 100644
index 0000000000..90c754f48c
--- /dev/null
+++ b/package/gtkiostream/gtkiostream.hash
@@ -0,0 +1,3 @@
+# locally computed hash
+sha256  44e8d921d462005cd330a1c24e5bd8061175b90ae53f537dbf73f59b74f6e01b  gtkiostream-v1.8.0.tar.gz
+sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  gpl.txt
diff --git a/package/gtkiostream/gtkiostream.mk b/package/gtkiostream/gtkiostream.mk
new file mode 100644
index 0000000000..e178bb668b
--- /dev/null
+++ b/package/gtkiostream/gtkiostream.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# GTKIOSTREAM
+#
+################################################################################
+
+GTKIOSTREAM_VERSION = v1.8.0
+GTKIOSTREAM_SITE = $(call github,flatmax,gtkiostream,$(GTKIOSTREAM_VERSION))
+GTKIOSTREAM_LICENSE = GPL-2.0+
+GTKIOSTREAM_LICENSE_FILES = gpl.txt
+
+# configure script not available
+GTKIOSTREAM_AUTORECONF = YES
+
+GTKIOSTREAM_DEPENDENCIES = \
+	eigen \
+	fftw-double \
+	fftw-single \
+	host-pkgconf \
+	$(if $(BR2_PACKAGE_SOX),sox)
+
+ifeq ($(BR2_PACKAGE_OCTAVE),y)
+GTKIOSTREAM_DEPENDENCIES += octave
+GTKIOSTREAM_CONF_OPTS += --enable-octave
+else
+GTKIOSTREAM_CONF_OPTS += --disable-octave
+endif
+
+GTKIOSTREAM_CONF_OPTS += $(if $(BR2_TOOLCHAIN_HAS_OPENMP),--disable,--enable)-openmp
+
+$(eval $(autotools-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
