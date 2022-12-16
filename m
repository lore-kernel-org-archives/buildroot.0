Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43965C4332F
	for <buildroot@archiver.kernel.org>; Fri, 16 Dec 2022 08:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81BFA82039;
	Fri, 16 Dec 2022 08:04:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81BFA82039
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HGqnBKZm-fiX; Fri, 16 Dec 2022 08:04:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C08538201B;
	Fri, 16 Dec 2022 08:04:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C08538201B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3E8601BF3B5
 for <buildroot@lists.busybox.net>; Fri, 16 Dec 2022 08:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 19E3F404C2
 for <buildroot@lists.busybox.net>; Fri, 16 Dec 2022 08:04:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19E3F404C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c2qysmfgcWSQ for <buildroot@lists.busybox.net>;
 Fri, 16 Dec 2022 08:04:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0989140187
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0989140187
 for <buildroot@buildroot.org>; Fri, 16 Dec 2022 08:04:43 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id i15so2579601edf.2
 for <buildroot@buildroot.org>; Fri, 16 Dec 2022 00:04:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HcYTUwljus9jqkMHo9v3P1jyOBc6Eagl7wiw27ps4hM=;
 b=Acx7C8biSPIHowWAA/PwkGc1EBlCu9/8M/rpo6Pv/09Ftpv8W6y3hfb03CdnWSVCGC
 75rQHw2O2Qr5gk86srvoyTxrXI6heNj13dNvk0XAY0QUPfIqV9fc+oVAYutkuokV+ZoX
 YC9RYhpcit1l6/UVwrWd4SfjslfYIlNccQBcvY0PCh2zDg1j5ajW/liufhIUDszI+bQ5
 mWo0w6RjfAL1K0cefZy6eT2pedaFdI/CMvgU3ykn7hkt7R5Y32dDbw0sfQK1RVKDJx3Y
 UyWoNSp3vCwQMXxC+awJg2mrOq8UmMVcIlvFBdP74cxLnrSg6bmeUoz05DozXKlnYZTm
 rEkQ==
X-Gm-Message-State: ANoB5plkJosbSS9gPvsaWeD5r7UhYbQj+3mm4uCXRQC+1k7WmTB5YgLW
 i7ZfwSsxF9A9+JvJJ/t2PKihyWFEBZbdmW1mT1M=
X-Google-Smtp-Source: AA0mqf7SZFnnCtbgn2lCE90/gsA14ewizfAsKNHoUhvoa4ZIvE/QzCWyt5yX9DXOBA4SPwnUpEiZww==
X-Received: by 2002:a05:6402:5303:b0:45c:834b:f2ad with SMTP id
 eo3-20020a056402530300b0045c834bf2admr26271735edb.42.1671177881771; 
 Fri, 16 Dec 2022 00:04:41 -0800 (PST)
Received: from angeloc.amarulasolutions.com
 (host085115199111.static.fidoka.tech. [85.115.199.111])
 by smtp.gmail.com with ESMTPSA id
 o8-20020aa7dd48000000b0046a0096bfdfsm571762edw.52.2022.12.16.00.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 00:04:41 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 16 Dec 2022 09:04:31 +0100
Message-Id: <20221216080433.1997432-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HcYTUwljus9jqkMHo9v3P1jyOBc6Eagl7wiw27ps4hM=;
 b=QKbnEyjnk3pIBV9aii+2sKgPXNWNAFH+ZfDkVaWduaMJNlgB7NHEKhvKJwWwY+PGfn
 FFpVolcw/I4584sIkTo3c3i1I2YbyhyjOzaELHL2fSSMI4MGEbPAS1ez1Gz2D2249gCc
 vIWjZu7YyILnor/iLg6DtRXUh6gjbA4sQOKLM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=QKbnEyjn
Subject: [Buildroot] [PATCH v6 1/3] package/rtl8723ds-bt: new package
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
Cc: indrek.kruusa@gmail.com, Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package install the required firmware for enabling the
Bluetooth device embedded in the RTL8723DS chip.
The driver is included in Linux main tree and can be enabled
with the BT_HCIUART_RTL symbol.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Tested-by: Indrek Kruusa <indrek.kruusa@gmail.com>
---
v6:
* Added me to developers file

 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/rtl8723ds-bt/Config.in         |  6 ++++++
 package/rtl8723ds-bt/rtl8723ds-bt.hash |  2 ++
 package/rtl8723ds-bt/rtl8723ds-bt.mk   | 17 +++++++++++++++++
 5 files changed, 27 insertions(+)
 create mode 100644 package/rtl8723ds-bt/Config.in
 create mode 100644 package/rtl8723ds-bt/rtl8723ds-bt.hash
 create mode 100644 package/rtl8723ds-bt/rtl8723ds-bt.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3a0e3c14ab..b52a065dbc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -185,6 +185,7 @@ F:	package/qt5/qt5coap/
 F:	package/qt5/qt5knx/
 F:	package/qt5/qt5mqtt/
 F:	package/rtl8723ds/
+F:	package/rtl8723ds-bt/
 F:	package/sam-ba/
 F:	package/sshguard/
 F:	package/sunwait/
diff --git a/package/Config.in b/package/Config.in
index 914c3584e9..999feae08a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -585,6 +585,7 @@ endmenu
 	source "package/rtl8192eu/Config.in"
 	source "package/rtl8723bu/Config.in"
 	source "package/rtl8723ds/Config.in"
+	source "package/rtl8723ds-bt/Config.in"
 	source "package/rtl8812au-aircrack-ng/Config.in"
 	source "package/rtl8821au/Config.in"
 	source "package/sane-backends/Config.in"
diff --git a/package/rtl8723ds-bt/Config.in b/package/rtl8723ds-bt/Config.in
new file mode 100644
index 0000000000..0a604310c0
--- /dev/null
+++ b/package/rtl8723ds-bt/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_RTL8723DS_BT
+	bool "rtl8723ds-bt"
+	help
+	  rtl8723ds UART attached Bluetooth module firmware.
+
+	  https://github.com/wsyco/RTL8723DS_BT_Linux
diff --git a/package/rtl8723ds-bt/rtl8723ds-bt.hash b/package/rtl8723ds-bt/rtl8723ds-bt.hash
new file mode 100644
index 0000000000..1ec4e350f9
--- /dev/null
+++ b/package/rtl8723ds-bt/rtl8723ds-bt.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  9e70a981946abeeb6437d9a27d8437cea15aa4df72f8d56ded0ae28af484d2f4  rtl8723ds-bt-14cedf3a9fec1aa8c500fa52f3e3acc433cbcf08.tar.gz
diff --git a/package/rtl8723ds-bt/rtl8723ds-bt.mk b/package/rtl8723ds-bt/rtl8723ds-bt.mk
new file mode 100644
index 0000000000..efd0a5bae9
--- /dev/null
+++ b/package/rtl8723ds-bt/rtl8723ds-bt.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# rtl8723ds-bt
+#
+################################################################################
+
+RTL8723DS_BT_VERSION = 14cedf3a9fec1aa8c500fa52f3e3acc433cbcf08
+RTL8723DS_BT_SITE = $(call github,wsyco,RTL8723DS_BT_Linux,$(RTL8723DS_BT_VERSION))
+RTL8723DS_BT_LICENSE = PROPRIETARY
+
+define RTL8723DS_BT_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/lib/firmware/rtl_bt/
+	cp $(@D)/8723D/rtl8723d_fw $(TARGET_DIR)/lib/firmware/rtl_bt/rtl8723ds_fw.bin
+	cp $(@D)/8723D/rtl8723d_config $(TARGET_DIR)/lib/firmware/rtl_bt/rtl8723ds_config.bin
+endef
+
+$(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
