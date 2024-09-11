Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21928EE499D
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 13:05:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC93A812F6;
	Wed, 11 Sep 2024 13:05:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wmsWf7eK9IrE; Wed, 11 Sep 2024 13:05:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49461812E7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49461812E7;
	Wed, 11 Sep 2024 13:05:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 529121BF342
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 13:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4125040CCF
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 13:05:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pJ7XUSbT0Bdt for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 13:05:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=188.165.44.123;
 helo=mail1.insia.net; envelope-from=guillaume.chaye@zeetim.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 26B3340480
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26B3340480
Received: from mail1.insia.net (mail1.insia.net [188.165.44.123])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 26B3340480
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 13:05:07 +0000 (UTC)
Received: from smtp.insia.net (unknown [192.168.1.24])
 by mail1.insia.net (Postfix) with ESMTP id C6D183F82F;
 Wed, 11 Sep 2024 15:04:59 +0200 (CEST)
Received: from sb-dev-build.insia.net. (gw-servers.insia.net [192.168.1.1])
 by smtp.insia.net (Postfix) with ESMTP id 39CDC5F497;
 Wed, 11 Sep 2024 15:00:56 +0200 (CEST)
From: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
To: buildroot@buildroot.org
Date: Wed, 11 Sep 2024 15:04:07 +0200
Message-Id: <20240911130407.2925548-2-guillaume.chaye@zeetim.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240911130407.2925548-1-guillaume.chaye@zeetim.com>
References: <20240911130407.2925548-1-guillaume.chaye@zeetim.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=zeetim.com; s=mail1; t=1726059899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cZSOsYAG2SaG4pyjwzBQE5cfCQWP1yQ8Y81k1q3oWm0=;
 b=kZBv5xp96hCwAhmz4aqSizY7jlwPeTpHS5TAK4UXP27Euv5t4ZkNnSbr8FVd7l5M5BsYrT
 omXf4FWDk4rWJ0+US5aDBL3rr8+dgmfzSxKMmemJkw6Yv7yID2NsvQh5I6kjI3HuwmSJ2c
 c+e7dNos6vhcP8AjM2OmFhQC3nGOQj9RIb/0eI1RnKDqiamtamRKrvgF15+irwjkHae1I/
 hHO8ouz2IqxLsx/BqQq/lD+DjAUlA9qtJdvq4iWKK+qUvngZD0+FurbHMBR2lgGRY1fI9u
 tVv/qBrHbk80+WKF5X7h4ka6+uTJBFTUOfxpev3gWEAN9mjoEjt9YvskiBxdjQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zeetim.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=zeetim.com header.i=@zeetim.com header.a=rsa-sha256
 header.s=mail1 header.b=kZBv5xp9
Subject: [Buildroot] [PATCHv2 2/2] package/librsvg: Add support of SVG in
 gdk-pixbuf
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Guillaume GC. Chaye <guillaume.chaye@zeetim.com>
---
 package/librsvg/librsvg.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
index 81a6667817..6b9200084b 100644
--- a/package/librsvg/librsvg.mk
+++ b/package/librsvg/librsvg.mk
@@ -12,7 +12,7 @@ LIBRSVG_INSTALL_STAGING = YES
 LIBRSVG_CONF_ENV = \
 	LIBS=$(TARGET_NLS_LIBS) \
 	RUST_TARGET=$(RUSTC_TARGET_NAME)
-LIBRSVG_CONF_OPTS = --disable-pixbuf-loader --disable-tools
+LIBRSVG_CONF_OPTS = --enable-pixbuf-loader --disable-tools
 HOST_LIBRSVG_CONF_OPTS = --enable-introspection=no
 LIBRSVG_DEPENDENCIES = cairo host-gdk-pixbuf gdk-pixbuf host-rustc libglib2 libxml2 pango \
 	$(TARGET_NLS_DEPENDENCIES)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
