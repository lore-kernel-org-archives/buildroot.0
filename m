Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B16C32774
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 05:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E49140339;
	Tue, 23 Aug 2022 05:48:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E49140339
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CJWHzYbM5YJd; Tue, 23 Aug 2022 05:48:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 98F7D40323;
	Tue, 23 Aug 2022 05:48:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98F7D40323
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 035381BF2F8
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 05:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB29240873
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 05:48:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB29240873
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H8FMgYdHJ7Po for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 05:48:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C81774086F
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C81774086F
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 05:48:16 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id z187so12451321pfb.12
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 22:48:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=VUUD3ObcZzMUEZ8hnGPIjhKtf48p8VvruFvyuBCcZAQ=;
 b=wRqD+V6235/9sCuch9Hy0EMv4Cy/rz0MuaBJQFeZTma1ZQpo8Iu/TeAFwdbiLTuYa5
 zVb9WtP9OWxambz+qf4sh1ThnSLCz5JPRa1xzmFn7uS+ZA5xlcvBtKWBT1GsgkKeAdIi
 a+yhERBKhE94YfX/iz0Gkdr1r9NXTnbIE6gB85/H8W2ygcaMOod1uuEhgqWTqXn+d02A
 knFsTL7M+89m1LIZu9wFwhWfA+ubib6NanBJv6Nsxa6w7VKULEuMltSSLnapJerp9jMl
 dhK7g87sRMWP/stedOoED+JX0wnfX+WxeMCQYXLzLVlDQmtXo0q8rmnHs18qiyi+6Mhb
 +Edw==
X-Gm-Message-State: ACgBeo3Domsy3jAfJjPNWQ4BBn8elTcFXE2yg4GGtEtD4rNn6PdHyyWa
 1FEhJAuYcCre1jbm10AYSARc4KDtQikStg==
X-Google-Smtp-Source: AA6agR7HSEh3V3uN2gtZ3Icn/lwkSRHD3lD0KepoBV1rEyOE+M6YZhtU3eFD9OpIq5Z8UX0rcpmhSQ==
X-Received: by 2002:a05:6a00:1a:b0:536:d522:dbf1 with SMTP id
 h26-20020a056a00001a00b00536d522dbf1mr4752709pfk.42.1661233695601; 
 Mon, 22 Aug 2022 22:48:15 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 c9-20020a170902d48900b0016db43e5212sm9528379plg.175.2022.08.22.22.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 22:48:14 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 22 Aug 2022 22:48:11 -0700
Message-Id: <20220823054811.360322-1-christian@paral.in>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/crun: new package
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

crun is a fast and low-memory OCI Container Runtime in C.

https://github.com/containers/crun

Signed-off-by: Christian Stewart <christian@paral.in>

---

v1 -> v2:

 - add libcap and systemd flags
 - use upstream download tar.gz with submodules and git version
 - no need to use the submodule download method nor the patch.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/crun/Config.in |  7 +++++++
 package/crun/crun.hash |  4 ++++
 package/crun/crun.mk   | 36 ++++++++++++++++++++++++++++++++++++
 5 files changed, 49 insertions(+)
 create mode 100644 package/crun/Config.in
 create mode 100644 package/crun/crun.hash
 create mode 100644 package/crun/crun.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d2bd0d809a..b92821f9c7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -530,6 +530,7 @@ F:	package/python-pylibftdi/
 N:	Christian Stewart <christian@paral.in>
 F:	package/batman-adv/
 F:	package/containerd/
+F:	package/crun/
 F:	package/delve/
 F:	package/docker-cli/
 F:	package/docker-engine/
diff --git a/package/Config.in b/package/Config.in
index d1c098c48f..fd591d9e52 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2567,6 +2567,7 @@ menu "System tools"
 	source "package/coreutils/Config.in"
 	source "package/cpulimit/Config.in"
 	source "package/cpuload/Config.in"
+	source "package/crun/Config.in"
 	source "package/daemon/Config.in"
 	source "package/dc3dd/Config.in"
 	source "package/dcron/Config.in"
diff --git a/package/crun/Config.in b/package/crun/Config.in
new file mode 100644
index 0000000000..5aca10dcdb
--- /dev/null
+++ b/package/crun/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_CRUN
+	bool "crun"
+	select BR2_PACKAGE_YAJL # libocispec
+	help
+	  crun is a fast and low-memory OCI Container Runtime in C.
+
+	  https://github.com/containers/crun
diff --git a/package/crun/crun.hash b/package/crun/crun.hash
new file mode 100644
index 0000000000..de61310e08
--- /dev/null
+++ b/package/crun/crun.hash
@@ -0,0 +1,4 @@
+# Locally computed
+sha256  acd24012daa951cf1674b20b2d5f87975d5d6c8e8c80bfe12e4cffa3495cae67  crun-1.5.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.libcrun
diff --git a/package/crun/crun.mk b/package/crun/crun.mk
new file mode 100644
index 0000000000..210d3c5860
--- /dev/null
+++ b/package/crun/crun.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# crun
+#
+################################################################################
+
+CRUN_VERSION = 1.5
+CRUN_SITE = https://github.com/containers/crun/releases/download/$(CRUN_VERSION)
+CRUN_DEPENDENCIES = host-pkgconf yajl
+
+CRUN_LICENSE = GPL-2.0+ (crun binary), LGPL-2.1+ (libcrun)
+CRUN_LICENSE_FILES = COPYING COPYING.libcrun
+
+CRUN_AUTORECONF = YES
+CRUN_CONF_OPTS += --enable-embedded-yajl=no
+
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+CRUN_DEPENDENCIES += libcap
+else
+CRUN_CONF_OPTS += --disable-caps
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
+CRUN_DEPENDENCIES += libseccomp
+else
+CRUN_CONF_OPTS += --disable-seccomp
+endif
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+CRUN_CONF_OPTS += --enable-systemd
+CRUN_DEPENDENCIES += systemd host-pkgconf
+else
+CRUN_CONF_OPTS += --disable-systemd
+endif
+
+$(eval $(autotools-package))
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
