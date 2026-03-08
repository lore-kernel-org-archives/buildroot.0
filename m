Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A0CEA8530
	for <buildroot@archiver.kernel.org>; Sun,  8 Mar 2026 16:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCDB04191E;
	Sun,  8 Mar 2026 16:03:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TO-r250Nr4If; Sun,  8 Mar 2026 16:03:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD84241847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772985829;
	bh=R5pzBfe5pvbNXgaunk/GqY+ZqVqa6Nb97ilbICZQz28=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PvN/7rDJ6M7pQ9RlbE+FRQH2h9nyFk/gRsOsxeiAt+99wQE2jexjgUSXDcsKVl3oW
	 +BFde9F9z3oHP/Jbomy8qpo/et+Pgi+VTriDun4tP0lg++FCCpJJT2YRdTX/Ou2AMv
	 dvbTIcRsv430/peSZReI4yi5IxwQSVsBSNPGHasQceYAPBbjPlxqY1rxb5+UiTZ4t7
	 K9YcnA5/DWhDcXDk7Dmf9f72+emzrV6oPWzLaWKPA+FRKRR0Uz76VR3cLXzA3dWJxY
	 hY3fREWzdSgD8H41EFBvZy86d79eu2L3E9qK9Sa2W/NO0IEScD4Abfcn6F1QPUf+IW
	 XOKmhLqwTkqBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD84241847;
	Sun,  8 Mar 2026 16:03:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 759ED223
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 16:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C24841847
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 16:03:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M7t4aTUNQP-P for <buildroot@buildroot.org>;
 Sun,  8 Mar 2026 16:03:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2D5824183F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D5824183F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D5824183F
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 16:03:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c66e.dip0.t-ipconnect.de [79.214.198.110])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C49CEA4C366A;
 Sun,  8 Mar 2026 17:03:44 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39460)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vzGbY-0000000022x-1Oi4;
 Sun, 08 Mar 2026 16:03:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Michael Vetter <jubalh@iodoru.org>
Date: Sun,  8 Mar 2026 17:03:44 +0100
Message-ID: <20260308160344.2593517-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260308160344.2593517-1-bernd@kuhls.net>
References: <20260308160344.2593517-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772985824;
 bh=fbkSPWi6b/pLmeaPMzrgGWwIi+xAyijkhohnSfRUhgg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=pvNUnMR0vhieTIaXcxEd/+AsQe15URcKDLaXVOWaaOXmd1csau41TE2oaKu4dCheX
 amjAdBHwIVnBFp5iFU6JGqinQ2ZxJsTtnu/O72UXIpNnRLQw7ixdeJNXTYoWxXk1iA
 mOP8WI/1yXzVLS9+COMtElcdJDpd3Yy6Y867Ljhyh3kfH7he6g5Y0s4lVo+KtMRR4a
 L3LtxVray2dOY0xFypXUOV1oxzKXYMN9B5jiC/MC1YT06xF7dPT8dRfx6xKy+6FCwx
 fJZz87sTV+/IXo3cGtLrj1PUoia4/DgJ5qzLDwuD8xQC/3EY/qowJ+d6hm4IuzoEOc
 WrClSa9flS68Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=pvNUnMR0
Subject: [Buildroot] [PATCH 2/2] package/jasper: bump version to 4.2.9
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

https://github.com/jasper-software/jasper/releases/tag/version-4.2.9

Switch to sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/jasper/jasper.hash | 3 ++-
 package/jasper/jasper.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/jasper/jasper.hash b/package/jasper/jasper.hash
index 3bda474dfa..d5c619e4a0 100644
--- a/package/jasper/jasper.hash
+++ b/package/jasper/jasper.hash
@@ -1,3 +1,4 @@
+# From https://github.com/jasper-software/jasper/releases/tag/version-4.2.9
+sha256  f71cf643937a5fcaedcfeb30a22ba406912948ad4413148214df280afc425454  jasper-4.2.9.tar.gz
 # Locally calculated
-sha256  98058a94fbff57ec6e31dcaec37290589de0ba6f47c966f92654681a56c71fae  jasper-4.2.8.tar.gz
 sha256  4ad1bb42aff888c4403d792e6e2c5f1716d6c279fea70b296333c9d577d30b81  LICENSE.txt
diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index 9ed54989e2..5370479328 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JASPER_VERSION = 4.2.8
+JASPER_VERSION = 4.2.9
 JASPER_SITE = https://github.com/jasper-software/jasper/releases/download/version-$(JASPER_VERSION)
 JASPER_INSTALL_STAGING = YES
 JASPER_LICENSE = JasPer-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
