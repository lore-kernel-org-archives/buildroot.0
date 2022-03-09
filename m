Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92DE5C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 18:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00BE7409F2;
	Wed,  9 Mar 2022 18:18:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TOptaS2GDReZ; Wed,  9 Mar 2022 18:18:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4E0B40232;
	Wed,  9 Mar 2022 18:18:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9A6661BF371
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 18:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97AB8402A7
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 18:18:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gGTy5pjvi4eX for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 18:18:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C20214028C
 for <buildroot@uclibc.org>; Wed,  9 Mar 2022 18:18:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id BC8B18380C; Wed,  9 Mar 2022 18:10:07 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Wed, 09 Mar 2022 18:18:35 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gsmecher@threespeedlogic.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-14661-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14661] New: Fakeroot script relies on bash-isms,
 does not work with dash
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

https://bugs.busybox.net/show_bug.cgi?id=14661

            Bug ID: 14661
           Summary: Fakeroot script relies on bash-isms, does not work
                    with dash
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: gsmecher@threespeedlogic.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

On a Debian (bookworm) release, I get the following error message when building
up the release tarball:

>>>   Generating filesystem image rootfs.tar
mkdir -p /home/gsmecher/winterland/buildroot-mkids/output/images
rm -rf /home/gsmecher/winterland/buildroot-mkids/output/build/buildroot-fs/tar
mkdir -p
/home/gsmecher/winterland/buildroot-mkids/output/build/buildroot-fs/tar
rsync -auH --exclude=/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
/home/gsmecher/winterland/buildroot-mkids/output/target/
/home/gsmecher/winterland/buildroot-mkids/output/build/buildroot-fs/tar/target
echo '#!/bin/sh' >
/home/gsmecher/winterland/buildroot-mkids/output/build/buildroot-fs/tar/fakeroot
echo "set -e" >>
/home/gsmecher/winterland/buildroot-mkids/output/build/buildroot-fs/tar/fakeroot
echo "chown -h -R 0:0
/home/gsmecher/winterland/buildroot-mkids/output/build/buildroot-fs/tar/target"
>>
/home/gsmecher/winterland/buildroot-mkids/output/build/buildroot-fs/tar/fakeroot
PATH="/home/gsmecher/winterland/buildroot-mkids/output/host/bin:/home/gsmecher/winterland/buildroot-mkids/output/host/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"
/home/gsmecher/winterland/buildroot-mkids/support/scripts/mkusers
/home/gsmecher/winterland/buildroot-mkids/output/build/buildroot-fs/full_users_table.txt
/home/gsmecher/winterland/buildroot-mkids/output/build/buildroot-fs/tar/target
>>
/home/gsmecher/winterland/buildroot-mkids/output/build/buildroot-fs/tar/fakeroot
echo "/home/gsmecher/winterland/buildroot-mkids/output/host/bin/makedevs -d
/home/gsmecher/winterland/buildroot-mkids/output/build/buildroot-fs/full_devices_table.txt
/home/gsmecher/winterland/buildroot-mkids/output/build/buildroot-fs/tar/target"
>>
/home/gsmecher/winterland/buildroot-mkids/output/build/buildroot-fs/tar/fakeroot
echo "rm -rf
/home/gsmecher/winterland/buildroot-mkids/output/build/buildroot-fs/tar/target/run/*
/home/gsmecher/winterland/buildroot-mkids/output/build/buildroot-fs/tar/target/run/.[^.]*
/home/gsmecher/winterland/buildroot-mkids/output/build/buildroot-fs/tar/target/tmp/*
/home/gsmecher/winterland/buildroot-mkids/output/build/buildroot-fs/tar/target/tmp/.[^.]*"
>>
/home/gsmecher/winterland/buildroot-mkids/output/build/buildroot-fs/tar/fakeroot
printf '   \n' >>
/home/gsmecher/winterland/buildroot-mkids/output/build/buildroot-fs/tar/fakeroot
printf '   \n' >>
/home/gsmecher/winterland/buildroot-mkids/output/build/buildroot-fs/tar/fakeroot
printf '        (cd
/home/gsmecher/winterland/buildroot-mkids/output/build/buildroot-fs/tar/target;
find -print0 | LC_ALL=C sort -z | tar 
--pax-option=exthdr.name=%%d/PaxHeaders/%%f,atime:=0,ctime:=0 -cf
/home/gsmecher/winterland/buildroot-mkids/output/images/rootfs.tar --null
--xattrs-include='\''*'\'' --no-recursion -T - --numeric-owner)\n' >>
/home/gsmecher/winterland/buildroot-mkids/output/build/buildroot-fs/tar/fakeroot
chmod a+x
/home/gsmecher/winterland/buildroot-mkids/output/build/buildroot-fs/tar/fakeroot
PATH="/home/gsmecher/winterland/buildroot-mkids/output/host/bin:/home/gsmecher/winterland/buildroot-mkids/output/host/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"
FAKEROOTDONTTRYCHOWN=1
/home/gsmecher/winterland/buildroot-mkids/output/host/bin/fakeroot --
/home/gsmecher/winterland/buildroot-mkids/output/build/buildroot-fs/tar/fakeroot
rootdir=/home/gsmecher/winterland/buildroot-mkids/output/build/buildroot-fs/tar/target
table='/home/gsmecher/winterland/buildroot-mkids/output/build/buildroot-fs/full_devices_table.txt'
rm: refusing to remove '.' or '..' directory: skipping
'/home/gsmecher/winterland/buildroot-mkids/output/build/buildroot-fs/tar/target/run/..'
rm: refusing to remove '.' or '..' directory: skipping
'/home/gsmecher/winterland/buildroot-mkids/output/build/buildroot-fs/tar/target/tmp/..'
make: *** [fs/tar/tar.mk:37:
/home/gsmecher/winterland/buildroot-mkids/output/images/rootfs.tar] Error 1

My /bin/sh is symlinked to /bin/dash:

$ ls -ls /bin/sh
0 lrwxrwxrwx 1 root root 4 Mar  7 16:32 /bin/sh -> dash

When I change fs/common.mk to produce a shebang line using /bin/bash instead,
the build completes as expected.

This is most likely a bash-ism in the fakeroot script - it is conceivably also
possibly a dash limitation. In any case, the most plausible fixes are either

- for me to insist on /bin/bash for /bin/sh, which fixes the problem here and
does not require buildroot alterations, or
- for buildroot to use /bin/bash instead of /bin/sh, which fixes the problem
for anyone else who bumps into it.

I am happy with either but thought a bug report was polite.

thanks,
Graeme

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
