Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 390E7C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 13:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22B0940103;
	Sat,  8 Jan 2022 13:49:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7ov1TyFLCFzl; Sat,  8 Jan 2022 13:49:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C0C8403B8;
	Sat,  8 Jan 2022 13:49:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D12991BF301
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 13:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD8808175B
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 13:49:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6j_Y7Yae7uuT for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 13:49:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2F4A813C1
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 13:49:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 8972182BC6; Sat,  8 Jan 2022 13:43:19 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 14:48:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cd84e1bcf9f116ccff2092124d56c1203d831a42
X-Git-Newrev: 409e30a70fc28e05a11c903dc7918eee92e424d1
X-Patchwork-Hint: ignore
Message-Id: <20220108134319.8972182BC6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/toolchain-wrapper: reproducible
 builds: handle debug info paths in GCC <7
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

commit: https://git.buildroot.net/buildroot/commit/?id=409e30a70fc28e05a11c903dc7918eee92e424d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In GCC8 the flag -ffile-prefix-map handles cleaning up both the __FILE__
macros and the debug info paths. In GCC7 or below we are manually
handling the __FILE__ macros, but not debug info paths. Use
-fdebug-prefix-map to clean them up. This option exists since GCC 4.3.0,
which is our minimal supported GCC version.

See for more detail: https://reproducible-builds.org/docs/build-path/

Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 toolchain/toolchain-wrapper.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index 8b551e3a18..bc8d77b892 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -26,6 +26,7 @@ TOOLCHAIN_WRAPPER_OPTS += -Wl,--build-id=none
 ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y)
 TOOLCHAIN_WRAPPER_OPTS += -ffile-prefix-map=$(BASE_DIR)=buildroot
 else
+TOOLCHAIN_WRAPPER_OPTS += -fdebug-prefix-map=$(BASE_DIR)=buildroot
 TOOLCHAIN_WRAPPER_OPTS += -D__FILE__=\"\" -D__BASE_FILE__=\"\" -Wno-builtin-macro-redefined
 endif
 ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_7),)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
