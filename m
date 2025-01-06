Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21D33E77188
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 16:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB9FD80569;
	Mon,  6 Jan 2025 16:19:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1e64_a2n6a1F; Mon,  6 Jan 2025 16:19:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E615A80CEC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E615A80CEC;
	Mon,  6 Jan 2025 16:19:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 05A43DB4
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 16:19:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6BE840569
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 16:19:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GNum_UQRWPLy for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 16:19:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0699840561
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0699840561
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 16:19:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E194483B85; Mon,  6 Jan 2025 16:19:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Jan 2025 17:14:09 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: ea76f2425d5d7032140dfda7f428037bb7013c3c
X-Git-Newrev: 70f75b7ad99d0845a0ddf5ffdbdee9ff94657082
X-Patchwork-Hint: ignore
Message-Id: <20250106161925.E194483B85@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/procps-ng: add
 wchar dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=70f75b7ad99d0845a0ddf5ffdbdee9ff94657082
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Since procps-ng was bumped from 3.3.17 to 4.0.4 in commit
d79f40dbbe98983bc657d4c82d46b38b8283351b ("package/procps-ng: security
bump to version 4.0.4"), the build has been failing on !wchar
configurations with:

src/ps/output.c:68:10: fatal error: wctype.h: No such file or directory
   68 | #include <wctype.h>
      |          ^~~~~~~~~~
compilation terminated.

The problematic code has been added by upstream commit
https://gitlab.com/procps-ng/procps/-/commit/605ea4a8f7460920b6de9e432757bd13f80f0dba,
which landed in upstream release v4.0.0.

To solve this, we simply add a BR2_USE_WCHAR dependency, and update
the comment related to this dependency on the only reverse dependency
of procps-ng.

Fixes:

  http://autobuild.buildroot.net/results/afc035e866bec6f2c14f9d52fa74a9c1897706de/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f6fe892141cd4c8b6dd934df92eb1fe7d9469e0c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/procps-ng/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/procps-ng/Config.in b/package/procps-ng/Config.in
index 6ff8983202..b0d69afdc0 100644
--- a/package/procps-ng/Config.in
+++ b/package/procps-ng/Config.in
@@ -1,7 +1,13 @@
+comment "procps-ng needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	depends on !BR2_USE_WCHAR
+
 config BR2_PACKAGE_PROCPS_NG
 	bool "procps-ng"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_NCURSES
 	help
 	  Standard informational utilities and process-handling tools.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
