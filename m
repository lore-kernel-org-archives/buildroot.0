Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B7AC77B6C
	for <buildroot@archiver.kernel.org>; Thu, 13 Apr 2023 09:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34DDF83C8E;
	Thu, 13 Apr 2023 09:21:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34DDF83C8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UV0344pyb3gQ; Thu, 13 Apr 2023 09:21:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 542CE83C90;
	Thu, 13 Apr 2023 09:21:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 542CE83C90
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B8C051BF288
 for <buildroot@lists.busybox.net>; Thu, 13 Apr 2023 09:21:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 922BE41F94
 for <buildroot@lists.busybox.net>; Thu, 13 Apr 2023 09:21:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 922BE41F94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yrkri0GaAZuu for <buildroot@lists.busybox.net>;
 Thu, 13 Apr 2023 09:21:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DADB41E6D
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9DADB41E6D
 for <buildroot@buildroot.org>; Thu, 13 Apr 2023 09:21:04 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id j17so26113239ejs.5
 for <buildroot@buildroot.org>; Thu, 13 Apr 2023 02:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681377662; x=1683969662;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GTdRFYA3JsJgniPuitJdhwK5qw0Y6arcODWSwqNgTvU=;
 b=FKOcnmBklLOIgshAxx6bOzDTok3o6IkY+CUHQ/W6hS28ttaWq54l8SweuxhpdnWp+K
 JOMmg5GI60KvLWGGxuURt8lqdfpf2tJLtsSosJjPm150MRmPxZouEezrmsbi8j2Xj7Zu
 UT7YQvNf3USrAH4lH9ZSHj7AzgkBi4jG6XjjmjxIy/eQvvTDUolcsEOL6OthHlYKwbiY
 oJfxBFieP2JSJ2dkbe2BUa/u/KRkvAqTIATV7zrPBDbr7S2mxms75cAlnkeV7Yz3NdJ+
 NaAfY9nkkEE3v8gxFmvAYEvchzH/aX7d362g4wRtm10ZRxDjscx3+Y5MLanWPSFvYm1H
 gB1A==
X-Gm-Message-State: AAQBX9dw9DWAPZJL/4cLvfVTzhci5TZNt8JcJjcuzH+ndkFKnv73nCkC
 9cOBofYJh+q9zNuhWcxXrgL/DrcG2qCjXV7fIXM=
X-Google-Smtp-Source: AKy350aekr3hUVROwAHT/NgxHUb6VTKdGgSLJvnMokYnwlRNnNna2d9Hop/8K9Q65VmpGYBSaOHPhg==
X-Received: by 2002:a17:906:3043:b0:8b1:820a:7b60 with SMTP id
 d3-20020a170906304300b008b1820a7b60mr2181071ejd.6.1681377662548; 
 Thu, 13 Apr 2023 02:21:02 -0700 (PDT)
Received: from localhost.localdomain ([91.90.166.178])
 by smtp.gmail.com with ESMTPSA id
 ta15-20020a1709078c0f00b0094a554804b9sm699353ejc.35.2023.04.13.02.21.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 02:21:02 -0700 (PDT)
From: Witold Lipieta <witold.lipieta@thaumatec.com>
To: buildroot@buildroot.org
Date: Thu, 13 Apr 2023 11:20:55 +0200
Message-Id: <20230413092055.3438333-1-witold.lipieta@thaumatec.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thaumatec-com.20221208.gappssmtp.com; s=20221208; t=1681377662; x=1683969662;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GTdRFYA3JsJgniPuitJdhwK5qw0Y6arcODWSwqNgTvU=;
 b=E4e5LHH7xNQuhp0RdYLe4EPBZC/P2LspYJ4Lo8hUqJWsPakbcbGXYFPchr9IzqOqpK
 nwcW3YR8d0fiB82raToupxYySfSbNmnM1GIv+Au+soX2k3FlJ3F/7oStr/Wou37pNPNg
 Bj8izXBQf8HsgJQ2EigwHhUK9sDVf7JofWKHjOaQ9WfZcSNJcVZA3PDQE5X/8ose3coD
 MHk4QWjr/2u9dTdfPJ2fJp7zmTEtvOtpTp7uN3RYSp0kEG6dJLxsU/25VJuo/qFgRaNd
 b6TCkGTpTqSQLqwdwmab70UuCuvcwGLDZElcLtwkEbhaVA2OMd1QeaU7RAdy9nIQaIwG
 LHhA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=thaumatec-com.20221208.gappssmtp.com
 header.i=@thaumatec-com.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=E4e5LHH7
Subject: [Buildroot] [PATCH 1/1] package/python-evdev: new package
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
Cc: Witold Lipieta <witold.lipieta@thaumatec.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

evdev 1.6.1 https://pypi.org/project/evdev/

Signed-off-by: Witold Lipieta <witold.lipieta@thaumatec.com>
---
 package/Config.in                      |  1 +
 package/python-evdev/Config.in         |  7 +++++++
 package/python-evdev/python-evdev.hash |  5 +++++
 package/python-evdev/python-evdev.mk   | 18 ++++++++++++++++++
 4 files changed, 31 insertions(+)
 create mode 100644 package/python-evdev/Config.in
 create mode 100644 package/python-evdev/python-evdev.hash
 create mode 100644 package/python-evdev/python-evdev.mk

diff --git a/package/Config.in b/package/Config.in
index 760dda6ac1..eaac32a01a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1049,6 +1049,7 @@ menu "External python modules"
 	source "package/python-engineio/Config.in"
 	source "package/python-entrypoints/Config.in"
 	source "package/python-esptool/Config.in"
+	source "package/python-evdev/Config.in"
 	source "package/python-falcon/Config.in"
 	source "package/python-filelock/Config.in"
 	source "package/python-fire/Config.in"
diff --git a/package/python-evdev/Config.in b/package/python-evdev/Config.in
new file mode 100644
index 0000000000..f6c021e694
--- /dev/null
+++ b/package/python-evdev/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_EVDEV
+	bool "python-evdev"
+	select BR2_PACKAGE_LIBEVDEV # runtime
+	help
+	  Bindings to the Linux input handling subsystem.
+
+	  https://github.com/gvalkov/python-evdev
diff --git a/package/python-evdev/python-evdev.hash b/package/python-evdev/python-evdev.hash
new file mode 100644
index 0000000000..9a6d0d07be
--- /dev/null
+++ b/package/python-evdev/python-evdev.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/evdev/json
+md5  905b12ef6136b518ddf418d8d5b053e4  evdev-1.6.1.tar.gz
+sha256  299db8628cc73b237fc1cc57d3c2948faa0756e2a58b6194b5bf81dc2081f1e3  evdev-1.6.1.tar.gz
+# Locally computed sha256 checksums
+sha256  55fd76d7b3f90d312f161d318631b93c58a0e69d662d07c4f5aca2c6c9ecc85e  LICENSE
diff --git a/package/python-evdev/python-evdev.mk b/package/python-evdev/python-evdev.mk
new file mode 100644
index 0000000000..33fe071916
--- /dev/null
+++ b/package/python-evdev/python-evdev.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# python-evdev
+#
+################################################################################
+
+PYTHON_EVDEV_VERSION = 1.6.1
+PYTHON_EVDEV_SOURCE = evdev-$(PYTHON_EVDEV_VERSION).tar.gz
+PYTHON_EVDEV_SITE = https://files.pythonhosted.org/packages/05/50/629b011a7f61cb2fca754ea8631575784bf8605a1ec4d6970a010bc54e2b
+PYTHON_EVDEV_SETUP_TYPE = setuptools
+PYTHON_EVDEV_LICENSE = Revised BSD License
+PYTHON_EVDEV_LICENSE_FILES = LICENSE
+
+PYTHON_EVDEV_BUILD_OPTS = \
+	build_ecodes \
+	--evdev-headers $(STAGING_DIR)/usr/include/linux/input.h:$(STAGING_DIR)/usr/include/linux/input-event-codes.h
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
