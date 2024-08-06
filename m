Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B54C52D6F
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 20:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75226404DF;
	Tue,  6 Aug 2024 20:15:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jfU73pCMQ_21; Tue,  6 Aug 2024 20:15:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 926B0404A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 926B0404A3;
	Tue,  6 Aug 2024 20:15:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9D20E1BF33D
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 20:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9618B40283
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 20:15:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bH7q55484Gjf for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 20:15:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4492A40261
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4492A40261
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 20:15:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3DE04842D4; Tue,  6 Aug 2024 20:15:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Aug 2024 22:13:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4dc5c45bd283991912a3536d044ec1f36756f505
X-Git-Newrev: 21f312a53e49a3338db870df778665e42cf72dbf
X-Patchwork-Hint: ignore
Message-Id: <20240806201500.3DE04842D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/htop: fix BR2_SHARED_STATIC_LIBS
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=21f312a53e49a3338db870df778665e42cf72dbf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/htop/htop.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index 6dbaae3796..4fa8e4fb5f 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -17,6 +17,16 @@ HTOP_LICENSE_FILES = COPYING
 # provided by autoconf relies on wchar_t.
 HTOP_CONF_ENV += ac_cv_prog_cc_c99=-std=gnu99
 
+# --enable-static has a non-standard semantic in htop, and causes the
+# main binary to be linked statically, not just the production of
+# static libraries. This causes issues with BR2_SHARED_STATIC_LIBS as
+# htop is linked statically, but pkg-config returns results relevant
+# for a shared library build. Since htop is only building an
+# application, let's disable this bogus behavior.
+ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+HTOP_CONF_OPTS += --disable-static
+endif
+
 ifeq ($(BR2_PACKAGE_HWLOC),y)
 HTOP_CONF_OPTS += --enable-hwloc
 HTOP_DEPENDENCIES += hwloc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
