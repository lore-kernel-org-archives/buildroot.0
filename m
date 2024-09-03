Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA2FCD37AA
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 19:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7737740A20;
	Tue,  3 Sep 2024 19:15:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DqBYTgoovZSM; Tue,  3 Sep 2024 19:15:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1621D40A1A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1621D40A1A;
	Tue,  3 Sep 2024 19:15:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3E3A41BF267
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38EA960681
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:15:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M6rxdoBeo9Kh for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 19:15:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DA04360663
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA04360663
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA04360663
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 19:15:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 10CC5240002;
 Tue,  3 Sep 2024 19:14:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1slYzT-005CFl-1M;
 Tue, 03 Sep 2024 21:14:59 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240204101140.1403357-1-fontaine.fabrice@gmail.com>
Date: Tue, 03 Sep 2024 21:14:59 +0200
In-Reply-To: <20240204101140.1403357-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 4 Feb 2024 11:11:40 +0100")
Message-ID: <87cylklfbg.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/htop: fix
 BR2_SHARED_STATIC_LIBS build
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > With BR2_SHARED_STATIC_LIBS=y, the generic infrastructure adds a
 > --enable-static flags causing htop to be built as a static binary.
 > Adding a --disable-static reverts this. This will fix the following
 > build failure with hwloc raised since bump to version 3.3.0 in commit
 > 09243186df3168022f0b23b8a9677c6313033769 and
 > https://github.com/htop-dev/htop/commit/c8a61850dd31ab64eb8ad83929ce86d2adbeb96c:

 > /home/autobuild/autobuild/instance-3/output-1/host/bin/mipsel-buildroot-linux-gnu-gcc
 > -std=c99 -pedantic -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600
 > -I/home/autobuild/autobuild/instance-3/output-1/host/mipsel-buildroot-linux-gnu/sysroot/usr/bin/../../usr/include
 > -I/home/autobuild/autobuild/instance-3/output-1/host/bin/../mipsel-buildroot-linux-gnu/sysroot/usr/include/libxml2
 > -Wall -Wcast-align -Wcast-qual -Wextra -Wfloat-equal -Wformat=2
 > -Winit-self -Wmissing-format-attribute -Wmissing-noreturn
 > -Wmissing-prototypes -Wpointer-arith -Wshadow -Wstrict-prototypes
 > -Wundef -Wunused -Wwrite-strings -Wnull-dereference
 > -D_XOPEN_SOURCE_EXTENDED -DSYSCONFDIR="\"/etc\"" -I"./linux"
 > -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
 > -g0 -D_FORTIFY_SOURCE=2 -static -rdynamic -static -o htop htop.o
 > Action.o Affinity.o AffinityPanel.o AvailableColumnsPanel.o
 > AvailableMetersPanel.o BatteryMeter.o CategoriesPanel.o ClockMeter.o
 > ColorsPanel.o ColumnsPanel.o CommandLine.o CommandScreen.
 >  o Compat.o CPUMeter.o CRT.o DateMeter.o DateTimeMeter.o DiskIOMeter.o
 > DisplayOptionsPanel.o DynamicColumn.o DynamicMeter.o DynamicScreen.o
 > EnvScreen.o FileDescriptorMeter.o FunctionBar.o Hashtable.o Header.o
 > HeaderOptionsPanel.o HostnameMeter.o IncSet.o InfoScreen.o ListItem.o
 > LoadAverageMeter.o Machine.o MainPanel.o MemoryMeter.o
 > MemorySwapMeter.o Meter.o MetersPanel.o NetworkIOMeter.o Object.o
 > OpenFilesScreen.o OptionItem.o Panel.o Process.o ProcessLocksScreen.o
 > ProcessTable.o Row.o RichString.o Scheduling.o ScreenManager.o
 > ScreensPanel.o ScreenTabsPanel.o Settings.o SignalsPanel.o SwapMeter.o
 > SysArchMeter.o Table.o TasksMeter.o TraceScreen.o UptimeMeter.o
 > UsersTable.o Vector.o XUtils.o generic/gettime.o generic/hostname.o
 > generic/uname.o linux/CGroupUtils.o linux/HugePageMeter.o
 > linux/IOPriorityPanel.o linux/LibSensors.o linux/LinuxMachine.o
 > linux/LinuxProcess.o linux/LinuxProcessTable.o linux/Platform.o
 > linux/PressureStallMeter.o linux/SELinuxMeter.o linux/SystemdMeter.o
 > linux/Z
 >  ramMeter.o zfs/ZfsArcMeter.o zfs/ZfsCompressedArcMeter.o -lcap -llzma
 > -L/home/autobuild/autobuild/instance-3/output-1/host/mipsel-buildroot-linux-gnu/sysroot/usr/bin/../../usr/lib
 > -lncurses -lm
 > -L/home/autobuild/autobuild/instance-3/output-1/host/bin/../mipsel-buildroot-linux-gnu/sysroot/usr/lib
 > -lhwloc
 > /home/autobuild/autobuild/instance-3/output-1/host/lib/gcc/mipsel-buildroot-linux-gnu/12.3.0/../../../../mipsel-buildroot-linux-gnu/bin/ld:
 > Action.o: in function `Action_setUserOnly':
 > Action.c:(.text+0x2490): warning: Using 'getpwnam' in statically
 > linked applications requires at runtime the shared libraries from the
 > glibc version used for linking
 > /home/autobuild/autobuild/instance-3/output-1/host/lib/gcc/mipsel-buildroot-linux-gnu/12.3.0/../../../../mipsel-buildroot-linux-gnu/bin/ld:
 > Settings.o: in function `Settings_new':
 > Settings.c:(.text+0x2dd0): warning: Using 'getpwuid' in statically
 > linked applications requires at runtime the shared libraries from the
 > glibc version used for linking
 > /home/autobuild/autobuild/instance-3/output-1/host/lib/gcc/mipsel-buildroot-linux-gnu/12.3.0/../../../../mipsel-buildroot-linux-gnu/bin/ld:
 > /home/autobuild/autobuild/instance-3/output-1/host/mipsel-buildroot-linux-gnu/sysroot/usr/bin/../../usr/lib/libhwloc.a(topology-xml-libxml.o):
 > in function `hwloc_libxml_free_buffer':
 > topology-xml-libxml.c:(.text+0x2c): undefined reference to `xmlFree'

 > Fixes:
 >  - http://autobuild.buildroot.org/results/04bd5633750ff5cef048ea78c9de043d3ffcfa32

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
