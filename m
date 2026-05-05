Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01DEACD3427
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 13:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0C6681371;
	Tue,  5 May 2026 13:41:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pcywSICf21WM; Tue,  5 May 2026 13:41:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B58B081374
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777988481;
	bh=kuzhSSL/trP22rQmLrHHhIw3KJIfKv3HN/wO58io0HA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jSqQO4HtWJsyC45OJ0ryx3vwC7nE0Qp+jvhp5SSc9XdGCrljl9FHMIEBfnda0pHe5
	 d873cAB4oxXephN2jyQDgcBlqrkYx50J2BUUAP33pr4NeMY64c/CgwdJswHe8TcLaQ
	 RxTCQgyuTmM6vlGAezLVxh+shGq5D/Hs7/asYaf3K+2uJfA6wnvwe90+lg/k693xBx
	 G5voimEYoyrA7tePGVIlVy13p2gV0tjd4fP2lXFNGDi5hsv/5VCfz7aJnTKB2BjbIY
	 /ZENpXWjPgQYwnpc3u9j9BTQwX9QcwXi4ZZ/TH5epxUoh/J9QIKpgZcVcPs5s9+SSS
	 ZT5ug1zfzeGqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B58B081374;
	Tue,  5 May 2026 13:41:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CEDCC2A8
 for <buildroot@buildroot.org>; Tue,  5 May 2026 13:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC25A81372
 for <buildroot@buildroot.org>; Tue,  5 May 2026 13:41:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ESjsSSK6lIF7 for <buildroot@buildroot.org>;
 Tue,  5 May 2026 13:41:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BC73C81371
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC73C81371
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC73C81371
 for <buildroot@buildroot.org>; Tue,  5 May 2026 13:41:18 +0000 (UTC)
Received: from bubutux.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 26ACE2C88D23
 for <buildroot@buildroot.org>; Tue, 05 May 2026 15:41:16 +0200 (CEST)
To: buildroot@buildroot.org
Date: Tue,  5 May 2026 15:40:55 +0200
Message-ID: <20260505134056.2212740-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1777988476; bh=2C81wNPgB3YVtIZ4ZUdUETZvD7UYXSUFuCXNpVf2QFA=;
 h=From:To:Subject:Date;
 b=W32B9vt6Vy8n0m3nx7SaAhJeKhNK8kj0dPeyDepzX0vWT9dB8qY6KfZQubPFccLni
 uQfL7QwkvqcVCfFvQUgop3wYq6CIebka2PPZ6SF09a79xdZjjeqfh8rrjGW/EOpu1Y
 3VHiUjkHcfLOeWF4+lgBqfl2ESEMzUaCwmwyo/OMwroK9+pGhVXKU1YD+BbEHKstF2
 MDjzxPKRlVuv3gSpskXSMp6EtFbrviPfiaLBJAsjw44o9nG1HqGCvo4syrOJUlqpe6
 8fgK/TsaFV+jeqS2WfSiJ+ScN6ERBoiyDL3m7CtN31DslD+BP8tNlewT9yyiqVK4tu
 EaZ2vhUt0Ndqg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=W32B9vt6
Subject: [Buildroot] [PATCH] package/mpc: bump to 1.4.1
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

Changes:
https://gitlab.inria.fr/mpc/mpc/-/blob/b8c90939ef1dc32cfbaa1823fe9e676ad5515ef4/NEWS#L1-16

Releases changed from tar.gz to .tar.xz format.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/mpc/mpc.hash | 3 ++-
 package/mpc/mpc.mk   | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/mpc/mpc.hash b/package/mpc/mpc.hash
index f69a5b66ca..c899cb9978 100644
--- a/package/mpc/mpc.hash
+++ b/package/mpc/mpc.hash
@@ -1,3 +1,4 @@
+# Locally calculated after verifying GPG signature
+sha256  91204cd32f164bd3b7c992d4a6a8ce6519511aadab30f78b6982d0bf8d73e931  mpc-1.4.1.tar.xz
 # Locally calculated
-sha256  ab642492f5cf882b74aa0cb730cd410a81edcdbec895183ce930e706c1c759b8  mpc-1.3.1.tar.gz
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING.LESSER
diff --git a/package/mpc/mpc.mk b/package/mpc/mpc.mk
index 467bed4dbe..b12af613a4 100644
--- a/package/mpc/mpc.mk
+++ b/package/mpc/mpc.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-MPC_VERSION = 1.3.1
+MPC_VERSION = 1.4.1
 MPC_SITE = $(BR2_GNU_MIRROR)/mpc
+MPC_SOURCE = mpc-$(MPC_VERSION).tar.xz
 MPC_LICENSE = LGPL-3.0+
 MPC_LICENSE_FILES = COPYING.LESSER
 MPC_INSTALL_STAGING = YES
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
