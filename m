Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22FD3C433FE
	for <buildroot@archiver.kernel.org>; Wed, 30 Nov 2022 04:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75BA5403A9;
	Wed, 30 Nov 2022 04:32:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75BA5403A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MKwdiRyBwLVH; Wed, 30 Nov 2022 04:32:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9775B4032B;
	Wed, 30 Nov 2022 04:32:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9775B4032B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F17981BF279
 for <buildroot@lists.busybox.net>; Wed, 30 Nov 2022 04:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA14D4032B
 for <buildroot@lists.busybox.net>; Wed, 30 Nov 2022 04:32:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA14D4032B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d9XrodkKjiDd for <buildroot@lists.busybox.net>;
 Wed, 30 Nov 2022 04:32:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8CA2400CE
 for <buildroot@uclibc.org>; Wed, 30 Nov 2022 04:32:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8CA2400CE
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id D55CD83F4D; Wed, 30 Nov 2022 04:32:15 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Wed, 30 Nov 2022 04:32:15 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2022.08.2
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: luffy.jiang@montage-lz.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-15161-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15161] New: kernel can't support SUBDIR
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

https://bugs.busybox.net/show_bug.cgi?id=15161

            Bug ID: 15161
           Summary: kernel can't support SUBDIR
           Product: buildroot
           Version: 2022.08.2
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: luffy.jiang@montage-lz.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

My kernel path is top/kernel/linux-x.y.z
I must keep to relative path because of some special reason

the local.mk like this
LINUX_OVERRIDE_SRCDIR = ../kernel
LINUX_SUBDIR = linux-x.y.z

After run make, I found the build directory follow my idea, the
top/kernel/linux-x.y.z be copied as output/build/linux-custom/linux-x.y.z/

but make oldconfig failed, because it use LINUX_DIR, I hope it use LINUX_SRCDIR
in package/pkg-kconfig.mk, I saw this code:
$$($(2)_DIR)/$$($(2)_KCONFIG_STAMP_DOTCONFIG): $$($(2)_KCONFIG_FILE)
$$($(2)_KCONFIG_FRAGMENT_FILES)
        $$(call prepare-per-package-directory,$$($(2)_KCONFIG_DEPENDENCIES))
        $$(call
kconfig-package-merge-config,$(2),$$(@D)/$$($(2)_KCONFIG_DOTCONFIG),\
                $$($(2)_KCONFIG_FRAGMENT_FILES))
        $$(Q)touch $$(@D)/$$($(2)_KCONFIG_STAMP_DOTCONFIG)




build log:

lujiang@cn028lnx02:~/work/mt_sdk/symphony/Lznux/linux/buildroot $ make V=1
/usr/bin/install -m 0644 -D
../kernel/linux-x.y.z/arch/arm64/configs/symphony6_fpga_dbg_defconfig
/home/lujiang/work/mt_sdk/symphony/Lznux/linux/buildroot/output/build/linux-custom/.config
support/kconfig/merge_config.sh -m -O
/home/lujiang/work/mt_sdk/symphony/Lznux/linux/buildroot/output/build/linux-custom/
/home/lujiang/work/mt_sdk/symphony/Lznux/linux/buildroot/output/build/linux-custom/.config
Using
/home/lujiang/work/mt_sdk/symphony/Lznux/linux/buildroot/output/build/linux-custom/.config
as base
#
# merged configuration written to
/home/lujiang/work/mt_sdk/symphony/Lznux/linux/buildroot/output/build/linux-custom/.config
(needs make)
#
(yes "" |
PATH="/home/lujiang/work/mt_sdk/symphony/Lznux/linux/buildroot/output/host/bin:/home/lujiang/work/mt_sdk/symphony/Lznux/linux/buildroot/output/host/sbin:/home/lujiang/work/mt_sdk/symphony/Lznux/linux/build/script/mt-pkg-config-dir:/home/lujiang/bin:/home/lujiang/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/lujiang/crosstool-ng/crosstool-ng-1.24.0/bin:/home/lujiang/bin:/usr/local/crosstool-ng/gcc-9.3-glibc-2.28-mipsel-linux-gnu-rm2.0/bin:/usr/local/linaro/gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf/bin:/usr/local/linaro/gcc-arm-10.2-2020.11-x86_64-aarch64-none-linux-gnu/bin"
PKG_CONFIG="/home/lujiang/work/mt_sdk/symphony/Lznux/linux/buildroot/output/host/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1
PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
PKG_CONFIG_LIBDIR="/home/lujiang/work/mt_sdk/symphony/Lznux/linux/buildroot/output/host/lib/pkgconfig:/home/lujiang/work/mt_sdk/symphony/Lznux/linux/buildroot/output/host/share/pkgconfig"
BR_BINARIES_DIR=/home/lujiang/work/mt_sdk/symphony/Lznux/linux/buildroot/output/images
KCFLAGS=-Wno-attribute-alias /usr/bin/make -j33 -C
/home/lujiang/work/mt_sdk/symphony/Lznux/linux/buildroot/output/build/linux-custom
HOSTCC="/usr/bin/gcc" HOSTCC="/usr/bin/gcc -O2
-I/home/lujiang/work/mt_sdk/symphony/Lznux/linux/buildroot/output/host/include
-L/home/lujiang/work/mt_sdk/symphony/Lznux/linux/buildroot/output/host/lib
-Wl,-rpath,/home/lujiang/work/mt_sdk/symphony/Lznux/linux/buildroot/output/host/lib"
ARCH=arm64
INSTALL_MOD_PATH=/home/lujiang/work/mt_sdk/symphony/Lznux/linux/buildroot/output/target
CROSS_COMPILE="/home/lujiang/work/mt_sdk/symphony/Lznux/linux/buildroot/output/host/bin/aarch64-none-linux-gnu-"
WERROR=0
DEPMOD=/home/lujiang/work/mt_sdk/symphony/Lznux/linux/buildroot/output/host/sbin/depmod
INSTALL_MOD_STRIP=1 HOSTCC="/usr/bin/gcc" oldconfig)
make[1]: Entering directory
'/home/lujiang/work/mt_sdk/symphony/Lznux/linux/buildroot/output/build/linux-custom'
make[1]: *** No rule to make target 'oldconfig'.  Stop.
make[1]: Leaving directory
'/home/lujiang/work/mt_sdk/symphony/Lznux/linux/buildroot/output/build/linux-custom'
linux/linux.mk:617: recipe for target
'/home/lujiang/work/mt_sdk/symphony/Lznux/linux/buildroot/output/build/linux-custom/.stamp_dotconfig'
failed
make: ***
[/home/lujiang/work/mt_sdk/symphony/Lznux/linux/buildroot/output/build/linux-custom/.stamp_dotconfig]
Error 2




you can see, the kernel config file be copied as
output/build/linux-custom/.config, but I want it be copied as
output/build/linux-custom/linux-x.y.z/.config

and make oldconfig in output/build/linux-custom/.config,
but I want to i run in output/build/linux-custom/linux-x.y.z





I print the var LINUX_SRCDIR and LINUX_DIR
$ make show-vars VARS=LINUX_SRCDIR
the value is
"/home/lujiang/work/mt_sdk/symphony/Lznux/linux/buildroot/output/build/linux-custom/linux-x.y.z"
$ make show-vars VARS=LINUX_DIR
the value is
"/home/lujiang/work/mt_sdk/symphony/Lznux/linux/buildroot/output/build/linux-custom"

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
