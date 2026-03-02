Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCCB1EB362F
	for <buildroot@archiver.kernel.org>; Mon,  2 Mar 2026 19:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8026B830E6;
	Mon,  2 Mar 2026 19:38:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rG-d2BU7WfTI; Mon,  2 Mar 2026 19:38:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A30128322E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772480280;
	bh=S8mkCiHNTYmdNST4dnyrJkFLxmsAOHUcf/Lz30CkMyo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=q4JeNHYfFahyM9KJZ8izm9nnBIwSRNVK2a783dk/RXhPV5UAHgrjXac8/Xf2hO/xB
	 cXBo0qEe3XkROq0UA93t13/37LFyhe2FVOso3KGE0HMQx3pe8n12CL4YFYgwrJ8gDp
	 jOO8NWw29U97Yuj0eHCX10JKWsiNB1kEzkTNY0iZnW1hATS6PGHPYEyIyxgdKNXRDJ
	 Vthgel3tc4s+tFZ4srcc19qUr7TijXZeW3AEGUmFKZ5IuI2kceinDFsZrymLHOdOf5
	 GwyynLZ2tKzT8IXnPSus/aTpV0G/ZDbF3qZ/IUzKbSCIT1eNFyMtJ2wBLKLyhWwcA4
	 ++q5g2lMJwc7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A30128322E;
	Mon,  2 Mar 2026 19:38:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A9A3F231
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 19:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9650460F04
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 19:37:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id flHn0HrGRn7k for <buildroot@buildroot.org>;
 Mon,  2 Mar 2026 19:37:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 97EF56078F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97EF56078F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 97EF56078F
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 19:37:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a037c.dip0.t-ipconnect.de [91.58.3.124])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 579C9A4C0DC4;
 Mon,  2 Mar 2026 20:37:55 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58294)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vx95X-0000000008B-17ix;
 Mon, 02 Mar 2026 19:37:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Mon,  2 Mar 2026 20:37:54 +0100
Message-ID: <20260302193754.3549175-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772480275;
 bh=E0W2C8Nm+zzGB2CZ2fTH4PNR82q/JS8znBKc0Tjp1lI=;
 h=From:To:Cc:Subject:Date:From;
 b=K8DjjCNs1mo20aX0s5k5LuDMABdM2n0FHo182eSCliBTPbQSUYn7E3nujkg4TsX0O
 n6/VKZHfdV1OEPsdPKKGdES1+0rBRqDlZ8Wh9qNGH5R+x7MK/UViYI6V3mgm5G034+
 MNU0ovTE0z+ULJGJg+iSHJJoWG4RqkbjM0hlCDDZfhVGBCLQW1k+sNObtCOUP1b54y
 FI0riaFjMTj91V47gw7tEnVLGphsVWJVjAXtR1pOUPV013rAokKXR6VjRdqRQj6kGS
 9jEY4XnGwUZUs5BAcBBi+DkLEzm0MxlT+0b50GOkPtP/ci9TZECvbN6QTdF8t6metW
 q7l23HJEEJuQQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=K8DjjCNs
Subject: [Buildroot] [PATCH/next 1/1] package/piglit: bump version
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

Includes https://gitlab.freedesktop.org/mesa/piglit/-/commit/ec0fc2fef0755b1595c3799ab25129174a4b2007
which fixes build with gcc >= 16.x.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/piglit/piglit.hash | 2 +-
 package/piglit/piglit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/piglit/piglit.hash b/package/piglit/piglit.hash
index 8158177e4f..83c4c1fa3f 100644
--- a/package/piglit/piglit.hash
+++ b/package/piglit/piglit.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  060d45db7304446ef280afd60fad3a728bcd9fdfe4c204b8a236e6a4a46ce592  piglit-3051e13ae12e1c927c7baace3138a8bebec7018a-git4.tar.gz
+sha256  b7892506de63d4f5b62c6e5dbb0c7e0d14497cc4617f8784e4e446bfe81941ec  piglit-ec0fc2fef0755b1595c3799ab25129174a4b2007-git4.tar.gz
 sha256  dcc398730859aee7cc1d6aa57f526f8d181b47bb3a49830e85b5723d5bc2c3bc  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  licences/GPL-2
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  licences/GPL-3
diff --git a/package/piglit/piglit.mk b/package/piglit/piglit.mk
index e61c3c9e61..c4c004c824 100644
--- a/package/piglit/piglit.mk
+++ b/package/piglit/piglit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIGLIT_VERSION = 3051e13ae12e1c927c7baace3138a8bebec7018a
+PIGLIT_VERSION = ec0fc2fef0755b1595c3799ab25129174a4b2007
 PIGLIT_SITE = https://gitlab.freedesktop.org/mesa/piglit.git
 PIGLIT_SITE_METHOD = git
 PIGLIT_LICENSE = MIT (code), \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
