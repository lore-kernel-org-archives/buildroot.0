Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D42C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 10:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F50B610DF;
	Wed,  9 Mar 2022 10:23:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zk-rMn_4sGFK; Wed,  9 Mar 2022 10:23:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94E39610B5;
	Wed,  9 Mar 2022 10:23:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 259431BF576
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 10:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 134C7610B5
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 10:23:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id skokloNsy5eN for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 10:23:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F35E61042
 for <buildroot@uclibc.org>; Wed,  9 Mar 2022 10:23:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 1DBB48380C; Wed,  9 Mar 2022 10:14:33 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Wed, 09 Mar 2022 10:22:59 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dopsi@dopsi.ch
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-14656-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14656] New: Adding dependencies from an external
 tree does not work
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

https://bugs.busybox.net/show_bug.cgi?id=14656

            Bug ID: 14656
           Summary: Adding dependencies from an external tree does not
                    work
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: dopsi@dopsi.ch
                CC: buildroot@uclibc.org
  Target Milestone: ---

When a dependency is added by a Makefile in an external tree to a package
present in the Buildroot tree, the dependency does not get built before the
package.

Detailled description:

When having the following in an external tree:

    FOO_DEPENDENCIES += bar

FOO_FINAL_ALL_DEPENDENCIES gets updated and will contain bar (as shown by
running make foo-show-depends) but this will not be reflected in the build
order (as shown in make foo-show-build-order).

In the package/pkg-generic.mk file [1] there is a call to patsubst that will
compute the prerequisites for foo-show-build-order.

When printing the output of pathsubst with

    echo $$(patsubst %,%-show-build-order,$$($(2)_FINAL_ALL_DEPENDENCIES))

the value is properly written out and will contain bar. However, the
prerequisite is not present when printing them out with

    echo $$^

[1] https://git.buildroot.org/buildroot/tree/package/pkg-generic.mk#n996

Links:
- first mailing list post:
https://lists.buildroot.org/pipermail/buildroot/2022-February/637237.html
- second mailing list post:
https://lists.buildroot.org/pipermail/buildroot/2022-March/638117.html
- minimal example: https://gitlab.com/dopsi/mve-br2-external-dep

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
