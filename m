Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1441FC433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Dec 2021 20:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71A5E83033;
	Tue, 21 Dec 2021 20:20:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WIqjLL9p-anQ; Tue, 21 Dec 2021 20:20:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF28281865;
	Tue, 21 Dec 2021 20:20:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E62F31BF398
 for <buildroot@lists.busybox.net>; Tue, 21 Dec 2021 20:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C11E9400D9
 for <buildroot@lists.busybox.net>; Tue, 21 Dec 2021 20:20:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y4dTjsZMasWX for <buildroot@lists.busybox.net>;
 Tue, 21 Dec 2021 20:20:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFE7940017
 for <buildroot@uclibc.org>; Tue, 21 Dec 2021 20:20:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id D077982940; Tue, 21 Dec 2021 20:15:16 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Tue, 21 Dec 2021 20:20:48 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2021.11
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: htenberge@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-14471-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14471] New: alsa_utils wrong deployment
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

https://bugs.busybox.net/show_bug.cgi?id=14471

            Bug ID: 14471
           Summary: alsa_utils wrong deployment
           Product: buildroot
           Version: 2021.11
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: htenberge@gmail.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

When the alsa_utils package is deployed, it deploys the /usr/share/alsa one
level too deep.

Instead of having a /usr/share/alsa with several files and subdirectories, some
parts are being deployed in /usr/share/alsa/alsa.

I'm not entirely what the right way is to fix this, but this simple hack fixed
it:

diff --git a/package/alsa-utils/alsa-utils.mk
b/package/alsa-utils/alsa-utils.mk
index 427280c1e6..da00f07d52 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -76,8 +76,8 @@ define ALSA_UTILS_INSTALL_TARGET_CMDS
                cp -rdpf $(STAGING_DIR)/usr/share/sounds/alsa/*
$(TARGET_DIR)/usr/share/sounds/alsa/; \
        fi
        if [ -x "$(TARGET_DIR)/usr/sbin/alsactl" ]; then \
-               mkdir -p $(TARGET_DIR)/usr/share/; \
-               cp -rdpf $(STAGING_DIR)/usr/share/alsa/
$(TARGET_DIR)/usr/share/alsa/; \
+               mkdir -p $(TARGET_DIR)/usr/share/alsa; \
+               cp -rdpf $(STAGING_DIR)/usr/share/alsa/*
$(TARGET_DIR)/usr/share/alsa/; \
        fi
 endef

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
