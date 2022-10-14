Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E1BDC4332F
	for <buildroot@archiver.kernel.org>; Fri, 14 Oct 2022 20:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F88481948;
	Fri, 14 Oct 2022 20:09:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F88481948
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U4yTmOd6GQWL; Fri, 14 Oct 2022 20:09:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22B5681919;
	Fri, 14 Oct 2022 20:09:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22B5681919
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 036201BF47A
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 20:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D343540236
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 20:09:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D343540236
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fuL_z5vCk_YX for <buildroot@lists.busybox.net>;
 Fri, 14 Oct 2022 20:09:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77164400C4
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 77164400C4
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 20:09:22 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id y80so4769904iof.3
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 13:09:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fO9cwjU/8lT+jrzFZwBpdITCprlzlfH6GKYWFSM7uPo=;
 b=kCghQtWJXivT/CgVm2O5yMWh6opOIX8I3bhulx02txLS3VuZ4lL/TJP53w0uiNyqde
 FbFQriCZNU5aRS/jE6JWxowx7UVHAMVLDkVKbF7fw8/z6dzgPas6qbENuRCX6bDAcxRT
 h7LdWO44iQUS0hUxXxxY6JMWef6WMgbL6jk/YqEz5KKQq6HD/VgBUzl9SzAr5Z5JbDr+
 oUdZKt/cUMRWIP55QgMmBCFuV5F+rwFzXxcuQVIC0lvxMKp2tuX5Vad1QG9fHGpM07SP
 1ufTUCrhTY1ky+UB/FEUZ0U2Nxlppyv1X3jiI4EDI/kWYz1CjbGUbVZSu0MKT4k1K5+z
 FJyA==
X-Gm-Message-State: ACrzQf1WYm0ENbhYP3DOGzG+BTcvVmWXKY0b78l4cAPqrDxjwI4o+CnY
 9bturp+bIvMV9pz3mItdv5xw4TuTPy7bMw==
X-Google-Smtp-Source: AMsMyM6k7xk5kekJftDeJn7S5cNw+/zCRhop7WWtJHBjigvYbzwk0sw+YNkhHw4uKTTY28hnadKJtg==
X-Received: by 2002:a05:6602:2c04:b0:6ab:d29a:7000 with SMTP id
 w4-20020a0566022c0400b006abd29a7000mr2976952iov.204.1665778160882; 
 Fri, 14 Oct 2022 13:09:20 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 v30-20020a056602059e00b006bc69b0fa07sm1271145iox.12.2022.10.14.13.09.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 13:09:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 14 Oct 2022 14:09:18 -0600
Message-Id: <20221014200918.2816609-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fO9cwjU/8lT+jrzFZwBpdITCprlzlfH6GKYWFSM7uPo=;
 b=VGmOv14SHuHSqUQ+PLbPVQLgOlS+zB8AKArojv5sNjs/9Dbfqc/InnihaHzn5uAoM4
 5sH/J7CTU5foSZNxS+g9m9MXE0AvOc1YN/W1mtXOq6z6qh1vL0IT+gq+jFnSZDoHcJYy
 N80il0Q63dxsHBWVIePUXAaz+CONyMvj0g5VPb9m4qMePwn/TTqK/c7mZqJr0y8zWs9h
 sPuDy3f+ycUUu5VTIdm3WKkITTILmQXNIohDp73DbxM58iIcP9irH+ZjjzJy/zlDh/1M
 tgj5s4DgbpFrWPTj26yxq4KkP2PGpo1A0PvbCKY2v5qKDqgwFRqmL3zCB0DRJ7wwzH/+
 lfnQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=VGmOv14S
Subject: [Buildroot] [PATCH 1/1] package/rtl8192eu: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - update to latest 5.11.2.1 version fixing issues on latest kernel
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/rtl8192eu/Config.in      | 13 +++++++++++++
 package/rtl8192eu/rtl8192eu.hash |  2 ++
 package/rtl8192eu/rtl8192eu.mk   | 23 +++++++++++++++++++++++
 5 files changed, 40 insertions(+)
 create mode 100644 package/rtl8192eu/Config.in
 create mode 100644 package/rtl8192eu/rtl8192eu.hash
 create mode 100644 package/rtl8192eu/rtl8192eu.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index bfde353c8a..0a3ecee2eb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1404,6 +1404,7 @@ F:	package/python-typing-inspect/
 F:	package/python-weasyprint/
 F:	package/python-yarl/
 F:	package/python-zopfli/
+F:	package/rtl8192eu/
 F:	package/serd/
 F:	package/sord/
 F:	package/sratom/
diff --git a/package/Config.in b/package/Config.in
index e3a34d6e97..e2ea999d60 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -576,6 +576,7 @@ endmenu
 	source "package/rtl8188eu/Config.in"
 	source "package/rtl8189es/Config.in"
 	source "package/rtl8189fs/Config.in"
+	source "package/rtl8192eu/Config.in"
 	source "package/rtl8723bu/Config.in"
 	source "package/rtl8723ds/Config.in"
 	source "package/rtl8812au-aircrack-ng/Config.in"
diff --git a/package/rtl8192eu/Config.in b/package/rtl8192eu/Config.in
new file mode 100644
index 0000000000..4d71b711c3
--- /dev/null
+++ b/package/rtl8192eu/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_RTL8192EU
+	bool "rtl8192eu"
+	depends on BR2_LINUX_KERNEL
+	help
+	  A standalone driver for the RTL8192EU USB Wi-Fi adapter.
+
+	  Make sure your target kernel has the CONFIG_WIRELESS_EXT
+	  config option enabled.
+
+	  https://github.com/clnhub/rtl8192eu-linux
+
+comment "rtl8192eu needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
diff --git a/package/rtl8192eu/rtl8192eu.hash b/package/rtl8192eu/rtl8192eu.hash
new file mode 100644
index 0000000000..f616def194
--- /dev/null
+++ b/package/rtl8192eu/rtl8192eu.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  75b523ff1cda54d7cd8734a043b2d145231ab81fcc13d3edcd80e00d59201409  rtl8192eu-1e15b6d451731bc4d3ffd587194dc4bd0f286ac0.tar.gz
diff --git a/package/rtl8192eu/rtl8192eu.mk b/package/rtl8192eu/rtl8192eu.mk
new file mode 100644
index 0000000000..0e8ffea5cb
--- /dev/null
+++ b/package/rtl8192eu/rtl8192eu.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# rtl8192eu
+#
+################################################################################
+
+RTL8192EU_VERSION = 1e15b6d451731bc4d3ffd587194dc4bd0f286ac0
+RTL8192EU_SITE = $(call github,clnhub,rtl8192eu-linux,$(RTL8192EU_VERSION))
+RTL8192EU_LICENSE = GPL-2.0
+RTL8192EU_MODULE_MAKE_OPTS = \
+	CONFIG_RTL8192EU=m \
+	USER_EXTRA_CFLAGS="-Wno-error"
+
+define RTL8192EU_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_USB_SUPPORT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_USB)
+endef
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
