Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA2AE677EE
	for <buildroot@archiver.kernel.org>; Sat,  2 Nov 2024 07:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1013281F93;
	Sat,  2 Nov 2024 07:43:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id In_fH2yNQn7Q; Sat,  2 Nov 2024 07:43:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 147E381F90
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 147E381F90;
	Sat,  2 Nov 2024 07:43:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E78B112A
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 07:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1CAF341214
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 07:43:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wvvqbdgt9iFC for <buildroot@buildroot.org>;
 Sat,  2 Nov 2024 07:43:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 83EDD41208
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83EDD41208
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 83EDD41208
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 07:43:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0255.dip0.t-ipconnect.de [91.58.2.85])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 09ED2A4C10C5
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 08:43:19 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49968)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t78n0-000000003Rj-1leo
 for buildroot@buildroot.org; Sat, 02 Nov 2024 07:43:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  2 Nov 2024 08:43:18 +0100
Message-Id: <20241102074318.5159-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1730533399;
 bh=KMWVN3jrYtqSz5wGkXwCqdYKPLrywPSyZsZuY7LMscU=;
 h=From:To:Subject:Date:From;
 b=MV/eV2zEVeA7X8aA7EVxf8NZsBLusuCyOB6jz6X3JFT18c3U6lZ4QgU+BzkupBqBo
 2QCvbmYIKUSKDhGbPxngLWPtFjs53rpo1577m2yTQNA9cKNeqTlBdvkCMxejFSZ5pw
 DwU3kGLdUvqO0l9+7lOj8wdcGkFnQ5fV8fkpe4dA6PpOCMu1/R7ULEZA8pJf4YRj4Z
 NyGgFS9YunsTm/QKKSxwc94iZbXUBDnD8jJ42LixzmgTTM/qGwMmwCGthkJOim8LXg
 abRE9qhYPOGsiD2KG7H2Yurfgyt8laHDCk7elOYnDi3weghN9fJkslIAu729vYwexc
 USoyIa5FgdHMg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=MV/eV2zE
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
causes a build failure on arm.

Gentoo solved the problem by removing --enable-arm-neon, for details see
https://bugs.gentoo.org/939819#c3
https://github.com/pnggroup/libpng/issues/598#issuecomment-2360338728

Fixes:
https://autobuild.buildroot.org/results/c67e3101005ef7b4d0eaf6eb8a93f22446643dbd/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libpng/libpng.mk | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 9761993d79..09b4494909 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -17,14 +17,6 @@ HOST_LIBPNG_DEPENDENCIES = host-pkgconf host-zlib
 LIBPNG_CONFIG_SCRIPTS = libpng$(LIBPNG_SERIES)-config libpng-config
 LIBPNG_CONF_OPTS = --disable-tools
 
-ifeq ($(BR2_aarch64),y)
-LIBPNG_CONF_OPTS += --enable-arm-neon
-else ifeq ($(BR2_ARM_CPU_HAS_NEON):$(BR2_ARM_SOFT_FLOAT),y:)
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
