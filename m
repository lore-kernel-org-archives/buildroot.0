Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 676EED58E78
	for <buildroot@archiver.kernel.org>; Mon,  2 Mar 2026 08:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E7F24189F;
	Mon,  2 Mar 2026 08:33:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5KwleRlKymtX; Mon,  2 Mar 2026 08:33:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32973417F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772440424;
	bh=HyjC08qkcXsOQggI3hkJp+SZcVEC/y7fm+5Lkl/l1+w=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AlBhJOF41L5DTxspGE8Svj+60D5iBpDEt7iTPGNlAkjmebrcxHVTgRi4ZZ45ULvFU
	 FoW98FPOD2vpxYgahRdfxik/SAPD7Uc5ZU5Nz5y/vbRYWdD3K8Ee1FK1x7YrilkApg
	 Dqvl+mIp5sP5GMVYBg6ypyovFMmhfDhc+FcRjC9LBF7ES/c5+THeZLMe3Gv9sGMiah
	 d64C0Eh6zBHy3M03geQhg4MGYjORovumXdUsba1Rlq1Z29MCX6JRRzTohny9Q5lgrC
	 bXJGcELh2a4aiX3U7+WkY1TJR/uGy1Uqf1+dh/6/AmoXctzwXt6qk6KUf348JDoaid
	 57qsqSgVWN8pw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32973417F9;
	Mon,  2 Mar 2026 08:33:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9911125B
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 08:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7ECB883C9B
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 08:33:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IG9Syb6wK1LZ for <buildroot@buildroot.org>;
 Mon,  2 Mar 2026 08:33:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D8AB583B69
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8AB583B69
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D8AB583B69
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 08:33:38 +0000 (UTC)
Received: from 91-154-227-245.elisa-laajakaista.fi ([91.154.227.245]
 helo=kodama) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vwyic-007nnB-P1; Mon, 02 Mar 2026 09:33:34 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 16c823a1;
 Mon, 2 Mar 2026 08:33:33 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Mon,  2 Mar 2026 10:33:31 +0200
Message-ID: <20260302083333.2907389-1-aperez@igalia.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fwNgFdqTCGk4Y3kTpXx3FdYlpmhcg6WNbSOto5IWAS4=; b=bV3tAXysiUpgbsh8pZFGZ5M8i5
 HJVVmHmcToLD8ACTgqwelWRYfAGbaMpGBlFrjKVTmgMI/AGIlqpHurdMUSwmb2DY7UkTONMIO/Vd7
 sdlIP9HOXT7sV5AsOxMLzx45McrVBmqBaUm0G5NBBiNtK1a7MBRgEX5JzN55b8gjEjB2zh6HwKFlz
 mK49O6cxGct8xDg+B8bvupOWZBbeSTdgxlyUXOosVV0cTECi9njfo4uJumGof4Ke67WZbCqyAj5Jg
 QEKSp47w2gVtPOH+qWMX9VGC+ei8+8hW/613i4arsGKDwYgfINx71D/VGNzxpkQTCPT08ngSVbWt4
 dmIR+UnA==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=bV3tAXys
Subject: [Buildroot] [PATCH] package/webkitgtk: bump to version 2.50.5
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

Fixes a number of crashes. Release notes:

  https://webkitgtk.org/2026/02/09/webkitgtk2.50.5-released.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/webkitgtk/webkitgtk.hash | 6 +++---
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 3c2f7aedbd..77bdc5485b 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,6 +1,6 @@
-# From https://www.webkitgtk.org/releases/webkitgtk-2.50.4.tar.xz.sums
-sha1  719c304539cecca945846700cefebc7339eb5924  webkitgtk-2.50.4.tar.xz
-sha256  d3bfa473845acfab72635bada5e0d134fda6792c5b95c5c5cd141b46125bd8e4  webkitgtk-2.50.4.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.50.5.tar.xz.sums
+sha1  e93f7efa9fbc7304cc159c35d8e76d7febab2515  webkitgtk-2.50.5.tar.xz
+sha256  8737631bac3e9c7ad3e5208f9370e076c09d9c45b39980021ce54edadcc6f94f  webkitgtk-2.50.5.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 161807bc5a..26c70ae6c8 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.50.4
+WEBKITGTK_VERSION = 2.50.5
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
