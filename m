Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E46C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 22:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4187F432A7;
	Wed,  1 Nov 2023 22:01:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4187F432A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bEjVLrTUPRMa; Wed,  1 Nov 2023 22:01:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA7CA432BA;
	Wed,  1 Nov 2023 22:01:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA7CA432BA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7E0D11BF44A
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 22:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55F704EE70
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 22:01:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55F704EE70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4WBXJwwdXEmI for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 22:01:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 928FA4EE64
 for <buildroot@uclibc.org>; Wed,  1 Nov 2023 22:01:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 928FA4EE64
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 7C83D864D1; Wed,  1 Nov 2023 22:01:07 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Wed, 01 Nov 2023 22:01:07 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jonas.d.karlsson@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-15838-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15838] New: dhcp server creates symlinks to /tmp
 on host
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

https://bugs.busybox.net/show_bug.cgi?id=15838

            Bug ID: 15838
           Summary: dhcp server creates symlinks to /tmp on host
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: jonas.d.karlsson@gmail.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

In package/dhcp/dhcp.mk this section can be found:

ifeq ($(BR2_PACKAGE_DHCP_SERVER),y)    
define DHCP_INSTALL_CTL_LIBS    
        $(MAKE) -C $(@D)/dhcpctl install-exec DESTDIR=$(TARGET_DIR)    
endef    
define DHCP_INSTALL_SERVER    
        mkdir -p $(TARGET_DIR)/var/lib    
        (cd $(TARGET_DIR)/var/lib; ln -snf /tmp dhcp)    
        $(MAKE) -C $(@D)/server DESTDIR=$(TARGET_DIR) install-sbinPROGRAMS    
        $(INSTALL) -m 0644 -D package/dhcp/dhcpd.conf \    
                $(TARGET_DIR)/etc/dhcp/dhcpd.conf    
endef    
endif

The symlink that is created from /var/lib/dhcp to /tmp seem to cause a symlink
to the host /tmp which creates access privilege problems.

Shouldn't the symlink be to ../../tmp rather than /tmp like the misc symlink
under /var/lib? See below 

cd output/target/var/lib

ls -al

drwxr-xr-x 2 jonkar jonkar 4096 nov  1 17:09 arpd
lrwxrwxrwx 1 jonkar jonkar    4 nov  1 18:27 dhcp -> /tmp
lrwxrwxrwx 1 jonkar jonkar    9 nov  1 16:13 misc -> ../../tmp

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
