Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9CAECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 13:59:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 921744165B;
	Fri, 16 Sep 2022 13:59:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 921744165B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pyz15dQhbsFU; Fri, 16 Sep 2022 13:59:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2A404164F;
	Fri, 16 Sep 2022 13:59:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2A404164F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5D9011BF2C0
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 13:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44BBB401DB
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 13:58:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44BBB401DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FrWKUen-0imh for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 13:58:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 39B004017F
 for <buildroot@uclibc.org>; Fri, 16 Sep 2022 13:58:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39B004017F
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 2592183853; Fri, 16 Sep 2022 13:58:58 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Fri, 16 Sep 2022 13:58:57 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: david.lawson1@tx.rr.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-14996-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14996] New: Too many directories in BR2_EXTERNAL
 causes hang during make
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

https://bugs.busybox.net/show_bug.cgi?id=14996

            Bug ID: 14996
           Summary: Too many directories in BR2_EXTERNAL causes hang
                    during make
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: david.lawson1@tx.rr.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

The top level Makefile in buildroot has a recursive rule which causes the
appearance of a hang as the number of directories in BR2_EXTERNAL increases.
When the number of directories in BR2_EXTERNAL is small, the recursion occurs,
but make detects the recursion and determines the target does not have to be
remade. This allows make to progress.

This is the failing rule:

define percent_defconfig
# Override the BR2_DEFCONFIG from COMMON_CONFIG_ENV with the new defconfig
%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(1)/configs/%_defconfig
outputmakefile
        @$$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(1)/configs/$$@ \
                $$< --defconfig=$(1)/configs/$$@ $$(CONFIG_CONFIG_IN)
endef
$(eval $(foreach d,$(call reverse,$(TOPDIR) $(BR2_EXTERNAL_DIRS)),$(call
percent_defconfig,$(d))$(sep)))

The rule for %defconfig is created for each directory in BR2_EXTERNAL. When the
rule is matched, the stem is 'defconfig_name'. The second prerequisite is
expanded to $(1)/configs/defconfig_name_defconfig. The rule, and all of the
other rules defined by this macro, are invoked again, but the stem is now
$(1)/configs/defconfig_name_defconfig. The second prerequisite is now expanded
to $(1)/configs/($1)/configs/defconfig_name_defconfig. This expansion continues
until make detects the infinite recursion.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
