Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16629C369A9
	for <buildroot@archiver.kernel.org>; Fri, 11 Apr 2025 10:44:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B570E60BEA;
	Fri, 11 Apr 2025 10:44:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R2P5Eixzm4_Q; Fri, 11 Apr 2025 10:44:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EB0E61B32
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EB0E61B32;
	Fri, 11 Apr 2025 10:44:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E07D01BA
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 10:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCDE46F641
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 10:44:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CExZh5bVe7jQ for <buildroot@buildroot.org>;
 Fri, 11 Apr 2025 10:44:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BBAA60C2E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3BBAA60C2E
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 10:44:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 38D738439F; Fri, 11 Apr 2025 10:44:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 11 Apr 2025 12:42:23 +0200
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: fee4b78429c8181b29393cd3fea381723d7b5b01
X-Git-Newrev: 8cb5263d3802da6cd22eb384ed6b0bb4bff7f103
X-Patchwork-Hint: ignore
Message-Id: <20250411104450.38D738439F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/linux-tools:
 perf: Fix _BIN_ARCH_EXCLUDE
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8cb5263d3802da6cd22eb384ed6b0bb4bff7f103
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

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
(cherry picked from commit 4d7292675af34fa0807c78089a5ea6b3e7b897eb)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
