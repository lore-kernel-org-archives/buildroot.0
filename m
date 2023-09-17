Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D8ECD37B3
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 14:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E7CC41550;
	Sun, 17 Sep 2023 14:35:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E7CC41550
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u3kSHL0FTQ-f; Sun, 17 Sep 2023 14:35:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EA3341570;
	Sun, 17 Sep 2023 14:35:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EA3341570
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D65F81BF3F4
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 14:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4B2F41570
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 14:35:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4B2F41570
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7YBgW16epA4e for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 14:34:59 +0000 (UTC)
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7B51D41550
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 14:34:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B51D41550
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2b9338e4695so58070341fa.2
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 07:34:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694961297; x=1695566097;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yUpoJzI1v9BR9ooEvXPGsVnYzXAWW36LDtkOGoVScd8=;
 b=bwEICUDck/cOW/G/tlP50bkw4WYvyyfjBH2FZcXdNOiUbEx3IoeLXh++UoAkuAe2si
 /Ih4S1q9nXg/FjLduJiLIuDDJIYa1FzWJogRjOCc8qunfaJIYF1bu4SA24fnJyFaBisZ
 c4Lj/MGrij2oKQXYsl1rY2kV8nyelwlW/HRDzWQE6wWlacn+NU5bnpPPGTx02B2nwbJ6
 PwjoG0fn4ngnKVCuyetcwt4q5CJUqsn64DusIq+3MsoeByyjtz1Z/pRU63vOo/FmcU9B
 1R3ob55Fp9PpYsvs/0LJUkl0THulUn8pb24+DgY/fUXPlgf08NOIKxAzVUfblQdHUQkD
 zfsg==
X-Gm-Message-State: AOJu0YzfgttNpD/Uxe2E3SJbHJd2hp7Cqk47Kjlvh04sNEJ9WJEw91Tg
 SahQN8e95dnzvKb5KdoG9Ds7I1IJ+ngV/SuC2GL0rA==
X-Google-Smtp-Source: AGHT+IGG41+1TOw0PjNq1lijsfID3RAJdgIoW4sejEZZh2VXNuszbHB0pT19MuD5AXDiilkbfFYFpg==
X-Received: by 2002:a2e:a4a8:0:b0:2c0:52e:eafa with SMTP id
 g8-20020a2ea4a8000000b002c0052eeafamr930821ljm.29.1694961296761; 
 Sun, 17 Sep 2023 07:34:56 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-21-103-71.retail.telecomitalia.it. [79.21.103.71])
 by smtp.gmail.com with ESMTPSA id
 gv23-20020a170906f11700b0098ec690e6d7sm5060311ejb.73.2023.09.17.07.34.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Sep 2023 07:34:56 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 17 Sep 2023 16:34:52 +0200
Message-Id: <20230917143452.1374576-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1694961297; x=1695566097;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yUpoJzI1v9BR9ooEvXPGsVnYzXAWW36LDtkOGoVScd8=;
 b=FxjcW1VCVl9g1cJ0dF75ZA91cyOmgBfZd4pomDMiMInrmqaGymQVp+vJWo3gv4Lw2U
 3TKldUza/iBDeffVogifLqqEzuZkXyaNNxO42BP3s7Hy4AApMgBmwdi7W539fCn2VZcc
 lMqlXanZmiFvXSnBIDnMdfd0+a/UKl9fRjrbU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=FxjcW1VC
Subject: [Buildroot] [PATCH 1/1] package/davinci-bootcount: rename as
 uboot-bootcount
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Dario Binacchi <dariobin@libero.it>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Born as a project to read/write the bootcount on the TI am3xx platform,
over time it has introduced bootcount management on EEPROM and for the
stm32mp1 platform. As a result, the project removed the 'davinci' tag
from its name and GitHub link.
The patch aligns the package name in Buildroot with the current one on
GitHub.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 DEVELOPERS                                        |  2 +-
 package/Config.in                                 |  2 +-
 package/davinci-bootcount/Config.in               | 11 -----------
 package/davinci-bootcount/davinci-bootcount.mk    | 15 ---------------
 package/uboot-bootcount/Config.in                 | 10 ++++++++++
 .../uboot-bootcount.hash}                         |  2 +-
 package/uboot-bootcount/uboot-bootcount.mk        | 15 +++++++++++++++
 7 files changed, 28 insertions(+), 29 deletions(-)
 delete mode 100644 package/davinci-bootcount/Config.in
 delete mode 100644 package/davinci-bootcount/davinci-bootcount.mk
 create mode 100644 package/uboot-bootcount/Config.in
 rename package/{davinci-bootcount/davinci-bootcount.hash => uboot-bootcount/uboot-bootcount.hash} (80%)
 create mode 100644 package/uboot-bootcount/uboot-bootcount.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 7fae4841e448..87c911f22460 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -739,7 +739,7 @@ F:	package/sscep/
 F:	package/uuu/
 
 N:	Dario Binacchi <dariobin@libero.it>
-F:	package/davinci-bootcount/
+F:	package/uboot-bootcount/
 F:	package/libmnl/
 
 N:	David Bachelart <david.bachelart@bbright.com>
diff --git a/package/Config.in b/package/Config.in
index e8dbadadf323..0ac137fc1ca0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -476,7 +476,6 @@ endmenu
 	source "package/cwiid/Config.in"
 	source "package/dahdi-linux/Config.in"
 	source "package/dahdi-tools/Config.in"
-	source "package/davinci-bootcount/Config.in"
 	source "package/dbus/Config.in"
 	source "package/dbus-broker/Config.in"
 	source "package/dbus-cpp/Config.in"
@@ -627,6 +626,7 @@ endmenu
 	source "package/ti-utils/Config.in"
 	source "package/tio/Config.in"
 	source "package/triggerhappy/Config.in"
+	source "package/uboot-bootcount/Config.in"
 	source "package/uboot-tools/Config.in"
 	source "package/ubus/Config.in"
 	source "package/udev/Config.in"
diff --git a/package/davinci-bootcount/Config.in b/package/davinci-bootcount/Config.in
deleted file mode 100644
index e34adde570af..000000000000
--- a/package/davinci-bootcount/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_DAVINCI_BOOTCOUNT
-	bool "davinci-bootcount"
-	depends on BR2_arm # only relevant for TI am335x
-	help
-	  U-Boot implements a boot count scheme that can be used to
-	  detect multiple failed attempts to boot Linux. On Davinci
-	  platform (TI AM 335x) the `bootcount' is stored in the RTC
-	  SCRATCH2 register. This tool allows to read and write this
-	  register from userspace.
-
-	  https://github.com/VoltServer/uboot-davinci-bootcount
diff --git a/package/davinci-bootcount/davinci-bootcount.mk b/package/davinci-bootcount/davinci-bootcount.mk
deleted file mode 100644
index 695d39688ac6..000000000000
--- a/package/davinci-bootcount/davinci-bootcount.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# davinci-bootcount
-#
-################################################################################
-
-DAVINCI_BOOTCOUNT_VERSION = 2.0.0
-DAVINCI_BOOTCOUNT_SITE = $(call github,VoltServer,uboot-davinci-bootcount,v$(DAVINCI_BOOTCOUNT_VERSION))
-DAVINCI_BOOTCOUNT_LICENSE = GPL-3.0
-DAVINCI_BOOTCOUNT_LICENSE_FILES = COPYING
-
-# sources fetched from github, no configure script
-DAVINCI_BOOTCOUNT_AUTORECONF = YES
-
-$(eval $(autotools-package))
diff --git a/package/uboot-bootcount/Config.in b/package/uboot-bootcount/Config.in
new file mode 100644
index 000000000000..0a18e5d1bbad
--- /dev/null
+++ b/package/uboot-bootcount/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_UBOOT_BOOTCOUNT
+	bool "uboot-bootcount"
+	depends on BR2_arm
+	help
+	  U-Boot implements a boot count scheme that can be used to
+	  detect multiple failed attempts to boot Linux. This tool
+	  allows to read and write bootcount from userspace for some
+	  platforms (TI AM335X or STM32MP1) or from I2C EEPROM.
+
+	  https://github.com/VoltServer/uboot-bootcount
diff --git a/package/davinci-bootcount/davinci-bootcount.hash b/package/uboot-bootcount/uboot-bootcount.hash
similarity index 80%
rename from package/davinci-bootcount/davinci-bootcount.hash
rename to package/uboot-bootcount/uboot-bootcount.hash
index 53435b1d1d6d..e1ebc442357e 100644
--- a/package/davinci-bootcount/davinci-bootcount.hash
+++ b/package/uboot-bootcount/uboot-bootcount.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  12b5aa83736efb2fefd22cd4d9f305a25c68dfaa10401d5efb17e55a5163934e  davinci-bootcount-2.0.0.tar.gz
+sha256  12b5aa83736efb2fefd22cd4d9f305a25c68dfaa10401d5efb17e55a5163934e  uboot-bootcount-2.0.0.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/uboot-bootcount/uboot-bootcount.mk b/package/uboot-bootcount/uboot-bootcount.mk
new file mode 100644
index 000000000000..07b52ab89eb5
--- /dev/null
+++ b/package/uboot-bootcount/uboot-bootcount.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# uboot-bootcount
+#
+################################################################################
+
+UBOOT_BOOTCOUNT_VERSION = 2.0.0
+UBOOT_BOOTCOUNT_SITE = $(call github,VoltServer,uboot-bootcount,v$(UBOOT_BOOTCOUNT_VERSION))
+UBOOT_BOOTCOUNT_LICENSE = GPL-3.0
+UBOOT_BOOTCOUNT_LICENSE_FILES = COPYING
+
+# sources fetched from github, no configure script
+UBOOT_BOOTCOUNT_AUTORECONF = YES
+
+$(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
