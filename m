Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5190FCAC592
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 12:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 241D580E54;
	Fri, 19 Sep 2025 12:54:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1cGmsOeKt5WG; Fri, 19 Sep 2025 12:54:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DD1680E4A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DD1680E4A;
	Fri, 19 Sep 2025 12:54:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E9B461290
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DBD3C40E36
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:54:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wBzPMV8PzuuE for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 12:54:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B1F140A6F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B1F140A6F
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:54:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 28CE085FD8; Fri, 19 Sep 2025 12:54:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Sep 2025 10:31:30 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: d142844ce38aa8f009fabe4b6e262ab49cda7da7
X-Git-Newrev: 5ebf95bfa3c3d5d05dfa5e31545fcd0609041277
X-Patchwork-Hint: ignore
Message-Id: <20250919125411.28CE085FD8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/llvm-project/lld:
 fix broken symlink in SDK
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5ebf95bfa3c3d5d05dfa5e31545fcd0609041277
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

The symlink bin/lld -> $(GNU_TARGET_NAME)/bin/lld is broken inside a
SDK containing host-lld package. The symlink still points to the
location of lld inside the build's host folder instead of the location
of lld inside the SDK. In consequence GCC is not able to find lld
linker. Changing the symlink to be relative during host-lld
installation fixes the problem.

Signed-off-by: Victor Krawiec <victor.krawiec@arturia.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit 289dd6bd7641d98b1a7edd84a707474873cd17a5)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/llvm-project/lld/lld.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/llvm-project/lld/lld.mk b/package/llvm-project/lld/lld.mk
index c9a2d3796b..e7233e74ae 100644
--- a/package/llvm-project/lld/lld.mk
+++ b/package/llvm-project/lld/lld.mk
@@ -20,8 +20,8 @@ HOST_LLD_CONF_OPTS += -DLLVM_COMMON_CMAKE_UTILS=$(HOST_DIR)/lib/cmake/llvm
 # GCC looks for tools in a different path from LLD's default installation path
 define HOST_LLD_CREATE_SYMLINKS
 	mkdir -p $(HOST_DIR)/$(GNU_TARGET_NAME)/bin
-	ln -sf $(HOST_DIR)/bin/lld $(HOST_DIR)/$(GNU_TARGET_NAME)/bin/lld
-	ln -sf $(HOST_DIR)/bin/lld $(HOST_DIR)/$(GNU_TARGET_NAME)/bin/ld.lld
+	ln -sfr $(HOST_DIR)/bin/lld $(HOST_DIR)/$(GNU_TARGET_NAME)/bin/lld
+	ln -sfr $(HOST_DIR)/bin/lld $(HOST_DIR)/$(GNU_TARGET_NAME)/bin/ld.lld
 endef
 
 HOST_LLD_POST_INSTALL_HOOKS += HOST_LLD_CREATE_SYMLINKS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
