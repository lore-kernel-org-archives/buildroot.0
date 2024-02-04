Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD915C48286
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 10:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 863C4851FF;
	Sun,  4 Feb 2024 10:11:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 863C4851FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yIxwj34Cy215; Sun,  4 Feb 2024 10:11:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE8A6851C3;
	Sun,  4 Feb 2024 10:11:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE8A6851C3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3419E1BF41D
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 10:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C25160FBE
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 10:11:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C25160FBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j5p2aToc6TTK for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 10:11:49 +0000 (UTC)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E0F3F60F1A
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 10:11:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0F3F60F1A
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-339289fead2so2300141f8f.3
 for <buildroot@buildroot.org>; Sun, 04 Feb 2024 02:11:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707041506; x=1707646306;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LNKezQIkLkEcZDnBLUShT5xaRloxjDLkmkzyT5LmYO0=;
 b=naLMZb/Rl2LUgYSGhxlSVa6vOUtRITs/Swnxy71YIJfi3tlgDDMU+RuNCJ1JjjGz5L
 fm4zjWFlyzoH1rE+c8dVCO72j6KwGu1PTZha17AsUK8TsgRzSRrLGApnQZMQlRjuqMB1
 CYzreg/Px5Xs4tcWjXBhpYVgKuNx5Vv0dHj4tkgYBE3Lx70kyX3opfNyvcBwbKD61K6x
 EyFlQuTil9h3eh4g7GFo1RIXx96lbpoZeV6py0eq4W+/cgR5tFcUDkcJ5Qah+5kHSRES
 f5IDXU3gKcxMALOkya5KNhyqWiQoxc2R+mgnlpBjaUaVcjF4jWazxmlxLl5njBmE189T
 7VtQ==
X-Gm-Message-State: AOJu0Yy3r/PMLsbStvQSLSxB3o/VcZyLitZtdWwfi6yFju5HCqP8xsp4
 ALCv1I788ah6wspwjpSi3Y2iUrhysIUvJPP0QEvxF/1sxX3WOrcXdlMS3EmDQcM=
X-Google-Smtp-Source: AGHT+IGBvcXoTF40fXVOdw/Yemr4MnQr7gMV4Gph/sSRR4P1czbObGaDqj18JKMSLmy7IXl5W3yZvA==
X-Received: by 2002:a5d:4a8e:0:b0:33b:296f:def9 with SMTP id
 o14-20020a5d4a8e000000b0033b296fdef9mr2848652wrq.8.1707041505860; 
 Sun, 04 Feb 2024 02:11:45 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 k14-20020adff28e000000b0033afc81fc00sm5637697wro.41.2024.02.04.02.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Feb 2024 02:11:44 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Feb 2024 11:11:40 +0100
Message-ID: <20240204101140.1403357-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707041506; x=1707646306; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LNKezQIkLkEcZDnBLUShT5xaRloxjDLkmkzyT5LmYO0=;
 b=HvHbf0ThHmVwze8YFOdPwjA8AxDDYXvVLFs8mJ8Eby4/HZnNk9rM2VqiQuiJ9c0UQ1
 DwSwFjZK6ArVTptKMbV8SkaQIu7iDK5xdpHUnJtxml6ogCbIcS2CjLS/dzLFKQRok7Q8
 ZHvmK2bULJPU+4gYs2T7Bmw8GorxRahH1/ESZEATrv0W7BxZCexKn1YfXi0zehzl1NsK
 fCPAqgje+DdAKUzXDkRncC60mumZw0NQASNxHUFGWgzQ3oey5SiWqqi1SH8uwgcFEDmM
 w7ZKxe0iFybni0pSIkW0avt2LZJyTYAjUPaZsPKWsd63ZxL63j8vnH3zQBDsHADZnvBe
 wW8g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HvHbf0Th
Subject: [Buildroot] [PATCH 1/1] package/htop: fix BR2_SHARED_STATIC_LIBS
 build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With BR2_SHARED_STATIC_LIBS=y, the generic infrastructure adds a
--enable-static flags causing htop to be built as a static binary.
Adding a --disable-static reverts this. This will fix the following
build failure with hwloc raised since bump to version 3.3.0 in commit
09243186df3168022f0b23b8a9677c6313033769 and
https://github.com/htop-dev/htop/commit/c8a61850dd31ab64eb8ad83929ce86d2adbeb96c:

/home/autobuild/autobuild/instance-3/output-1/host/bin/mipsel-buildroot-linux-gnu-gcc -std=c99 -pedantic -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600 -I/home/autobuild/autobuild/instance-3/output-1/host/mipsel-buildroot-linux-gnu/sysroot/usr/bin/../../usr/include -I/home/autobuild/autobuild/instance-3/output-1/host/bin/../mipsel-buildroot-linux-gnu/sysroot/usr/include/libxml2  -Wall -Wcast-align -Wcast-qual -Wextra -Wfloat-equal -Wformat=2 -Winit-self -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wpointer-arith -Wshadow -Wstrict-prototypes -Wundef -Wunused -Wwrite-strings -Wnull-dereference -D_XOPEN_SOURCE_EXTENDED -DSYSCONFDIR="\"/etc\"" -I"./linux" -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0 -D_FORTIFY_SOURCE=2 -static -rdynamic  -static -o htop htop.o   Action.o Affinity.o AffinityPanel.o AvailableColumnsPanel.o AvailableMetersPanel.o BatteryMeter.o CategoriesPanel.o ClockMeter.o ColorsPanel.o ColumnsPanel.o CommandLine.o CommandScreen.
 o Compat.o CPUMeter.o CRT.o DateMeter.o DateTimeMeter.o DiskIOMeter.o DisplayOptionsPanel.o DynamicColumn.o DynamicMeter.o DynamicScreen.o EnvScreen.o FileDescriptorMeter.o FunctionBar.o Hashtable.o Header.o HeaderOptionsPanel.o HostnameMeter.o IncSet.o InfoScreen.o ListItem.o LoadAverageMeter.o Machine.o MainPanel.o MemoryMeter.o MemorySwapMeter.o Meter.o MetersPanel.o NetworkIOMeter.o Object.o OpenFilesScreen.o OptionItem.o Panel.o Process.o ProcessLocksScreen.o ProcessTable.o Row.o RichString.o Scheduling.o ScreenManager.o ScreensPanel.o ScreenTabsPanel.o Settings.o SignalsPanel.o SwapMeter.o SysArchMeter.o Table.o TasksMeter.o TraceScreen.o UptimeMeter.o UsersTable.o Vector.o XUtils.o generic/gettime.o generic/hostname.o generic/uname.o linux/CGroupUtils.o linux/HugePageMeter.o linux/IOPriorityPanel.o linux/LibSensors.o linux/LinuxMachine.o linux/LinuxProcess.o linux/LinuxProcessTable.o linux/Platform.o linux/PressureStallMeter.o linux/SELinuxMeter.o linux/SystemdMeter.o linux/Z
 ramMeter.o zfs/ZfsArcMeter.o zfs/ZfsCompressedArcMeter.o   -lcap -llzma -L/home/autobuild/autobuild/instance-3/output-1/host/mipsel-buildroot-linux-gnu/sysroot/usr/bin/../../usr/lib -lncurses -lm   -L/home/autobuild/autobuild/instance-3/output-1/host/bin/../mipsel-buildroot-linux-gnu/sysroot/usr/lib -lhwloc
/home/autobuild/autobuild/instance-3/output-1/host/lib/gcc/mipsel-buildroot-linux-gnu/12.3.0/../../../../mipsel-buildroot-linux-gnu/bin/ld: Action.o: in function `Action_setUserOnly':
Action.c:(.text+0x2490): warning: Using 'getpwnam' in statically linked applications requires at runtime the shared libraries from the glibc version used for linking
/home/autobuild/autobuild/instance-3/output-1/host/lib/gcc/mipsel-buildroot-linux-gnu/12.3.0/../../../../mipsel-buildroot-linux-gnu/bin/ld: Settings.o: in function `Settings_new':
Settings.c:(.text+0x2dd0): warning: Using 'getpwuid' in statically linked applications requires at runtime the shared libraries from the glibc version used for linking
/home/autobuild/autobuild/instance-3/output-1/host/lib/gcc/mipsel-buildroot-linux-gnu/12.3.0/../../../../mipsel-buildroot-linux-gnu/bin/ld: /home/autobuild/autobuild/instance-3/output-1/host/mipsel-buildroot-linux-gnu/sysroot/usr/bin/../../usr/lib/libhwloc.a(topology-xml-libxml.o): in function `hwloc_libxml_free_buffer':
topology-xml-libxml.c:(.text+0x2c): undefined reference to `xmlFree'

Fixes:
 - http://autobuild.buildroot.org/results/04bd5633750ff5cef048ea78c9de043d3ffcfa32

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/htop/htop.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index 6dbaae3796..af8eff4860 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -17,6 +17,13 @@ HTOP_LICENSE_FILES = COPYING
 # provided by autoconf relies on wchar_t.
 HTOP_CONF_ENV += ac_cv_prog_cc_c99=-std=gnu99
 
+# With BR2_SHARED_STATIC_LIBS=y, the generic infrastructure adds a
+# --enable-static flags causing htop to be built as a static binary.
+# Adding a --disable-static reverts this
+ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+HTOP_CONF_OPTS += --disable-static
+endif
+
 ifeq ($(BR2_PACKAGE_HWLOC),y)
 HTOP_CONF_OPTS += --enable-hwloc
 HTOP_DEPENDENCIES += hwloc
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
