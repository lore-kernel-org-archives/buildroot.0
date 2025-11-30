Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD15ACFD376
	for <buildroot@archiver.kernel.org>; Sun, 30 Nov 2025 12:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DB7140A4B;
	Sun, 30 Nov 2025 12:05:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TNXn_TzvH-NP; Sun, 30 Nov 2025 12:05:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D40C40A89
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D40C40A89;
	Sun, 30 Nov 2025 12:05:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 95E21219
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 12:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7BF9E80C8A
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 12:05:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HsHgF0pZ7Gbq for <buildroot@buildroot.org>;
 Sun, 30 Nov 2025 12:04:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AD52D80C50
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD52D80C50
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD52D80C50
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 12:04:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b593.dip0.t-ipconnect.de [84.161.181.147])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7B3B0A4C773A;
 Sun, 30 Nov 2025 13:04:57 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37678)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vPgAj-000000005VW-0ZdL;
 Sun, 30 Nov 2025 12:04:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Stefan Hager <stefan.hager@ginzinger.com>
Date: Sun, 30 Nov 2025 13:04:57 +0100
Message-ID: <20251130120457.3021844-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1764504297;
 bh=Vx2y7MI5lOfmE8t02dVcqLj5boF9/fsoOpw7Ihnna6I=;
 h=From:To:Cc:Subject:Date:From;
 b=j3r36n0OhVyf2oeoysKZlnE4j0hyzkiQFzXzlDHaJcDEedeuV6gIS+S4riVRs5mMD
 eRRk/cueRr2fHkEw435UE6McF63Y4Za51ba6d25lhsCRKc7XaQFfhJ79snct4+s8M7
 XSOsGbLq9W1GXus6ug634gXMa0DNk1Ptey9nPgu8OZG3bOcEPVbhVyxfbyzsdN1xYN
 BFCvnad8fGk7fFjAn3VlJv0PEG+H1gGW9mj67MXhk2W/7MYgdbEJP6z0Zvb2zPhLiw
 QKpO97HX3PVeNJxgta4Rb6zFM2fxgdMGvMfKcT9DzjTBW/tFwRw38pJYh+80dcSp26
 3ccYW9YxXX5rw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=j3r36n0O
Subject: [Buildroot] [PATCH 1/1] package/psimd: fix cmake 4 compatibility
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

The current upstream repo shows this note:
"This repository was archived by the owner on May 27, 2024. It is now
 read-only."

Switched to fork whose only difference is a commit fixing build errors
with cmake 4:
https://github.com/snest/psimd/commit/4674816f56757dbd99b297cb5647f2520df08db1

Fixes:
https://autobuild.buildroot.net/results/130/13084ca4df5ae91d72f46ef51873676b05398ec9/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/psimd/psimd.hash | 2 +-
 package/psimd/psimd.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/psimd/psimd.hash b/package/psimd/psimd.hash
index 5692e79bd6..69481438e4 100644
--- a/package/psimd/psimd.hash
+++ b/package/psimd/psimd.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  f6c4dab91ae9a03b3019e7cab0572743afd0e1b6e75b97fcca50259c737c924e  psimd-072586a71b55b7f8c584153d223e95687148a900.tar.gz
+sha256  8934a8dff062663331a17588dfb771940be9d22887596c8ca77e25026c2adc6f  psimd-4674816f56757dbd99b297cb5647f2520df08db1.tar.gz
 # License files, locally calculated
 sha256  984ce1e0b8ee89d234e28b960381f240e03a07a8031f35012f9c3256f56964e2  LICENSE
diff --git a/package/psimd/psimd.mk b/package/psimd/psimd.mk
index be0090a32f..cf6562a3f4 100644
--- a/package/psimd/psimd.mk
+++ b/package/psimd/psimd.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PSIMD_VERSION = 072586a71b55b7f8c584153d223e95687148a900
-PSIMD_SITE = $(call github,Maratyszcza,psimd,$(PSIMD_VERSION))
+PSIMD_VERSION = 4674816f56757dbd99b297cb5647f2520df08db1
+PSIMD_SITE = $(call github,snest,psimd,$(PSIMD_VERSION))
 PSIMD_LICENSE = MIT
 PSIMD_LICENSE_FILES = LICENSE
 PSIMD_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
