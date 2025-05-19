Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0622C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 15:04:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FDC94055E;
	Mon, 19 May 2025 15:04:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a0UHkJceB03E; Mon, 19 May 2025 15:04:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEE7F40563
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEE7F40563;
	Mon, 19 May 2025 15:04:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 90297D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 15:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 800EC40F33
 for <buildroot@buildroot.org>; Mon, 19 May 2025 15:04:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SNdoH_Qg57Vv for <buildroot@buildroot.org>;
 Mon, 19 May 2025 15:04:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A8FAC40BFD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8FAC40BFD
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A8FAC40BFD
 for <buildroot@buildroot.org>; Mon, 19 May 2025 15:04:16 +0000 (UTC)
Received: from charybdis.office.fixme.cloud (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id 52EDFE0029C;
 Mon, 19 May 2025 17:04:14 +0200 (CEST)
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: Florian Larysch <fl@n621.de>
Date: Mon, 19 May 2025 17:04:08 +0200
Message-ID: <20250519150409.25390-3-fl@n621.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519150409.25390-1-fl@n621.de>
References: <20250519150409.25390-1-fl@n621.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1747667054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PUrLfRwLYMav/6+Japsdkoj1pLpHTi1iWPlmf9ZHqh8=;
 b=Q89nq6F2wAw/es9WexQdhEjl113jwNHfNVoTbmi3A/XVT19JGHJsAUWFt34TgaSG429RQZ
 LH/O8VpdfBb3CmKlfcZZGtQjC0wyih+nFXXWD6RmqVsIuFO4tGb1MJo3Zgeg2/vkNyoyvy
 C0qct0LUDdxV1flkjNfvhUoAhCLagX0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=Q89nq6F2
Subject: [Buildroot] [PATCH 2/2] package/casync-nano: enable OpenSSL
 ChaCha20 support
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

When building against OpenSSL, ensure the ChaCha20 algorithm is enabled,
which is needed by this package.

Fixes: https://autobuild.buildroot.org/results/3cb/3cb58229dfb47e79c50b4b52ca57b3f56a945ed7

Signed-off-by: Florian Larysch <fl@n621.de>
---
 package/casync-nano/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/casync-nano/Config.in b/package/casync-nano/Config.in
index 8ba80e4ce6..e0e555eda3 100644
--- a/package/casync-nano/Config.in
+++ b/package/casync-nano/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_CASYNC_NANO
 	bool "casync-nano"
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_CHACHA if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_ZSTD
 	select BR2_PACKAGE_LIBCURL
 	help
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
