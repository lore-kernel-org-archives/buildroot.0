Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26663C19F29
	for <buildroot@archiver.kernel.org>; Thu,  4 Aug 2022 02:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 984964148A;
	Thu,  4 Aug 2022 02:44:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 984964148A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wMMmzzTNmz7o; Thu,  4 Aug 2022 02:44:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 277B64148F;
	Thu,  4 Aug 2022 02:44:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 277B64148F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7C9191BF255
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 02:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61DBE402D7
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 02:44:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61DBE402D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id URmQSO7gTHKV for <buildroot@lists.busybox.net>;
 Thu,  4 Aug 2022 02:44:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F61D40151
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7F61D40151
 for <buildroot@buildroot.org>; Thu,  4 Aug 2022 02:44:43 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id s206so16753596pgs.3
 for <buildroot@buildroot.org>; Wed, 03 Aug 2022 19:44:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tNmwlB/XhuGQg450+eBbAKSepTzVWhhg3oncZTZcykI=;
 b=xaSEJw7nl7i/Tbk7FIU0CeTlKWT2PzeWt7jMHre2ojz8s/pH0Bdi9yGDrkLl9qblIs
 tQSPftxbcLlRzJzBArXiFGSqcX7gqJgCekHD8Z8HVckBy7+oe16jq5iPn6Gd+22WDRvq
 /j4lIYNJQBF03YA6+z7wJx43Oq8v5i3/y4o4jypWKnaC40pvjO6Wkdg3y25YXrNkBM79
 GHZ4K8oBd8NiJ3Md6sAcFiFEqLDPVvbDP/C2WJFxvgOFGKHEK5jjZ4N8AAAaLYXXhtsF
 w0ISrxphEvMU4nrHckIPaKOSC4xYKe+OuSk63MatQvGCEwVaQCCa1QcYFhlmNrZF7rGQ
 ZaAg==
X-Gm-Message-State: ACgBeo001lXTz3E0hi3US4f2uWBpzT+K/sEED23p1uFCXRYzn9HKv5Yg
 nWqXpsDh7lwMvqTTktCOhmDBNXlRqRO50A==
X-Google-Smtp-Source: AA6agR4Xqsybbl9VPY/t5gOctIMAaXeLXB2vnzOJBlLPx/sZ1cnJAdbFSJbPH8Qto6rTTKI0PrJYgA==
X-Received: by 2002:a05:6a00:2342:b0:52e:6c99:a55a with SMTP id
 j2-20020a056a00234200b0052e6c99a55amr1370465pfj.32.1659581082336; 
 Wed, 03 Aug 2022 19:44:42 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 i12-20020a170902c94c00b0016ed8af2ec0sm2766769pla.29.2022.08.03.19.44.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 19:44:41 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  3 Aug 2022 19:44:38 -0700
Message-Id: <20220804024438.1118030-1-christian@paral.in>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/go: fix go on riscv64 in sv57
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

Upstream: https://go-review.googlesource.com/c/go/+/409055/4

Signed-off-by: Christian Stewart <christian@paral.in>

---

v1 -> v2:

 - updated to upstream patchset version 4
 - note: the upstream patchset has been code-reviewed and approved
 - rebased against go 1.19 (patch is #0002)
 - see: https://patchwork.ozlabs.org/project/buildroot/patch/20220804024126.1103291-1-christian@paral.in/

Signed-off-by: Christian Stewart <christian@paral.in>
---
 ...02-runtime-support-riscv64-SV57-mode.patch | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 package/go/0002-runtime-support-riscv64-SV57-mode.patch

diff --git a/package/go/0002-runtime-support-riscv64-SV57-mode.patch b/package/go/0002-runtime-support-riscv64-SV57-mode.patch
new file mode 100644
index 0000000000..9b5393e1e4
--- /dev/null
+++ b/package/go/0002-runtime-support-riscv64-SV57-mode.patch
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
+
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
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
