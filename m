Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E61A6CD5BD4
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 16:24:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67A1760A82;
	Thu,  5 Sep 2024 16:24:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Dr-LKoRAscW; Thu,  5 Sep 2024 16:24:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6010260A87
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6010260A87;
	Thu,  5 Sep 2024 16:24:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 416A71BF39D
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 16:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5471E801CC
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 16:24:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7mOYY99RlDKN for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 16:24:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=188.165.44.123;
 helo=mail1.insia.net; envelope-from=guillaume.chaye@zeetim.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 84CD380426
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84CD380426
Received: from mail1.insia.net (mail1.insia.net [188.165.44.123])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 84CD380426
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 16:24:33 +0000 (UTC)
Received: from smtp.insia.net (unknown [192.168.1.24])
 by mail1.insia.net (Postfix) with ESMTP id 0FC5A3F9C3;
 Thu,  5 Sep 2024 18:24:26 +0200 (CEST)
Received: from sb-dev-build.insia.net. (gw-servers.insia.net [192.168.1.1])
 by smtp.insia.net (Postfix) with ESMTP id 8C1345F497;
 Thu,  5 Sep 2024 18:20:54 +0200 (CEST)
From: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
To: buildroot@buildroot.org
Date: Thu,  5 Sep 2024 18:24:02 +0200
Message-Id: <20240905162402.1320569-1-guillaume.chaye@zeetim.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=zeetim.com; s=mail1; t=1725553466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=PVMxD48fAaGagnyLIEXwXi6xoNBnHCVgm4rYBGDWyAU=;
 b=dkc5rQwoQ/KauwZu0T6I6/58NdbTzHyFyyUxJSTThp6xJ0NP8YFXf6r4Fjq6J7P0UlkG0t
 /ZRAiacHV4ii7t/zyLbb9BAhlpUlW3aiH5PPSwOmbSxeDa2X3Zv8V2ibtdv7BZHCojk9GT
 x6wTtnKDhhFHOuo1MpNM4QBmHwVtW5tLiuQTmLCyo+z6STa9tZNZXIzG1hmLES3NOwOixM
 y1SuGi49Sooj4/Bn6VSVeboF7HAf1hmxcWAgo5bv4Hc4AzmvcakVjQNEbQwpFUbQIN7yog
 5ZcKd1gYYvLPiqCH1wsKZ2eL/p9nemELmuv1mI7t6ta0h1EhcH9EJ2x8uTiijQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zeetim.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=zeetim.com header.i=@zeetim.com header.a=rsa-sha256
 header.s=mail1 header.b=dkc5rQwo
Subject: [Buildroot] [PATCH 5/5] package/librsvg: fix svg with gdk-pixbuf
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
 package/librsvg/librsvg.mk | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
index 81a6667817..0187218a98 100644
--- a/package/librsvg/librsvg.mk
+++ b/package/librsvg/librsvg.mk
@@ -12,7 +12,7 @@ LIBRSVG_INSTALL_STAGING = YES
 LIBRSVG_CONF_ENV = \
 	LIBS=$(TARGET_NLS_LIBS) \
 	RUST_TARGET=$(RUSTC_TARGET_NAME)
-LIBRSVG_CONF_OPTS = --disable-pixbuf-loader --disable-tools
+LIBRSVG_CONF_OPTS = --disable-tools
 HOST_LIBRSVG_CONF_OPTS = --enable-introspection=no
 LIBRSVG_DEPENDENCIES = cairo host-gdk-pixbuf gdk-pixbuf host-rustc libglib2 libxml2 pango \
 	$(TARGET_NLS_DEPENDENCIES)
@@ -30,5 +30,22 @@ else
 LIBRSVG_CONF_OPTS += --disable-introspection
 endif
 
+# gdk-pixbuf requires the loaders.cache file populated to work properly
+# Rather than doing so at runtime, since the fs can be read-only, do so
+# here after building and installing to target.
+# And since the cache file will contain relative host directory names we
+# need to prepend them with /usr/.
+ifeq ($(BR2_STATIC_LIBS),)
+define LIBRSVG_PIXBUF_UPDATE_CACHE
+	GDK_PIXBUF_MODULEDIR=$(HOST_DIR)/lib/gdk-pixbuf-2.0/2.10.0/loaders \
+		$(HOST_DIR)/bin/gdk-pixbuf-query-loaders \
+		> $(TARGET_DIR)/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache
+	$(SED) 's,^"lib,"/usr/lib,g' \
+		$(TARGET_DIR)/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache
+endef
+LIBRSVG_POST_INSTALL_TARGET_HOOKS += LIBRSVG_PIXBUF_UPDATE_CACHE
+endif
+
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
