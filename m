Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A76FC433EF
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 14:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 724EB40FEA;
	Thu,  9 Jun 2022 14:59:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qGU66UsWu5iP; Thu,  9 Jun 2022 14:59:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A91D040FF6;
	Thu,  9 Jun 2022 14:59:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C778B1BF2B7
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 14:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4D2B83F74
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 14:59:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vq_oFLLIj-z6 for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 14:59:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2486183F6B
 for <buildroot@uclibc.org>; Thu,  9 Jun 2022 14:59:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id DFE7086E95; Thu,  9 Jun 2022 14:47:06 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Thu, 09 Jun 2022 14:59:02 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2022.02
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: fesc2000@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-14366-163-sRYouCaOS2@https.bugs.busybox.net/>
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

--- Comment #10 from Felix Schmidt <fesc2000@mailbox.org> ---
(In reply to Frank Rogall from comment #9)
I'm having a similar issue, with host=x86_64 and target=i686 (32bit).

Here this patch does not work. This is my workaround:

--- buildroot/package/nodejs/v8-qemu-wrapper.in.orig
+++ buildroot/package/nodejs/v8-qemu-wrapper.in
@@ -5,5 +5,6 @@
 exec @QEMU_USER@ -r @TOOLCHAIN_HEADERS_VERSION@ \
     @QEMU_USERMODE_ARGS@ \
    -L "${STAGING_DIR}/" \
+   -E LD_LIBRARY_PATH="${STAGING_DIR}/lib:${STAGING_DIR}/usr/lib/" \
     "$@"

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
