Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA96C5478C
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 15:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80E7D416AB;
	Wed, 28 Feb 2024 15:46:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xi-x48RDGZHS; Wed, 28 Feb 2024 15:46:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AB9C416CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AB9C416CC;
	Wed, 28 Feb 2024 15:46:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3139E1BF3D5
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 15:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E83C822F4
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 15:46:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ahMaqw_KqUd2 for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 15:46:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=bugzilla@busybox.net;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CC7B82100
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3CC7B82100
 for <buildroot@uclibc.org>; Wed, 28 Feb 2024 15:46:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 2E4CD87ACC; Wed, 28 Feb 2024 15:46:21 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Wed, 28 Feb 2024 15:46:20 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2023.11
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: minor
X-Bugzilla-Who: laurentbadel@eaton.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-15961-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15961] New: empty file statistic on partial build
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

https://bugs.busybox.net/show_bug.cgi?id=15961

            Bug ID: 15961
           Summary: empty file statistic on partial build
           Product: buildroot
           Version: 2023.11
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: laurentbadel@eaton.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

There seems to be a problem with the package statistics in pkg-generic.mk. 
As I understand the files-lists* files are used to track which files were
installed in which directories during the installations steps. 
I have found this quite helpful to keep track version numbers of packages in my
final rootfs, for example, but it seems that this functionality is now partly
broken and produces only empty files in case of a partial build. 

Looking at pkg-generic.mk, the logic seems to be that we collect lists of files
after the configuration step, and store these lists in files-list*.before.
Then, at the end of the installation step, we generate new lists of files in
files-list*.after, which we compare with the .before files generated earlier,
and extract the entries that are present only in the .after file.

The problem is that this does not work when using -rebuild or -reinstall
targets, because (i) the .before files are deleted after the first
installation, and (ii) the contents of the .before file might not be up-to-date
anyway since other stuff may have been installed in-between.

It seems to me that moving the calls to pkg_size_before into the
.stamp_*_installed targets themselves would solve the problem. In this way, the
state of the directories just before, and just after, the package installation,
will be compared, producing the expected results.

I have tested this with the below patch, and the results were as I expected. I
would gladly submit it directly, but I am unsure if my understanding of the
purpose and contents of these files is correct, and I'd rather not spam the
entire list with nonsense.

I am using the 2023.11 tag but I don't see any recent patch indicating that
this might have been fixed. 

Thank you very much in advance,

Laurent 

From 99421a92a8dce34385c4ec3d51ee4a1c54327a54 Mon Sep 17 00:00:00 2001
From: Laurent Badel <laurentbadel@eaton.com>
Date: Wed, 28 Feb 2024 15:39:29 +0000
Subject: [PATCH] package/pkg-generic: fix file statistics for partial builds

Signed-off-by: Laurent Badel <laurentbadel@eaton.com>
---
 package/pkg-generic.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 577a148c..db5cc81a 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -265,10 +265,6 @@ $(BUILD_DIR)/%/.stamp_configured:
        $(Q)mkdir -p $(HOST_DIR) $(TARGET_DIR) $(STAGING_DIR) $(BINARIES_DIR)
        $(call prepare-per-package-directory,$($(PKG)_FINAL_DEPENDENCIES))
        $(foreach hook,$($(PKG)_POST_PREPARE_HOOKS),$(call $(hook))$(sep))
-       @$(call pkg_size_before,$(TARGET_DIR))
-       @$(call pkg_size_before,$(STAGING_DIR),-staging)
-       @$(call pkg_size_before,$(BINARIES_DIR),-images)
-       @$(call pkg_size_before,$(HOST_DIR),-host)
        $(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
        $($(PKG)_CONFIGURE_CMDS)
        $(foreach hook,$($(PKG)_POST_CONFIGURE_HOOKS),$(call $(hook))$(sep))
@@ -289,6 +285,7 @@ $(BUILD_DIR)/%/.stamp_built::
 $(BUILD_DIR)/%/.stamp_host_installed:
        @$(call step_start,install-host)
        @$(call MESSAGE,"Installing to host directory")
+       @$(call pkg_size_before,$(TARGET_DIR))
        $(foreach hook,$($(PKG)_PRE_INSTALL_HOOKS),$(call $(hook))$(sep))
        +$($(PKG)_INSTALL_CMDS)
        $(foreach hook,$($(PKG)_POST_INSTALL_HOOKS),$(call $(hook))$(sep))
@@ -318,6 +315,7 @@ $(BUILD_DIR)/%/.stamp_host_installed:
 $(BUILD_DIR)/%/.stamp_staging_installed:
        @$(call step_start,install-staging)
        @$(call MESSAGE,"Installing to staging directory")
+       @$(call pkg_size_before,$(TARGET_DIR))
        $(foreach hook,$($(PKG)_PRE_INSTALL_STAGING_HOOKS),$(call
$(hook))$(sep))
        +$($(PKG)_INSTALL_STAGING_CMDS)
        $(foreach hook,$($(PKG)_POST_INSTALL_STAGING_HOOKS),$(call
$(hook))$(sep))
@@ -360,6 +358,7 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
 $(BUILD_DIR)/%/.stamp_images_installed:
        @$(call step_start,install-image)
        @$(call MESSAGE,"Installing to images directory")
+       @$(call pkg_size_before,$(BINARIES_DIR),-images)
        $(foreach hook,$($(PKG)_PRE_INSTALL_IMAGES_HOOKS),$(call
$(hook))$(sep))
        +$($(PKG)_INSTALL_IMAGES_CMDS)
        $(foreach hook,$($(PKG)_POST_INSTALL_IMAGES_HOOKS),$(call
$(hook))$(sep))
@@ -370,6 +369,7 @@ $(BUILD_DIR)/%/.stamp_images_installed:
 $(BUILD_DIR)/%/.stamp_target_installed:
        @$(call step_start,install-target)
        @$(call MESSAGE,"Installing to target")
+       @$(call pkg_size_before,$(TARGET_DIR))
        $(foreach hook,$($(PKG)_PRE_INSTALL_TARGET_HOOKS),$(call
$(hook))$(sep))
        +$($(PKG)_INSTALL_TARGET_CMDS)
        $(if $(BR2_INIT_SYSTEMD),\
-- 
2.17.1

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
