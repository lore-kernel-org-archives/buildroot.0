Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D08E66892
	for <buildroot@archiver.kernel.org>; Fri, 19 Dec 2025 21:10:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C14960BB3;
	Fri, 19 Dec 2025 21:10:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wZ7b_1-RpNuA; Fri, 19 Dec 2025 21:10:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E0EC60BBA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766178620;
	bh=OBUjhdsrLuP4/loWpuRKYnk3GZQQ68MmndqJoPhJMV0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KlhxIMAQ7ym4cBG8aNPkZfr7R55KSbOvo22g7zZi5BqEcIczOpMi5p2hqk5bGPhke
	 3mTzAeF8w0XjJopRJlUEoxQBium59Jx2+rep31NIfW5gCbEr0ubNRtqeF7/0iqkoJv
	 kh9To7oinwHeXqR39mUYxdfGQJSHRan4zpWd6OsgS+xIzSB9DgqCkivkv5uxyXPqu6
	 ONkuPckkpO2DApr/TZ4E3kGIMfsJQYjh983fqbybsucVUMwnkiT2raa1+GINmhyKON
	 32t7w912BWAmbvMVjBgmfBt7TW0YJETs3wcfZnRzgRsM5MWqzxUjtY/4SczCUxTlRh
	 Z+ePurLtPLElQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E0EC60BBA;
	Fri, 19 Dec 2025 21:10:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F8D81A6
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 21:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71DA483CA3
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 21:10:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JvipwOC497J1 for <buildroot@buildroot.org>;
 Fri, 19 Dec 2025 21:10:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4F3C783CA1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F3C783CA1
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F3C783CA1
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 21:10:17 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a0d:e487:418e:8c09:857b:bc67:c232:7cba])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 06504780371;
 Fri, 19 Dec 2025 22:10:10 +0100 (CET)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Fri, 19 Dec 2025 22:09:55 +0100
Message-ID: <20251219210957.556930-2-ju.o@free.fr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251219210957.556930-1-ju.o@free.fr>
References: <20251219210957.556930-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766178615;
 bh=yEdFHZtStlrhVg1mVPsNohbVN+zFhkvOYt0OroLp2xE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=m7dqjDdFd4w88WcQ8F9Mv5svA7m+xq4WHCs3+mbKGOtBcC9aVLCgFsaRduaMN1tWS
 CwSaQAWMN5A+Ft93NorKGQuDVZ+hIBA/OqGfjXxm8GNtxlnmvCs/ggTXe/nhaYXSOa
 CKJ119Ew0lyAUUmnPmcBnbvUjnAQMwmz2wiAonoXy+iCSP3mfTDcot5H19KFTrWnzg
 XmMEHA0fE4EmS6OsLCUzNVVdAm3LP5OEj9UaIi7EV7V9nmmU3UkZFe7RFHDDZwPkHF
 u35GMNAXjYAYnuUW8kofCl1sAkOkTaosyyoOBSR0peevm+r5sUN8/nrQl4MVTSqrDg
 Qy8Fk0eWbsYNg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=m7dqjDdF
Subject: [Buildroot] [PATCH 2/4] support/testing: ddrescue: bump test kernel
 to 6.18.2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_ddrescue.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_ddrescue.py b/support/testing/tests/package/test_ddrescue.py
index 042431eb7b..eb3f63ae53 100644
--- a/support/testing/tests/package/test_ddrescue.py
+++ b/support/testing/tests/package/test_ddrescue.py
@@ -17,7 +17,7 @@ class TestDdrescue(infra.basetest.BRTest):
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.15"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.2"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
         BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
