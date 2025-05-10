Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745BBC3ABC9
	for <buildroot@archiver.kernel.org>; Sat, 10 May 2025 22:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4593D408B5;
	Sat, 10 May 2025 22:12:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vi7YTVLnT_Py; Sat, 10 May 2025 22:12:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 729AB408DD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 729AB408DD;
	Sat, 10 May 2025 22:12:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 77FFBE0
 for <buildroot@buildroot.org>; Sat, 10 May 2025 22:12:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E687400EA
 for <buildroot@buildroot.org>; Sat, 10 May 2025 22:12:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O9vjt4tw3P5t for <buildroot@buildroot.org>;
 Sat, 10 May 2025 22:12:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DBF68403D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBF68403D2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DBF68403D2
 for <buildroot@buildroot.org>; Sat, 10 May 2025 22:12:50 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a07c5.dip0.t-ipconnect.de [91.58.7.197])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E9DB5A4C0938
 for <buildroot@buildroot.org>; Sun, 11 May 2025 00:12:33 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60650)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uDsQr-000000003zt-1imP
 for buildroot@buildroot.org; Sat, 10 May 2025 22:12:33 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 May 2025 00:12:33 +0200
Message-Id: <20250510221233.2416832-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250510221233.2416832-1-bernd@kuhls.net>
References: <20250510221233.2416832-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1746915153;
 bh=+EAeLxO36XsE9I5zcptffq9b19v4o657dwXbWpy7u/Q=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=X5akrvd4a16++k/l9SNuKkzwyuZ8nbDbZb9ydnZgzXa7Q0wju+cZmD3rMhxSWeWb1
 ymInIi/4yWzprIBvoCAwK+nHqCvuSF2X+QN7ibJUaHFfCFcp6swIzzCAbSW5qRO0+r
 OzkXCteYmz9bhrhYLnHzAhrvf2pgQqHYf6GUIr3u6dstBzbeZYLYrxyvMVzWRrdn+g
 3zhTrZNpvroDx/vZ/b3OKm1PHYZQXSLRbaEjhN1LfJHrtevXCOctbsbGqG535M+HCY
 h09rmywD1c2RWOve7WYZIlYJPY411Ls2iF2um0iCWhtb9CPpkqKp460l5vviKIbWvn
 oFhycRuo3ERig==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=X5akrvd4
Subject: [Buildroot] [PATCH 2/2] package/kodi-pvr-waipu: bump version to
 21.10.3-Omega
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
 package/kodi-pvr-waipu/kodi-pvr-waipu.hash | 2 +-
 package/kodi-pvr-waipu/kodi-pvr-waipu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
index a0349b4d77..4e02aee58c 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fb8f25f28023907332d3ebf554c026c6e36e3e78f688f462439c152de676734c  kodi-pvr-waipu-21.10.1-Omega.tar.gz
+sha256  bbf7fed04150f2e680eeb6e51ab5cdc52b4381702fbe0643fc1f107739f0e2fa  kodi-pvr-waipu-21.10.3-Omega.tar.gz
 sha256  4202d4fb329f58c83ba921b56d7071e37f7df3f15b3820a3a04ef8eee49f54d2  pvr.waipu/LICENSE.txt
diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
index 54080f213e..b83f6eb3f9 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_WAIPU_VERSION = 21.10.1-Omega
+KODI_PVR_WAIPU_VERSION = 21.10.3-Omega
 KODI_PVR_WAIPU_SITE = $(call github,flubshi,pvr.waipu,$(KODI_PVR_WAIPU_VERSION))
 KODI_PVR_WAIPU_LICENSE = GPL-2.0+
 KODI_PVR_WAIPU_LICENSE_FILES = pvr.waipu/LICENSE.txt
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
