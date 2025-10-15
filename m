Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316BCCCD185
	for <buildroot@archiver.kernel.org>; Wed, 15 Oct 2025 17:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3C3C82784;
	Wed, 15 Oct 2025 17:20:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jDNkX8dSW46s; Wed, 15 Oct 2025 17:20:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5CAB8235E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5CAB8235E;
	Wed, 15 Oct 2025 17:20:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 817B31C9
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 17:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6692382204
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 17:20:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9XlRgrHWe7ro for <buildroot@buildroot.org>;
 Wed, 15 Oct 2025 17:20:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 599FC821D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 599FC821D4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 599FC821D4
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 17:20:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5ED0BA4C6E49
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 19:20:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38002)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v95AR-000000003Up-2rZX
 for buildroot@buildroot.org; Wed, 15 Oct 2025 17:20:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 15 Oct 2025 19:20:03 +0200
Message-ID: <20251015172003.1893707-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760548804;
 bh=ccptmJJonsCL6WuoLIHGt74alSKS/qJyMrnY1EyaYH4=;
 h=From:To:Subject:Date:From;
 b=pUj5xMvES3mBaxOBDn8T6q1kIsh8FhVGfNkUXPnh/F3gGYd+o/4FDfvnKYdfBrTTN
 z/R7cogngdqc1a4EEd1xHWnVcq7QOc84kWF7wVF7qnpOGU/NIm12L89QPQI+WDrx7B
 n2SSkPzxYJYYbyvaBxS9a6+9pdBI1CDeggAEFomS7yF6ibgPSPq3yFjK9iegQx64YX
 JSk+b2HDk65ZQ5dDgImSrA1GIt6urOjsjTDVnAP3JgwrzOZdfAw2i8rPx2ncDU2juu
 lzv3uzBJU5jETQqGPE/Ilbvw4lfJ9klbvyRacKt7REiPXtVzyB9rRIjtyzgBJ+GMwq
 kbLiRQnVmo33w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=pUj5xMvE
Subject: [Buildroot] [PATCH 1/1] package/samba4: security bump version to
 4.22.5
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

Release notes: https://www.samba.org/samba/history/samba-4.22.5.html

Fixes CVE-2025-9640 & CVE-2025-10230.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index f0e19d8741..0668a9e8db 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.22.4.tar.asc
-sha256  a41a828848abdf5e942c900ca178597e18aab7b61d3c06a9b5ba43661988010b  samba-4.22.4.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.22.5.tar.asc
+sha256  d8566a15d3dbfc0b777d1e8fbb2eee988a024ca9c786dcac65dd10347307400d  samba-4.22.5.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index c1d1b0b160..688d5177bc 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.22.4
+SAMBA4_VERSION = 4.22.5
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
