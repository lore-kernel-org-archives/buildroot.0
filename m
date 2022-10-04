Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86200C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Oct 2022 12:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E12E860EF2;
	Tue,  4 Oct 2022 12:52:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E12E860EF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q87TfUUSsdse; Tue,  4 Oct 2022 12:52:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 231C760E52;
	Tue,  4 Oct 2022 12:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 231C760E52
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 182C21BF846
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 12:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC6F160E52
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 12:52:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC6F160E52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TqJqmicnEufL for <buildroot@lists.busybox.net>;
 Tue,  4 Oct 2022 12:52:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DEEE60B46
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6DEEE60B46
 for <buildroot@buildroot.org>; Tue,  4 Oct 2022 12:52:46 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0CC8840005;
 Tue,  4 Oct 2022 12:52:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue,  4 Oct 2022 14:52:41 +0200
Message-Id: <20221004125242.136925-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664887963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ocXxtiD7CihsEgjU4HjaBymsc5cNcWP2MVsFGALJth8=;
 b=l1GT9SFFyJR8tZ0dkHmh+EvB1oW4LAd3eYgDT988Ro5ZYPV9DEw1OqPQD4DDBLq24U6miE
 f6y7T55IVye1I8FcxQzUy9z+oM8YOaDHP0PWqFmM3FEvaCMtmnqZk4+TQVmvznGmFRpG3p
 zswr2CDCEfEX7TcoqsLmyVFctiSW8Mo1H/ENDXIc6hZAgmeXrKW8JoTtn1iqpF/UHZ3QtH
 8ZImpkRVgDAR+J5kZmAawlz8pfCn0Fg7yFZhDXrKF0dLGzypb4yBSE9pw6lnyhVqD2bYcp
 J53F8xhmHPS7XehcU9gAodLMOxTCiQDirYbjZmcH0yM3kKPG5S3ZluBBKIQZ4Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=l1GT9SFF
Subject: [Buildroot] [PATCH] boot/at91bootstrap: disable PIE and
 stack-protector build flags
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
From: =?utf-8?q?K=C3=B6ry_Maincent_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>
Cc: Kory Maincent <kory.maincent@bootlin.com>, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Kory Maincent <kory.maincent@bootlin.com>

The toolchain wrapper add automatically Position Independent Execution
and stack protector flags in the build process when selected in the
configuration. at91bootstrap does not support these, therefore I added a
patch to disable them in the Makefiles

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 ...ck-protector-and-the-PIE-build-flags.patch | 502 ++++++++++++++++++
 1 file changed, 502 insertions(+)
 create mode 100644 boot/at91bootstrap/0004-ensure-the-stack-protector-and-the-PIE-build-flags.patch

diff --git a/boot/at91bootstrap/0004-ensure-the-stack-protector-and-the-PIE-build-flags.patch b/boot/at91bootstrap/0004-ensure-the-stack-protector-and-the-PIE-build-flags.patch
new file mode 100644
index 0000000000..a4cc3819d0
--- /dev/null
+++ b/boot/at91bootstrap/0004-ensure-the-stack-protector-and-the-PIE-build-flags.patch
@@ -0,0 +1,502 @@
+From 66f7a5ed597adb166461531e8c914b07bbd41563 Mon Sep 17 00:00:00 2001
+From: Kory Maincent <kory.maincent@bootlin.com>
+Date: Tue, 4 Oct 2022 11:39:24 +0200
+Subject: [PATCH] ensure the stack protector and the PIE build flags are
+ disabled
+
+at91bootstrap does not support to build with stack-protector and position
+independant executable.
+Add -fno-stack-protector and -fno-PIE to the Makefiles to disable it.
+
+Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
+---
+ board/at91cap9adk/dataflash/Makefile      | 4 ++--
+ board/at91cap9adk/norflash/Makefile       | 4 ++--
+ board/at91cap9stk/nandflash/Makefile      | 4 ++--
+ board/at91sam9260ek/dataflash/Makefile    | 4 ++--
+ board/at91sam9260ek/nandflash/Makefile    | 4 ++--
+ board/at91sam9261ek/dataflash/Makefile    | 4 ++--
+ board/at91sam9261ek/nandflash/Makefile    | 4 ++--
+ board/at91sam9263ek/dataflash/Makefile    | 4 ++--
+ board/at91sam9263ek/nandflash/Makefile    | 4 ++--
+ board/at91sam9g10ek/dataflash/Makefile    | 4 ++--
+ board/at91sam9g10ek/nandflash/Makefile    | 4 ++--
+ board/at91sam9g20ek/dataflash/Makefile    | 4 ++--
+ board/at91sam9g20ek/nandflash/Makefile    | 4 ++--
+ board/at91sam9g45ekes/nandflash/Makefile  | 4 ++--
+ board/at91sam9m10ekes/dataflash/Makefile  | 4 ++--
+ board/at91sam9m10ekes/nandflash/Makefile  | 4 ++--
+ board/at91sam9m10g45ek/dataflash/Makefile | 4 ++--
+ board/at91sam9m10g45ek/nandflash/Makefile | 4 ++--
+ board/at91sam9rlek/dataflash/Makefile     | 4 ++--
+ board/at91sam9rlek/nandflash/Makefile     | 4 ++--
+ board/at91sam9xeek/dataflash/Makefile     | 4 ++--
+ board/at91sam9xeek/nandflash/Makefile     | 4 ++--
+ 22 files changed, 44 insertions(+), 44 deletions(-)
+
+diff --git a/board/at91cap9adk/dataflash/Makefile b/board/at91cap9adk/dataflash/Makefile
+index 5196783..e904788 100644
+--- a/board/at91cap9adk/dataflash/Makefile
++++ b/board/at91cap9adk/dataflash/Makefile
+@@ -34,14 +34,14 @@ NM= $(CROSS_COMPILE)nm
+ SIZE=$(CROSS_COMPILE)size
+ OBJCOPY=$(CROSS_COMPILE)objcopy
+ OBJDUMP=$(CROSS_COMPILE)objdump
+-CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -D$(BOARD) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
++CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -D$(BOARD) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-stack-protector
+ ASFLAGS=-g -mcpu=arm9 -c -Os -Wall -D$(TARGET) -D$(BOARD) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
+ 
+ # Linker flags.
+ #  -Wl,...:     tell GCC to pass this to linker.
+ #    -Map:      create map file
+ #    --cref:    add cross reference to map file
+-LDFLAGS+=-nostartfiles -nostdlib  -Wl,-Map=$(BOOT_NAME).map,--cref
++LDFLAGS+=-nostartfiles -nostdlib  -Wl,-Map=$(BOOT_NAME).map,--cref -fno-PIE
+ LDFLAGS+=-T $(BOOTSTRAP_PATH)/elf32-littlearm.lds -Ttext $(LINK_ADDR)
+ OBJS=crt0_gnu.o
+ 
+diff --git a/board/at91cap9adk/norflash/Makefile b/board/at91cap9adk/norflash/Makefile
+index 22390e8..8ac8301 100644
+--- a/board/at91cap9adk/norflash/Makefile
++++ b/board/at91cap9adk/norflash/Makefile
+@@ -34,14 +34,14 @@ NM= $(CROSS_COMPILE)nm
+ SIZE=$(CROSS_COMPILE)size
+ OBJCOPY=$(CROSS_COMPILE)objcopy
+ OBJDUMP=$(CROSS_COMPILE)objdump
+-CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -D$(BOARD) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
++CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -D$(BOARD) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-stack-protector
+ ASFLAGS=-g -mcpu=arm9 -c -Os -Wall -D$(TARGET) -D$(BOARD) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
+ 
+ # Linker flags.
+ #  -Wl,...:     tell GCC to pass this to linker.
+ #    -Map:      create map file
+ #    --cref:    add cross reference to map file
+-LDFLAGS+=-nostartfiles -nostdlib  -Wl,-Map=$(BOOT_NAME).map,--cref
++LDFLAGS+=-nostartfiles -nostdlib  -Wl,-Map=$(BOOT_NAME).map,--cref -fno-PIE
+ LDFLAGS+=-T $(BOOTSTRAP_PATH)/elf32-littlearm.lds -Ttext $(LINK_ADDR)
+ OBJS=crt0_gnu.o
+ 
+diff --git a/board/at91cap9stk/nandflash/Makefile b/board/at91cap9stk/nandflash/Makefile
+index 0b5b0ef..31ed32e 100755
+--- a/board/at91cap9stk/nandflash/Makefile
++++ b/board/at91cap9stk/nandflash/Makefile
+@@ -37,7 +37,7 @@ NM= $(CROSS_COMPILE)nm
+ SIZE=$(CROSS_COMPILE)size
+ OBJCOPY=$(CROSS_COMPILE)objcopy
+ OBJDUMP=$(CROSS_COMPILE)objdump
+-CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -D$(BOARD) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
++CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -D$(BOARD) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-stack-protector
+ ASFLAGS=-g -mcpu=arm9 -c -Os -Wall -D$(TARGET) -D$(BOARD) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
+ 
+ 
+@@ -45,7 +45,7 @@ ASFLAGS=-g -mcpu=arm9 -c -Os -Wall -D$(TARGET) -D$(BOARD) -I$(INCL) -DTOP_OF_MEM
+ #  -Wl,...:     tell GCC to pass this to linker.
+ #    -Map:      create map file
+ #    --cref:    add cross reference to map file
+-LDFLAGS+=-nostartfiles -nostdlib -Wl,-Map=$(BOOT_NAME).map,--cref
++LDFLAGS+=-nostartfiles -nostdlib -Wl,-Map=$(BOOT_NAME).map,--cref -fno-PIE
+ LDFLAGS+=-T $(BOOTSTRAP_PATH)/elf32-littlearm.lds -Ttext $(LINK_ADDR)
+ OBJS=crt0_gnu.o
+ 
+diff --git a/board/at91sam9260ek/dataflash/Makefile b/board/at91sam9260ek/dataflash/Makefile
+index 8035a3b..8765e9c 100644
+--- a/board/at91sam9260ek/dataflash/Makefile
++++ b/board/at91sam9260ek/dataflash/Makefile
+@@ -37,14 +37,14 @@ NM= $(CROSS_COMPILE)nm
+ SIZE=$(CROSS_COMPILE)size
+ OBJCOPY=$(CROSS_COMPILE)objcopy
+ OBJDUMP=$(CROSS_COMPILE)objdump
+-CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
++CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-stack-protector
+ ASFLAGS=-g -mcpu=arm926ej-s -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
+ 
+ # Linker flags.
+ #  -Wl,...:     tell GCC to pass this to linker.
+ #    -Map:      create map file
+ #    --cref:    add cross reference to map file
+-LDFLAGS+=-nostartfiles -nostdlib -Wl,-Map=$(BOOT_NAME).map,--cref
++LDFLAGS+=-nostartfiles -nostdlib -Wl,-Map=$(BOOT_NAME).map,--cref -fno-PIE
+ LDFLAGS+=-T $(BOOTSTRAP_PATH)/elf32-littlearm.lds -Ttext $(LINK_ADDR)
+ OBJS=crt0_gnu.o
+ 
+diff --git a/board/at91sam9260ek/nandflash/Makefile b/board/at91sam9260ek/nandflash/Makefile
+index 7c3982d..a816ba3 100644
+--- a/board/at91sam9260ek/nandflash/Makefile
++++ b/board/at91sam9260ek/nandflash/Makefile
+@@ -37,14 +37,14 @@ NM= $(CROSS_COMPILE)nm
+ SIZE=$(CROSS_COMPILE)size
+ OBJCOPY=$(CROSS_COMPILE)objcopy
+ OBJDUMP=$(CROSS_COMPILE)objdump
+-CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
++CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-stack-protector
+ ASFLAGS=-g -mcpu=arm926ej-s -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
+ 
+ # Linker flags.
+ #  -Wl,...:     tell GCC to pass this to linker.
+ #    -Map:      create map file
+ #    --cref:    add cross reference to map file
+-LDFLAGS+=-nostartfiles -nostdlib -Wl,-Map=$(BOOT_NAME).map,--cref
++LDFLAGS+=-nostartfiles -nostdlib -Wl,-Map=$(BOOT_NAME).map,--cref -fno-PIE
+ LDFLAGS+=-T $(BOOTSTRAP_PATH)/elf32-littlearm.lds -Ttext $(LINK_ADDR)
+ OBJS=crt0_gnu.o
+ 
+diff --git a/board/at91sam9261ek/dataflash/Makefile b/board/at91sam9261ek/dataflash/Makefile
+index 2f7e637..c265c8b 100644
+--- a/board/at91sam9261ek/dataflash/Makefile
++++ b/board/at91sam9261ek/dataflash/Makefile
+@@ -37,14 +37,14 @@ NM= $(CROSS_COMPILE)nm
+ SIZE=$(CROSS_COMPILE)size
+ OBJCOPY=$(CROSS_COMPILE)objcopy
+ OBJDUMP=$(CROSS_COMPILE)objdump
+-CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
++CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-stack-protector
+ ASFLAGS=-g -mcpu=arm9 -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
+ 
+ # Linker flags.
+ #  -Wl,...:     tell GCC to pass this to linker.
+ #    -Map:      create map file
+ #    --cref:    add cross reference to map file
+-LDFLAGS+=-nostartfiles -nostdlib -Wl,-Map=$(BOOT_NAME).map,--cref
++LDFLAGS+=-nostartfiles -nostdlib -Wl,-Map=$(BOOT_NAME).map,--cref -fno-PIE
+ LDFLAGS+=-T $(BOOTSTRAP_PATH)/elf32-littlearm.lds -Ttext $(LINK_ADDR)
+ OBJS=crt0_gnu.o
+ 
+diff --git a/board/at91sam9261ek/nandflash/Makefile b/board/at91sam9261ek/nandflash/Makefile
+index 66d5712..fc1da7e 100644
+--- a/board/at91sam9261ek/nandflash/Makefile
++++ b/board/at91sam9261ek/nandflash/Makefile
+@@ -37,14 +37,14 @@ NM= $(CROSS_COMPILE)nm
+ SIZE=$(CROSS_COMPILE)size
+ OBJCOPY=$(CROSS_COMPILE)objcopy
+ OBJDUMP=$(CROSS_COMPILE)objdump
+-CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
++CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-stack-protector
+ ASFLAGS=-g -mcpu=arm9 -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
+ 
+ # Linker flags.
+ #  -Wl,...:     tell GCC to pass this to linker.
+ #    -Map:      create map file
+ #    --cref:    add cross reference to map file
+-LDFLAGS+=-nostartfiles -nostdlib -Wl,-Map=$(BOOT_NAME).map,--cref
++LDFLAGS+=-nostartfiles -nostdlib -Wl,-Map=$(BOOT_NAME).map,--cref -fno-PIE
+ LDFLAGS+=-T $(BOOTSTRAP_PATH)/elf32-littlearm.lds -Ttext $(LINK_ADDR)
+ OBJS=crt0_gnu.o
+ 
+diff --git a/board/at91sam9263ek/dataflash/Makefile b/board/at91sam9263ek/dataflash/Makefile
+index 696e872..4e60260 100644
+--- a/board/at91sam9263ek/dataflash/Makefile
++++ b/board/at91sam9263ek/dataflash/Makefile
+@@ -34,14 +34,14 @@ NM= $(CROSS_COMPILE)nm
+ SIZE=$(CROSS_COMPILE)size
+ OBJCOPY=$(CROSS_COMPILE)objcopy
+ OBJDUMP=$(CROSS_COMPILE)objdump
+-CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
++CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-stack-protector
+ ASFLAGS=-g -mcpu=arm9 -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
+ 
+ # Linker flags.
+ #  -Wl,...:     tell GCC to pass this to linker.
+ #    -Map:      create map file
+ #    --cref:    add cross reference to map file
+-LDFLAGS+=-nostartfiles -nostdlib  -Wl,-Map=$(BOOT_NAME).map,--cref
++LDFLAGS+=-nostartfiles -nostdlib  -Wl,-Map=$(BOOT_NAME).map,--cref -fno-PIE
+ LDFLAGS+=-T $(BOOTSTRAP_PATH)/elf32-littlearm.lds -Ttext $(LINK_ADDR)
+ OBJS=crt0_gnu.o
+ 
+diff --git a/board/at91sam9263ek/nandflash/Makefile b/board/at91sam9263ek/nandflash/Makefile
+index 7b90eab..a916fcf 100644
+--- a/board/at91sam9263ek/nandflash/Makefile
++++ b/board/at91sam9263ek/nandflash/Makefile
+@@ -33,14 +33,14 @@ NM= $(CROSS_COMPILE)nm
+ SIZE=$(CROSS_COMPILE)size
+ OBJCOPY=$(CROSS_COMPILE)objcopy
+ OBJDUMP=$(CROSS_COMPILE)objdump
+-CCFLAGS=-g -mcpu=arm9 -O0 -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
++CCFLAGS=-g -mcpu=arm9 -O0 -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-stack-protector
+ ASFLAGS=-g -mcpu=arm9 -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
+ 
+ # Linker flags.
+ #  -Wl,...:     tell GCC to pass this to linker.
+ #    -Map:      create map file
+ #    --cref:    add cross reference to map file
+-LDFLAGS+=-nostartfiles -nostdlib  -Wl,-Map=$(BOOT_NAME).map,--cref
++LDFLAGS+=-nostartfiles -nostdlib  -Wl,-Map=$(BOOT_NAME).map,--cref -fno-PIE
+ LDFLAGS+=-T $(BOOTSTRAP_PATH)/elf32-littlearm.lds -Ttext $(LINK_ADDR)
+ OBJS=crt0_gnu.o
+ 
+diff --git a/board/at91sam9g10ek/dataflash/Makefile b/board/at91sam9g10ek/dataflash/Makefile
+index 84060d7..d2c9b33 100644
+--- a/board/at91sam9g10ek/dataflash/Makefile
++++ b/board/at91sam9g10ek/dataflash/Makefile
+@@ -37,14 +37,14 @@ NM= $(CROSS_COMPILE)nm
+ SIZE=$(CROSS_COMPILE)size
+ OBJCOPY=$(CROSS_COMPILE)objcopy
+ OBJDUMP=$(CROSS_COMPILE)objdump
+-CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
++CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-stack-protector
+ ASFLAGS=-g -mcpu=arm9 -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
+ 
+ # Linker flags.
+ #  -Wl,...:     tell GCC to pass this to linker.
+ #    -Map:      create map file
+ #    --cref:    add cross reference to map file
+-LDFLAGS+=-nostartfiles -nostdlib -Wl,-Map=$(BOOT_NAME).map,--cref
++LDFLAGS+=-nostartfiles -nostdlib -Wl,-Map=$(BOOT_NAME).map,--cref -fno-PIE
+ LDFLAGS+=-T $(BOOTSTRAP_PATH)/elf32-littlearm.lds -Ttext $(LINK_ADDR)
+ OBJS=crt0_gnu.o
+ 
+diff --git a/board/at91sam9g10ek/nandflash/Makefile b/board/at91sam9g10ek/nandflash/Makefile
+index e9c1398..2cbb641 100644
+--- a/board/at91sam9g10ek/nandflash/Makefile
++++ b/board/at91sam9g10ek/nandflash/Makefile
+@@ -37,14 +37,14 @@ NM= $(CROSS_COMPILE)nm
+ SIZE=$(CROSS_COMPILE)size
+ OBJCOPY=$(CROSS_COMPILE)objcopy
+ OBJDUMP=$(CROSS_COMPILE)objdump
+-CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
++CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-stack-protector
+ ASFLAGS=-g -mcpu=arm9 -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
+ 
+ # Linker flags.
+ #  -Wl,...:     tell GCC to pass this to linker.
+ #    -Map:      create map file
+ #    --cref:    add cross reference to map file
+-LDFLAGS+=-nostartfiles -nostdlib -Wl,-Map=$(BOOT_NAME).map,--cref
++LDFLAGS+=-nostartfiles -nostdlib -Wl,-Map=$(BOOT_NAME).map,--cref -fno-PIE
+ LDFLAGS+=-T $(BOOTSTRAP_PATH)/elf32-littlearm.lds -Ttext $(LINK_ADDR)
+ OBJS=crt0_gnu.o
+ 
+diff --git a/board/at91sam9g20ek/dataflash/Makefile b/board/at91sam9g20ek/dataflash/Makefile
+index a11b080..dd15946 100644
+--- a/board/at91sam9g20ek/dataflash/Makefile
++++ b/board/at91sam9g20ek/dataflash/Makefile
+@@ -37,14 +37,14 @@ NM= $(CROSS_COMPILE)nm
+ SIZE=$(CROSS_COMPILE)size
+ OBJCOPY=$(CROSS_COMPILE)objcopy
+ OBJDUMP=$(CROSS_COMPILE)objdump
+-CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
++CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-stack-protector
+ ASFLAGS=-g -mcpu=arm926ej-s -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
+ 
+ # Linker flags.
+ #  -Wl,...:     tell GCC to pass this to linker.
+ #    -Map:      create map file
+ #    --cref:    add cross reference to map file
+-LDFLAGS+=-nostartfiles -nostdlib -Wl,-Map=$(BOOT_NAME).map,--cref
++LDFLAGS+=-nostartfiles -nostdlib -Wl,-Map=$(BOOT_NAME).map,--cref -fno-PIE
+ LDFLAGS+=-T $(BOOTSTRAP_PATH)/elf32-littlearm.lds -Ttext $(LINK_ADDR)
+ OBJS=crt0_gnu.o
+ 
+diff --git a/board/at91sam9g20ek/nandflash/Makefile b/board/at91sam9g20ek/nandflash/Makefile
+index 109a3c8..630430f 100644
+--- a/board/at91sam9g20ek/nandflash/Makefile
++++ b/board/at91sam9g20ek/nandflash/Makefile
+@@ -37,14 +37,14 @@ NM= $(CROSS_COMPILE)nm
+ SIZE=$(CROSS_COMPILE)size
+ OBJCOPY=$(CROSS_COMPILE)objcopy
+ OBJDUMP=$(CROSS_COMPILE)objdump
+-CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
++CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-stack-protector
+ ASFLAGS=-g -mcpu=arm926ej-s -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
+ 
+ # Linker flags.
+ #  -Wl,...:     tell GCC to pass this to linker.
+ #    -Map:      create map file
+ #    --cref:    add cross reference to map file
+-LDFLAGS+=-nostartfiles -nostdlib -Wl,-Map=$(BOOT_NAME).map,--cref
++LDFLAGS+=-nostartfiles -nostdlib -Wl,-Map=$(BOOT_NAME).map,--cref -fno-PIE
+ LDFLAGS+=-T $(BOOTSTRAP_PATH)/elf32-littlearm.lds -Ttext $(LINK_ADDR)
+ OBJS=crt0_gnu.o
+ 
+diff --git a/board/at91sam9g45ekes/nandflash/Makefile b/board/at91sam9g45ekes/nandflash/Makefile
+index a96a5fa..99c02d8 100644
+--- a/board/at91sam9g45ekes/nandflash/Makefile
++++ b/board/at91sam9g45ekes/nandflash/Makefile
+@@ -37,14 +37,14 @@ NM= $(CROSS_COMPILE)nm
+ SIZE=$(CROSS_COMPILE)size
+ OBJCOPY=$(CROSS_COMPILE)objcopy
+ OBJDUMP=$(CROSS_COMPILE)objdump
+-CCFLAGS=-g -mcpu=arm926ej-s -O2 -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
++CCFLAGS=-g -mcpu=arm926ej-s -O2 -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-stack-protector
+ ASFLAGS=-g -mcpu=arm926ej-s -c -O2 -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
+ 
+ # Linker flags.
+ #  -Wl,...:     tell GCC to pass this to linker.
+ #    -Map:      create map file
+ #    --cref:    add cross reference to map file
+-LDFLAGS+=-nostartfiles -nostdlib -Wl,-Map=$(BOOT_NAME).map,--cref
++LDFLAGS+=-nostartfiles -nostdlib -Wl,-Map=$(BOOT_NAME).map,--cref -fno-PIE
+ LDFLAGS+=-T $(BOOTSTRAP_PATH)/elf32-littlearm.lds -Ttext $(LINK_ADDR)
+ OBJS=crt0_gnu.o
+ 
+diff --git a/board/at91sam9m10ekes/dataflash/Makefile b/board/at91sam9m10ekes/dataflash/Makefile
+index 28e8d42..17e2590 100644
+--- a/board/at91sam9m10ekes/dataflash/Makefile
++++ b/board/at91sam9m10ekes/dataflash/Makefile
+@@ -37,14 +37,14 @@ NM= $(CROSS_COMPILE)nm
+ SIZE=$(CROSS_COMPILE)size
+ OBJCOPY=$(CROSS_COMPILE)objcopy
+ OBJDUMP=$(CROSS_COMPILE)objdump
+-CCFLAGS=-g -mcpu=arm926ej-s -O2 -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
++CCFLAGS=-g -mcpu=arm926ej-s -O2 -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-stack-protector
+ ASFLAGS=-g -mcpu=arm926ej-s -c -O2 -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
+ 
+ # Linker flags.
+ #  -Wl,...:     tell GCC to pass this to linker.
+ #    -Map:      create map file
+ #    --cref:    add cross reference to map file
+-LDFLAGS+=-nostartfiles -nostdlib -Wl,-Map=$(BOOT_NAME).map,--cref
++LDFLAGS+=-nostartfiles -nostdlib -Wl,-Map=$(BOOT_NAME).map,--cref -fno-PIE
+ LDFLAGS+=-T $(BOOTSTRAP_PATH)/elf32-littlearm.lds -Ttext $(LINK_ADDR)
+ OBJS=crt0_gnu.o
+ 
+diff --git a/board/at91sam9m10ekes/nandflash/Makefile b/board/at91sam9m10ekes/nandflash/Makefile
+index 0ffd08d..01108de 100644
+--- a/board/at91sam9m10ekes/nandflash/Makefile
++++ b/board/at91sam9m10ekes/nandflash/Makefile
+@@ -37,14 +37,14 @@ NM= $(CROSS_COMPILE)nm
+ SIZE=$(CROSS_COMPILE)size
+ OBJCOPY=$(CROSS_COMPILE)objcopy
+ OBJDUMP=$(CROSS_COMPILE)objdump
+-CCFLAGS=-g -mcpu=arm926ej-s -O2 -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
++CCFLAGS=-g -mcpu=arm926ej-s -O2 -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-stack-protector
+ ASFLAGS=-g -mcpu=arm926ej-s -c -O2 -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
+ 
+ # Linker flags.
+ #  -Wl,...:     tell GCC to pass this to linker.
+ #    -Map:      create map file
+ #    --cref:    add cross reference to map file
+-LDFLAGS+=-nostartfiles -nostdlib -Wl,-Map=$(BOOT_NAME).map,--cref
++LDFLAGS+=-nostartfiles -nostdlib -Wl,-Map=$(BOOT_NAME).map,--cref -fno-PIE
+ LDFLAGS+=-T $(BOOTSTRAP_PATH)/elf32-littlearm.lds -Ttext $(LINK_ADDR)
+ OBJS=crt0_gnu.o
+ 
+diff --git a/board/at91sam9m10g45ek/dataflash/Makefile b/board/at91sam9m10g45ek/dataflash/Makefile
+index 0eefc52..805073a 100644
+--- a/board/at91sam9m10g45ek/dataflash/Makefile
++++ b/board/at91sam9m10g45ek/dataflash/Makefile
+@@ -37,14 +37,14 @@ NM= $(CROSS_COMPILE)nm
+ SIZE=$(CROSS_COMPILE)size
+ OBJCOPY=$(CROSS_COMPILE)objcopy
+ OBJDUMP=$(CROSS_COMPILE)objdump
+-CCFLAGS=-g -mcpu=arm926ej-s -O2 -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
++CCFLAGS=-g -mcpu=arm926ej-s -O2 -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-stack-protector
+ ASFLAGS=-g -mcpu=arm926ej-s -c -O2 -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
+ 
+ # Linker flags.
+ #  -Wl,...:     tell GCC to pass this to linker.
+ #    -Map:      create map file
+ #    --cref:    add cross reference to map file
+-LDFLAGS+=-nostartfiles -nostdlib -Wl,-Map=$(BOOT_NAME).map,--cref
++LDFLAGS+=-nostartfiles -nostdlib -Wl,-Map=$(BOOT_NAME).map,--cref -fno-PIE
+ LDFLAGS+=-T $(BOOTSTRAP_PATH)/elf32-littlearm.lds -Ttext $(LINK_ADDR)
+ OBJS=crt0_gnu.o
+ 
+diff --git a/board/at91sam9m10g45ek/nandflash/Makefile b/board/at91sam9m10g45ek/nandflash/Makefile
+index f7cde1b..121594d 100644
+--- a/board/at91sam9m10g45ek/nandflash/Makefile
++++ b/board/at91sam9m10g45ek/nandflash/Makefile
+@@ -37,14 +37,14 @@ NM= $(CROSS_COMPILE)nm
+ SIZE=$(CROSS_COMPILE)size
+ OBJCOPY=$(CROSS_COMPILE)objcopy
+ OBJDUMP=$(CROSS_COMPILE)objdump
+-CCFLAGS=-g -mcpu=arm926ej-s -O2 -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
++CCFLAGS=-g -mcpu=arm926ej-s -O2 -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-stack-protector
+ ASFLAGS=-g -mcpu=arm926ej-s -c -O2 -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
+ 
+ # Linker flags.
+ #  -Wl,...:     tell GCC to pass this to linker.
+ #    -Map:      create map file
+ #    --cref:    add cross reference to map file
+-LDFLAGS+=-nostartfiles -nostdlib -Wl,-Map=$(BOOT_NAME).map,--cref
++LDFLAGS+=-nostartfiles -nostdlib -Wl,-Map=$(BOOT_NAME).map,--cref -fno-PIE
+ LDFLAGS+=-T $(BOOTSTRAP_PATH)/elf32-littlearm.lds -Ttext $(LINK_ADDR)
+ OBJS=crt0_gnu.o
+ 
+diff --git a/board/at91sam9rlek/dataflash/Makefile b/board/at91sam9rlek/dataflash/Makefile
+index 83f5c62..0bd9261 100644
+--- a/board/at91sam9rlek/dataflash/Makefile
++++ b/board/at91sam9rlek/dataflash/Makefile
+@@ -37,14 +37,14 @@ NM= $(CROSS_COMPILE)nm
+ SIZE=$(CROSS_COMPILE)size
+ OBJCOPY=$(CROSS_COMPILE)objcopy
+ OBJDUMP=$(CROSS_COMPILE)objdump
+-CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
++CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-stack-protector
+ ASFLAGS=-g -mcpu=arm926ej-s -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
+ 
+ # Linker flags.
+ #  -Wl,...:     tell GCC to pass this to linker.
+ #    -Map:      create map file
+ #    --cref:    add cross reference to map file
+-LDFLAGS+=-nostartfiles -nostdlib -Wl,-Map=$(BOOT_NAME).map,--cref
++LDFLAGS+=-nostartfiles -nostdlib -Wl,-Map=$(BOOT_NAME).map,--cref -fno-PIE
+ LDFLAGS+=-T $(BOOTSTRAP_PATH)/elf32-littlearm.lds -Ttext $(LINK_ADDR)
+ OBJS=crt0_gnu.o
+ 
+diff --git a/board/at91sam9rlek/nandflash/Makefile b/board/at91sam9rlek/nandflash/Makefile
+index 961a3fb..0e51a70 100644
+--- a/board/at91sam9rlek/nandflash/Makefile
++++ b/board/at91sam9rlek/nandflash/Makefile
+@@ -37,14 +37,14 @@ NM= $(CROSS_COMPILE)nm
+ SIZE=$(CROSS_COMPILE)size
+ OBJCOPY=$(CROSS_COMPILE)objcopy
+ OBJDUMP=$(CROSS_COMPILE)objdump
+-CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
++CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-stack-protector
+ ASFLAGS=-g -mcpu=arm926ej-s -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
+ 
+ # Linker flags.
+ #  -Wl,...:     tell GCC to pass this to linker.
+ #    -Map:      create map file
+ #    --cref:    add cross reference to map file
+-LDFLAGS+=-nostartfiles -nostdlib -Wl,-Map=$(BOOT_NAME).map,--cref
++LDFLAGS+=-nostartfiles -nostdlib -Wl,-Map=$(BOOT_NAME).map,--cref -fno-PIE
+ LDFLAGS+=-T $(BOOTSTRAP_PATH)/elf32-littlearm.lds -Ttext $(LINK_ADDR)
+ OBJS=crt0_gnu.o
+ 
+diff --git a/board/at91sam9xeek/dataflash/Makefile b/board/at91sam9xeek/dataflash/Makefile
+index 07e0d4c..274fc30 100644
+--- a/board/at91sam9xeek/dataflash/Makefile
++++ b/board/at91sam9xeek/dataflash/Makefile
+@@ -38,14 +38,14 @@ NM= $(CROSS_COMPILE)nm
+ SIZE=$(CROSS_COMPILE)size
+ OBJCOPY=$(CROSS_COMPILE)objcopy
+ OBJDUMP=$(CROSS_COMPILE)objdump
+-CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
++CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-stack-protector
+ ASFLAGS=-g -mcpu=arm9 -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
+ 
+ # Linker flags.
+ #  -Wl,...:     tell GCC to pass this to linker.
+ #    -Map:      create map file
+ #    --cref:    add cross reference to map file
+-LDFLAGS+=-nostartfiles -nostdlib -Wl,-Map=$(BOOT_NAME).map,--cref
++LDFLAGS+=-nostartfiles -nostdlib -Wl,-Map=$(BOOT_NAME).map,--cref -fno-PIE
+ LDFLAGS+=-T $(BOOTSTRAP_PATH)/elf32-littlearm.lds -Ttext $(LINK_ADDR)
+ ifdef MEMORY_BASE
+ LDFLAGS+=-Tdata $(MEMORY_BASE)
+diff --git a/board/at91sam9xeek/nandflash/Makefile b/board/at91sam9xeek/nandflash/Makefile
+index ff7d7df..3b29a2b 100644
+--- a/board/at91sam9xeek/nandflash/Makefile
++++ b/board/at91sam9xeek/nandflash/Makefile
+@@ -38,14 +38,14 @@ NM= $(CROSS_COMPILE)nm
+ SIZE=$(CROSS_COMPILE)size
+ OBJCOPY=$(CROSS_COMPILE)objcopy
+ OBJDUMP=$(CROSS_COMPILE)objdump
+-CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
++CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-stack-protector
+ ASFLAGS=-g -mcpu=arm9 -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
+ 
+ # Linker flags.
+ #  -Wl,...:     tell GCC to pass this to linker.
+ #    -Map:      create map file
+ #    --cref:    add cross reference to map file
+-LDFLAGS+=-nostartfiles -nostdlib -Wl,-Map=$(BOOT_NAME).map,--cref
++LDFLAGS+=-nostartfiles -nostdlib -Wl,-Map=$(BOOT_NAME).map,--cref -fno-PIE
+ LDFLAGS+=-T $(BOOTSTRAP_PATH)/elf32-littlearm.lds -Ttext $(LINK_ADDR)
+ ifdef MEMORY_BASE
+ LDFLAGS+=-Tdata $(MEMORY_BASE)
+-- 
+2.25.1
+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
