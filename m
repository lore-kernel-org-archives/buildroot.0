Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731E8C5DF66
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 20:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FBAE405F9;
	Sun, 16 Aug 2026 20:32:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7J7IAo2YCD5S; Sun, 16 Aug 2026 20:32:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F174F405F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786912345;
	bh=WLtkIRmO2g9hDtT8OkCF0kVqLCapLPtNMfTIveD7n70=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=GFFrGyk0MUgkDEE76ITAVy1FBtf2zCpuu/oksHU4My6E2BoxD4DhiR2WvHQYYxDPn
	 oqfbowreaotuGmX+VbLIgFy2UZUV7/vNwwc7f0BgvtdtGQheYqlg1cruFMXpzA/vDz
	 kidJ4SdvQFYdWOrtKTqBHj7FSqnws76wwI8BkneIMbT3ZBCHtQaQlMJCFfCgS7pXD/
	 8KAqcxftxFsCtBHqshQ6iGVFYnTbqdASSkhk2ZUesgrqUe4ErXUBfcM+DoO1eEbJ9/
	 b2iwrq96CPqSXzTLj2zsT5HlIPjSMtzEIJSHX6QItS1W4V32NjsV3AHkQJRPutZWp3
	 2RwNLB6WfJQcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F174F405F5;
	Sun, 16 Aug 2026 20:32:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 41A5B147
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 20:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 205C380CAB
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 20:32:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kwrHmTCCZHAk for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 20:32:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 15D4B80C81
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15D4B80C81
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Gen+N4+f
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 15D4B80C81
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 20:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1786912327;
 bh=8gwOArZXmsN8unelVlEEqZW8Aw4GFVmji68VRZsd9O0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Gen+N4+fwk7UB1wuTDLb+0oQzJ/OnjOZsVS+qbEc2HxG4J+nzXrHsvcfPcvwJKT4A
 NXxkL5L0CowVFjUoWe6HBBrLKyqyx83/G2PJl6d7J+XF/0VklWUV66+kjwp82Crg7V
 Hib1jKQuYIOeOMNZrQ8Co8Gs777m2A4VXs6C/OXszNK+R1YokgZiXwGpz8R4+FF0ua
 ByMupj7xWmTIGEegkgVwgXPXLnokBPhugUfUnQZzgFtPxJ6mhwSBpfYNrR5Jbkkj0r
 udCjk6Ujn1hk5MBNBwTGqtKymsgCrl0FuFek5PqjvpDmczPS15uVp82MBg1OC3gkd7
 FoLQT21ofizRQ==
Received: from fli4l.lan.fli4l (p4fd6cf91.dip0.t-ipconnect.de [79.214.207.145])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CF34BA4C4D88;
 Sun, 16 Aug 2026 22:32:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53480)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wvhWZ-000000002MC-2LnF;
 Sun, 16 Aug 2026 20:32:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 16 Aug 2026 22:32:04 +0200
Message-ID: <20260816203207.3980846-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260816203207.3980846-1-bernd@kuhls.net>
References: <20260816203207.3980846-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 2/5] package/docker-engine: security bump to
 version 28.5.2
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
Cc: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/moby/moby/releases/tag/v28.5.2
Fixes CVE-2025-31133, CVE-2025-52565 & CVE-2025-52881.

https://github.com/moby/moby/releases/tag/v28.5.1
https://github.com/moby/moby/releases/tag/v28.5.0
https://github.com/moby/moby/releases/tag/v28.4.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/99b74ab8c322d7aacf9b9bee370fc273a0dc7fa5

 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 7f305b6880..32bdb45ef5 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3727c8963ab4bcff12291e99e4d4a6b9a29ace5236fd245717bbff648f15f8cd  docker-engine-28.3.3-go2.tar.gz
+sha256  0e450c03c536a1304ba8fd26ca4c4ff96fac62182fd042fec90ffdf4a0969d40  docker-engine-28.5.2-go2.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 2df260e1e5..bf2dc588fb 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 28.3.3
+DOCKER_ENGINE_VERSION = 28.5.2
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
