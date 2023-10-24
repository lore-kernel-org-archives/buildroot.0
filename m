Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE145C07545
	for <buildroot@archiver.kernel.org>; Tue, 24 Oct 2023 16:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4660D433E8;
	Tue, 24 Oct 2023 16:54:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4660D433E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8TLRvmzVEdVX; Tue, 24 Oct 2023 16:54:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0203F433EC;
	Tue, 24 Oct 2023 16:54:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0203F433EC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 834BF1BF3F7
 for <buildroot@lists.busybox.net>; Tue, 24 Oct 2023 16:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 66DCE6F521
 for <buildroot@lists.busybox.net>; Tue, 24 Oct 2023 16:54:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66DCE6F521
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zYJoHJCUX7-4 for <buildroot@lists.busybox.net>;
 Tue, 24 Oct 2023 16:54:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B6226FC07
 for <buildroot@uclibc.org>; Tue, 24 Oct 2023 16:54:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B6226FC07
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 8463282866; Tue, 24 Oct 2023 16:54:22 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Tue, 24 Oct 2023 16:54:21 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gary.isliefson@ametek.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-15820-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15820] New: make linux-menuconfig does not modify
 correct .config file when LINUX_KERNEL_CUSTOM_CONFIG_FILE set
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

https://bugs.busybox.net/show_bug.cgi?id=15820

            Bug ID: 15820
           Summary: make linux-menuconfig does not modify correct .config
                    file when LINUX_KERNEL_CUSTOM_CONFIG_FILE set
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: gary.isliefson@ametek.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

I want to have the linux source files in an alternate tree from where buildroot
places them after the download. I've successfully done this by using the
local.mk file with an entry LINUX_OVERRIDE_SRCDIR=/home/me/some-path.

make linux-rebuild then correctly builds from the source files in the new path. 

However, if I run make linux-menuconfig, it modifies the .config file in its
build directory (which is under buildroot at output/build/linux-custom/.config)

I found the variable BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE in buildroot's make
menuconfig, and I thought this would do what I want (ie, modify the .config in
my linux source directory), so I set this var to
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=/home/me/some-path/.config

Then make linux-reconfigure, it rebuilds linux, but appeared to again use the
wrong .config file, then make linux-menuconfig still modifies the .config in
output/build/linux-custom, rather than modifying the one in my source directory
(/home/me/some-path/.config).

Correct me if I'm wrong, but setting BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE
shouldn't buildroot make linux-menuconfig modify the one pointed to by this
variable? So far, I've had to run make linux-menuconfig, then manually copy the
output/target/linux-custom/.config to my actual linux source directory in order
to preserve the changes.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
