Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2EAED2F7EB
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 12:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5569484A02;
	Fri,  5 Dec 2025 12:19:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iGhlLYv7LTSr; Fri,  5 Dec 2025 12:19:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F7FC84A03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764937149;
	bh=kUYNZd8+C9gsODt/fRCfe6HLKuJ5PcEFAW0lbgV2eLY=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=MQqAIiIF/SC7NDMRUI34lSa9ZqKE5Fci23TpuVM+QkHFqLMwxofJb3MEoiIqDcI7U
	 s/09LiBN/QkQQLFzLLM42Qte4KbsIWivHOJuvKlfWiERai+YqNVGp+aj3y/hVAD9io
	 Hz0yk/zT6hwEijIiPN7CQ2wdlI40IUw7yDiyHCf7WVpVczrQ+qhJvM9f+rTSl1KfVe
	 01u5Q/7dKSgsQmo5I32C/XwUOyyrOAjbLcGNhqAirnpnQOv7TzN+kcluzMfusKeE4G
	 19NiboGSCTeraAz7+TRH4yrSuqgh48Cdt7OwPtEmBR2NerW6pk77XIFerZcotI/ppd
	 SNMHcLCpFMbTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F7FC84A03;
	Fri,  5 Dec 2025 12:19:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 87591199
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 12:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DC2484A02
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 12:19:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GDGYO0Wtg9Rv for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 12:19:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2A7B884A03
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A7B884A03
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A7B884A03
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 12:19:06 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 771C62C89475;
 Fri, 05 Dec 2025 13:19:03 +0100 (CET)
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  5 Dec 2025 13:19:04 +0100
Message-ID: <20251205121905.578982-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1764937143; bh=aGRAtGaOM9ajtOr6Rdez+7CLWr4A5x9w2Soc+zn0NSg=;
 h=From:To:Cc:Subject:Date;
 b=NrkxuXReKV0fDfg1ShVKXZ0laOVkba8ax1YuiH+ee9A5ydOPvlZ0N50uHAR1MmnIZ
 jcxYKIDGDu8LNi7Kex/iCUGEcta65yM406upEQ7rM8DDkogwH/p/N62EygrkSWn8Yj
 cTLlZZnqegwExnpMcoeAeBkbrf7n92N3LhF8BSYxNyJuAaDHbHU5DdaRmvdf+kO655
 k1cazEXq4IEONqnbnhS/KLemlXEGIADc/5d9Ym2gLTuN5hieNWpOkEQgvrCPBeOrQ7
 r7ECoS5LweHuOstzl9l9FoaLmiy5PMbWvlcNvtpGpQm5PvvE+v96G+MVwUJ9Cl0xBy
 BMriox0tlzBLQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=NrkxuXRe
Subject: [Buildroot] [PATCH] package/libglib2: bump to 2.86.2
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release Notes: https://gitlab.gnome.org/GNOME/glib/-/releases/2.86.2

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/libglib2/libglib2.hash | 4 ++--
 package/libglib2/libglib2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index e4b9a7c5ae..6698db8389 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.86/glib-2.86.1.sha256sum
-sha256  119d1708ca022556d6d2989ee90ad1b82bd9c0d1667e066944a6d0020e2d5e57  glib-2.86.1.tar.xz
+# https://download.gnome.org/sources/glib/2.86/glib-2.86.2.sha256sum
+sha256  8a724e970855357ea8101e27727202392a0ffd5410a98336aed54ec59113e611  glib-2.86.2.tar.xz
 # License files, locally calculated
 sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 0957d946bc..1c5109f4ec 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGLIB2_VERSION_MAJOR = 2.86
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).1
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).2
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = https://download.gnome.org/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
