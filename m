Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CDCD609A7
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 15:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D1D1828B5;
	Tue, 16 Dec 2025 15:15:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QJhsp079uNDT; Tue, 16 Dec 2025 15:15:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFA68828BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765898123;
	bh=VIHxGCSCaT/sAs5vNR9uvFSWvAXeGpDyEgoBR9PNjGU=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=o3vpnezO0KG2CQ9KCQRCGbqZ4irO3SKHYm2nPIMOMLtiUR/he8WFvuEeannbrgXT4
	 9MsEI5/+bHbxFi7v77OhpRB2+ccwZZpuViHTixyaX1/kF8/qyvI7NoGzyHjDXKYJBA
	 /1ses/gfz/a+Vzo8q4cx+cUvd55DiGlU0FvQ9a6zAtShAMIbrUK8tG45LsnqDkJTEP
	 tUiXuw2SUfNRkLVTcnbIugNeJjBa7bVrHFTFBP3J9IrAz3mzp0Dt0ahq7incQBBeOO
	 XSRdn4ydVvhDs7qQvoMyvOFjLtN/xC1NDxJigk93AKBx3MeCjpbiEKJ972JPEunYAR
	 1BbYEYcSPzjjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFA68828BA;
	Tue, 16 Dec 2025 15:15:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F2B23370
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 15:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D992A40591
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 15:15:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g4aJ5zSE6Om9 for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 15:15:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 696A040574
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 696A040574
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 696A040574
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 15:15:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 4702D4E41C29;
 Tue, 16 Dec 2025 15:15:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1BA836071C;
 Tue, 16 Dec 2025 15:15:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9F471119A8E01; Tue, 16 Dec 2025 16:15:13 +0100 (CET)
To: buildroot@buildroot.org
Date: Tue, 16 Dec 2025 15:14:44 +0000
Message-ID: <20251216151449.395253-5-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216151449.395253-1-kory.maincent@bootlin.com>
References: <20251216151449.395253-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765898114; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=77cPV7ATKmMzbeFGXX1v+Vhg+QaFJuUd3Ql20HSAKa4=;
 b=ODBTiT/pp+sNodN4zbdJpJ7xfPuzo9zAEao1crOeKggsj/g/kB6PmHPj8iQkmUw8l7xmB8
 9GaluOaEGr4VSeXH3RsaUNk3JqOy4K65vJQLdS2728T9yfvostZScHmUhO4/ns5h4yk+xg
 wnzEHcRP8PCw1yv8TTv2yPWiCinQPyrmsV+MCA90SJZOyJAC0jG3Y4/pRqAN01hBnOc5yj
 mx/oBUt6RB3VJ9ItxDIvI1zsc9hdPP4MDRUsWNixoDX00d0POpKNFcQ1zc+DE9uxdczzWF
 AGaTKnxSHKko9tAvlx9CrDjtHuodJV26VIDniC9Y2afBeFzTC1dRoDYz9GusVw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=ODBTiT/p
Subject: [Buildroot] [PATCH v3 4/5] package/am33x-cm3: Switch to TI repo and
 bump to v0x192
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Cc: "Kory Maincent \(TI.com\)" <kory.maincent@bootlin.com>,
 Lothar Felten <lothar.felten@gmail.com>, Bajjuri Praneeth <praneeth@ti.com>,
 Julien Olivain <ju.o@free.fr>, thomas.petazzoni@bootlin.com,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>

Switch from the RobertCNelson GitHub mirror to the official TI git
repository and update to version 0x192 (latest release).

The previous installation method used sysfs to load the firmware,
which was specific to old downstream Beaglebone or TI kernels. The
mainline wkup_m3_ipc driver now expects am335x-pm-firmware.elf and
*-scale-data.bin files to be installed in /lib/firmware, making the
sysfs init script obsolete.

Changes:
 - Switch repository from github.com/RobertCNelson to git.ti.com
 - Update version from 11107db (v05.00.00.02) to fb484c5 (v0x192)
 - Refresh all patches to apply cleanly on new version
 - Install .elf and scale-data files instead of .bin
 - Remove obsolete S93-am335x-pm-firmware-load init script

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
Change in v3:
- New patch.
---
 .../0001-Enforce-correct-march-option.patch   | 38 +++++++++++++++++++
 package/am33x-cm3/0001-fix-makefile.patch     | 30 ---------------
 ...Makefile-unconditionally-disable-SSP.patch | 17 +++++----
 ...Makefile-unconditionally-disable-PIE.patch | 17 +++++----
 .../0004-Makefile-add-fno-builtin.patch       | 17 +++++----
 package/am33x-cm3/S93-am335x-pm-firmware-load |  6 ---
 package/am33x-cm3/am33x-cm3.hash              |  2 +-
 package/am33x-cm3/am33x-cm3.mk                | 18 ++++-----
 8 files changed, 76 insertions(+), 69 deletions(-)
 create mode 100644 package/am33x-cm3/0001-Enforce-correct-march-option.patch
 delete mode 100644 package/am33x-cm3/0001-fix-makefile.patch
 delete mode 100644 package/am33x-cm3/S93-am335x-pm-firmware-load

diff --git a/package/am33x-cm3/0001-Enforce-correct-march-option.patch b/package/am33x-cm3/0001-Enforce-correct-march-option.patch
new file mode 100644
index 0000000000..3a915a0ef8
--- /dev/null
+++ b/package/am33x-cm3/0001-Enforce-correct-march-option.patch
@@ -0,0 +1,38 @@
+From 4e2c99b1197633704ce249413d86da28d21e1d8b Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Tue, 16 Dec 2025 14:58:28 +0100
+Subject: [PATCH] Enforce correct -march option
+
+Buildroot uses a normal ARM compiler to build the AM33X CM3 firmware
+(which runs on a Cortex-M3 processor), but Buildroot will have a
+default -march value that doesn't necessarily match the one needed for
+Cortex-M3, leading to build failures (gcc complains that the
+-mcpu=cortex-m3 option being passed is not compatible with the
+selected -march).
+
+Fix this by explicitly indicating -march=armv7-m.
+
+Upstream: N/A Buildroot specific
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 3fd9f23d4969..3f27be4dff4f 100644
+--- a/Makefile
++++ b/Makefile
+@@ -13,7 +13,7 @@ SRCDIR = src
+ BINDIR = bin
+ 
+ INCLUDES = $(SRCDIR)/include
+-CFLAGS =-mcpu=cortex-m3 -mthumb -nostdlib -ffreestanding -Wall -Wundef \
++CFLAGS =-march=armv7-m -mcpu=cortex-m3 -mthumb -nostdlib -ffreestanding -Wall -Wundef \
+ 	-Werror-implicit-function-declaration -Wstrict-prototypes \
+ 	-Wdeclaration-after-statement -fno-delete-null-pointer-checks \
+ 	-Wempty-body -fno-strict-overflow  -g -I$(INCLUDES) -O2	-MD
+-- 
+2.43.0
+
diff --git a/package/am33x-cm3/0001-fix-makefile.patch b/package/am33x-cm3/0001-fix-makefile.patch
deleted file mode 100644
index f3cdb5e2b9..0000000000
--- a/package/am33x-cm3/0001-fix-makefile.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Enforce correct -march option
-
-Buildroot uses a normal ARM compiler to build the AM33X CM3 firmware
-(which runs on a Cortex-M3 processor), but Buildroot will have a
-default -march value that doesn't necessarily match the one needed for
-Cortex-M3, leading to build failures (gcc complains that the
--mcpu=cortex-m3 option being passed is not compatible with the
-selected -march).
-
-Fix this by explicitly indicating -march=armv7-m.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Updated the patch to the latest version of the Makefile
-
-Signed-off-by: Anders Darander <anders@chargestorm.se>
-
-Index: b/Makefile
-===================================================================
---- a/Makefile
-+++ b/Makefile
-@@ -13,7 +13,7 @@ SRCDIR = src
- BINDIR = bin
- 
- INCLUDES = $(SRCDIR)/include
--CFLAGS =-mcpu=cortex-m3 -mthumb -nostdlib -Wall -Wundef \
-+CFLAGS =-march=armv7-m -mcpu=cortex-m3 -mthumb -nostdlib -Wall -Wundef \
- 	-Werror-implicit-function-declaration -Wstrict-prototypes \
- 	-Wdeclaration-after-statement -fno-delete-null-pointer-checks \
- 	-Wempty-body -fno-strict-overflow  -g -I$(INCLUDES) -O2
diff --git a/package/am33x-cm3/0002-Makefile-unconditionally-disable-SSP.patch b/package/am33x-cm3/0002-Makefile-unconditionally-disable-SSP.patch
index ed333bfe05..ae6e315382 100644
--- a/package/am33x-cm3/0002-Makefile-unconditionally-disable-SSP.patch
+++ b/package/am33x-cm3/0002-Makefile-unconditionally-disable-SSP.patch
@@ -1,6 +1,6 @@
-From 6c3b05b74ccd49d8ba246bfef0c2e549b9f2bf7b Mon Sep 17 00:00:00 2001
+From ba71b50bef042ed404759a8d48bef1f779cec6d6 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 29 Oct 2019 16:14:18 +0100
+Date: Tue, 16 Dec 2025 15:02:28 +0100
 Subject: [PATCH] Makefile: unconditionally disable SSP
 
 Though -nostdlib is passed in $(CFLAGS), -fno-stack-protector must also be
@@ -11,25 +11,28 @@ passed to avoid linking errors related to undefined references to
 Fixes:
  - http://autobuild.buildroot.net/results/3a3a21f3c35ea025e9b93e09c2454aed0ad31034
 
+Upstream: N/A Buildroot specific
+
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
 ---
  Makefile | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index c3ec071..5226006 100644
+index 3f27be4dff4f..52423507f50b 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -16,7 +16,8 @@ INCLUDES = $(SRCDIR)/include
- CFLAGS =-march=armv7-m -mcpu=cortex-m3 -mthumb -nostdlib -Wall -Wundef \
+ CFLAGS =-march=armv7-m -mcpu=cortex-m3 -mthumb -nostdlib -ffreestanding -Wall -Wundef \
  	-Werror-implicit-function-declaration -Wstrict-prototypes \
  	-Wdeclaration-after-statement -fno-delete-null-pointer-checks \
--	-Wempty-body -fno-strict-overflow  -g -I$(INCLUDES) -O2
+-	-Wempty-body -fno-strict-overflow  -g -I$(INCLUDES) -O2	-MD
 +	-Wempty-body -fno-strict-overflow -fno-stack-protector \
-+	-g -I$(INCLUDES) -O2
++	-g -I$(INCLUDES) -O2 -MD
  LDFLAGS =-nostartfiles -fno-exceptions -Tfirmware.ld
  
  EXECUTABLE=am335x-pm-firmware.elf
 -- 
-2.23.0
+2.43.0
 
diff --git a/package/am33x-cm3/0003-Makefile-unconditionally-disable-PIE.patch b/package/am33x-cm3/0003-Makefile-unconditionally-disable-PIE.patch
index 6be157932d..02b192fbda 100644
--- a/package/am33x-cm3/0003-Makefile-unconditionally-disable-PIE.patch
+++ b/package/am33x-cm3/0003-Makefile-unconditionally-disable-PIE.patch
@@ -1,6 +1,6 @@
-From 0e8c3c4851ce64268a8ae1810ef72594251d917d Mon Sep 17 00:00:00 2001
+From 8d86dd4b141da8d4d4dc0002b5588389b4412df8 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 10 Nov 2019 21:57:12 +0100
+Date: Tue, 16 Dec 2025 15:03:55 +0100
 Subject: [PATCH] Makefile: unconditionally disable PIE
 
 Though -nostdlib is passed in $(CFLAGS), -fno-pie must also be passed to
@@ -10,24 +10,27 @@ enforces PIE.
 Fixes:
  - http://autobuild.buildroot.org/results/418a40b995e91bc66e692dfbc4b0521db3fa5fbb
 
+Upstream: N/A Buildroot specific
+
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
 ---
  Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 5226006..fe3d844 100644
+index 52423507f50b..9146a8b6a7da 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -17,7 +17,7 @@ CFLAGS =-march=armv7-m -mcpu=cortex-m3 -mthumb -nostdlib -Wall -Wundef \
+@@ -17,7 +17,7 @@ CFLAGS =-march=armv7-m -mcpu=cortex-m3 -mthumb -nostdlib -ffreestanding -Wall -W
  	-Werror-implicit-function-declaration -Wstrict-prototypes \
  	-Wdeclaration-after-statement -fno-delete-null-pointer-checks \
  	-Wempty-body -fno-strict-overflow -fno-stack-protector \
--	-g -I$(INCLUDES) -O2
-+	-fno-pie -g -I$(INCLUDES) -O2
+-	-g -I$(INCLUDES) -O2 -MD
++	-fno-pie -g -I$(INCLUDES) -O2 -MD
  LDFLAGS =-nostartfiles -fno-exceptions -Tfirmware.ld
  
  EXECUTABLE=am335x-pm-firmware.elf
 -- 
-2.23.0
+2.43.0
 
diff --git a/package/am33x-cm3/0004-Makefile-add-fno-builtin.patch b/package/am33x-cm3/0004-Makefile-add-fno-builtin.patch
index 7478bd45f3..73e697edc6 100644
--- a/package/am33x-cm3/0004-Makefile-add-fno-builtin.patch
+++ b/package/am33x-cm3/0004-Makefile-add-fno-builtin.patch
@@ -1,6 +1,6 @@
-From 25fc567ba8a0cd199e48bfa82863247d953784ea Mon Sep 17 00:00:00 2001
+From bce00a9036fb0fc4d7735cd2c386b4932b915d97 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 30 Aug 2020 20:59:29 +0200
+Date: Tue, 16 Dec 2025 15:09:15 +0100
 Subject: [PATCH] Makefile: add -fno-builtin
 
 Build with gcc 10 fails on:
@@ -18,24 +18,27 @@ To fix this build failure, add -fno-builtin
 Fixes:
  - http://autobuild.buildroot.org/results/a991e6efa012df518ff1bb35017ad2c96c8feedc
 
+Upstream: N/A Buildroot specific
+
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
 ---
  Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index fe3d844..fa24d4b 100644
+index 9146a8b6a7da..b4869c494593 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -17,7 +17,7 @@ CFLAGS =-march=armv7-m -mcpu=cortex-m3 -mthumb -nostdlib -Wall -Wundef \
+@@ -17,7 +17,7 @@ CFLAGS =-march=armv7-m -mcpu=cortex-m3 -mthumb -nostdlib -ffreestanding -Wall -W
  	-Werror-implicit-function-declaration -Wstrict-prototypes \
  	-Wdeclaration-after-statement -fno-delete-null-pointer-checks \
  	-Wempty-body -fno-strict-overflow -fno-stack-protector \
--	-fno-pie -g -I$(INCLUDES) -O2
-+	-fno-pie -fno-builtin -g -I$(INCLUDES) -O2
+-	-fno-pie -g -I$(INCLUDES) -O2 -MD
++	-fno-pie -fno-builtin -g -I$(INCLUDES) -O2 -MD
  LDFLAGS =-nostartfiles -fno-exceptions -Tfirmware.ld
  
  EXECUTABLE=am335x-pm-firmware.elf
 -- 
-2.28.0
+2.43.0
 
diff --git a/package/am33x-cm3/S93-am335x-pm-firmware-load b/package/am33x-cm3/S93-am335x-pm-firmware-load
deleted file mode 100644
index 56c17b334d..0000000000
--- a/package/am33x-cm3/S93-am335x-pm-firmware-load
+++ /dev/null
@@ -1,6 +0,0 @@
-#!/bin/sh
-
-# Load the PM CM3 firmware
-echo 1 > /sys/devices/ocp.2/44d00000.wkup_m3/firmware/am335x-pm-firmware.bin/loading
-cat /lib/firmware/am335x-pm-firmware.bin > /sys/devices/ocp.2/44d00000.wkup_m3/firmware/am335x-pm-firmware.bin/data
-echo 0 > /sys/devices/ocp.2/44d00000.wkup_m3/firmware/am335x-pm-firmware.bin/loading
diff --git a/package/am33x-cm3/am33x-cm3.hash b/package/am33x-cm3/am33x-cm3.hash
index 33dc205f3b..aa282dab15 100644
--- a/package/am33x-cm3/am33x-cm3.hash
+++ b/package/am33x-cm3/am33x-cm3.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  79b05eda90498390778001caf18435617d5983c075b5b4a6b339bee40551e946  am33x-cm3-11107db2f1e9e58ee75d4fe9cc38423c9a6e4365-git4.tar.gz
+sha256  b6020ce5fee52e8df6cf8e045c75064021760dd04e2923ad0e4bdd6e18ebaa49  am33x-cm3-fb484c5e54f2e31cf0a338d2927a06a2870bcc2c-git4.tar.gz
 sha256  e136e6949a1d3ca144374375af8b9387faa11d2eee7debff8cf22ca8fe7bf7e9  License.txt
diff --git a/package/am33x-cm3/am33x-cm3.mk b/package/am33x-cm3/am33x-cm3.mk
index d5ace7bb0e..cd5839e9b8 100644
--- a/package/am33x-cm3/am33x-cm3.mk
+++ b/package/am33x-cm3/am33x-cm3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-# This should correpsond to v05.00.00.02
-AM33X_CM3_VERSION = 11107db2f1e9e58ee75d4fe9cc38423c9a6e4365
-AM33X_CM3_SITE = https://github.com/RobertCNelson/am33x-cm3
+# This should correpsond to version 0x192
+AM33X_CM3_VERSION = fb484c5e54f2e31cf0a338d2927a06a2870bcc2c
+AM33X_CM3_SITE = https://git.ti.com/git/processor-firmware/ti-amx3-cm3-pm-firmware.git
 AM33X_CM3_SITE_METHOD = git
 AM33X_CM3_LICENSE = TI Publicly Available Software License
 AM33X_CM3_LICENSE_FILES = License.txt
@@ -17,15 +17,11 @@ define AM33X_CM3_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CROSS_COMPILE="$(TARGET_CROSS)" -C $(@D) all
 endef
 
-# Not all of the firmware files are used
 define AM33X_CM3_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0644 -D $(@D)/bin/am335x-pm-firmware.bin \
-		$(TARGET_DIR)/lib/firmware/am335x-pm-firmware.bin
-endef
-
-define AM33X_CM3_INSTALL_INIT_SYSV
-	$(INSTALL) -m 0755 -D package/am33x-cm3/S93-am335x-pm-firmware-load \
-		$(TARGET_DIR)/etc/init.d/S93-am335x-pm-firmware-load
+	$(INSTALL) -m 0644 -D $(@D)/bin/am335x-pm-firmware.elf \
+		$(TARGET_DIR)/lib/firmware/am335x-pm-firmware.elf
+	$(INSTALL) -m 0644 -D $(@D)/bin/*-scale-data.bin \
+		$(TARGET_DIR)/lib/firmware/
 endef
 
 $(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
