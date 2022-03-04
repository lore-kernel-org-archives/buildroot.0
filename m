Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17683C433EF
	for <buildroot@archiver.kernel.org>; Fri,  4 Mar 2022 23:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E2CE402F7;
	Fri,  4 Mar 2022 23:28:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4JHa6BHgpLKo; Fri,  4 Mar 2022 23:28:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82E0140168;
	Fri,  4 Mar 2022 23:28:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C5A4B1BF276
 for <buildroot@lists.busybox.net>; Fri,  4 Mar 2022 23:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4360841EE
 for <buildroot@lists.busybox.net>; Fri,  4 Mar 2022 23:28:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r-kRQBnVNcUm for <buildroot@lists.busybox.net>;
 Fri,  4 Mar 2022 23:28:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C162841E7
 for <buildroot@uclibc.org>; Fri,  4 Mar 2022 23:28:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id D58C18347B; Fri,  4 Mar 2022 23:19:57 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Fri, 04 Mar 2022 23:28:14 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2021.02.10
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jcowgill+busybox@jcowgill.uk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-14636-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14636] New: azure-iot-sdk-c: Installed headers do
 not compile
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

https://bugs.busybox.net/show_bug.cgi?id=14636

            Bug ID: 14636
           Summary: azure-iot-sdk-c: Installed headers do not compile
           Product: buildroot
           Version: 2021.02.10
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: jcowgill+busybox@jcowgill.uk
                CC: buildroot@uclibc.org
  Target Milestone: ---

After building azure-iot-sdk-c...

test.c contains:
#include <iothub_client.h>

Running this:
$ output/host/bin/aarch64-none-linux-gnu-gcc -c test.c

Gives:
In file included from test.c:1:
.../output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/iothub_client.h:22:10:
fatal error: umock_c/umock_c_prod.h: No such file or directory
   22 | #include "umock_c/umock_c_prod.h"
      |          ^~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.

Most of the headers seem to depend on umock_c which isn't installed.

$ find output/staging/usr/include -name umock_c
$

This bug pretty much makes the package unusable.

----

It's only slightly related, but I also wonder why the headers are installed
directly into "/usr/include" even though upstream installs them under
"/usr/include/azureiot".

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
