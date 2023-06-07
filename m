Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCD3C77B7A
	for <buildroot@archiver.kernel.org>; Wed,  7 Jun 2023 12:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 76122415DC;
	Wed,  7 Jun 2023 12:40:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76122415DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wKkrGqc5ChS5; Wed,  7 Jun 2023 12:40:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F6E44117C;
	Wed,  7 Jun 2023 12:40:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F6E44117C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B87A51BF3DB
 for <buildroot@lists.busybox.net>; Wed,  7 Jun 2023 12:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DEE181D11
 for <buildroot@lists.busybox.net>; Wed,  7 Jun 2023 12:40:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DEE181D11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kdZOnpNwkqHE for <buildroot@lists.busybox.net>;
 Wed,  7 Jun 2023 12:40:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8D6881C11
 for <buildroot@uclibc.org>; Wed,  7 Jun 2023 12:40:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8D6881C11
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id A561286D3A; Wed,  7 Jun 2023 12:40:24 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Wed, 07 Jun 2023 12:40:24 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2023.02
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: fesc2000@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone attachments.created
Message-ID: <bug-15625-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15625] New: nodejs build fails in installation
 phase when BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL is set
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

https://bugs.busybox.net/show_bug.cgi?id=15625

            Bug ID: 15625
           Summary: nodejs build fails in installation phase when
                    BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL is set
           Product: buildroot
           Version: 2023.02
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: fesc2000@mailbox.org
                CC: buildroot@uclibc.org
  Target Milestone: ---

Created attachment 9607
  --> https://bugs.busybox.net/attachment.cgi?id=9607&action=edit
patch for check-bin-arch to ignore nodejs files

My setup is buildroot2023.02, host OS is Ubuntu, target is linux i686 (32 bit).

I added some nodejs modules: 

BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL="zigbee2mqtt lirc2mqtt"

Now when nodejs is being built check-bin-arch complains:
~~~
(...)
ERROR: architecture for
"/usr/lib/node_modules/zigbee2mqtt/node_modules/@serialport/bindings-cpp/prebuilds/linux-arm/node.napi.armv6.node"
is "ARM", should be "Intel 80386"
ERROR: architecture for
"/usr/lib/node_modules/zigbee2mqtt/node_modules/@serialport/bindings-cpp/prebuilds/android-arm/node.napi.armv7.node"
is "ARM", should be "Intel 80386"
ERROR: architecture for
"/usr/lib/node_modules/zigbee2mqtt/node_modules/@serialport/bindings-cpp/prebuilds/linux-arm/node.napi.armv7.node"
is "ARM", should be "Intel 80386"
ERROR: architecture for
"/usr/lib/node_modules/zigbee2mqtt/node_modules/@serialport/bindings-cpp/prebuilds/android-arm64/node.napi.armv8.node"
is "AArch64", should be "Intel 80386"
ERROR: architecture for
"/usr/lib/node_modules/zigbee2mqtt/node_modules/@serialport/bindings-cpp/prebuilds/linux-arm64/node.napi.armv8.node"
is "AArch64", should be "Intel 80386"
ERROR: architecture for
"/usr/lib/node_modules/zigbee2mqtt/node_modules/@serialport/bindings-cpp/prebuilds/linux-x64/node.napi.glibc.node"
is "Advanced Micro Devices X86-64", should be "Intel 80386"
ERROR: architecture for
"/usr/lib/node_modules/zigbee2mqtt/node_modules/@serialport/bindings-cpp/prebuilds/linux-x64/node.napi.musl.node"
is "Advanced Micro Devices X86-64", should be "Intel 80386"
make[1]: *** [package/pkg-generic.mk:406:
/home/felix/ffritz/packages/x86/buildroot-2023.02_glibc230/build/output/build/nodejs-16.18.1/.stamp_installed]
Error 1
make: *** [Makefile:82: _all] Error 2
~~~

Just re-building works. My fix is to have check-bin-arch ignore these files,
see patch. I'm not sure if this is the proper approach.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
