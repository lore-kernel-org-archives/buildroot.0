Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 471E4C28B30
	for <buildroot@archiver.kernel.org>; Thu, 20 Mar 2025 21:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7548838AF;
	Thu, 20 Mar 2025 21:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id piuE2sEdYftA; Thu, 20 Mar 2025 21:46:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29D05838B3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29D05838B3;
	Thu, 20 Mar 2025 21:46:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D42501A4
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 21:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C5C7740758
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 21:46:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9FxlVu3-Eb3o for <buildroot@buildroot.org>;
 Thu, 20 Mar 2025 21:46:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10473406F6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10473406F6
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 21:46:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EDEAE881E9; Thu, 20 Mar 2025 21:46:41 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 20 Mar 2025 22:44:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 572197f6d9cc079d73c57da91381191671ed8564
X-Git-Newrev: 4d7292675af34fa0807c78089a5ea6b3e7b897eb
X-Patchwork-Hint: ignore
Message-Id: <20250320214641.EDEAE881E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-tools: perf: Fix
 _BIN_ARCH_EXCLUDE
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

commit: https://git.buildroot.net/buildroot/commit/?id=4d7292675af34fa0807c78089a5ea6b3e7b897eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

support/scripts/check-bin-arch has an option -i to exclude a path
(or many paths by using -i multiple times).

This was implemented in commit 01d90f0d093f ("spport/check-bin-arch:
accept arbitrary per-package ignore paths").

Looking at this feature (which hasn't changed since being added),
we can see that check-bin-arch automatically adds a trailing slash
to all entries specified using -i.

Thus, specifying a path to a file, e.g.
"/usr/libexec/perf-core/tests/pe-file.exe" will cause check-bin-arch
to add "/usr/libexec/perf-core/tests/pe-file.exe/" to the IGNORES array.

When running the main loop, the file
"/usr/libexec/perf-core/tests/pe-file.exe" will thus not be ignored,
since it will not trigger a match the pattern that was added to the
IGNORES array ("/usr/libexec/perf-core/tests/pe-file.exe/").

This means that the -i option in check-bin-arch only supports directories
and not files.

Fix the LINUX_TOOLS_BIN_ARCH_EXCLUDE in
package/linux-tools/linux-tool-perf.mk.in to specify a directory, as the
existing LINUX_TOOLS_BIN_ARCH_EXCLUDE can never have actually worked.

Fixes: a7ad7816262d ("package/linux-tools: Exclude checking PE binaries from perf test")
Signed-off-by: Niklas Cassel <cassel@kernel.org>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/linux-tools/linux-tool-perf.mk.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index df3030439e..d67318571a 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -180,8 +180,7 @@ define PERF_INSTALL_REMOVE_SCRIPTS
 endef
 
 LINUX_TOOLS_BIN_ARCH_EXCLUDE += \
-	/usr/libexec/perf-core/tests/pe-file.exe \
-	/usr/libexec/perf-core/tests/pe-file.exe.debug
+	/usr/libexec/perf-core/tests/
 endif
 
 define PERF_INSTALL_TARGET_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
