Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D3CE66886
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 11:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3783340836;
	Sun, 21 Dec 2025 11:57:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WuKGrqhqnOgp; Sun, 21 Dec 2025 11:57:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D68D40839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766318252;
	bh=WtcXfJfUqHERDLMm6bxARvS/TE51BdEue6lrLDpfq5k=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WjGMIqfIorYr7I1eEOeKoqTUemciGS1zGp4oKwpec3WhRgQFTnFe1WS3ulzshwPgd
	 pC1xGV9pZLHPZacpPXBhk5iX9DXKcxdiY7RAJBfCi/NZ0eYjb5+k3WMyCfDhzsanz6
	 7FPNc+c22RQV5zfF86nbgepAk0f1AF6tCmTLK80zsnzeCobdOqm3fS22Sgxz+ao/XH
	 ekS8ZEuQvkZfZ3rVT6TvPZt8SI50S5R2tlmFOQQ/qMCWUxy0BmOh/dcwPFtrsqIDdW
	 utbWtuoDnpUlxHZoXbxhBB2yQfLmAqRAo5m3vTXJS47ACxKo9GuAHUzmUgaje9DR/V
	 kGue3wLMBi6dw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D68D40839;
	Sun, 21 Dec 2025 11:57:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 507421A6
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 11:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3724E60BDE
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 11:57:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id abqdGY-07G9j for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 11:57:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 40C4C60B5D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40C4C60B5D
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 40C4C60B5D
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 11:57:29 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a0d:e487:412e:ace1:8cb:5573:7181:a54f])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id CE8EB6013B;
 Sun, 21 Dec 2025 12:57:21 +0100 (CET)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, Sergio Prado <sergio.prado@e-labworks.com>
Date: Sun, 21 Dec 2025 12:57:07 +0100
Message-ID: <20251221115708.256386-2-ju.o@free.fr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251221115708.256386-1-ju.o@free.fr>
References: <20251221115708.256386-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766318247;
 bh=D5aoePfYPBPOdPFg9W7iN2T+MfPfyOyl20SrW2nA6ZM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WM4alzI3B7JPTIXhPlEyGAHvH+3VT1GXi/+wCw1SdoLI67ts96Nr84o9knjjfjb2P
 m9NNgtozbOuTKJDX7EbxwX1JRfzWTPQw1eHJ+UvKJB7iL/HGwRaRCkBNxdDMqzoNsM
 90dY8jRiWkTuYCxqIIZramD6Z0LK6pdycBB5MeYAbGNgvqA2b4CsnonQz9+nWeHhhF
 IDFXNNX7KdGNnaQ6IpXQ4z1Mt/hAL6WP2upxfyMHo22pPkLOwPnIV8imOx6jap15G8
 nZV7gKGYnY2zxxlYyz7onhqck6vDqkwOywTQZWwwKXHGw4O4Db9xrYkqDSG7xA20n2
 JnLZy8r1ZFJmg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=WM4alzI3
Subject: [Buildroot] [PATCH 2/3] package/tio: bump version to 3.9
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

For release notes since 3.5, see:
https://github.com/tio/tio/releases

This commit updates the license hash, after a year update:
https://github.com/tio/tio/commit/f5740dbf3150bf292d77a450b9945d7870489192

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/tio/tio.hash | 6 +++---
 package/tio/tio.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/tio/tio.hash b/package/tio/tio.hash
index d1caeeebc6..0d9acae9d6 100644
--- a/package/tio/tio.hash
+++ b/package/tio/tio.hash
@@ -1,5 +1,5 @@
-# From https://github.com/tio/tio/releases/download/v3.5/tio-3.5.tar.xz.sha256sum:
-sha256  efd3e9a406f827ac22d4157e345079dde15ee5a948b24156561d6c97a54e6ec0  tio-3.5.tar.xz
+# From https://github.com/tio/tio/releases/download/v3.9/tio-3.9.tar.xz.sha256sum:
+sha256  06fe0c22e3e75274643c017928fbc85e86589bc1acd515d92f98eecd4bbab11b  tio-3.9.tar.xz
 
 # Hash for license files:
-sha256  9248dee77ee136321f24556a96e07ff8f90461013941884a9defd0ac825ef131  LICENSE
+sha256  4c336df2e6334540d713e302281bcd35df3e03b05e4d4d62ef84bde8ae00eea9  LICENSE
diff --git a/package/tio/tio.mk b/package/tio/tio.mk
index 637a7bdd83..b5711d10ff 100644
--- a/package/tio/tio.mk
+++ b/package/tio/tio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIO_VERSION = 3.5
+TIO_VERSION = 3.9
 TIO_SOURCE = tio-$(TIO_VERSION).tar.xz
 TIO_SITE = https://github.com/tio/tio/releases/download/v$(TIO_VERSION)
 TIO_LICENSE = GPL-2.0+
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
