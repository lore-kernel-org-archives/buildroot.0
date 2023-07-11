Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2935EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 22:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8452D41E60;
	Tue, 11 Jul 2023 22:09:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8452D41E60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TBOIfwh9gZjT; Tue, 11 Jul 2023 22:09:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0523341E75;
	Tue, 11 Jul 2023 22:09:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0523341E75
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A18C21BF2C0
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 22:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7BACE40493
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 22:08:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BACE40493
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yep372ABlc30 for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 22:08:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 420704000B
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 420704000B
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 22:08:55 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-26304be177fso3185136a91.1
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 15:08:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689113334; x=1691705334;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dSdVuwysvj5V0aTCBmvO/vYR5/apvLkpvSI+8aP6f/g=;
 b=S42z/AfLhGKIm0V7djVYjiYrih/baDa+SQ2ogjTALpeaN1CDYy0ykUd51WRJ0Cmwsz
 5tFvOPEx5wYNZE2ChFd0qIKF3pdelnvQBHxXad8a0EJxSXFmE7eIfMK1wUe/YW3/w2yk
 s+5Xb44Lhw8ZHpuhvr3FpRikijLOKfvzHBA4PLuXcZdTem8q35UI/442jysTy7Q9OSWT
 adjf9yDP8G1UqjMCSGRtXL8Kso6RHSG2VuzLzXH8NdrZIrTvUkRKdBetva6qaAh7Im5z
 u+d2jEldJ09TfEx5GkBSY4MFpriuvTYezNYF3o4dao2Oe5CcRdQ5e/q94fwQy1Uq/5NX
 vofg==
X-Gm-Message-State: ABy/qLYhwtmRSKG8aKxbGenmhicGEzHCtjt4BY5WRJe+QQ7was4XT+F0
 KaNsfSL4pKSYwFQyJ4qGWDVYn3FP8xkIw7SQnhcsDw==
X-Google-Smtp-Source: APBJJlHxy1rTv/YT9NUsz+G3qupE9m/YErDdJeJbvSnB/zRz7Ygh5M78hwN346Apa4vV0llJ27gAdg==
X-Received: by 2002:a17:90a:be02:b0:263:fc43:5f39 with SMTP id
 a2-20020a17090abe0200b00263fc435f39mr13603354pjs.13.1689113334383; 
 Tue, 11 Jul 2023 15:08:54 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 ep11-20020a17090ae64b00b0025bbe90d3cbsm2268015pjb.44.2023.07.11.15.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 15:08:54 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 11 Jul 2023 15:08:48 -0700
Message-ID: <20230711220849.1702358-3-christian@aperture.us>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230711220849.1702358-1-christian@aperture.us>
References: <20230711220849.1702358-1-christian@aperture.us>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1689113334; x=1691705334;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dSdVuwysvj5V0aTCBmvO/vYR5/apvLkpvSI+8aP6f/g=;
 b=F5Ja06RlfI2E6cfQ/a80tiyZiq0dCB470kYTR2CjdjIhZB9u9I37M2sDWsDO7vpXa3
 HPt10wqIFII67oV7fcXX/Up2W3tyso2N6b9hp3dik8ZobQjSU0+CceCeyhiZ4dCyvoyZ
 8UinNdkSEqsDaEbidV9Q+FI/TRAXzwt56S0dLDEWovjCDZtXoBAUDHl4WGhXtiFcGec7
 tNt6l4oUWk/+QeVMgrBPb9WtcmPYAyzjEoX9D+GlKmu/TjSsiHX+1PZVTVDtZK68+fN+
 61vFeVa+bGr0Vntz1O03Qlw65RPqC0waHc5GhFLhfEk5W2UOYoq9zE2rc+bZjvywh70z
 Ad1g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=F5Ja06Rl
Subject: [Buildroot] [PATCH v7 3/4] package/go: bump to version 1.20.6
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The latest Go release, version 1.20, arrives six months after Go 1.19. Most of
its changes are in the implementation of the toolchain, runtime, and libraries.

https://go.dev/doc/go1.20
https://go.dev/doc/devel/release#go1.20.6
https://github.com/golang/go/issues?q=milestone%3AGo1.20.6+label%3ACherryPickApproved

Signed-off-by: Christian Stewart <christian@aperture.us>

---

v1 -> v2:

 - drop unnecessary change to config.in.host

v2 -> v3:

 - bump to go 1.20.1
 - add note about fixed cves

v3 -> v4:

 - rebase on updated go1.19.x version
 - remove notes about cves (fixed in previous 1.19.x version)
 - update to go 1.20.2

v4 -> v5:

 - security update to go 1.20.4

v5 -> v6:

 - security update to go 1.20.5

v6 -> v7:

 - security update to go 1.20.6
 - CVE-2023-29406

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 ...03-runtime-support-riscv64-SV57-mode.patch | 65 -------------------
 package/go/go.hash                            |  2 +-
 package/go/go.mk                              |  4 +-
 3 files changed, 3 insertions(+), 68 deletions(-)
 delete mode 100644 package/go/0003-runtime-support-riscv64-SV57-mode.patch

diff --git a/package/go/0003-runtime-support-riscv64-SV57-mode.patch b/package/go/0003-runtime-support-riscv64-SV57-mode.patch
deleted file mode 100644
index f51c2ca093..0000000000
--- a/package/go/0003-runtime-support-riscv64-SV57-mode.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 6618c7af436488fa12018cdcd31eeedb3a698745 Mon Sep 17 00:00:00 2001
-From: Dmitry Vyukov <dvyukov@google.com>
-Date: Fri, 27 May 2022 18:55:35 +0200
-Subject: [PATCH] runtime: support riscv64 SV57 mode
-
-Riscv64 has SV57 mode when user-space VA is 56 bits.
-Linux kernel recently got support for this mode and Go binaries started crashing as:
-
-runtime: lfstack.push invalid packing: node=0xffffff5908a940 cnt=0x1
-packed=0xffff5908a9400001 -> node=0xffff5908a940
-
-Adjust lfstack code to use only 8 top bits of pointers on riscv64.
-
-For context see:
-https://groups.google.com/g/syzkaller-bugs/c/lU0GQTZoNQQ/m/O_c3vmE3AAAJ
-
-Update #54104
-
-Change-Id: Ib5d3d6a79c0c6eddf11618d73fcc8bc1832a9c25
-Signed-off-by: Christian Stewart <christian@paral.in>
----
-
-Upstream: https://go-review.googlesource.com/c/go/+/409055/4
----
- src/runtime/lfstack_64bit.go | 12 ++++++++++++
- 1 file changed, 12 insertions(+)
-
-diff --git a/src/runtime/lfstack_64bit.go b/src/runtime/lfstack_64bit.go
-index 154130cf63..39fa647b9e 100644
---- a/src/runtime/lfstack_64bit.go
-+++ b/src/runtime/lfstack_64bit.go
-@@ -36,12 +36,21 @@ const (
- 	// We use one bit to distinguish between the two ranges.
- 	aixAddrBits = 57
- 	aixCntBits  = 64 - aixAddrBits + 3
-+
-+	// Riscv64 SV57 mode gives 56 bits of userspace VA.
-+	// lfstack code supports it, but broader support for SV57 mode is incomplete,
-+	// and there may be other issues (see #54104).
-+	riscv64AddrBits = 56
-+	riscv64CntBits  = 64 - riscv64AddrBits + 3
- )
- 
- func lfstackPack(node *lfnode, cnt uintptr) uint64 {
- 	if GOARCH == "ppc64" && GOOS == "aix" {
- 		return uint64(uintptr(unsafe.Pointer(node)))<<(64-aixAddrBits) | uint64(cnt&(1<<aixCntBits-1))
- 	}
-+	if GOARCH == "riscv64" {
-+		return uint64(uintptr(unsafe.Pointer(node)))<<(64-riscv64AddrBits) | uint64(cnt&(1<<riscv64CntBits-1))
-+	}
- 	return uint64(uintptr(unsafe.Pointer(node)))<<(64-addrBits) | uint64(cnt&(1<<cntBits-1))
- }
- 
-@@ -54,5 +63,8 @@ func lfstackUnpack(val uint64) *lfnode {
- 	if GOARCH == "ppc64" && GOOS == "aix" {
- 		return (*lfnode)(unsafe.Pointer(uintptr((val >> aixCntBits << 3) | 0xa<<56)))
- 	}
-+	if GOARCH == "riscv64" {
-+		return (*lfnode)(unsafe.Pointer(uintptr(val >> riscv64CntBits << 3)))
-+	}
- 	return (*lfnode)(unsafe.Pointer(uintptr(val >> cntBits << 3)))
- }
--- 
-2.35.1
-
diff --git a/package/go/go.hash b/package/go/go.hash
index 874737ea2d..135d1ad37b 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  13755bcce529747d5f2930dee034730c86d02bd3e521ab3e2bbede548d3b953f  go1.19.10.src.tar.gz
+sha256  62ee5bc6fb55b8bae8f705e0cb8df86d6453626b4ecf93279e2867092e0b7f70  go1.20.6.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 66af25db45..50e3e85cf5 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.19.10
+GO_VERSION = 1.20.6
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
@@ -151,7 +151,7 @@ define HOST_GO_INSTALL_CMDS
 	cp -a $(@D)/lib $(HOST_GO_ROOT)/
 
 	mkdir -p $(HOST_GO_ROOT)/pkg
-	cp -a $(@D)/pkg/include $(@D)/pkg/linux_* $(HOST_GO_ROOT)/pkg/
+	cp -a $(@D)/pkg/include $(HOST_GO_ROOT)/pkg/
 	cp -a $(@D)/pkg/tool $(HOST_GO_ROOT)/pkg/
 
 	# The Go sources must be installed to the host/ tree for the Go stdlib.
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
