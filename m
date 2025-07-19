Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF9CC83F27
	for <buildroot@archiver.kernel.org>; Sat, 19 Jul 2025 10:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C66A161B14;
	Sat, 19 Jul 2025 10:08:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s4DFR2srW_kN; Sat, 19 Jul 2025 10:08:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05903613EC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05903613EC;
	Sat, 19 Jul 2025 10:08:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E8196DA
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 10:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD9A78458B
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 10:08:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mCSAsoqB27C1 for <buildroot@buildroot.org>;
 Sat, 19 Jul 2025 10:08:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9924484581
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9924484581
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9924484581
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 10:08:51 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:656e:cf44:475c:a8d2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 1BC8EB005A2;
 Sat, 19 Jul 2025 12:08:47 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sat, 19 Jul 2025 12:08:32 +0200
Message-ID: <20250719100832.8929-1-ju.o@free.fr>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752919728;
 bh=WkdlOFe3D64n/GzNGkWtZ5Yco3UKFGQB398Sgt8TM/4=;
 h=From:To:Cc:Subject:Date:From;
 b=iTQV5AWLetIhPCaebkFjTLzyzojz8iQnbDAZlHbN/wsh/PLrhV6UzWOMjnH1O56yT
 Cr+ycr9h5x0x30RZyrj8ztm2IDl2KaSK3eMKcoPLf72yZJqEscMasJBvOVUo+4Rdya
 RK/0SqGChT1uOOqfkKw6KPeWf4Dz+xgVsiywIW0MuCWLSAic+F6TiJrEEzCBftUzL8
 RD4jmVJncR1RYWYo5N4tOQJYKpmDk3X9ekFpKKNx81ig8EuPc34Cv6WwDrPSpH035+
 4YDHh7WmJLo8JSsZzb3V3bRPoeRdK9j4x7Gph3Z8LVJyCgmK/fN6RLKxzZIJTzv4Xm
 lcK8SzgH24U4g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=iTQV5AWL
Subject: [Buildroot] [PATCH 1/1] package/berkeleydb: fix build with host
 gcc-15.x
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

Commit [1] fixed berkeleydb target build with gcc-15.x.
The host variant package also fails when building with host gcc-15.x.

This commit fixes the issue by replicating the same fix for the package
host variant.

Fixes:
https://autobuild.buildroot.org/results/a8051600ab95a63c852960f8dace757b16c665f0/

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/c1d422edde19d07d6406705b1a4b059125dba689

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/berkeleydb/berkeleydb.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
index b2d4b689f3..93f04c1c7a 100644
--- a/package/berkeleydb/berkeleydb.mk
+++ b/package/berkeleydb/berkeleydb.mk
@@ -51,6 +51,7 @@ endef
 define HOST_BERKELEYDB_CONFIGURE_CMDS
 	(cd $(@D)/build_unix; rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
+		CFLAGS="$(HOST_CFLAGS) -std=c99" \
 		../dist/configure $(QUIET) \
 		--prefix=$(HOST_DIR) \
 		--with-gnu-ld \
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
