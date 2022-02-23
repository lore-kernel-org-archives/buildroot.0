Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C600C433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 08:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28C2E8249E;
	Wed, 23 Feb 2022 08:20:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UkIcDgQ8PV2F; Wed, 23 Feb 2022 08:20:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60A9782451;
	Wed, 23 Feb 2022 08:20:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C0EE81BF263
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 08:20:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AEE8360F1D
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 08:20:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BQfmgDdXmxJ6 for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 08:20:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFCB160F01
 for <buildroot@uclibc.org>; Wed, 23 Feb 2022 08:20:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 5E1D182A96; Wed, 23 Feb 2022 08:12:12 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Wed, 23 Feb 2022 08:20:07 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2021.11.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: mail@jens-maus.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-14366-163-zTiO0GJ8cx@https.bugs.busybox.net/>
In-Reply-To: <bug-14366-163@https.bugs.busybox.net/>
References: <bug-14366-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14366] Nodejs fails with "version `GLIBC_2.34' not
 found" on Ubuntu 20.04
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

https://bugs.busybox.net/show_bug.cgi?id=14366

--- Comment #4 from Jens Maus <mail@jens-maus.de> ---
I just checked the latest 2022.02-rc2 version and there the issue with not
being able to compile nodejs v14+ on an ubuntu host still exists as outlined
here.

However, taking the workaround mentioned in
https://gitlab.com/qemu-project/qemu/-/issues/857 I could workout a patch that
seems to fix the issue:

--- buildroot/package/nodejs/v8-qemu-wrapper.in.orig
+++ buildroot/package/nodejs/v8-qemu-wrapper.in
@@ -5,5 +5,6 @@
 exec @QEMU_USER@ -r @TOOLCHAIN_HEADERS_VERSION@ \
     @QEMU_USERMODE_ARGS@ \
    -L "${STAGING_DIR}/" \
+   -E LD_LIBRARY_PATH="/lib/" \
     "$@"


With this patch nodejs v14+ seems to compile fine on an ubuntu 20.04 LTS host.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
