Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90809C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 13:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4343760ABE;
	Sat,  8 Jan 2022 13:49:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nigHnzPjKVd9; Sat,  8 Jan 2022 13:49:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A48D60655;
	Sat,  8 Jan 2022 13:49:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A9AC01BF301
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 13:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 981FA813C1
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 13:49:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eHu71VVjYTJR for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 13:49:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7F778149C
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 13:49:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 914E882D32; Sat,  8 Jan 2022 13:43:19 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 14:48:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 409e30a70fc28e05a11c903dc7918eee92e424d1
X-Git-Newrev: 7ec9b3abd9dc8d24bc75f2b5b365ad78e2b09b8d
X-Patchwork-Hint: ignore
Message-Id: <20220108134319.914E882D32@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/toolchain-wrapper: reproducible
 builds: omit absolute paths from debug symbols
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7ec9b3abd9dc8d24bc75f2b5b365ad78e2b09b8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In GCC6 the compiler was made smarter to omit the flag
-fdebug-prefix-map from the DWARF DW_AT_producer section[1]. That flag
contains the absolute path '$(BASE_DIR)' which breaks reproducibility.
Prior to GCC6 however, the only way to omit the flag is to use
-gno-record-gcc-switches which omits all flags.

[1] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=266cc0c181549c2fb6b50f8f26213cdc89101026

Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
[Arnout: invert condition to ifeq (,) instead of ifneq (,y)]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 toolchain/toolchain-wrapper.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index bc8d77b892..cbf46f15fa 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -32,6 +32,9 @@ endif
 ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_7),)
 TOOLCHAIN_WRAPPER_OPTS += -DBR_NEED_SOURCE_DATE_EPOCH
 endif
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_6),)
+TOOLCHAIN_WRAPPER_OPTS += -gno-record-gcc-switches
+endif
 endif
 
 # Disable -ftree-loop-distribute-patterns on microblaze to
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
