Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33845C52D7C
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 19:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F02088448C;
	Fri,  9 Aug 2024 19:38:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TTsvFMqwsXwb; Fri,  9 Aug 2024 19:38:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F35498448F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F35498448F;
	Fri,  9 Aug 2024 19:38:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C9E721BF2F5
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 19:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B83B58448F
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 19:38:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W-CA0784NtPZ for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 19:38:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E44808448C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E44808448C
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 19:38:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CDE4684E62; Fri,  9 Aug 2024 19:38:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 9 Aug 2024 21:33:38 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: ab1facc33a5f0f29e1854de4066a8c1e6677454f
X-Git-Newrev: da7a5e4ae1e1ff7b4ed784a3d5ba9b5d584fea4f
X-Patchwork-Hint: ignore
Message-Id: <20240809193822.CDE4684E62@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/boost:
 Boost.Atomic needs atomic intrinsics
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

commit: https://git.buildroot.net/buildroot/commit/?id=da7a5e4ae1e1ff7b4ed784a3d5ba9b5d584fea4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

similar to previous problems with nios2 and not-available atomic ints
the build for Boost.Atomics also fails for ARC Targets which don't
have the ATOMICS_EXT flag set.

according to [0] "Boost.Atomic has a hard requirement of the native
atomic operations on bytes". The same tests mentioned there fail for
ARC without the atomic extension.

Disable BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS for BR2_arc
without BR2_ARC_ATOMIC_EXT.

Fixes:
  http://autobuild.buildroot.net/results/4ca54a85672d7b9328b1909b457e548c6032a493

[0] https://github.com/boostorg/atomic/issues/42#issuecomment-734130348

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
[Arnout: add to BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
         instead of updating all packages]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit ad71b415c1bdf1bbf4c37b04c772dc3104187b58)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 0e142d66a6..bd4f80bda4 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -100,6 +100,7 @@ config BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_ARM_CPU_ARMV5
 	depends on !BR2_sparc_v8
 	depends on !BR2_m68k_cf5208
+	depends on !(BR2_arc && !BR2_ARC_ATOMIC_EXT)
 
 # GCC uses thunk functions to adjust the 'this' pointer when calling
 # C++ member functions in classes derived with multiple inheritance.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
