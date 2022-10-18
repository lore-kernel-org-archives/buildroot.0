Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C519C4332F
	for <buildroot@archiver.kernel.org>; Tue, 18 Oct 2022 16:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9A99408C5;
	Tue, 18 Oct 2022 16:14:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9A99408C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ItRs87nydr8G; Tue, 18 Oct 2022 16:14:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8827E40554;
	Tue, 18 Oct 2022 16:14:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8827E40554
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 292241BF5AE
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 16:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 112B883E87
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 16:14:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 112B883E87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zVuODlqUBuRw for <buildroot@lists.busybox.net>;
 Tue, 18 Oct 2022 16:14:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E555D83E85
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E555D83E85
 for <buildroot@buildroot.org>; Tue, 18 Oct 2022 16:14:20 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id b2so33502561eja.6
 for <buildroot@buildroot.org>; Tue, 18 Oct 2022 09:14:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QJoJAzqecFmUqSuhSmk2FU3Dn0U5ot3Zt4xX676yOkc=;
 b=lJkOrIcl8P4tXtnnIEHPSpdCWnGXiHthLfwJeUs8tzapYqlD03v7GfEDlXED4D5Vcv
 ep/YsscAP76Od670aHntn5MH7SBJng0btaA3NkPhXn1kb1gSIm90Xkv5aBLmXxWrec29
 9D+tKnhEtVb3uEmKDZYlaJJNHBoz0JWTDY8zX9KWU1WY1mcJu7c0K4PbeuQQqTEIV4Pe
 mgaqtJ4CJdVh2xC2m7LpQb+u2j+atgDStvlC+oFHMUWPkWg9vz1bq79qc5ecfHWCWmu+
 HXFxpNOWeFMjh/HIlQaFhBNsWCpWtal/PUBy4VhAq07WhbIZ3zCcRRp+VInDQqxKHSnr
 IFrQ==
X-Gm-Message-State: ACrzQf20+oOOH2WjDKP5kJLU4TewuqX2PIeFvRFT45Zefte6Az5UYIuJ
 RSS4QVVk17YLqFN3GUCqTF2ugXvjHk2QGw==
X-Google-Smtp-Source: AMsMyM7r9N29eia3563d5jxbQy83gvHhohrx3rvVBXURQ/ibNL2o+TiOPDeNFK+5EwOmBeqHTbowIQ==
X-Received: by 2002:a17:907:6e11:b0:78e:3057:f631 with SMTP id
 sd17-20020a1709076e1100b0078e3057f631mr3053705ejc.333.1666109658714; 
 Tue, 18 Oct 2022 09:14:18 -0700 (PDT)
Received: from localhost.localdomain ([37.161.144.184])
 by smtp.gmail.com with ESMTPSA id
 b21-20020aa7d495000000b004580862ffdbsm9100661edr.59.2022.10.18.09.14.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 09:14:17 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 18 Oct 2022 18:14:13 +0200
Message-Id: <20221018161413.1237297-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QJoJAzqecFmUqSuhSmk2FU3Dn0U5ot3Zt4xX676yOkc=;
 b=UPi0JHim0+KsP9c+xCIN+zjhDLky8GFHW7/lO1TDDl3hNILKUbRwaSC9d3LXF3U5u/
 Uo1zJ35Wem/IqJQGYbd1oWXdLX3VrHYIrljZLvmNqnTlI95HwpAOMuyiHkiWRN4AieF8
 WP/Gx5uYtdbi9mJ2/iSGPKLQRvKQcdh7GS9YA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=UPi0JHim
Subject: [Buildroot] [PATCH] package/python-minimalmodbus: new package
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
 package/Config.in                                  |  1 +
 package/python-minimalmodbus/Config.in             |  7 +++++++
 .../python-minimalmodbus/python-minimalmodbus.hash |  4 ++++
 .../python-minimalmodbus/python-minimalmodbus.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-minimalmodbus/Config.in
 create mode 100644 package/python-minimalmodbus/python-minimalmodbus.hash
 create mode 100644 package/python-minimalmodbus/python-minimalmodbus.mk

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
