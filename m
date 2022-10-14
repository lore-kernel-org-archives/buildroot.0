Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCD6C4332F
	for <buildroot@archiver.kernel.org>; Fri, 14 Oct 2022 15:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4801F6FA04;
	Fri, 14 Oct 2022 15:07:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4801F6FA04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wPTXM1hikM8d; Fri, 14 Oct 2022 15:07:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B5616F9FA;
	Fri, 14 Oct 2022 15:06:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B5616F9FA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5EC611BF2EA
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 15:06:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 39E6584188
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 15:06:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39E6584188
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fdQv3sZ-p8Wg for <buildroot@lists.busybox.net>;
 Fri, 14 Oct 2022 15:06:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E8E884177
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E8E884177
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 15:06:56 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id 8so2664790ilj.4
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 08:06:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GqQWYPOed7RlowlzGhg4/qu6lv5TtxibWPSnABOrwJ8=;
 b=tmaEnc7NzShkPIsonivIsAe71xQZFLZfcvq/dq0m495WYtr9BcpicLeC+GzZjjuZb7
 aairzrIvktYQ3V7EjZo8Cnc7m/ZBwbv+9aOELSpWHbDBGXHo25uUSv61HauuNhaA//Ok
 orDo52toIrYqKdMyjZXTSlV3M80Wut1+nLEYW/k8/Qv3N5IhnpuKLtqo7cLHmMmoOnUn
 J3MwpqEuXHbgCKtLkL0tQlyBXCf6OIeZX3Or0tkzKHgZAt/NPcw2nO965c4/3EmScFPm
 Z453uq9rMeKvFBdMJG2TxbUth4QghIq0SeEyy9dhJeo+qJR58WzAqEVvFExyLbtpez7V
 m7cQ==
X-Gm-Message-State: ACrzQf2sJCyW+ly++lxz4deyrAmm61JVrDWjeA5+fYKXArt64op7iHI8
 +0oCFJNekmTHedRHM6GT87uWOJ1RRgTAEQ==
X-Google-Smtp-Source: AMsMyM4XOj7BOOYOx8Jq0hPDzlnXfP1T0mUWA0cxlEH032opLzX25FEBpQtecdPFmK8EUyMdm4b4Jw==
X-Received: by 2002:a92:b752:0:b0:2f9:5159:6d52 with SMTP id
 c18-20020a92b752000000b002f951596d52mr2675392ilm.9.1665760014818; 
 Fri, 14 Oct 2022 08:06:54 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 u24-20020a02b1d8000000b00363753f4730sm1188291jah.91.2022.10.14.08.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 08:06:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 14 Oct 2022 09:06:51 -0600
Message-Id: <20221014150651.2527997-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GqQWYPOed7RlowlzGhg4/qu6lv5TtxibWPSnABOrwJ8=;
 b=BSZhJ3oFwSjGw6BGLy6GmbONCR5vrkIQvCsAMPmX9r5vDeW9SIjNZKI8CR3ffZK1YI
 45O8ukQJw5bhPj5hMo9md6bmPjijM2k4F5DGbcRobDIHSbyUBMHrI+YiOJygDiXTlC6O
 moFgIscv0i4g1hNo6Ama4MYVT8udVnMYj9uSPA3wua/+oYHFMQGY2fZnzMuQo/q6+8sQ
 gJigZKXwAZoElh+yte8MlR4ohespPFYsRKy4fuiflIyV7zoDYA8Amy00Ks6qvUQl08FF
 janWKvV4sIzwe/qyTiPladmoS5LaaNLDLcKNg52fo6swLP5BGlUvhMia2fnUClCOeloE
 37WA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BSZhJ3oF
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
index 0000000000..167864c35d
--- /dev/null
+++ b/package/rtl8192eu/rtl8192eu.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  b2b363b8dc27c658cbfd5be32a65d0876cfd7c723ac6f72fdefeb6e44a9b1c9e  rtl8192eu-7b17d51543859e23d845d473806347db3415e8e4.tar.gz
diff --git a/package/rtl8192eu/rtl8192eu.mk b/package/rtl8192eu/rtl8192eu.mk
new file mode 100644
index 0000000000..cb612a4c15
--- /dev/null
+++ b/package/rtl8192eu/rtl8192eu.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# rtl8192eu
+#
+################################################################################
+
+RTL8192EU_VERSION = 7b17d51543859e23d845d473806347db3415e8e4
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
