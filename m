Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E90BC41535
	for <buildroot@archiver.kernel.org>; Tue, 19 Dec 2023 17:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C13A827A5;
	Tue, 19 Dec 2023 17:05:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C13A827A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pbaC6XUWOcXp; Tue, 19 Dec 2023 17:04:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4769182980;
	Tue, 19 Dec 2023 17:04:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4769182980
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 002721BF420
 for <buildroot@lists.busybox.net>; Tue, 19 Dec 2023 17:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA76682B49
 for <buildroot@lists.busybox.net>; Tue, 19 Dec 2023 17:04:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA76682B49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nsdG8hYhfuLv for <buildroot@lists.busybox.net>;
 Tue, 19 Dec 2023 17:04:55 +0000 (UTC)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA9E9828DD
 for <buildroot@buildroot.org>; Tue, 19 Dec 2023 17:04:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA9E9828DD
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-6d93278bfbeso661181b3a.3
 for <buildroot@buildroot.org>; Tue, 19 Dec 2023 09:04:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703005494; x=1703610294;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6WGdw8Z5HIrkmAFVKJkuicdV8okbeqXDC9yjqqdUrMQ=;
 b=F4HIUF0W1njmVqxX03R2lmxBCOaVlmLjaNx0qDAPvy7PxB/N02sJUi7TzkQ/Fg6Vod
 HTuK8DqOzCIG39hYyeskRa2GrlClleMXbsTWTOAP7wzh4SouPDoCTLFIC3dJvf2Jh2I1
 Y02XbfFKqNtJd/q3YHeddEb9nBHoxkkQ2CSh190WzcF1vZtN3XAqXIYQhjRPfJplTA4y
 Q102Ubs1yrN+wVEpRVVXrMQDxdcB99VbOD6c9tAu/dx1DfruYxUqBO6Ik0pIhRsRPmgy
 +7YQY16bXDd35R5fSKDI5KlGGhQX5mX6dFDwoJ0JsnJ+PhRwp7NFudwZTv/4dN0kQ0Tf
 Un9A==
X-Gm-Message-State: AOJu0Yyi614p5vLwHmkKJUBSxcYj/ZxIHi66x47dieku0kbThP6zsqoU
 NYTiorMB6Pw3HospqU3YMvl8I5A5snizxKhJA7A=
X-Google-Smtp-Source: AGHT+IGxCWrsoBj65wDdst7f+NVxviI0D+OB20y5mHF2ZPAFx5BMdtIt0jxZulkAMqD/DYY6hnOx+A==
X-Received: by 2002:a05:6a00:10d3:b0:6c3:1b90:8552 with SMTP id
 d19-20020a056a0010d300b006c31b908552mr9859148pfu.17.1703005494427; 
 Tue, 19 Dec 2023 09:04:54 -0800 (PST)
Received: from fedora.. ([75.174.143.7]) by smtp.gmail.com with ESMTPSA id
 x25-20020aa793b9000000b006d45fc85962sm5697911pff.55.2023.12.19.09.04.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 09:04:53 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 19 Dec 2023 10:04:49 -0700
Message-ID: <20231219170451.60414-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1703005494; x=1703610294;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6WGdw8Z5HIrkmAFVKJkuicdV8okbeqXDC9yjqqdUrMQ=;
 b=GU6x2MiUCXlQWN6XsvkYf0Aa413vNEPUV1zllbyZSMShCGEGQicVxt01OPHCfLW0vE
 /Qxo84NqE5Va4IAwF7m5YWTSNcPk/LQiIEzYBZk3wLZM/1A8fY0LLPNGeYJ2Aqi7ZBwx
 trH1xoYyIoP1L/JdPAVLUZ/iFvyNGfIIvB4nc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=GU6x2MiU
Subject: [Buildroot] [PATCH v4 1/3] package/itstool: new host-package
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Translate XML with PO files using W3C Internationalization Tag Set rules.
This is needed for the zenity package.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v3 -> v4:
  - Add a Config.in.host file and select host-python3 [Yann]
  - Add a dependency on host-libxml2 [Yann]
  - Add a comment as to why autoreconf = yes is set. [Yann]
 DEVELOPERS                     |  1 +
 package/Config.in.host         |  1 +
 package/itstool/Config.in.host |  8 ++++++++
 package/itstool/itstool.hash   |  3 +++
 package/itstool/itstool.mk     | 15 +++++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/itstool/Config.in.host
 create mode 100644 package/itstool/itstool.hash
 create mode 100644 package/itstool/itstool.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 311dcd9504..519ad2984e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -37,6 +37,7 @@ F:	package/flutter-engine/
 F:	package/flutter-gallery/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
+F:	package/itstool/
 F:	package/python-kmod/
 F:	package/python-versioneer/
 F:	support/testing/tests/package/test_firewalld.py
diff --git a/package/Config.in.host b/package/Config.in.host
index c80842c33a..6bc1857df2 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -51,6 +51,7 @@ menu "Host utilities"
 	source "package/imagemagick/Config.in.host"
 	source "package/imx-mkimage/Config.in.host"
 	source "package/imx-usb-loader/Config.in.host"
+	source "package/itstool/Config.in.host"
 	source "package/jh71xx-tools/Config.in.host"
 	source "package/jq/Config.in.host"
 	source "package/jsmin/Config.in.host"
diff --git a/package/itstool/Config.in.host b/package/itstool/Config.in.host
new file mode 100644
index 0000000000..52b17a762f
--- /dev/null
+++ b/package/itstool/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_ITSTOOL
+	bool "host itstool"
+	select BR2_PACKAGE_HOST_PYTHON3
+	help
+	  Translate XML with PO files using W3C Internationalization
+	  Tag Set rules
+
+	  https://github.com/itstool/itstool
diff --git a/package/itstool/itstool.hash b/package/itstool/itstool.hash
new file mode 100644
index 0000000000..937185ec2b
--- /dev/null
+++ b/package/itstool/itstool.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  fba78a37dc3535e4686c7f57407b97d03c676e3a57beac5fb2315162b0cc3176  itstool-2.0.7.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.GPL3
diff --git a/package/itstool/itstool.mk b/package/itstool/itstool.mk
new file mode 100644
index 0000000000..94337e229c
--- /dev/null
+++ b/package/itstool/itstool.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# itstool
+#
+################################################################################
+
+ITSTOOL_VERSION = 2.0.7
+ITSTOOL_SITE = $(call github,itstool,itstool,$(ITSTOOL_VERSION))
+ITSTOOL_LICENSE = GPL-3.0+
+ITSTOOL_LICENSE_FILES = COPYING.GPL3
+# Straight our of git, no ./configure
+HOST_ITSTOOL_AUTORECONF = YES
+HOST_ITSTOOL_DEPENDENCIES = host-python3 host-libxml2
+
+$(eval $(host-autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
