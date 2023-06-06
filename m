Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 927B4C7EE37
	for <buildroot@archiver.kernel.org>; Tue,  6 Jun 2023 21:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2914F60E2E;
	Tue,  6 Jun 2023 21:46:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2914F60E2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gpN82iagz023; Tue,  6 Jun 2023 21:46:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 879D860EA0;
	Tue,  6 Jun 2023 21:46:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 879D860EA0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 305C31BF470
 for <buildroot@lists.busybox.net>; Tue,  6 Jun 2023 21:46:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 090DE81F87
 for <buildroot@lists.busybox.net>; Tue,  6 Jun 2023 21:46:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 090DE81F87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WBOPYSEjMwto for <buildroot@lists.busybox.net>;
 Tue,  6 Jun 2023 21:46:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D75A581F82
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D75A581F82
 for <buildroot@buildroot.org>; Tue,  6 Jun 2023 21:46:05 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-38e04d1b2b4so5610018b6e.3
 for <buildroot@buildroot.org>; Tue, 06 Jun 2023 14:46:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686087964; x=1688679964;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XMprb9PB320QZ70172VDU/Q2EeqMMsSvGMwpd0FT97E=;
 b=EJtz22aLVW0af6tyj+H4RLc0XdAd0N9eUOzqWogWZxPXGnPYqTHO+Mx9rOWXWc24QV
 2Gebg8MseIkXqzF9IGR89W9IP30kNFkBmi5Hkrygr8plECgHMQ41Yrky3VIPewXQltuw
 wXvBV0/rERH53lm04Fe0l7qBgOxcwIJPn+VBzSvImhZ2Ro0fyUqHPihvwIKEb3xp6Oug
 ogBwaBAiTXAlWXN2D2kQkHpLqKNd+MVgQGxEB0AUL0Z9F0tFRIcpU5nFNNLNTubKMaRy
 kFf8fm9kXS9T+ladCX0V6AvfkHaPDITO/+eF8EjE9g0yktaTI5/TXxPVn8N2cz0qCyXE
 4rcA==
X-Gm-Message-State: AC+VfDy42uj7hk5sNXD4gCN2CHCaT1EVhHCoBu/zRA9cgu0DdRRd+AuE
 /c4vgvhgJN+aFSPNzZqWGCbeUYsPpltY9y9R+opkODPO
X-Google-Smtp-Source: ACHHUZ4YHe5+k1W++iEILfZp+1OERCpLfgDWZQ0Alq8I0Rfk+wbCiEi+NNzI46Vhy6yyb0fx2NXLrw==
X-Received: by 2002:a54:4898:0:b0:39a:4f11:cfb4 with SMTP id
 r24-20020a544898000000b0039a4f11cfb4mr3403078oic.26.1686087964616; 
 Tue, 06 Jun 2023 14:46:04 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 n22-20020a62e516000000b0065dd1e7c3c2sm2981142pff.184.2023.06.06.14.46.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 14:46:04 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue,  6 Jun 2023 14:45:56 -0700
Message-ID: <20230606214556.174086-3-christian@aperture.us>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230606214556.174086-1-christian@aperture.us>
References: <20230606214556.174086-1-christian@aperture.us>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1686087964; x=1688679964;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XMprb9PB320QZ70172VDU/Q2EeqMMsSvGMwpd0FT97E=;
 b=cBDXDvP0D+08cZ/GaXn3J5+LiFCwPQklCYkvLGp2K0mCOj6lO5GKbi8FjQHv2FEkot
 aAfoi61iPeo00+XTenc3+JVaqFDy4Z070PVr19cH/kBLDArgL2eFqYd/C4LqutYtlRMf
 +ZYEaGogE8Xp+iBychXauP+zpsw2LxCew2Sq/2UngwoeNW7XB4GeZ40+M+9YgWFC42x8
 MSLCDFTVOLgPtf1J3enKmJ0a2BKIOYzaeH4KGEUcFjwwPG+iRjIjAWLEYeu1OsOx6Rhv
 an6J3833wx1DzIccqOLly7qXgACus56HlQpmK4+P92DJ9VuAXX3tZILukRiqcbywqlpO
 9tYQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=cBDXDvP0
Subject: [Buildroot] [PATCH v6 3/3] package/go: bump to version 1.20.5
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
https://go.dev/doc/devel/release#go1.20.5
https://github.com/golang/go/issues?q=milestone%3AGo1.20.5+label%3ACherryPickApproved

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
index 874737ea2d..524ebc826c 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  13755bcce529747d5f2930dee034730c86d02bd3e521ab3e2bbede548d3b953f  go1.19.10.src.tar.gz
+sha256  9a15c133ba2cfafe79652f4815b62e7cfc267f68df1b9454c6ab2a3ca8b96a88  go1.20.5.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 66af25db45..24d59e2c77 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.19.10
+GO_VERSION = 1.20.5
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
