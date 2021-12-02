Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B42C433F5
	for <buildroot@archiver.kernel.org>; Thu,  2 Dec 2021 06:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08143607DC;
	Thu,  2 Dec 2021 06:55:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lzet8MeMd8Js; Thu,  2 Dec 2021 06:55:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7131C607B9;
	Thu,  2 Dec 2021 06:55:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 845621BF340
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 06:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7421A81B01
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 06:55:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l1H_UjmI__IX for <buildroot@lists.busybox.net>;
 Thu,  2 Dec 2021 06:55:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C738B81971
 for <buildroot@uclibc.org>; Thu,  2 Dec 2021 06:55:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id A28138DBDD; Thu,  2 Dec 2021 06:51:07 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Thu, 02 Dec 2021 06:55:54 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2021.08.2
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: info@arachnodroid.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-14416-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14416] New: Mesa3D missing DRI3 support for
 various Gallium drivers
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

https://bugs.busybox.net/show_bug.cgi?id=14416

            Bug ID: 14416
           Summary: Mesa3D missing DRI3 support for various Gallium
                    drivers
           Product: buildroot
           Version: 2021.08.2
          Hardware: Other
                OS: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: info@arachnodroid.de
                CC: buildroot@uclibc.org
  Target Milestone: ---

Hi!

I've found https://bugs.busybox.net/show_bug.cgi?id=13831 and can confirm that
Mesa3D is not working on my Raspberry Pi 4. It turns out, that the logic in
mesa3d.mk seems to be broken, as it doesn't enable DRI3 support, though it's
required for V3D/VC4. Otherwise glxgears doesn't work and complains with a

Failed to open bo 1: Permission denied.

Below you will find a patch to enable DRI3 support if one of the Gallium
drivers is selected which requires DRI3 support.

Best regards,
Michael

--- snip ---

--- a/mesa3d.mk 2021-12-02 07:08:41.432624186 +0100
+++ b/mesa3d.mk 2021-12-02 07:24:06.889889427 +0100
@@ -120,7 +120,11 @@
        -Dgallium-extra-hud=true
 endif

-ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
+ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER) \
+       $(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D) \
+       $(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4) \
+       $(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA) \
+       $(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST),)
 MESA3D_CONF_OPTS += \
        -Ddri-drivers= -Ddri3=disabled
 else


--- snip ---

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
