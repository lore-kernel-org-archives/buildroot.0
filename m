Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 879AAC77B78
	for <buildroot@archiver.kernel.org>; Wed,  3 May 2023 02:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2925A81D11;
	Wed,  3 May 2023 02:23:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2925A81D11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zwOevTVZ7E2r; Wed,  3 May 2023 02:23:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C9A181586;
	Wed,  3 May 2023 02:23:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C9A181586
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 916C91BF860
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 02:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A1734024D
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 02:23:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A1734024D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t84PtPW7lqGp for <buildroot@lists.busybox.net>;
 Wed,  3 May 2023 02:23:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26D064021C
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 26D064021C
 for <buildroot@buildroot.org>; Wed,  3 May 2023 02:23:12 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-63b4bf2d74aso3277757b3a.2
 for <buildroot@buildroot.org>; Tue, 02 May 2023 19:23:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683080591; x=1685672591;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+npb+vwY2G4YR5htIq/fKz8As7yGfnWIgCK32mZibXo=;
 b=HuvlsNaC959PjewNiYdpg1lVz4vkaRY39YlnB8+/Ozd2WYLOhl38DOSd3wCpUERNza
 R8fc86fj0z4Q2mQxU2RiOrndwB0mH6crkgSRMca6n9uoTRBInQSNHqZHsjGyB+hgFZGG
 fxAWBDE43AETgjzZTCHGQRMutE0YEqDjUgy1dZOFVrX/UK1O/1H3p3rq65GAHdywYXCx
 ulKnJ6YNZLOc+P1+HUG7JmFkhV5lbsfEzdJY+c3zOLs2bcGdzsNpTEkCiKwfaaob2p69
 EE/SlaML0Lj306SdEASanVADSY+qvinpEaMraJ8RDab+ae2NNAF0GJ7rWgKSVsYZoXi3
 /Vlg==
X-Gm-Message-State: AC+VfDzXAEdBjHNJOu1w+MM0F6xS6JZ2uGfNUWOITNgLPinjch3eNBcZ
 Y7aqt3dNrlQ+1lljKYevBYbp26RFCD00rw==
X-Google-Smtp-Source: ACHHUZ5WgBtlNn3H3RrsblP+q3B0fLtaM7yL6M2jYaht/PAqGnYpFbQKdPVnYZK0AJWyLO5c5hpoYg==
X-Received: by 2002:a05:6a00:1ac9:b0:641:558:8e2e with SMTP id
 f9-20020a056a001ac900b0064105588e2emr26388062pfv.15.1683080591120; 
 Tue, 02 May 2023 19:23:11 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 n41-20020a056a000d6900b00637b0c719c5sm22349859pfv.201.2023.05.02.19.23.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 19:23:10 -0700 (PDT)
From: Christian Stewart <christian@aperture.us>
To: buildroot@buildroot.org
Date: Tue,  2 May 2023 19:23:02 -0700
Message-Id: <20230503022302.3188863-3-christian@aperture.us>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230503022302.3188863-1-christian@aperture.us>
References: <20230503022302.3188863-1-christian@aperture.us>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 3/4] package/go: bump to version 1.20.4
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
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Anisse Astier <anisse@astier.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The latest Go release, version 1.20, arrives six months after Go 1.19. Most of
its changes are in the implementation of the toolchain, runtime, and libraries.

https://go.dev/doc/go1.20
https://go.dev/doc/devel/release#go1.20.4
https://github.com/golang/go/issues?q=milestone%3AGo1.20.4+label%3ACherryPickApproved

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
index 5488ed9710..3167ccc523 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  1d7a67929dccafeaf8a29e55985bc2b789e0499cb1a17100039f084e3238da2f  go1.19.8.src.tar.gz
+sha256  9f34ace128764b7a3a4b238b805856cc1b2184304df9e5690825b0710f4202d6  go1.20.4.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index c8ad1a8dc6..c1c088a81d 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.19.8
+GO_VERSION = 1.20.4
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
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
