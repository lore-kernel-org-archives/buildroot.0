Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4914FD3B7E5
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 07:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EABD4078C;
	Mon, 29 Dec 2025 07:45:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9AoAZzLrH7sV; Mon, 29 Dec 2025 07:45:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 569B240788
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766994308;
	bh=lcDFHZ9Tg34HbB6XcxkKP/DAdJoDppqssKPxW7nYj9I=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=p2TIQyCjPaQRfLwoxnrIim9iD6M7M24y1VI/OwbgQf2FP7O54CIvuvjDUk8qayRWX
	 hYzOS/0stYlCANlCLBWEruuwGlQeAZ1ShsQJemkmfIsElbHu40mpkoLYdfvu+Ak0Z6
	 hg8VYJ9ukQ80dRvUdQKvnf5oZDxGe4j3fg2QAWMbxeuqJmdGizUd+AD2ey4OwZKapW
	 U5A5tS4OEsAMroHdGU0rpuSiXi29WsVzBT/5NZBR2w8bs/SLZegQcHLK+kWL31dTfg
	 h1OM4SyFDC+R5WDo02tRrskeAV/5EO2IUsL59/qK0lcFaKmy9JdTgbhapi/JpVN7bk
	 T1S+Bgeq+ZA2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 569B240788;
	Mon, 29 Dec 2025 07:45:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BCD75B9
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 07:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A327D40378
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 07:45:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FusB_eoPZrf6 for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 07:45:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AFA2740235
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFA2740235
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AFA2740235
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 07:45:04 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 61CC6A4C1A26
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 08:45:00 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51768)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1va7w3-000000000HI-2wJi
 for buildroot@buildroot.org; Mon, 29 Dec 2025 07:45:00 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 08:44:59 +0100
Message-ID: <20251229074459.503126-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766994300;
 bh=yOOy0kdLYH21/EfvwbVXXPYVVK0OpvgzoBSIBwS5JvA=;
 h=From:To:Subject:Date:From;
 b=SUEfPKmLmYIizPID55KCeBOsqeuLP9zCW+vYxebnBf+8TWh6FogQez2bJ11BmO9Bw
 F2rn23HtAw+kgtAKm4o/CfRXjGbdkoIzV7EE4eB9YC+Heceu03natbBwyF6E5FXFw6
 qpSEi77KU8UdxPG7Ad/6Gn/k9wuKfp8rMoRVZ60Oe0Xghdc9Il4QNRrtjhRWzbDEON
 85kJr87rnEsRA/g9GkvsaKOTt8+Uc/y++RsnztDXekAAa24hGM+wtR9RiOE82nMGEQ
 DLndtFQz5/AeJFHuJX92GXLjuS1kctnhR89hGrgpdysN1ahZgAA0Q3VbYnPrBu7eW8
 Z6zzaGC1gjEMg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=SUEfPKmL
Subject: [Buildroot] [PATCH 1/1] package/xmrig: bump version to 6.25.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Changelog: https://github.com/xmrig/xmrig/blob/v6.25.0/CHANGELOG.md

Added armv8 and riscv64 (riscv32 is broken) as supported archs.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/xmrig/Config.in  | 2 ++
 package/xmrig/xmrig.hash | 2 +-
 package/xmrig/xmrig.mk   | 2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/xmrig/Config.in b/package/xmrig/Config.in
index 0b5f5370e4..273678a88f 100644
--- a/package/xmrig/Config.in
+++ b/package/xmrig/Config.in
@@ -2,7 +2,9 @@
 config BR2_PACKAGE_XMRIG_ARCH_SUPPORTS
 	bool
 	default y if BR2_ARM_CPU_ARMV7A
+	default y if BR2_ARM_CPU_ARMV8A
 	default y if BR2_aarch64
+	default y if BR2_RISCV_64
 	default y if BR2_x86_64
 	default y if BR2_i386
 
diff --git a/package/xmrig/xmrig.hash b/package/xmrig/xmrig.hash
index 89c8fa1c11..5aa1630b14 100644
--- a/package/xmrig/xmrig.hash
+++ b/package/xmrig/xmrig.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3521c592a18ada781d79c919ea6c1b7e5a8bcfe2ec666789bc55fd88a2aee8d3  xmrig-6.24.0.tar.gz
+sha256  55e415792f2a4ef2430cb26829b0b7d96fc52f51c6274831e9fe76b8aef28593  xmrig-6.25.0.tar.gz
 sha256  589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  LICENSE
diff --git a/package/xmrig/xmrig.mk b/package/xmrig/xmrig.mk
index 860af71f75..bfd2a98e12 100644
--- a/package/xmrig/xmrig.mk
+++ b/package/xmrig/xmrig.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XMRIG_VERSION = 6.24.0
+XMRIG_VERSION = 6.25.0
 XMRIG_SITE = $(call github,xmrig,xmrig,v$(XMRIG_VERSION))
 XMRIG_LICENSE = GPL-3.0+
 XMRIG_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
