Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3BCC4332F
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 09:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 295F860D4C;
	Wed, 19 Oct 2022 09:03:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 295F860D4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cZVZEuHWEvkk; Wed, 19 Oct 2022 09:03:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B05F60671;
	Wed, 19 Oct 2022 09:03:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B05F60671
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6E6391BF2C7
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 09:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 55B564026E
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 09:03:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55B564026E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lDYtXoYrYSTC for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 09:03:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78A3440154
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 78A3440154
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 09:03:20 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id b2so38392057eja.6
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 02:03:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SDHOWVfwlIXne43MhrdvFhDIdP/1fe+OIyuRANEgfzw=;
 b=Ged5DS4p9Wwz6A5gpwazuna0ayjQ6iwD71gMvjYDNMuMwF7RF3UYYIbd9H3/GBrBsV
 oulSZO2If5PQ3YPB1pwbxcYZvKWT1jwOE9rA6ja4Hjd4axEF0J8yq4tjfe7VWUuDOr7X
 AlGucpe+qI/ent9pJvLCWXH+cRY37a9iaU8vhOwVaWHrX3iqir7sdXThDONy64BGsL2B
 GUqOlABKZE8Lmm6j/JaTIzuWrP1q0u0chEWiCIQ3Q2uE7T9i7KAqBO/o3LnmPIHyVIjK
 QsThMy9OvVdk/o+/J8D1cKGAhJ/SNHlQGmGuFr6hQCFCcqoXybAWAvQudnFsTYUWQudE
 GuPg==
X-Gm-Message-State: ACrzQf3KK2U3hZn2/vaDls0UCGjNCcIqMlDyDtsMeaAkd/+2Rwsqo0tu
 BJFuV/IT2h78VsKFouoESHlCoOkShYx0XA==
X-Google-Smtp-Source: AMsMyM6hbIAbJzR9DKbyN1yhJL/8D4H6zZjlhpE4JpUETi3jTvQTLvtHt2uK5JezZjhD99bRMB8YkA==
X-Received: by 2002:a17:906:8457:b0:78d:b793:5511 with SMTP id
 e23-20020a170906845700b0078db7935511mr5770638ejy.393.1666170198152; 
 Wed, 19 Oct 2022 02:03:18 -0700 (PDT)
Received: from localhost.localdomain ([37.160.4.29])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a170906292100b00773f3cb67ffsm8611206ejd.28.2022.10.19.02.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 02:03:17 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 19 Oct 2022 11:03:09 +0200
Message-Id: <20221019090309.1410432-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SDHOWVfwlIXne43MhrdvFhDIdP/1fe+OIyuRANEgfzw=;
 b=g809YrJzGrIyB30g5aFsOROYxWm5dp8OgX8A2/JRpsaFu810bgwstl4tp8TzwioO0S
 t/rXZXvOn6e6GVnctefYm3hmgb1OZf+J6vxWQ03/mYVDO3T4tTGFPnteyAjx7BLN+/ub
 scZFG3wBK3UOrPmbfZbluRgB1mddRV0XwwWcE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=g809YrJz
Subject: [Buildroot] [PATCH v2] package/python-minimalmodbus: new package
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Easy-to-use Modbus RTU and Modbus ASCII implementation for Python.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
V2:
* Adding me to DEVELOPERS

 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/python-minimalmodbus/Config.in             |  7 +++++++
 .../python-minimalmodbus/python-minimalmodbus.hash |  4 ++++
 .../python-minimalmodbus/python-minimalmodbus.mk   | 14 ++++++++++++++
 5 files changed, 27 insertions(+)
 create mode 100644 package/python-minimalmodbus/Config.in
 create mode 100644 package/python-minimalmodbus/python-minimalmodbus.hash
 create mode 100644 package/python-minimalmodbus/python-minimalmodbus.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c0e6f8bbef..9eb5400999 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -173,6 +173,7 @@ F:	package/mono-gtksharp3/
 F:	package/monolite/
 F:	package/openjpeg/
 F:	package/python-can/
+F:	package/python-minimalmodbus/
 F:	package/python-pillow/
 F:	package/python-pydal/
 F:	package/python-spidev/
diff --git a/package/Config.in b/package/Config.in
index e3a34d6e97..08574931f8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1112,6 +1112,7 @@ menu "External python modules"
 	source "package/python-mbstrdecoder/Config.in"
 	source "package/python-memory-profiler/Config.in"
 	source "package/python-mimeparse/Config.in"
+	source "package/python-minimalmodbus/Config.in"
 	source "package/python-mistune/Config.in"
 	source "package/python-modbus-tk/Config.in"
 	source "package/python-more-itertools/Config.in"
diff --git a/package/python-minimalmodbus/Config.in b/package/python-minimalmodbus/Config.in
new file mode 100644
index 0000000000..fd0f33e0d4
--- /dev/null
+++ b/package/python-minimalmodbus/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_MINIMALMODBUS
+	bool "python-minimalmodbus"
+	select BR2_PACKAGE_PYTHON_SERIAL # runtime
+	help
+	  Easy-to-use Modbus RTU and Modbus ASCII implementation.
+
+	  https://minimalmodbus.readthedocs.io/
diff --git a/package/python-minimalmodbus/python-minimalmodbus.hash b/package/python-minimalmodbus/python-minimalmodbus.hash
new file mode 100644
index 0000000000..56af3d426b
--- /dev/null
+++ b/package/python-minimalmodbus/python-minimalmodbus.hash
@@ -0,0 +1,4 @@
+# sha256 locally computed
+sha256  aa7e3989074d4efba0013c3c50263aec01afae368bd5bd234008b50aea1b7ab4  minimalmodbus-2.0.1.tar.gz
+# Hash for license file
+sha256  abe787d472ae2069e935c84eb13fd770518dfb08b92d5f190f3cd7ff6d1f6f32  LICENSE
diff --git a/package/python-minimalmodbus/python-minimalmodbus.mk b/package/python-minimalmodbus/python-minimalmodbus.mk
new file mode 100644
index 0000000000..e4e93b4c31
--- /dev/null
+++ b/package/python-minimalmodbus/python-minimalmodbus.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-minimalmodbus
+#
+################################################################################
+
+PYTHON_MINIMALMODBUS_VERSION = 2.0.1
+PYTHON_MINIMALMODBUS_SOURCE = minimalmodbus-$(PYTHON_MINIMALMODBUS_VERSION).tar.gz
+PYTHON_MINIMALMODBUS_SITE = $(call github,pyhys,minimalmodbus,$(PYTHON_MINIMALMODBUS_VERSION))
+PYTHON_MINIMALMODBUS_SETUP_TYPE = setuptools
+PYTHON_MINIMALMODBUS_LICENSE = Apache License 2.0
+PYTHON_MINIMALMODBUS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
