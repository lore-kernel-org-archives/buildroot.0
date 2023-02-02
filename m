Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0807BC61DA4
	for <buildroot@archiver.kernel.org>; Thu,  2 Feb 2023 10:56:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33FE8606ED;
	Thu,  2 Feb 2023 10:56:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33FE8606ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CARCOkm6Rz8M; Thu,  2 Feb 2023 10:56:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC34360AF2;
	Thu,  2 Feb 2023 10:55:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC34360AF2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CBE3E1BF287
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 10:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A59DE60AC2
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 10:55:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A59DE60AC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RiBnYkDdjpSI for <buildroot@lists.busybox.net>;
 Thu,  2 Feb 2023 10:55:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA88B606ED
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CA88B606ED
 for <buildroot@buildroot.org>; Thu,  2 Feb 2023 10:55:56 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id f3so1046472pgc.2
 for <buildroot@buildroot.org>; Thu, 02 Feb 2023 02:55:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SXKi8mLvHG25fXdBhsPPvZlm5/gzKERNTf8sol4pw40=;
 b=3Ac8BJCHLrbOYWE8ZIk2jDRV7QflkxAzW3/H+V5EIX+0H5T39wnVI8F+C2WA8JmkOo
 HXGjVEW2F6sUByWEX0BU0R4PN5QjxgEgKn/tVBz8FP/lQ6+7X1rb7rpWcJHtd2kCMW8G
 nCBIEYXBFDfg3EI9Ip8kCc5fLL7FVHYVmHplNaoeHXkAqogKYUdnw8lRHV5CzblBjn4O
 W4AD8fV1ecC2i4S277NpEVs6stgBD5lFuqctXULP/7v7B//j4qVoNy6aXlVh9OVPD37g
 B1Tb4cX4clWxRar5EUvWOB3YJgSphtcPpoI36KT11dAx65iB3JXXjTOKrQ2zRMKa01Ai
 CGkA==
X-Gm-Message-State: AO0yUKWwB3jGXc3mtGCwhTWXCy7qD6NPfI5zf8QHjHXRpeJF5DcyCokk
 q1xg5EDSfAbFChf15tuAK2xpm4ypBwKFKg==
X-Google-Smtp-Source: AK7set/HuUbs8XDzHC2hMdYkYwqZvzDk3t0PCKOIZnvJBXvkkw8TM3Mdj47WjrzQgvc0d085UQRaxg==
X-Received: by 2002:aa7:9618:0:b0:58b:c3b3:d3dd with SMTP id
 q24-20020aa79618000000b0058bc3b3d3ddmr5386657pfg.21.1675335355811; 
 Thu, 02 Feb 2023 02:55:55 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 h18-20020a056a00219200b0059416691b64sm3513218pfi.19.2023.02.02.02.55.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 02:55:55 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu,  2 Feb 2023 02:55:43 -0800
Message-Id: <20230202105544.315452-2-christian@paral.in>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230202105544.315452-1-christian@paral.in>
References: <20230202105544.315452-1-christian@paral.in>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 2/3] package/go: bump to version 1.20
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
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
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

Signed-off-by: Christian Stewart <christian@paral.in>
---
 ...03-runtime-support-riscv64-SV57-mode.patch | 65 -------------------
 package/go/Config.in.host                     |  2 +-
 package/go/go.hash                            |  2 +-
 package/go/go.mk                              |  4 +-
 4 files changed, 4 insertions(+), 69 deletions(-)
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
diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index 43cb62309d..b87b862cec 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -2,9 +2,9 @@
 config BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	bool
 	default y
+	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE2_ARCH_SUPPORTS
 	# See https://go.dev/doc/install/source#environment
 	# See src/go/build/syslist.go for the list of supported architectures
-	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE2_ARCH_SUPPORTS
 	depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
 		|| BR2_i386 || BR2_x86_64 || BR2_powerpc64le \
 		|| BR2_mips64 || BR2_mips64el || BR2_riscv || BR2_s390x
diff --git a/package/go/go.hash b/package/go/go.hash
index 4c22f0f274..204e508fc3 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  8e486e8e85a281fc5ce3f0bedc5b9d2dbf6276d7db0b25d3ec034f313da0375f  go1.19.5.src.tar.gz
+sha256  3a29ff0421beaf6329292b8a46311c9fbf06c800077ceddef5fb7f8d5b1ace33  go1.20.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index b0dd002712..18d3a80212 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.19.5
+GO_VERSION = 1.20
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
@@ -151,7 +151,7 @@ define HOST_GO_INSTALL_CMDS
 	cp -a $(@D)/lib $(HOST_GO_ROOT)/
 
 	mkdir -p $(HOST_GO_ROOT)/pkg
-	cp -a $(@D)/pkg/include $(@D)/pkg/linux_* $(HOST_GO_ROOT)/pkg/
+	cp -a $(@D)/pkg/include $(HOST_GO_ROOT)/pkg/
 	cp -a $(@D)/pkg/tool $(HOST_GO_ROOT)/pkg/
 
 	# https://golang.org/issue/2775
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
