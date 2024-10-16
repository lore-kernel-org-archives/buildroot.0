Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC6AD1AD50
	for <buildroot@archiver.kernel.org>; Wed, 16 Oct 2024 12:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE91080DAB;
	Wed, 16 Oct 2024 12:45:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wWftctLwAXCw; Wed, 16 Oct 2024 12:45:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F65F80DA4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F65F80DA4;
	Wed, 16 Oct 2024 12:45:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9892D1BF2CF
 for <buildroot@lists.busybox.net>; Wed, 16 Oct 2024 12:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8377740223
 for <buildroot@lists.busybox.net>; Wed, 16 Oct 2024 12:45:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ujQdLAAc0Nez for <buildroot@lists.busybox.net>;
 Wed, 16 Oct 2024 12:45:44 +0000 (UTC)
Received-SPF: Pass (sender SPF authorized) identity=helo;
 client-ip=81.169.146.221; helo=mo4-p00-ob.smtp.rzone.de;
 envelope-from=ludwig.kormann@ict42.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 19A5340230
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19A5340230
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 19A5340230
 for <buildroot@buildroot.org>; Wed, 16 Oct 2024 12:45:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1729082741; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=DckNa5kvFf/AVwxrq7rYPQvfg1XABj/eiUoahAKRwuJnogpy2PdAXpO0PwgbF/q6bl
 Ort4pc3NfN6kkGqMXOKaV4t2Q0qdQpJvjPg7TIjvwfX+h+v5ct2K3C5yngRC4aTwH0rw
 7lPxO56DUNENAr8dOpzVOtnk+0sf3ro1E5fjODxiB+o/Y6A9L3Nov2e0YvaKppe888pS
 iXvzN72aPplK+hit/I72V4mp907lu7prSgxPMly/NJzHm2u4yWhGQLxJTFe50EAAUVmx
 qRfFZgwtnBijmvqbr+YcM0WDMbbe0iJa6HG+n5d40v6vlxjOJAvH1Wdz6/0TWN/nAkf1
 8F6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1729082741;
 s=strato-dkim-0002; d=strato.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:To:From:Cc:Date:From:
 Subject:Sender;
 bh=jh+AcZxP29ue2VtVUpRPecQpxbeklOpNP5AaICBEsTo=;
 b=rQ6fyFr1U+GE4saVjhOl4/pwtZ4f2ERn2AWJRZtbkRZDq0WTliIzUkrthvMyHCKgpr
 iGavDLI7h9zj4QQthxzjzeWUcD3PS2/VU0/4/bm6J8n8WK6mZgg9jCQfIVyeAgY0oKJQ
 hO42qDLs7dthUQGYqE7BoVlRgNfioS5E3KPlItvL9psOtEnmwQn9jWfFeKD+wjXEP7yi
 kPz1D4nB5HiGhPXTlFFIczOFqAGClzdJYVAnjw1RBP+tWjthBadq+ycm4kmTtf178SVh
 I0ZAzVCLBMnd1pY57TsjH84fgVRLhRxN/ENv5X6CJXPoU0ykl1MCJUGWSekVgIDPZGKg
 vS3w==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
X-RZG-AUTH: ":IHkAYkmvNfSwjg/qSc4u8zZOVaURsoXe3UH2mQA0KgllCYtN8WqJZ5aMuoQuCdrfzui0vA=="
Received: from debian-test.local.in-circuit.de
 by smtp.strato.de (RZmta 51.2.11 DYNA|AUTH)
 with ESMTPSA id ja045c09GCjf7fU
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate) for <buildroot@buildroot.org>;
 Wed, 16 Oct 2024 14:45:41 +0200 (CEST)
From: Ludwig Kormann <ludwig.kormann@ict42.de>
To: buildroot@buildroot.org
Date: Wed, 16 Oct 2024 14:45:36 +0200
Message-Id: <20241016124537.2645119-2-ludwig.kormann@ict42.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241016124537.2645119-1-ludwig.kormann@ict42.de>
References: <20241016124537.2645119-1-ludwig.kormann@ict42.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1729082741; 
 s=strato-dkim-0002; d=ict42.de;
 h=References:In-Reply-To:Message-Id:Date:Subject:To:From:Cc:Date:From:
 Subject:Sender;
 bh=jh+AcZxP29ue2VtVUpRPecQpxbeklOpNP5AaICBEsTo=;
 b=QUgA0nG9LeM2LihmzMpAeda/ZS1r1Q8fsWofPDK9u/qdBc8kXD8xvszwHhmLmSRjV7
 Nfy2lgA6/OVYV+HNEfSSqrynGs5qLkWaViTP+wqUiWOv1V7+AS+VqDAci+ZGnv9GyIGD
 Nc+D/CVA17jJJEfHb8QRPKvutOpUvC8Vp9ZuI6KtEzTktdThF5eZGpMVxDxwGz4q+aD1
 6iR3kA+seoAP8NUHrOqlzdrCBiv92jXeqmtpGPIeiifR9FZ2kFZWHGBaXUTc9EXgWPPZ
 cV9/DzQMqmsChQl4RV92zTNhtgGLGd8iCVnKh6+lE4/de081FLYBtRAX1cYbIN6Ky9jY
 26EQ==
X-Mailman-Original-DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 t=1729082741; 
 s=strato-dkim-0003; d=ict42.de;
 h=References:In-Reply-To:Message-Id:Date:Subject:To:From:Cc:Date:From:
 Subject:Sender;
 bh=jh+AcZxP29ue2VtVUpRPecQpxbeklOpNP5AaICBEsTo=;
 b=sp4Il4m6gG5Z1pp9YOUKnW8mKIkINjpgGdZP9dk2X0Tnfni8XkF0eXvEksPatlri8Z
 m7k/+16ALnSG1oxmDYAg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=ict42.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=ict42.de header.i=@ict42.de
 header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=QUgA0nG9; 
 dkim=pass header.d=ict42.de header.i=@ict42.de header.a=ed25519-sha256
 header.s=strato-dkim-0003 header.b=sp4Il4m6
Subject: [Buildroot] [PATCH v2 2/3] configs/icnova-a20-adb4006: enable
 BR2_DOWNLOAD_FORCE_CHECK_HASHES
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Ludwig Kormann <ludwig.kormann@ict42.de>
---
 .../patches/linux-headers/linux-headers.hash                  | 1 +
 board/in-circuit/icnova-a20-adb4006/patches/linux/linux.hash  | 2 ++
 board/in-circuit/icnova-a20-adb4006/patches/uboot/uboot.hash  | 2 ++
 configs/icnova-a20-adb4006_defconfig                          | 4 ++++
 4 files changed, 9 insertions(+)
 create mode 120000 board/in-circuit/icnova-a20-adb4006/patches/linux-headers/linux-headers.hash
 create mode 100644 board/in-circuit/icnova-a20-adb4006/patches/linux/linux.hash
 create mode 100644 board/in-circuit/icnova-a20-adb4006/patches/uboot/uboot.hash

diff --git a/board/in-circuit/icnova-a20-adb4006/patches/linux-headers/linux-headers.hash b/board/in-circuit/icnova-a20-adb4006/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/in-circuit/icnova-a20-adb4006/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/in-circuit/icnova-a20-adb4006/patches/linux/linux.hash b/board/in-circuit/icnova-a20-adb4006/patches/linux/linux.hash
new file mode 100644
index 0000000000..98edd13a58
--- /dev/null
+++ b/board/in-circuit/icnova-a20-adb4006/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  f74812f78e88992c416434cb107639e13a551dbaff36bb90d6346ab16ab71a95  linux-6.6.56.tar.xz
diff --git a/board/in-circuit/icnova-a20-adb4006/patches/uboot/uboot.hash b/board/in-circuit/icnova-a20-adb4006/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..904fa56c02
--- /dev/null
+++ b/board/in-circuit/icnova-a20-adb4006/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
diff --git a/configs/icnova-a20-adb4006_defconfig b/configs/icnova-a20-adb4006_defconfig
index 7eac9b429d..6b860489ca 100644
--- a/configs/icnova-a20-adb4006_defconfig
+++ b/configs/icnova-a20-adb4006_defconfig
@@ -5,6 +5,10 @@ BR2_ARM_FPU_NEON_VFPV4=y
 # Linux headers same as kernel, a 6.6 LTS series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
+# Build
+BR2_GLOBAL_PATCH_DIR="board/in-circuit/icnova-a20-adb4006/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
 # System
 BR2_TARGET_GENERIC_HOSTNAME="ICnova A20 ADB4006"
 BR2_TARGET_GENERIC_ISSUE="Welcome to ICnova A20 ADB4006!"
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
