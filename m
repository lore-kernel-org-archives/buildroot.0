Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1917AC3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 09:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D80E160711;
	Sat, 13 Jul 2024 09:34:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U3JuZiWa3Vji; Sat, 13 Jul 2024 09:34:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE34D60741
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE34D60741;
	Sat, 13 Jul 2024 09:34:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1685C1BF4D6
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 09:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D24E9606C0
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 09:34:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k8bwQrZKq7lg for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 09:34:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 114B2606C6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 114B2606C6
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 09:34:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F21DF8638D; Sat, 13 Jul 2024 09:34:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 11:33:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7c0733c9be8a9f7ea54a1880896686ae7b323100
X-Git-Newrev: ad71b415c1bdf1bbf4c37b04c772dc3104187b58
X-Patchwork-Hint: ignore
Message-Id: <20240713093424.F21DF8638D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/boost: Boost.Atomic needs atomic
 intrinsics
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ad71b415c1bdf1bbf4c37b04c772dc3104187b58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 toolchain/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 1aa17cbfbd..8acdc62fc2 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -94,6 +94,7 @@ config BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
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
