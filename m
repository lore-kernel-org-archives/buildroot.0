Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E178C0015E
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 21:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0BE883295;
	Thu, 27 Jul 2023 21:16:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0BE883295
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nwD7e4O9x6tW; Thu, 27 Jul 2023 21:16:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E9FF81E6B;
	Thu, 27 Jul 2023 21:16:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E9FF81E6B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6C8921BF414
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 21:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46B4F404D4
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 21:16:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46B4F404D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zSq2E9cWzAQw for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 21:16:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77A2B4020B
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 21:16:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77A2B4020B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 65A1A8373A; Thu, 27 Jul 2023 21:16:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 27 Jul 2023 23:16:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 50a8d8330bf5ac9a3f7a52e83a5316bd40fe0ec9
X-Git-Newrev: 6d677931284d58ae0e8e001cfd990eafaee5cecc
X-Patchwork-Hint: ignore
Message-Id: <20230727211652.65A1A8373A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/weston: select the seatd daemon
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6d677931284d58ae0e8e001cfd990eafaee5cecc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When we updated weston to version 12.0.1 the only supported launcher
was the libseat based launcher.

For this launcher to function correctly when used with weston we also
need to enable the seatd daemon.

Fixes:
[libseat/backend/logind.c:660] Could not get primary session for user: No data available
[libseat/libseat.c:76] Backend 'logind' failed to open seat, skipping
[libseat/libseat.c:79] No backend was able to open a seat
libseat: could not open seat

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/weston/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index 22996805f6..8aabe86652 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -19,6 +19,7 @@ config BR2_PACKAGE_WESTON
 	select BR2_PACKAGE_LIBINPUT
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_SEATD
+	select BR2_PACKAGE_SEATD_DAEMON
 	# Runtime dependency
 	select BR2_PACKAGE_XKEYBOARD_CONFIG
 	select BR2_PACKAGE_WESTON_SHELL_DESKTOP if !BR2_PACKAGE_WESTON_HAS_SHELL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
