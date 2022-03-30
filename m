Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8875DC433F5
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 00:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F41A40C5C;
	Wed, 30 Mar 2022 00:40:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R_Fkle7p7zSs; Wed, 30 Mar 2022 00:40:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D6C440C59;
	Wed, 30 Mar 2022 00:40:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D1541BF9C6
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 00:40:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F1BB41835
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 00:40:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FI-ECi7ZSsDU for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 00:40:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DFDC4176D
 for <buildroot@uclibc.org>; Wed, 30 Mar 2022 00:40:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 4BAB78461D; Wed, 30 Mar 2022 00:30:46 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Wed, 30 Mar 2022 00:39:59 +0000
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
 target_milestone attachments.created
Message-ID: <bug-14721-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14721] New: python-argon2_cffi no longer works
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

https://bugs.busybox.net/show_bug.cgi?id=14721

            Bug ID: 14721
           Summary: python-argon2_cffi no longer works
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

Created attachment 9256
  --> https://bugs.busybox.net/attachment.cgi?id=9256&action=edit
Snippet of the build log concerning argon2-cffi and argon2-cffi-bindings

Commit
https://github.com/buildroot/buildroot/commit/e2957f5ce743cfaf4fb3aaa98d619e83e8e6989e
breaks the argon2-cffi Python package for my ARM target (Beaglebone Black).

The installation of the argon2-cffi Python package somehow got broken with the
version bump. Just before that commit, I get (via serial terminal):

# python -c 'help("modules")' | grep argon2
__future__          argon2              gzip                selectors

# python -c 'from argon2 import PasswordHasher;
print(PasswordHasher().hash("cor
rect horse battery staple"));'
$argon2id$v=19$m=102400,t=2,p=8$qHc/evoNvfGlp98pE26Ayw$tZWcHYjxFTKDUoaSysapPA

And just after that commit, I get:
# python -c 'help("modules")' | grep argon2
_argon2_cffi_bindings ast                 hmac                shutil

Traceback (most recent call last):
  File "<string>", line 1, in <module>
ModuleNotFoundError: No module named 'argon2'

argon2-cffi is the only Python package I have enabled via menu xconfig for this
test.

I've attached a snippet of the build log concerning argon2-cffi and
argon2-cffi-bindings.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
