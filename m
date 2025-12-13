Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EDC7D5B156
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 11:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D5A540CDB;
	Sat, 13 Dec 2025 11:58:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BI6VYfsovF1A; Sat, 13 Dec 2025 11:58:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E48740C7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765627119;
	bh=jNOWrYs2Ro/N/GnoBGYvbBdIGNsPSzH4eKgZwcybw5g=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=DsgiS5K6SyJyfYOtTTxV+CDmoa4IONK1PIyXr1NQuyb1ge5m0ApTnUq6sRw6s0YE6
	 OCN00edswYeKGrZH67T9jD9y1JrsdLJDKxwe3lJI4hBsWJvWNy1w5ML5gcu/7LKrZy
	 DTRHv8zZx7UuR4cRfQW2P/5hxcgQQPdPAVwZv2X2oW/1hmLxDRd1m+OFbqP6AptH/n
	 cZ25UzYuO7qewswdJaUnpSM74P83phniUtwGUlJB/RDQQZyFC/6RENolifp3B8lud3
	 652bCoh3stbHWu6has7HaZ6V5sdDpVVvRLmarFpKE/+OEeqX2vVQS9hEqyUT93gf58
	 0w5bHk1vj6UjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E48740C7D;
	Sat, 13 Dec 2025 11:58:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 458542C1
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 11:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 377DB40186
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 11:58:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z_HFOFqqxYz1 for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 11:58:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 203A14009B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 203A14009B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 203A14009B
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 11:58:36 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc21.dip0.t-ipconnect.de [79.214.204.33])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 77B08A4C4033;
 Sat, 13 Dec 2025 12:58:10 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55170)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vUOGI-0000000078u-0TYm;
 Sat, 13 Dec 2025 11:58:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 13 Dec 2025 12:58:09 +0100
Message-ID: <20251213115809.1277255-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251213115809.1277255-1-bernd@kuhls.net>
References: <20251213115809.1277255-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765627090;
 bh=xFy4aU7LQCEa+iSH73HzNTOlbAfrx1f9q6i+2VnN51w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ocHPCYpqU8pJel4cKO6TbnugeswGoGoDIjNT6vyiaFcC4Jx1n10QsCKS9LmWoZLSq
 LPk/3T7xB0rLJct0F0x/F0YULuy4Iy8mYPom4IDwxbu9zs+lxVWdDQeN7otaLLUx1S
 bWa9lnepq0zl118iuecBWHTWS2Osp3+R/0YO+vQMl/5bWcjOeQyDK4Nm0DFb5FCIe3
 jU57F8TrCGmmnSzmJL97Tx6dWzSH74pNQBh2timEcw6r1yqnS5hyoZKw8+qzi+E1eY
 0FaLr9+zwsp2GyzTPE6uE/eZfN9sOnisxGkHnbhdRlw9eqL4IR4hMY9DVVUIpv8XuG
 TU9/iI+8Bwitg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ocHPCYpq
Subject: [Buildroot] [PATCH 3/3] package/python-glslang: bump version to
 16.1.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/KhronosGroup/glslang/blob/16.1.0/CHANGES.md

Supports spirv-{headers, tools} version 1.4.335.0:
https://github.com/KhronosGroup/glslang/commit/209b675bf0c0d82c0e536bcb3cb7e1011957dd59

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-glslang/python-glslang.hash | 2 +-
 package/python-glslang/python-glslang.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-glslang/python-glslang.hash b/package/python-glslang/python-glslang.hash
index 16b399e542..5b53cd882a 100644
--- a/package/python-glslang/python-glslang.hash
+++ b/package/python-glslang/python-glslang.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  172385478520335147d3b03a1587424af0935398184095f24beab128a254ecc7  python-glslang-16.0.0.tar.gz
+sha256  32c605822ed63a0cdc2d24f318c3d912fa14e58573aff1d8eac0cf69f1a6b6d2  python-glslang-16.1.0.tar.gz
 sha256  17e70c676e1521ff3e4686f04a2053d93a7e28a33be8de7ec37ab0ff72feb677  LICENSE.txt
diff --git a/package/python-glslang/python-glslang.mk b/package/python-glslang/python-glslang.mk
index 48e5531600..92dc86bf6d 100644
--- a/package/python-glslang/python-glslang.mk
+++ b/package/python-glslang/python-glslang.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_GLSLANG_VERSION = 16.0.0
+PYTHON_GLSLANG_VERSION = 16.1.0
 PYTHON_GLSLANG_SITE = $(call github,KhronosGroup,glslang,$(PYTHON_GLSLANG_VERSION))
 PYTHON_GLSLANG_LICENSE = BSD-3-Clause
 PYTHON_GLSLANG_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
