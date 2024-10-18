Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D187D3DEAB
	for <buildroot@archiver.kernel.org>; Fri, 18 Oct 2024 19:07:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2DDA8174C;
	Fri, 18 Oct 2024 19:07:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XWLbXja8i2IG; Fri, 18 Oct 2024 19:07:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A69B181778
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A69B181778;
	Fri, 18 Oct 2024 19:07:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D8CC12072
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 19:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6E8A60B9B
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 19:07:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ozroyKacyei6 for <buildroot@buildroot.org>;
 Fri, 18 Oct 2024 19:06:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5C2DF60B8D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C2DF60B8D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5C2DF60B8D
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 19:06:58 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c50d.dip0.t-ipconnect.de [79.214.197.13])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 75EC1A4C2338;
 Fri, 18 Oct 2024 21:06:55 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34292)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t1sJL-000000000JT-0V5E;
 Fri, 18 Oct 2024 19:06:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Louis-Paul Cordier <lpdev@cordier.org>
Date: Fri, 18 Oct 2024 21:06:54 +0200
Message-Id: <20241018190654.29370-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241018190654.29370-1-bernd@kuhls.net>
References: <20241018190654.29370-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1729278415;
 bh=8e9fM2oELlupBbdEsnCYzmhzoOAEDBScznx1G+lCqfA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gJBYPvaSfwETcOM2hX7xMXtJ8S5lpWpsJhBAC2U06CaVdOtKTfNex3oCZ8t12fc8f
 Lvhh8dLDJtdwlCXEdW0UKpDC/n5fki8WXLYJTrruBUnlxc4sV/A8b4TuwMo09CqxXO
 6f1gVwuN/6C6HRxnbyMV1Y06KhVa4raK9VLMQ9wPhy2WKpgDVVBYaPdyT08jgP5AcJ
 +6VOI9xJZKDFmTTFZ9zWqyf2kM344WNG66h+WVlyDaDS+akHZZ7nojGdP38t0HTBy1
 qUbHpSJFRzx2BpOOaocQxnldfVUHFFKcVxbPpkVOw4xe5PXJUgPh6pDD2bAbQDVvTw
 okFqAVHP6J7UQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=gJBYPvaS
Subject: [Buildroot] [PATCH 3/3] package/intel-gmmlib: bump version to 22.5.2
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-gmmlib/intel-gmmlib.hash | 2 +-
 package/intel-gmmlib/intel-gmmlib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-gmmlib/intel-gmmlib.hash b/package/intel-gmmlib/intel-gmmlib.hash
index 5080301ee1..1accd2e205 100644
--- a/package/intel-gmmlib/intel-gmmlib.hash
+++ b/package/intel-gmmlib/intel-gmmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6dec8eccf0df4924b44de37afa0fd835684328778784dcd556df826b0a71e54f  intel-gmmlib-22.5.1.tar.gz
+sha256  dbf7cc401de7ff386306a23c1c61b3cf7bd86a4d9001b3a1d16a81e6b0e3ab2b  intel-gmmlib-22.5.2.tar.gz
 sha256  8b7446825df3f8b0268307e272aa6aaaf78351c83161d860d02c913c22666c48  LICENSE.md
diff --git a/package/intel-gmmlib/intel-gmmlib.mk b/package/intel-gmmlib/intel-gmmlib.mk
index 8145b372aa..3698d2fff0 100644
--- a/package/intel-gmmlib/intel-gmmlib.mk
+++ b/package/intel-gmmlib/intel-gmmlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_GMMLIB_VERSION = 22.5.1
+INTEL_GMMLIB_VERSION = 22.5.2
 INTEL_GMMLIB_SITE = https://github.com/intel/gmmlib/archive
 INTEL_GMMLIB_LICENSE = MIT
 INTEL_GMMLIB_LICENSE_FILES = LICENSE.md
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
