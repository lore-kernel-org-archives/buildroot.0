Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FADCCA48B
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 10:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C37B46112F;
	Fri, 22 Jul 2022 10:24:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C37B46112F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8BJPW514duZ0; Fri, 22 Jul 2022 10:24:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4547A610D6;
	Fri, 22 Jul 2022 10:24:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4547A610D6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0E5201BF32B
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 10:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA6D7610D6
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 10:24:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA6D7610D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CH8jtXiDFnaD for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 10:24:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 16BC860EE5
 for <buildroot@uclibc.org>; Fri, 22 Jul 2022 10:24:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16BC860EE5
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id B1D4E8414F; Fri, 22 Jul 2022 10:10:43 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Fri, 22 Jul 2022 10:24:17 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2022.02.3
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: buildroot@heine.tech
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-14921-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14921] New: wpewebkit build fails because of
 internal build order
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://bugs.busybox.net/show_bug.cgi?id=14921

            Bug ID: 14921
           Summary: wpewebkit build fails because of internal build order
           Product: buildroot
           Version: 2022.02.3
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: buildroot@heine.tech
                CC: buildroot@uclibc.org
  Target Milestone: ---

Hi,

since wpewebkit was bumped to 2.36.x (which is the case for 2022.05 as well as
2022.02.3) the build fails with my config. This bug was already briefly
mentioned on the ML but I file it here for visibility.

This bug happens depending on the defconfig and the configuration of the
buildsystem (I'm building on a 24-core machine). When I restart the build it
succeeds because the missing dependency was then already build.

Two traces I recorded:

Scanning dependencies of target jsc
[ 39%] Building CXX object
Source/JavaScriptCore/shell/CMakeFiles/jsc.dir/__/jsc.cpp.o
[ 39%] Linking CXX executable ../../../bin/jsc
/builds/chp/bsp/buildroot/build/per-package/wpewebkit/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabihf/10.3.1/../../../../arm-none-linux-gnueabihf/bin/ld:
../CMakeFiles/JavaScriptCore.dir/__/__/JavaScriptCore/DerivedSources/unified-sources/UnifiedSource-6e4525b9-1.cpp.o:
in function `JSC::LLInt::CLoop::initialize()':
UnifiedSource-6e4525b9-1.cpp:(.text+0x2f4): undefined reference to
`JSC::LLInt::CLoop::execute(JSC::OpcodeID, void*, JSC::VM*,
JSC::ProtoCallFrame*, bool)'
/builds/chp/bsp/buildroot/build/per-package/wpewebkit/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabihf/10.3.1/../../../../arm-none-linux-gnueabihf/bin/ld:
../CMakeFiles/JavaScriptCore.dir/__/__/JavaScriptCore/DerivedSources/unified-sources/UnifiedSource-6e4525b9-1.cpp.o:
in function `vmEntryToJavaScript':
UnifiedSource-6e4525b9-1.cpp:(.text+0xb40): undefined reference to
`JSC::LLInt::CLoop::execute(JSC::OpcodeID, void*, JSC::VM*,
JSC::ProtoCallFrame*, bool)'
/builds/chp/bsp/buildroot/build/per-package/wpewebkit/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabihf/10.3.1/../../../../arm-none-linux-gnueabihf/bin/ld:
../CMakeFiles/JavaScriptCore.dir/__/__/JavaScriptCore/DerivedSources/unified-sources/UnifiedSource-6e4525b9-1.cpp.o:
in function `vmEntryToNative':
UnifiedSource-6e4525b9-1.cpp:(.text+0xbc0): undefined reference to
`JSC::LLInt::CLoop::execute(JSC::OpcodeID, void*, JSC::VM*,
JSC::ProtoCallFrame*, bool)'
collect2: error: ld returned 1 exit status


[ 39%] Built target JavaScriptCore_CopyPrivateHeaders
Scanning dependencies of target jsc
make[4]: *** No rule to make target
'Source/JavaScriptCore/CMakeFiles/LowLevelInterpreterLib.dir/llint/LowLevelInterpreter.cpp.o',
needed by 'bin/jsc'.  Stop.
make[4]: *** Waiting for unfinished jobs....
[ 39%] Building CXX object
Source/JavaScriptCore/shell/CMakeFiles/jsc.dir/__/jsc.cpp.o
make[3]: *** [CMakeFiles/Makefile2:775:
Source/JavaScriptCore/shell/CMakeFiles/jsc.dir/all] Error 2
make[3]: *** Waiting for unfinished jobs....
Scanning dependencies of target LowLevelInterpreterLib
[ 39%] Building CXX object
Source/JavaScriptCore/CMakeFiles/LowLevelInterpreterLib.dir/llint/LowLevelInterpreter.cpp.o
[ 39%] Built target LowLevelInterpreterLib
[ 39%] Built target WebInspectorUI
make[2]: *** [Makefile:152: all] Error 2
make[1]: *** [package/pkg-generic.mk:293:
/home/mheinemann/buildroot/build/build/wpewebkit-2.36.3/.stamp_built] Error 2
make: *** [Makefile:23: _all] Error 2


So it seems JSC is depending on LowLevelInterpreterLib which is built in
parallel and thus not (always) finished in time.

Defconfig with which I can reproduce this but it might depend on the system you
are building on:

BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2711-rpi-4-b"
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
BR2_PACKAGE_COG=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_RPI_FIRMWARE=y
BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4=y
BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypi4/config_4.txt"
BR2_PACKAGE_WPEWEBKIT=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
# BR2_TARGET_ROOTFS_TAR is not set
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_MTOOLS=y

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
