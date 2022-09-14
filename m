Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C06AECAAD3
	for <buildroot@archiver.kernel.org>; Wed, 14 Sep 2022 22:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFBBA81951;
	Wed, 14 Sep 2022 22:05:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFBBA81951
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bO3RzceVYU35; Wed, 14 Sep 2022 22:05:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58E9A818E6;
	Wed, 14 Sep 2022 22:05:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58E9A818E6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 468EC1C1148
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 22:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2264C60BEC
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 22:04:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2264C60BEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jbo4J3TT34se for <buildroot@lists.busybox.net>;
 Wed, 14 Sep 2022 22:04:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33A36605A9
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 22:04:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33A36605A9
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 219A583A8A; Wed, 14 Sep 2022 22:04:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Sep 2022 23:23:51 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 6cfbc63803f6ccd089501207c1c370881df76571
X-Git-Newrev: 719c234e783bfd2e993f29cbb971dc2aa30d332f
X-Patchwork-Hint: ignore
Message-Id: <20220914220453.219A583A8A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/go: fix go on
 riscv64 in sv57 mode
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

commit: https://git.buildroot.net/buildroot/commit/?id=719c234e783bfd2e993f29cbb971dc2aa30d332f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

On machines supporting Riscv SV57 mode like Qemu, Go programs currently crash
with the following type of error:

runtime: lfstack.push invalid packing: node=0xffffff5908a940 cnt=0x1
packed=0xffff5908a9400001 -> node=0xffff5908a940

The upstream PR fixes this error, but has not yet been merged.

Upstream: https://go-review.googlesource.com/c/go/+/409055/4

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fb97f4f354bd4e2fce270eebfba072c45a2a8a7c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0003-runtime-support-riscv64-SV57-mode.patch   | 65 ++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/package/go/0003-runtime-support-riscv64-SV57-mode.patch b/package/go/0003-runtime-support-riscv64-SV57-mode.patch
new file mode 100644
index 0000000000..f51c2ca093
--- /dev/null
+++ b/package/go/0003-runtime-support-riscv64-SV57-mode.patch
@@ -0,0 +1,65 @@
+From 6618c7af436488fa12018cdcd31eeedb3a698745 Mon Sep 17 00:00:00 2001
+From: Dmitry Vyukov <dvyukov@google.com>
+Date: Fri, 27 May 2022 18:55:35 +0200
+Subject: [PATCH] runtime: support riscv64 SV57 mode
+
+Riscv64 has SV57 mode when user-space VA is 56 bits.
+Linux kernel recently got support for this mode and Go binaries started crashing as:
+
+runtime: lfstack.push invalid packing: node=0xffffff5908a940 cnt=0x1
+packed=0xffff5908a9400001 -> node=0xffff5908a940
+
+Adjust lfstack code to use only 8 top bits of pointers on riscv64.
+
+For context see:
+https://groups.google.com/g/syzkaller-bugs/c/lU0GQTZoNQQ/m/O_c3vmE3AAAJ
+
+Update #54104
+
+Change-Id: Ib5d3d6a79c0c6eddf11618d73fcc8bc1832a9c25
+Signed-off-by: Christian Stewart <christian@paral.in>
+---
+
+Upstream: https://go-review.googlesource.com/c/go/+/409055/4
+---
+ src/runtime/lfstack_64bit.go | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/src/runtime/lfstack_64bit.go b/src/runtime/lfstack_64bit.go
+index 154130cf63..39fa647b9e 100644
+--- a/src/runtime/lfstack_64bit.go
++++ b/src/runtime/lfstack_64bit.go
+@@ -36,12 +36,21 @@ const (
+ 	// We use one bit to distinguish between the two ranges.
+ 	aixAddrBits = 57
+ 	aixCntBits  = 64 - aixAddrBits + 3
++
++	// Riscv64 SV57 mode gives 56 bits of userspace VA.
++	// lfstack code supports it, but broader support for SV57 mode is incomplete,
++	// and there may be other issues (see #54104).
++	riscv64AddrBits = 56
++	riscv64CntBits  = 64 - riscv64AddrBits + 3
+ )
+ 
+ func lfstackPack(node *lfnode, cnt uintptr) uint64 {
+ 	if GOARCH == "ppc64" && GOOS == "aix" {
+ 		return uint64(uintptr(unsafe.Pointer(node)))<<(64-aixAddrBits) | uint64(cnt&(1<<aixCntBits-1))
+ 	}
++	if GOARCH == "riscv64" {
++		return uint64(uintptr(unsafe.Pointer(node)))<<(64-riscv64AddrBits) | uint64(cnt&(1<<riscv64CntBits-1))
++	}
+ 	return uint64(uintptr(unsafe.Pointer(node)))<<(64-addrBits) | uint64(cnt&(1<<cntBits-1))
+ }
+ 
+@@ -54,5 +63,8 @@ func lfstackUnpack(val uint64) *lfnode {
+ 	if GOARCH == "ppc64" && GOOS == "aix" {
+ 		return (*lfnode)(unsafe.Pointer(uintptr((val >> aixCntBits << 3) | 0xa<<56)))
+ 	}
++	if GOARCH == "riscv64" {
++		return (*lfnode)(unsafe.Pointer(uintptr(val >> riscv64CntBits << 3)))
++	}
+ 	return (*lfnode)(unsafe.Pointer(uintptr(val >> cntBits << 3)))
+ }
+-- 
+2.35.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
