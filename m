Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E94BBC3DA4A
	for <buildroot@archiver.kernel.org>; Sat, 27 Jul 2024 18:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C43C4076D;
	Sat, 27 Jul 2024 18:26:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mPdVcMnHTGx7; Sat, 27 Jul 2024 18:26:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58CBA407BC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58CBA407BC;
	Sat, 27 Jul 2024 18:26:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A77671BF5A7
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 18:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A18B9401F3
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 18:26:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C4UlcL2dXKTs for <buildroot@lists.busybox.net>;
 Sat, 27 Jul 2024 18:26:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6BCAD40153
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BCAD40153
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6BCAD40153
 for <buildroot@buildroot.org>; Sat, 27 Jul 2024 18:26:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ce6c.dip0.t-ipconnect.de [79.214.206.108])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 166BAA4C272A;
 Sat, 27 Jul 2024 20:26:12 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52482)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1sXm7P-000000001yP-3zmd;
 Sat, 27 Jul 2024 18:26:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 27 Jul 2024 20:26:11 +0200
Message-Id: <20240727182611.1866996-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1722104772;
 bh=3BySBUeBAkQVTbWXky/9+GSRfWb5q2t8yl9I1f+9TXw=;
 h=From:To:Cc:Subject:Date:From;
 b=vvOwtRZhbMWfe2uqkknqbSke9yYY+QG9Nxb9+iZPVX27y2vEy6paxyJakNYBFPY2T
 S+vxRKg5s5piNFoZMgks76CmNbnR0OwAaQ9FV8zESypEPCeLuw/AFFCtFOyWGTKV8I
 ziUVO6PKCl5RRCpA2gxU0zXYW9+xYBijMHUTggU59Ka7oz4vYtKUlUV9OcwRvPIlkq
 3NxaNeZFdzs2JgROQgkhrV7Rm7Folx/RHnoBseosSootZwMst8gRVmIuUs/Tc4CrRd
 wZvLu8uTkoW5BvHOQMcFO2SNn7orPDjpYmoRjyPRiXeZCHLnYnmzQjMbk9ms11qGJv
 Ne1Orm3ldQcDg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=vvOwtRZh
Subject: [Buildroot] [PATCH 1/1] package/rapidjson: bump version
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
Cc: Simon Dawson <spdawson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Last release dates back to 2016, project is active so bump to current
HEAD. Upstream issue to tag a new release is open:
https://github.com/Tencent/rapidjson/issues/2284

Updated _SITE due to upstream move in 2017:
https://github.com/Tencent/rapidjson/commit/4a2f2729f1313a7150d1275185f4888224a48753

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/rapidjson/rapidjson.hash | 2 +-
 package/rapidjson/rapidjson.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rapidjson/rapidjson.hash b/package/rapidjson/rapidjson.hash
index 3c16abee60..ca5befdefc 100644
--- a/package/rapidjson/rapidjson.hash
+++ b/package/rapidjson/rapidjson.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  bf7ced29704a1e696fbccf2a2b4ea068e7774fa37f6d7dd4039d0787f8bed98e  rapidjson-1.1.0.tar.gz
+sha256  39f96f17b40f7201042c9b45d6444cb7eae1b7adfb7455412a86f6140450d32d  rapidjson-ab1842a2dae061284c0a62dca1cc6d5e7e37e346.tar.gz
 sha256  a140e5d46fe734a1c78f1a3c3ef207871dd75648be71fdda8e309b23ab8b1f32  license.txt
diff --git a/package/rapidjson/rapidjson.mk b/package/rapidjson/rapidjson.mk
index d3bcef7df1..3091edeab9 100644
--- a/package/rapidjson/rapidjson.mk
+++ b/package/rapidjson/rapidjson.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-RAPIDJSON_VERSION = 1.1.0
-RAPIDJSON_SITE = $(call github,miloyip,rapidjson,v$(RAPIDJSON_VERSION))
+RAPIDJSON_VERSION = ab1842a2dae061284c0a62dca1cc6d5e7e37e346
+RAPIDJSON_SITE = $(call github,Tencent,rapidjson,$(RAPIDJSON_VERSION))
 RAPIDJSON_LICENSE = MIT
 RAPIDJSON_LICENSE_FILES = license.txt
 RAPIDJSON_CPE_ID_VENDOR = tencent
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
