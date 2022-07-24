Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3288C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 23:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33556611EB;
	Sun, 24 Jul 2022 23:51:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33556611EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d37yFL9KeUwe; Sun, 24 Jul 2022 23:51:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28362611E3;
	Sun, 24 Jul 2022 23:51:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28362611E3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4DF4A1BF31C
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 23:51:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25A7141899
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 23:51:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25A7141899
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dgPRSQxy9XDu for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 23:51:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1EA441895
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E1EA441895
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 23:51:01 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id w7so8917488ply.12
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 16:51:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x0U37EEy6IgVKzhaMU+t6lyzXHgyxrFgTw6vyiLSByw=;
 b=sFJ1NN2SygYSbKnVByMw7qplwdL4aWHI1LGXVaW2HVrC8qncAtpZinpSAaMD+Oev5E
 KuA+8sQA89P8waL1fEJAjX7DJ6pO0GkblvfI/s70zANGT8kLDkN8Eo2sJtAB3QMA8Syo
 ZKNBR5GvpbuIcaCBg4jSkYviY2zs4w94DCa2On998vuCwohKsXV+89d8xpym/4TNGnHx
 i5FC3KFgOx/sPvGm32UqeITfPYZRhYGQ1+JmC1QV6mPnA4HUpl/v+77Pg2BG/9Qmc7PI
 iwJeSIorh1/z+nAbdI3YgMonsbvaOWwa7jRgRWAv0PVS/mLigggteXMkCw9ZwvjRkoJR
 LBgg==
X-Gm-Message-State: AJIora+yrWxn6Gv9L2YhEQMtIRyX2+thJJRq2krbYvUMCRrOE9Qdge/q
 5kjOA5XB3bxl2XoioLesAvJ034drD+Zb3Q==
X-Google-Smtp-Source: AGRyM1tP2xHj2WmpU8MOJlUxADHKnpijjW67tjdZIQrH+yefpwI4Rff8SILO6CYPPTJNPa8Kwcskjw==
X-Received: by 2002:a17:902:dacb:b0:16d:7c59:bcf6 with SMTP id
 q11-20020a170902dacb00b0016d7c59bcf6mr1286791plx.135.1658706660804; 
 Sun, 24 Jul 2022 16:51:00 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 c4-20020a170902d48400b0016c37fe48casm3410626plg.193.2022.07.24.16.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jul 2022 16:51:00 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 16:50:58 -0700
Message-Id: <20220724235058.677911-1-christian@paral.in>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 1/1] package/go: fix go on riscv64 in sv57
 mode
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

On machines supporting Riscv SV57 mode like Qemu, Go programs currently crash
with the following type of error:

runtime: lfstack.push invalid packing: node=0xffffff5908a940 cnt=0x1
packed=0xffff5908a9400001 -> node=0xffff5908a940

The upstream PR fixes this error, but has not yet been merged.

Upstream: https://go-review.googlesource.com/c/go/+/409055/3

Signed-off-by: Christian Stewart <christian@paral.in>
---
 ...03-runtime-support-riscv64-SV57-mode.patch | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 package/go/0003-runtime-support-riscv64-SV57-mode.patch

diff --git a/package/go/0003-runtime-support-riscv64-SV57-mode.patch b/package/go/0003-runtime-support-riscv64-SV57-mode.patch
new file mode 100644
index 0000000000..04811dd3ba
--- /dev/null
+++ b/package/go/0003-runtime-support-riscv64-SV57-mode.patch
@@ -0,0 +1,59 @@
+From 98eeeaeaa20279368be0466b24afe44ed24fceb8 Mon Sep 17 00:00:00 2001
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
+Change-Id: Ib5d3d6a79c0c6eddf11618d73fcc8bc1832a9c25
+
+Upstream: https://go-review.googlesource.com/c/go/+/409055/3
+---
+ src/runtime/lfstack_64bit.go | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/src/runtime/lfstack_64bit.go b/src/runtime/lfstack_64bit.go
+index 3f0e480897..9f13e72fa6 100644
+--- a/src/runtime/lfstack_64bit.go
++++ b/src/runtime/lfstack_64bit.go
+@@ -36,12 +36,19 @@ const (
+ 	// We use one bit to distinguish between the two ranges.
+ 	aixAddrBits = 57
+ 	aixCntBits  = 64 - aixAddrBits + 3
++
++	// Riscv64 SV57 mode gives 56 bits of userspace VA.
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
+@@ -54,5 +61,8 @@ func lfstackUnpack(val uint64) *lfnode {
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
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
