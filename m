Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D43CE7A88
	for <buildroot@archiver.kernel.org>; Sat, 23 Sep 2023 22:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F35B81FE2;
	Sat, 23 Sep 2023 22:49:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F35B81FE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jyr9nP8uZkLA; Sat, 23 Sep 2023 22:49:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B17D81FDE;
	Sat, 23 Sep 2023 22:48:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B17D81FDE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 318E81BF86C
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 22:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09930416E7
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 22:48:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09930416E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PlKxRiEoa38t for <buildroot@lists.busybox.net>;
 Sat, 23 Sep 2023 22:48:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1A49416CE
 for <buildroot@uclibc.org>; Sat, 23 Sep 2023 22:48:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1A49416CE
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id CDAEE872F6; Sat, 23 Sep 2023 22:48:56 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Sat, 23 Sep 2023 22:48:56 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jbglaw@lug-owl.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-15802-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15802] New: freescale_imx8qmmek_defconfig,
 freescale_imx8qxpmek_defconfig: Segment flags problem
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

https://bugs.busybox.net/show_bug.cgi?id=15802

            Bug ID: 15802
           Summary: freescale_imx8qmmek_defconfig,
                    freescale_imx8qxpmek_defconfig: Segment flags problem
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: jbglaw@lug-owl.de
                CC: buildroot@uclibc.org
  Target Milestone: ---

While linking (as of ab4f3fafaa839593b3efd9ea12c8ee5d9340cdeb), two
configurations face issues with unexpected segment flags:

[build 2023-09-23 19:17:37]   PP      bl31/bl31.ld.S
[build 2023-09-23 19:17:37]   LD     
/var/lib/laminar/run/buildroot-freescale_imx8qmmek_defconfig/6/buildroot/output/build/arm-trusted-firmware-custom/build/imx8qm/release/bl31/bl31.elf
[build 2023-09-23 19:17:37]
/var/lib/laminar/run/buildroot-freescale_imx8qmmek_defconfig/6/buildroot/output/host/bin/aarch64-buildroot-linux-gnu-ld:
warning:
/var/lib/laminar/run/buildroot-freescale_imx8qmmek_defconfig/6/buildroot/output/build/arm-trusted-firmware-custom/build/imx8qm/release/bl31/bl31.elf
has a LOAD segment with RWX permissions
[build 2023-09-23 19:17:37] make[1]: *** [Makefile:1105:
/var/lib/laminar/run/buildroot-freescale_imx8qmmek_defconfig/6/buildroot/output/build/arm-trusted-firmware-custom/build/imx8qm/release/bl31/bl31.elf]
Error 1
[build 2023-09-23 19:17:37] make[1]: Leaving directory
'/var/lib/laminar/run/buildroot-freescale_imx8qmmek_defconfig/6/buildroot/output/build/arm-trusted-firmware-custom'
[build 2023-09-23 19:17:37] make: *** [package/pkg-generic.mk:293:
/var/lib/laminar/run/buildroot-freescale_imx8qmmek_defconfig/6/buildroot/output/build/arm-trusted-firmware-custom/.stamp_built]
Error 2

Logs at
http://toolchain.lug-owl.de/laminar/jobs/buildroot-freescale_imx8qmmek_defconfig/6
and
http://toolchain.lug-owl.de/laminar/jobs/buildroot-freescale_imx8qxpmek_defconfig/6
.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
