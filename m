Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C068CC433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Jul 2022 21:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5605040B1D;
	Mon, 18 Jul 2022 21:43:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5605040B1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LHDouDwKrQlM; Mon, 18 Jul 2022 21:43:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5DEA54063C;
	Mon, 18 Jul 2022 21:43:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DEA54063C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 59BA11BF3C1
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 21:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 41B7E60F6B
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 21:43:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41B7E60F6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oYaQ93lx9z_e for <buildroot@lists.busybox.net>;
 Mon, 18 Jul 2022 21:43:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8338F60F2B
 for <buildroot@uclibc.org>; Mon, 18 Jul 2022 21:43:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8338F60F2B
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 386058192F; Mon, 18 Jul 2022 21:29:44 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Mon, 18 Jul 2022 21:43:10 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2022.02.3
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: thomas.petazzoni@bootlin.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: 2022.02
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-14916-163-qp3mLkzsUX@https.bugs.busybox.net/>
In-Reply-To: <bug-14916-163@https.bugs.busybox.net/>
References: <bug-14916-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14916] build buildroot with glibc and linux kernel
 5.4, start with qemu will cause error: "FATAL: kernel too old"
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

https://bugs.busybox.net/show_bug.cgi?id=14916

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@bootlin.com> ---
Thanks for the bug report. I am surprised we never realized this before.

Isn't the solution as simple as:

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index f3a08fbf24..6c54d044a5 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -99,7 +99,7 @@ GLIBC_MAKE = $(BR2_MAKE)
 GLIBC_CONF_ENV += ac_cv_prog_MAKE="$(BR2_MAKE)"

 ifeq ($(BR2_PACKAGE_GLIBC_KERNEL_COMPAT),)
-GLIBC_CONF_OPTS += --enable-kernel=$(call
qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST))
+GLIBC_CONF_OPTS += --enable-kernel=$(call
qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)).0
 endif

 # Even though we use the autotools-package infrastructure, we have to

Indeed, $(BR2_TOOLCHAIN_HEADERS_AT_LEAST) never includes the minor version as
far as I can see. Yann, any opinion?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
