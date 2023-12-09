Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C114C4167B
	for <buildroot@archiver.kernel.org>; Sat,  9 Dec 2023 10:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAFCA81B0A;
	Sat,  9 Dec 2023 10:10:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAFCA81B0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6oQ09knNGL-7; Sat,  9 Dec 2023 10:10:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 266C681ABB;
	Sat,  9 Dec 2023 10:10:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 266C681ABB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 899F31BF239
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 10:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6705B401A1
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 10:10:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6705B401A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9v4iY7J-HLD6 for <buildroot@lists.busybox.net>;
 Sat,  9 Dec 2023 10:10:50 +0000 (UTC)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 508E240198
 for <buildroot@buildroot.org>; Sat,  9 Dec 2023 10:10:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 508E240198
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-332fd81fc8dso2734223f8f.3
 for <buildroot@buildroot.org>; Sat, 09 Dec 2023 02:10:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702116648; x=1702721448;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PjxdxUvjKeM8puLpx+91jtizZMQ1ILGQBk1DDb/pe3k=;
 b=HVhuXqIMB+TsaqKXuXgyBc1tbh72YcABXNNbtjf9cAtDvMlpwJcIDWXw9VvM0xuU16
 mq+vycHRS04v3ORzhrEM+SIsARrIfFxA+vusPLRrsEnFgGuq1aoAChq0OOMVAUW4Wqhm
 dp+oXEPeR/VRH4BUBPa1tqvKK1eLtbChmHaXaRjx1UNDOFn1vtMZWYeYyRa3flXXx+p6
 lJUju4qgzqOTbWPITmzJD8GbqYeSE4Vhkfi2NUOdqY9/qQuZ7dpSBX8/A2QqpUpd0xpB
 vWRsxnH4TDS3aaH2KRn+piYP/MgQpG4Npw/iNy0HbXVR+9smqLMEdkx/AzI1tRDU3wCV
 ZkzQ==
X-Gm-Message-State: AOJu0YwtpeZSBnuOCzF5J5Sp5t2G6SDR9lNr7uP8ObnSK6cuWp//3vjU
 rLkk51mdfE/IBOocQtnJ56M3oaP4XEK1P4mVTJyFsg==
X-Google-Smtp-Source: AGHT+IG4XVIJsJVsOGNGRRk2NMTjF11DsEgXUFIMrbzipu5E3cO7hiIPGbDYyRQMODty5HGeVTIFsQ==
X-Received: by 2002:a05:600c:3b06:b0:40c:32f1:8167 with SMTP id
 m6-20020a05600c3b0600b0040c32f18167mr752225wms.69.1702116647772; 
 Sat, 09 Dec 2023 02:10:47 -0800 (PST)
Received: from panicking.amarulasolutions.com ([2.198.79.154])
 by smtp.gmail.com with ESMTPSA id
 d12-20020adfa40c000000b003333fa3d043sm3992515wra.12.2023.12.09.02.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Dec 2023 02:10:46 -0800 (PST)
From: Michael Trimarchi <michael@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat,  9 Dec 2023 11:10:43 +0100
Message-Id: <20231209101043.1839458-1-michael@amarulasolutions.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702116648; x=1702721448;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PjxdxUvjKeM8puLpx+91jtizZMQ1ILGQBk1DDb/pe3k=;
 b=flywC1kvrKwMcSI5ZgAjJ5Gveiu24Fpspu12dnMZm7v0X7WMsiiXXXGkQ27H2MKoOR
 krKX1FDyKnJXDazez0xX8uz9EVwOujYtm2oSRLO8L3BGSPt22UvbPl1P+BzJ2/dqoVPs
 sqJ7cxuknHaDaANDx9HEJMmg695Lvb8x7Ady8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=flywC1kv
Subject: [Buildroot] [PATCH] linux: Add helping kernel gdb functions
 compilation
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
 linux-amarula@amarulasolutions.com,
 Michael Trimarchi <michael@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In order to use all the features of KGDB it's nice to have
the possibility to source the vmlinux-gdb.py file. The
generation of this file it's a target of linux kernel. Add it
in order to use gdb of vmlinux in output directory including
tx-* linux script

gdb-multiarch --tui output/build/<linux dir>/vmlinux
add-auto-load-safe-path output/build/<linux dir>
source output/build/<linux dir>/vmlinux-gdb.py

Linux needs to be compiled with DEBUG_INFO (without restrict
DEBUG_INFO) and kernel cmdline should be modified to wait
of kgdb if needed. As example

kgdboc_earlycon=ns16550a kgdboc=/dev/ttyS2 kgdbwait nokaslr

The test was done on am62x board over serial line. In order
to have it running properly we need to compile the agent-proxy

./output/host/bin/agent-proxy 4440 4441 0 /dev/ttyUSB0 115200

gdb can now having the debugging uart available using:

target remote localhost:4441

the 4440 is used by the console and 4441 is used to debug

Tested-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
---
 linux/Config.in | 7 +++++++
 linux/linux.mk  | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index ae734c49a0..71ab27bbcb 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -486,6 +486,13 @@ config BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE
 	  such as "BTF: .tmp_vmlinux.btf: pahole (pahole) is not
 	  available".
 
+config BR2_LINUX_KERNEL_ADD_HOST_GDB_SCRIPTS
+	bool "Need tools for debugging with kgdb"
+	help
+	  Add helping script to be used with gdb and kgdb in order to
+	  debug linux kernel. Those convinients scripts add some feature
+	  command to gdb with specific python script
+
 # Linux extensions
 source "linux/Config.ext.in"
 
diff --git a/linux/linux.mk b/linux/linux.mk
index 1db5c6046d..e8cdb26793 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -488,6 +488,12 @@ LINUX_APPEND_DTB += ; \
 endif
 endif
 
+ifeq ($(BR2_LINUX_KERNEL_ADD_HOST_GDB_SCRIPTS),y)
+define LINUX_BUILD_GDB_SCRIPTS
+	$(LINUX_MAKE_ENV) $(BR2_MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) scripts_gdb
+endef
+endif
+
 # Compilation. We make sure the kernel gets rebuilt when the
 # configuration has changed. We call the 'all' and
 # '$(LINUX_TARGET_NAME)' targets separately because calling them in
@@ -503,6 +509,7 @@ define LINUX_BUILD_CMDS
 	$(LINUX_MAKE_ENV) $(BR2_MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) all
 	$(LINUX_MAKE_ENV) $(BR2_MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)
 	$(LINUX_BUILD_DTB)
+	$(LINUX_BUILD_GDB_SCRIPTS)
 	$(LINUX_APPEND_DTB)
 endef
 
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
