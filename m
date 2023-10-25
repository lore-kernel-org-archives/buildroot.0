Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99358C07545
	for <buildroot@archiver.kernel.org>; Wed, 25 Oct 2023 20:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2DA8F404C8;
	Wed, 25 Oct 2023 20:39:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DA8F404C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b5GpVQCJ-Adh; Wed, 25 Oct 2023 20:38:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B67D404BF;
	Wed, 25 Oct 2023 20:38:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B67D404BF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7BF521BF3F4
 for <buildroot@lists.busybox.net>; Wed, 25 Oct 2023 20:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6118F41800
 for <buildroot@lists.busybox.net>; Wed, 25 Oct 2023 20:38:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6118F41800
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o-eV-S_KHeAu for <buildroot@lists.busybox.net>;
 Wed, 25 Oct 2023 20:38:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F8C54168B
 for <buildroot@uclibc.org>; Wed, 25 Oct 2023 20:38:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F8C54168B
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 6BB628353E; Wed, 25 Oct 2023 20:38:55 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Wed, 25 Oct 2023 20:38:54 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2023.08.2
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: marcus.hoffmann@othermo.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-15823-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15823] New: Installing nodejs modules with native
 extensions fails on first run
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

https://bugs.busybox.net/show_bug.cgi?id=15823

            Bug ID: 15823
           Summary: Installing nodejs modules with native extensions fails
                    on first run
           Product: buildroot
           Version: 2023.08.2
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: marcus.hoffmann@othermo.de
                CC: buildroot@uclibc.org
  Target Milestone: ---

I'm building the the raspberrypi4_64_defconfig with the following
changes/additions:

```
BR2_CCACHE=y
BR2_PACKAGE_NODEJS=y
BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL="serialport"
BR2_TARGET_ROOTFS_EXT2_SIZE="300M"
```


This fails during the first run with the following errors:
```
ERROR: architecture for
"/usr/lib/node_modules/node-red-node-serialport/node_modules/@serialport/bindings-cpp/prebuilds/linux-arm/node.napi.armv6.node"
is "ARM", should be "AArch64"
ERROR: architecture for
"/usr/lib/node_modules/node-red-node-serialport/node_modules/@serialport/bindings-cpp/prebuilds/android-arm/node.napi.armv7.node"
is "ARM", should be "AArch64"
ERROR: architecture for
"/usr/lib/node_modules/node-red-node-serialport/node_modules/@serialport/bindings-cpp/prebuilds/linux-arm/node.napi.armv7.node"
is "ARM", should be "AArch64"
ERROR: architecture for
"/usr/lib/node_modules/node-red-node-serialport/node_modules/@serialport/bindings-cpp/prebuilds/linux-x64/node.napi.glibc.node"
is "Advanced Micro Devices X86-64", should be "AArch64"
ERROR: architecture for
"/usr/lib/node_modules/node-red-node-serialport/node_modules/@serialport/bindings-cpp/prebuilds/linux-x64/node.napi.musl.node"
is "Advanced Micro Devices X86-64", should be "AArch64"
make[1]: *** [package/pkg-generic.mk:406:
/home/marcus/repos/buildroot-upstream/output/build/nodejs-16.20.0/.stamp_installed]
Error 1
```

On a second invocation of make, it then succeeds to build. I have not yet
runtime testing if the serialport library actually works.

As discussed on IRC just now, there was a discussion about this issue on this
patch already:

https://patchwork.ozlabs.org/project/buildroot/patch/20190531075800.7064-1-vcrini@gmail.com/

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
