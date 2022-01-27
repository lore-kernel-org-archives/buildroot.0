Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A43CC433F5
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 23:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 712C260BBC;
	Thu, 27 Jan 2022 23:22:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4KyN_ipBzokZ; Thu, 27 Jan 2022 23:22:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B663560B97;
	Thu, 27 Jan 2022 23:22:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6B4071BF352
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 23:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 574C94019A
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 23:22:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gDTUXs_0EKUH for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 23:22:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64490400E5
 for <buildroot@uclibc.org>; Thu, 27 Jan 2022 23:22:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 95C3381EBF; Thu, 27 Jan 2022 23:15:14 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Thu, 27 Jan 2022 23:22:09 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: emile.cormier.jr@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-14556-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14556] New: python-crossbar fails to build
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

https://bugs.busybox.net/show_bug.cgi?id=14556

            Bug ID: 14556
           Summary: python-crossbar fails to build
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: emile.cormier.jr@gmail.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

The buildroot crossbar package does not work in the latest release/head of
buildroot. After two days of playing dependency whac-a-mole, I've been able to
make it work again with the following steps:

1. Remove the package-crossbar/0002-Remove-idna-requirement.patch and replace
it with another patch which does the following:

- Change the idna requirement to >=2.5,<4 to match that of the Requests v2.27.1
package included with the latest buildroot. The idna v3.3 package is the one
currently bundled with buildroot.

- Change the urllib3 requirement to >=1.21.1,<1.27 to match that of the
Requests v2.27.1 package included with the latest buildroot. The urllib3
v1.26.8 package is the one currently bundled with buildroot.

- Remove the importlib-resources>=4.1.1 requirement. The importlib-resources
5.0 features have been merged into the CPython 3.10 included with the latest
buildroot.

2. Generate a new python-zlmdb package via utility/scanpypi. scanpypi fails
before terminating, but it generates a viable python-zlmdb package nonetheless.

3. Add a patch for the new python-zlmdb package which removes pytest-runner
from the setup-requirements in setup.py.

4. Bump buildroot's python-pyopenssl version to 21.0.0.

5. Bump buildroot's python-snappy version to 0.6.0.

6. Bump buildroot's python-trek version to 21.5.0.

7. Add these missing dependencies in python-crossbar/Config.in: bcrypt, cffi,
colorama, wsaccel, zlmdb, argon_cffi, cbor2, flatbuffers, msgpack, snappy,
ujson

I will submit a patch with the above changes, but I first need some time to
familiarize myself with your submission conventions.

(Cross-posted to https://github.com/crossbario/crossbar/issues/1936)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
