Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37DACC4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 11:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBB10612DC;
	Thu,  9 Nov 2023 11:07:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBB10612DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YxKDYFUJZnVf; Thu,  9 Nov 2023 11:07:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 092CD60ADE;
	Thu,  9 Nov 2023 11:07:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 092CD60ADE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3A14D1BF352
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 11:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07C6E400C1
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 11:07:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07C6E400C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YOyCPmf3XGqq for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 11:07:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7EFE40A67
 for <buildroot@uclibc.org>; Thu,  9 Nov 2023 11:07:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7EFE40A67
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id B16978284C; Thu,  9 Nov 2023 11:07:14 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Thu, 09 Nov 2023 11:07:14 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2023.08.2
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: minor
X-Bugzilla-Who: justin.brown@fandingo.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-15847-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15847] New: Systemd: Incorrect Permission on
 /usr/lib/systemd
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

https://bugs.busybox.net/show_bug.cgi?id=15847

            Bug ID: 15847
           Summary: Systemd: Incorrect Permission on /usr/lib/systemd
           Product: buildroot
           Version: 2023.08.2
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: justin.brown@fandingo.org
                CC: buildroot@uclibc.org
  Target Milestone: ---

I'm trying to use systemd as my init and systemd-networkd as my connection
manager. There appears to be a problem with the file permissions that prevent
networkd from starting. 


CONFIG:
=======

I'm tracking origin/master and am up to date with fd41e442f0f from Nov. 7th. My
defconfig is qemu_x86_64_defconfig with two modifications: BR2_INIT_SYSTEMD=y
(including BR2_PACKAGE_SYSTEMD_NETWORKD=y) and a BR2_ROOTFS_OVERLAY that
provides a etc/systemd/network/01.network basic DHCP unit file. (Plus the
additional both required and optional linux.config modifications for systemd
specified at https://github.com/systemd/systemd/blob/main/README.) 


PROBLEM:
========

The systemd package creates a systemd-network user, and the
systemd-networkd.service unit executes as that user. However, the file
permissions prohibit this non-root user from executing
/usr/lib/systemd/systemd-networkd:


# ls -ald /usr/lib/systemd/
drwxrwx---   13 root     root          2048 Nov  9 10:10 /usr/lib/systemd/

# ls -al /usr/lib/systemd/systemd-networkd
-rwxr-xr-x    1 root     root       1579456 Nov  9 10:10
/usr/lib/systemd/systemd-networkd


Note that the /usr/lib/systemd directory does not allow the necessary o=rx
permissions for a non-root user to access these binaries.


REQUEST:
========

I'm not well versed in writing makefiles, yet. But from a sh perspective, the
solution seems to be that the systemd package makefile needs to do the
equivalent of:

chmod o+rx /usr/lib/systemd

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
