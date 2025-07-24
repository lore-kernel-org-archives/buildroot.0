Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C65C87FC5
	for <buildroot@archiver.kernel.org>; Thu, 24 Jul 2025 20:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A34A56079A;
	Thu, 24 Jul 2025 20:24:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5I2MqpEQIGzw; Thu, 24 Jul 2025 20:24:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0240607AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0240607AE;
	Thu, 24 Jul 2025 20:24:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 71851115
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 20:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6304641B6B
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 20:24:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eNzYXG7A0n5a for <buildroot@buildroot.org>;
 Thu, 24 Jul 2025 20:24:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7AF7541A2B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AF7541A2B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7AF7541A2B
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 20:24:18 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:656e:cf44:475c:a8d2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id B3233B00573;
 Thu, 24 Jul 2025 22:24:15 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Thu, 24 Jul 2025 22:24:06 +0200
Message-ID: <20250724202406.958337-1-ju.o@free.fr>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753388656;
 bh=si10CiLbE2HAQzTLOmZm9OmQdV2wjWyb6sPp/b/MD4g=;
 h=From:To:Cc:Subject:Date:From;
 b=jUOfwyhc4g8egN7yLU1dpqf+pPJwpU38gMR1K82yZSowc4qlefLdeDt7OlchZneWP
 SD0ogdnf79MB2fsUq/sb/mOZnqwdXIJbi8Bd6GoLVNYZ6aCh8zF7+YaKwgfbO8lJId
 nQEc8/sBnn3jlGPoGZ7XPqiCxy067/a6QZh8RnrpWIj1TLzB+nYkUNdRfv/IwdDTTz
 c1Rv5m/mK4/GR8N6M7fEjCCqlfsk6IAA8+uXwTF9bfNiLUGqs9iQIwlsJLmEXhev+n
 rTOqmShnnjZrQ4AvQ8GOsJ5csqM0KqqrbRf1XnyrUsUWiEThiqJQDEg3yewNeGG194
 nsy9c1d5NvWtg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jUOfwyhc
Subject: [Buildroot] [PATCH v2 1/1] package/berkeleydb: fix build with host
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
Changes v1 -> v2:
change -std=c99 to -std=gnu99 to align fix with target variant
---
 package/berkeleydb/berkeleydb.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
index b2d4b689f3..6c487400ae 100644
--- a/package/berkeleydb/berkeleydb.mk
+++ b/package/berkeleydb/berkeleydb.mk
@@ -51,6 +51,7 @@ endef
 define HOST_BERKELEYDB_CONFIGURE_CMDS
 	(cd $(@D)/build_unix; rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
+		CFLAGS="$(HOST_CFLAGS) -std=gnu99" \
 		../dist/configure $(QUIET) \
 		--prefix=$(HOST_DIR) \
 		--with-gnu-ld \
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
