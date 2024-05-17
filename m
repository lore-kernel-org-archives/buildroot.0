Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA33C04FFE
	for <buildroot@archiver.kernel.org>; Fri, 17 May 2024 13:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8565860744;
	Fri, 17 May 2024 13:21:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PSGcmeRirTiN; Fri, 17 May 2024 13:21:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94C60607B9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94C60607B9;
	Fri, 17 May 2024 13:21:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3B96C1BF3F0
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 13:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26B0B82155
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 13:20:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tXLguSxi9Z9S for <buildroot@lists.busybox.net>;
 Fri, 17 May 2024 13:20:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=139.178.84.217;
 helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 67A858210F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67A858210F
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67A858210F
 for <buildroot@buildroot.org>; Fri, 17 May 2024 13:20:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A02DC61A7F;
 Fri, 17 May 2024 13:20:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1609CC2BD11;
 Fri, 17 May 2024 13:20:54 +0000 (UTC)
From: Jarkko Sakkinen <jarkko@kernel.org>
To: buildroot@buildroot.org
Date: Fri, 17 May 2024 16:20:37 +0300
Message-ID: <20240517132039.7124-3-jarkko@kernel.org>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240517132039.7124-1-jarkko@kernel.org>
References: <20240517132039.7124-1-jarkko@kernel.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1715952055;
 bh=2hd2G1aF1fQsPsCym/sYjZrNwaVq7+D0iQ60WWRrpG0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dds8sk71NbS6wIgnaoIL4zISnrtZaJpgtfVz0gVD1c0l3NL889RN5Ml9vWoErTcY6
 KX8kyipl3beTeYPslG7AWEokNlk/FpZFcDYcJajgCFqC38+T7+3GuLK0oPpEw0UCi0
 mTm6z2jxX3ofVCTb9OiKe0mPFv6x5Psx+FLRK+kv7muldaZHzrBLYTibsvT2Eu4tUC
 GHrH2oeduttVTvGyvTz/F82J/OBtlW10l9DCyPXW/tn0uGODQWQBW2YNLJ8odkYNWm
 NTGh/8EZq2CPrtYaRiE2i5+ho0nt7vnXEBA1PCrBXHu+PButvULBr8ncnOCfwQ/ZEN
 KtmKDssdVSgDA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dds8sk71
Subject: [Buildroot] [PATCH 2/4] package/json-glib: add host build
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
Cc: Jarkko Sakkinen <jarkko@kernel.org>, Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
---
 package/json-glib/json-glib.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/json-glib/json-glib.mk b/package/json-glib/json-glib.mk
index cd53f24cee..ffdc76f2c1 100644
--- a/package/json-glib/json-glib.mk
+++ b/package/json-glib/json-glib.mk
@@ -18,19 +18,31 @@ JSON_GLIB_DEPENDENCIES = \
 	host-pkgconf \
 	libglib2
 
+HOST_JSON_GLIB_DEPENDENCIES = \
+	$(HOST_NLS_DEPENDENCIES) \
+	host-pkgconf \
+	host-libglib2
+
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 JSON_GLIB_CONF_OPTS += -Dintrospection=enabled
 JSON_GLIB_DEPENDENCIES += gobject-introspection
+HOST_JSON_GLIB_CONF_OPTS += -Dintrospection=enabled
+HOST_JSON_GLIB_DEPENDENCIES += gobject-introspection
 else
 JSON_GLIB_CONF_OPTS += -Dintrospection=disabled
+HOST_JSON_GLIB_CONF_OPTS += -Dintrospection=disabled
 endif
 
 ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
 JSON_GLIB_CONF_OPTS += -Dnls=enabled
+HOST_JSON_GLIB_CONF_OPTS += -Dnls=enabled
 else
 JSON_GLIB_CONF_OPTS += -Dnls=disabled
+HOST_JSON_GLIB_CONF_OPTS += -Dnls=disabled
 endif
 
 JSON_GLIB_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
+HOST_JSON_GLIB_LDFLAGS = $(HOST_LDFLAGS) $(HOST_NLS_LIBS)
 
 $(eval $(meson-package))
+$(eval $(host-meson-package))
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
