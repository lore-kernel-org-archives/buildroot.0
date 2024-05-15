Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3002C25B75
	for <buildroot@archiver.kernel.org>; Wed, 15 May 2024 06:22:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D2C6400F9;
	Wed, 15 May 2024 06:22:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KeuBA59q8UoH; Wed, 15 May 2024 06:22:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F23740B1F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F23740B1F;
	Wed, 15 May 2024 06:22:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9AE7B1BF59A
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 06:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 872B940B1F
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 06:22:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H4CLIIYb_1ln for <buildroot@lists.busybox.net>;
 Wed, 15 May 2024 06:22:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=bugzilla@busybox.net;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C1CF400F9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C1CF400F9
 for <buildroot@uclibc.org>; Wed, 15 May 2024 06:22:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 944778714A; Wed, 15 May 2024 06:22:13 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Wed, 15 May 2024 06:22:12 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2024.02.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mscdex@mscdex.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-16075-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 16075] New: Cannot use linux kernel extensions
 from external tree (building zfs into kernel)
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

https://bugs.busybox.net/show_bug.cgi?id=16075

            Bug ID: 16075
           Summary: Cannot use linux kernel extensions from external tree
                    (building zfs into kernel)
           Product: buildroot
           Version: 2024.02.1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: mscdex@mscdex.net
                CC: buildroot@uclibc.org
  Target Milestone: ---

I'm wanting to build zfs into the kernel, so after reading through the
documentation it seemed like the best way to go about it would be through
Buildroot's Linux kernel extension mechanism.

I already have an existing, working external tree, so according to the
documentation I added a `linux/Config.ext.in` and
`linux/linux-ext-zfs-inkernel.mk` to my external tree.

Re-running `make menuconfig` and navigating to the Linux Extensions section
shows both the built-in Buildroot extensions and my new extension. However,
after I select my extension and save the Buildroot configuration, just about
every make target except `menuconfig` fails with:

linux/linux.mk:646: *** Package 'linux' defined a second time in 'linux/';
previous definition was in '/home/foo/buildroot-external/linux/'.  Stop.
make: *** [Makefile:23: _all] Error 2

I tried explicitly adding a reference to the Config.ext.in in my external
tree's Config.in and adding a reference to the linux-ext-zfs-inkernel.mk in my
external tree's external.mk, but that did not make any difference.

For what it's worth here are the contents of the two files (there may be issues
with them as I obviously haven't been able to test them yet):

linux/Config.ext.in:
  config BR2_LINUX_KERNEL_EXT_ZFS_INKERNEL
      bool "In-kernel ZFS"
      help
        In-kernel ZFS module

linux/linux-ext-zfs-inkernel.mk:
  ZFS_INKERNEL_VERSION = 2.2.2
  ZFS_INKERNEL_SOURCE =
https://github.com/openzfs/zfs/releases/download/zfs-$(ZFS_INKERNEL_VERSION)
  ZFS_INKERNEL_INSTALL_STAGING = NO
  ZFS_INKERNEL_INSTALL_TARGET = NO
  define ZFS_INKERNEL_COPY_BUILTIN
    cd $(ZFS_INKERNEL_BUILDDIR) && ./copy-builtin $(LINUX_DIR)
  endef
  ZFS_INKERNEL_POST_CONFIGURE_HOOKS += ZFS_INKERNEL_COPY_BUILTIN
  LINUX_EXTENSIONS += zfs-inkernel
  ZFS_INKERNEL_CONF_OPTS = \
      --with-linux=$(LINUX_DIR) \
      --enable-linux-builtin
  ZFS_INKERNEL_MAKE = true
  $(eval $(autotools-package))

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
