Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86969C636CC
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 01:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8C7D60C0E;
	Sun, 12 Feb 2023 01:55:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8C7D60C0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dN-_Je477ALO; Sun, 12 Feb 2023 01:55:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9E9460C0F;
	Sun, 12 Feb 2023 01:55:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9E9460C0F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2A3821BF855
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 01:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11F1A403B8
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 01:54:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11F1A403B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ktw6-2p6kMCc for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 01:54:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B338140343
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B338140343
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 01:54:48 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id o8so7979494pls.11
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 17:54:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dn5SMXRVbuAsL+pOnBYhh6xSk12ZXboShxX6X4zaGBU=;
 b=yNFkxB2Jj3C1jTwL1QSp0B4lyps84+aH/cARoC71WU8rDHef/W1Lz8RDj6kBj+hZJd
 uWFFgew3thhJPf55XVPgg0J5eYei7yIrYbFz6s9sFSyWIxCP6Q5g8HdiwpUvIli+A/pg
 7VI1HmU1/5pGg5qfAgcG32ME+QitVrfWvj/vo6mzU1JnbhM+tLBfvTO120Wk85Sq4Bi0
 exIWzqBui/k3B907jakFutYzVVknNSXzFhHKuscMPowprvPYMo0v1/i1cqDunFCr4eW3
 FdglZuXPlhKXa/yi9u0Cwad7sQWesigQKLeH48GjycOqQIUoW0SH7cekrGrW+MuSdmML
 sYTQ==
X-Gm-Message-State: AO0yUKWYKf/bGiiqKQL+Ut2OJbW7U6n4odkvEiIfzWEB8rHRIwcoMgP9
 BZGFyowI1YJ07W7yCRL15BEqoLIVqw0=
X-Google-Smtp-Source: AK7set9zBCb0VOwu6LQ9fUuJIb/1WJ0r4n9O8kbsySwVNdxJXk/7+mlY9b1aSnlXrGY6OZsgGuxbrQ==
X-Received: by 2002:a17:903:20c9:b0:19a:93fc:c4d0 with SMTP id
 i9-20020a17090320c900b0019a93fcc4d0mr1347700plb.12.1676166887465; 
 Sat, 11 Feb 2023 17:54:47 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 f3-20020a170902ab8300b0019615a0d083sm5528703plr.210.2023.02.11.17.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 17:54:47 -0800 (PST)
To: buildroot@buildroot.org
Date: Sat, 11 Feb 2023 17:54:42 -0800
Message-Id: <20230212015443.7740-2-christian@paral.in>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230212015443.7740-1-christian@paral.in>
References: <20230212015443.7740-1-christian@paral.in>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/go: bump to version 1.20
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The latest Go release, version 1.20, arrives six months after Go 1.19. Most of
its changes are in the implementation of the toolchain, runtime, and libraries.

https://go.dev/doc/go1.20

Signed-off-by: Christian Stewart <christian@paral.in>

---

v1 -> v2:

 - drop unnecessary change to config.in.host

Signed-off-by: Christian Stewart <christian@paral.in>
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
