Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A69C636D3
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 17:51:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 480C240047;
	Tue,  7 Feb 2023 17:51:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 480C240047
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xOF0sTv872f2; Tue,  7 Feb 2023 17:51:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A04C401DF;
	Tue,  7 Feb 2023 17:51:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A04C401DF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 82C9F1BF5F6
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B688F408A3
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:51:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B688F408A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0oek3CJ0xiFo for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 17:51:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88C6940A95
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 88C6940A95
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 17:51:21 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 m16-20020a05600c3b1000b003dc4050c94aso12109419wms.4
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 09:51:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TQzDHsKpMOncg37xiYtEKEm2TGTky3xCoN4uuD5V3k4=;
 b=UzXOi8ALEpGwCCDDPIjBY7K2AIIapQG4kAM/88mQa9oXZfSlyAz7XKQ7Q4WOxXvWHF
 bGomB0/ERIBGX3kKH6MgcTUX3LAQF+UILFNlzGBrn/uX2ykCXhHucNPkoFrhdciX8pS6
 2T817SLf50WytNyH9P5Gaw06xcQ1TovawDHsypqtV8MzFtO72iN3fn+WdDTUBfkeGy9p
 OtoNCnS0z+5YZP1Z0o8CLJUnSKNLiHIRla7dGISt9l/DdqHH9rv7C+BtLc5xB60emdMI
 B1qeHySVAOREvuesPn58LTx1h38B34kvhg9S5tTR2+OgTN1K8H/F4BDA9EE97riDOwjQ
 tLEg==
X-Gm-Message-State: AO0yUKXPY0BUwTbN7leukkpte75Yi02SorNePRdBoRCRgLy/njED1Rkn
 OV2ZwQbt8YfVahvUdOknXY1I6cuElZNzbmPAOFNRUQ==
X-Google-Smtp-Source: AK7set9xZN2dclsD5aiELbPjrzx+w05ZuTF9miuzfUWPXyFvN5f83XhzK5Q4oVP+tvRuAc6RzUNoIA==
X-Received: by 2002:a05:600c:4393:b0:3de:1d31:1043 with SMTP id
 e19-20020a05600c439300b003de1d311043mr3710717wmn.21.1675792279347; 
 Tue, 07 Feb 2023 09:51:19 -0800 (PST)
Received: from angeloc.wifiguest.local (cpe1150018.bra.be.verixi.net.
 [85.119.216.19]) by smtp.gmail.com with ESMTPSA id
 s24-20020a05600c319800b003dfe5190376sm13747909wmp.35.2023.02.07.09.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 09:51:18 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  7 Feb 2023 18:51:16 +0100
Message-Id: <20230207175116.3043006-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TQzDHsKpMOncg37xiYtEKEm2TGTky3xCoN4uuD5V3k4=;
 b=ibPSDGL+dxCzGd3Ctvukz1suP1pZK9yAjZmzDLT8zCgT3adshhWal1zUXCFPLTGC88
 JWW/iGDDUliZu41SVSfgP3ZUop34YKZ5Z8gb7icK9bxtT9MGK7NOJqieJhTk6GlFW7Ha
 f+AxAbJL7QINMYcqTbxW3d8K2rBsoosCQvYqc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ibPSDGL+
Subject: [Buildroot] [PATCH v4] package/gtkiostream: new package
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
[Angelo:
 * Bumped to 1.8.0
 * Added myself to DEVELOPERS
 * Added dependency on octave when enable instead of use
   --disable-octave configure option
 * Fixes from check-package]
Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 DEVELOPERS                           |  4 ++++
 package/Config.in                    |  1 +
 package/gtkiostream/Config.in        | 15 +++++++++++++++
 package/gtkiostream/gtkiostream.hash |  3 +++
 package/gtkiostream/gtkiostream.mk   | 23 +++++++++++++++++++++++
 5 files changed, 46 insertions(+)
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
diff --git a/package/gtkiostream/Config.in b/package/gtkiostream/Config.in
new file mode 100644
index 0000000000..bb97961587
--- /dev/null
+++ b/package/gtkiostream/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_GTKIOSTREAM
+	bool "gtkiostream"
+	depends on BR2_INSTALL_LIBSTDCPP # eigen
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
index 0000000000..3988ae5888
--- /dev/null
+++ b/package/gtkiostream/gtkiostream.mk
@@ -0,0 +1,23 @@
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
+GTKIOSTREAM_DEPENDENCIES = eigen fftw-double fftw-single host-pkgconf
+
+ifeq ($(BR2_PACKAGE_OCTAVE),y)
+GTKIOSTREAM_DEPENDENCIES += octave
+GTKIOSTREAM_CONF_OPTS = --enable-octave
+else
+GTKIOSTREAM_CONF_OPTS = --disable-octave
+endif
+
+# configure script not available
+GTKIOSTREAM_AUTORECONF = YES
+
+$(eval $(autotools-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
