Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18CA6D3E2BB
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 19:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD2DC40345;
	Mon, 28 Oct 2024 19:39:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WAMGhT6NTE3R; Mon, 28 Oct 2024 19:39:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DFD240391
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DFD240391;
	Mon, 28 Oct 2024 19:39:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C3FEBAEE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 19:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0C4E40558
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 19:39:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yxLn3s_M5Ssf for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 19:39:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6E87E40315
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E87E40315
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6E87E40315
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 19:39:17 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02c6.dip0.t-ipconnect.de [91.58.2.198])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8227BA4C0ED0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:39:15 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59534)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t5Va6-0000000050c-39gL
 for buildroot@buildroot.org; Mon, 28 Oct 2024 19:39:15 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 28 Oct 2024 20:39:15 +0100
Message-Id: <20241028193915.787455-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1730144355;
 bh=k/eRu5XrnW0gQzSX+dvp59JsfGkt+5JuC23zopY9LkY=;
 h=From:To:Subject:Date:From;
 b=mI1l5M1bXH5xzBd1GHrDL/5cOM1Cp+IR+O1vtO3uAyIOy3ajpzRkwlA3HP+vxjexO
 PQHtcuoiBj5aB9X8OXyVy8kjhbKTD6+HUeKWInnQsMXjoVrYHuRotBfGbRtzezDg/L
 AZqpHrVPB9+/MCVr6d87GvKLKbUNsTBqbsiQR6qPdpysnw4gcLS6NYCFOHas2iM0uY
 0iTPTpMQY/gsWah/5csK2Pja+MbmT2UfEHnrpp4VXXqu9SVRMxDccaBJtfEb6FxKXx
 ZIecvFS19BGgRa2KlLGH86iz6SmYXMXMTkBeVyTKesEu2lG9RH2ho4Mp517iiN3iDm
 VUQSUj5WU7B9A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=mI1l5M1b
Subject: [Buildroot] [PATCH 1/1] package/libpng: fix arm build
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

Bumping libpng to 1.6.44 with buildroot commit
583bb434ffe1eec0dbf6887dd719c3f41a6253e9
causes a build failure on arm due to the upstream removal of
the ASM implementation of ARM Neon optimizations.

Remove the corresponding configure options to fix the build error.

Fixes:
http://autobuild.buildroot.net/results/021/02158525203d8c7f16a4a32637d44d6c87b7f333/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libpng/libpng.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 3e7fc42d82..09b4494909 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -17,12 +17,6 @@ HOST_LIBPNG_DEPENDENCIES = host-pkgconf host-zlib
 LIBPNG_CONFIG_SCRIPTS = libpng$(LIBPNG_SERIES)-config libpng-config
 LIBPNG_CONF_OPTS = --disable-tools
 
-ifeq ($(BR2_ARM_CPU_HAS_NEON)$(BR2_aarch64),y)
-LIBPNG_CONF_OPTS += --enable-arm-neon
-else
-LIBPNG_CONF_OPTS += --disable-arm-neon
-endif
-
 ifeq ($(BR2_X86_CPU_HAS_SSE2),y)
 LIBPNG_CONF_OPTS += --enable-intel-sse
 else
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
