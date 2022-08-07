Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D963C19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 13:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ADC5C404BD;
	Sun,  7 Aug 2022 13:45:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADC5C404BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bu4YoOuMsvfS; Sun,  7 Aug 2022 13:45:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E31E40475;
	Sun,  7 Aug 2022 13:45:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E31E40475
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 25FD21BF3CD
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 13:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF66D60AE4
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 13:45:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF66D60AE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l7Zn7ZR5p_ge for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 13:45:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1632560767
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 13:45:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1632560767
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B8A4A86F4B; Sun,  7 Aug 2022 13:31:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Aug 2022 15:45:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2dc8b0dd7432480082e02e0b186476108728fb8b
X-Git-Newrev: fb97f4f354bd4e2fce270eebfba072c45a2a8a7c
X-Patchwork-Hint: ignore
Message-Id: <20220807133134.B8A4A86F4B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go: fix go on riscv64 in sv57 mode
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

commit: https://git.buildroot.net/buildroot/commit/?id=fb97f4f354bd4e2fce270eebfba072c45a2a8a7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On machines supporting Riscv SV57 mode like Qemu, Go programs currently crash
with the following type of error:

runtime: lfstack.push invalid packing: node=0xffffff5908a940 cnt=0x1
packed=0xffff5908a9400001 -> node=0xffff5908a940

The upstream PR fixes this error, but has not yet been merged.

Upstream: https://go-review.googlesource.com/c/go/+/409055/4

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
