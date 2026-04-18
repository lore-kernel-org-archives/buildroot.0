Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF76CF99C89
	for <buildroot@archiver.kernel.org>; Sat, 18 Apr 2026 16:10:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 684AD60D61;
	Sat, 18 Apr 2026 16:10:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JNonh4H1pie2; Sat, 18 Apr 2026 16:10:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B22C60D77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776528604;
	bh=1JXRIVJZUDVkfe5VzX4A6Fu6tX1/L2G9lTaPdw4BCQw=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=kwpACIs388jCTha/VDQpo7Mdpof7bt0yMNnbU2WPOylHXKyw12ZlshCi4grfvEt93
	 nMJ64auSE4D3OnAjpLWbVF1k+7nDWukEhl+rocCZX/wD3zHj87k0KKPLm57j30k26e
	 55Rc7OQLiSbhoQKs33uvpRsar5FzFH/WExJD0ps/zdPYIYcvwzPSoLItdrE7cDScgR
	 Gb2GGZ0STsntsXVXkADuBoAxwXF4qyIRnDlOTB7+/SObHnxXONKwzYKR5OjWMr0td1
	 U9eLKWaLlucPiYwjrkG3+rep2SodiHZELwNpmcei42yGtWyX9renlRLv3mS7r4gGbF
	 gOFVumxwHBJzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B22C60D77;
	Sat, 18 Apr 2026 16:10:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 93EC0259
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 16:10:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85A3840108
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 16:10:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SOwrolLH4Lr4 for <buildroot@buildroot.org>;
 Sat, 18 Apr 2026 16:10:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9138A4002D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9138A4002D
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9138A4002D
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 16:10:01 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 5C19B6013C;
 Sat, 18 Apr 2026 18:09:57 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sat, 18 Apr 2026 18:09:53 +0200
Message-ID: <20260418160953.958739-1-ju.o@free.fr>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776528598;
 bh=tkznQ2MjpOprL3+6nKduhLFR5sH68b5M/HYU3UXHpEc=;
 h=From:To:Cc:Subject:Date:From;
 b=Yvya2rW4O07etv87TxDmWC3B4vv3ZiJbatBtXEvk2wJeO9n4tJRXqrjxhIffi3jCc
 KzRBH7wKa7fXDcbiHeI9BbWlz44YVZrgbWXsV8JxtRSwkEAf4mG4J+WvU0sZKI8H0F
 1hPwsqUYN0oUVXta4Hl48gJa+c0jMpcspvPWhcO5RKAFx0xk2IjcEahOr1cbxtSQ8S
 Op0iq7Pa0WXB0jk5sqPP2cb5qKGoFAcjwTkn9gLFV8BjMB++6F5z/De/r5XMt2WvIA
 q4IyIQD8TVPr4lwYmNG6mT1oI1lBzWajeLM9mgF7q+I4iF9N0lkyunhwlappM1TS5X
 borXNTICXWQPg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Yvya2rW4
Subject: [Buildroot] [PATCH 1/1] package/opencsd: bump to version 1.8.1
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

For change log since 1.6.1, see:
https://github.com/Linaro/OpenCSD/blob/v1.8.1/README.md?plain=1#L365

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/opencsd/opencsd.hash | 2 +-
 package/opencsd/opencsd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/opencsd/opencsd.hash b/package/opencsd/opencsd.hash
index 52d07fefc4..8cccb03cc9 100644
--- a/package/opencsd/opencsd.hash
+++ b/package/opencsd/opencsd.hash
@@ -1,3 +1,3 @@
 # Locally Computed:
-sha256  e940e7ddd4e3c723c8dbe614e0728e20cb19729d44bb55cdb016abd6ad221bfd  opencsd-1.6.1.tar.gz
+sha256  2133692c37f05c01354959d9da6f57797d58b2d1346693fd9477f1332eaa4223  opencsd-1.8.1.tar.gz
 sha256  980eef4b0744e63834e3ec0d50c2a4ff6d81d7ec62dd8ba8c66acae0ec5a2e88  LICENSE
diff --git a/package/opencsd/opencsd.mk b/package/opencsd/opencsd.mk
index a7a24587ee..350dec73ce 100644
--- a/package/opencsd/opencsd.mk
+++ b/package/opencsd/opencsd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENCSD_VERSION = 1.6.1
+OPENCSD_VERSION = 1.8.1
 OPENCSD_SITE = $(call github,Linaro,OpenCSD,v$(OPENCSD_VERSION))
 OPENCSD_LICENSE = BSD-3-Clause
 OPENCSD_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
