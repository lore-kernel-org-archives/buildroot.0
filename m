Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90A8E7719E
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 10:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39219608EA;
	Mon, 13 Jan 2025 10:52:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1O9WASzCxZjZ; Mon, 13 Jan 2025 10:52:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A631C60889
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A631C60889;
	Mon, 13 Jan 2025 10:51:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D39295D
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 10:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6AE1660811
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 10:51:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kZJfLp1GYcIl for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 10:51:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=188.165.44.123;
 helo=mail1.insia.net; envelope-from=guillaume.chaye@zeetim.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A82C2607C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A82C2607C8
Received: from mail1.insia.net (mail1.insia.net [188.165.44.123])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A82C2607C8
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 10:51:56 +0000 (UTC)
Received: from smtp.insia.net (unknown [192.168.1.24])
 by mail1.insia.net (Postfix) with ESMTP id 06BC73F9DB;
 Mon, 13 Jan 2025 11:43:04 +0100 (CET)
Received: from sb-dev-build.insia.net. (gw-servers.insia.net [192.168.1.1])
 by smtp.insia.net (Postfix) with ESMTP id 371875F497;
 Mon, 13 Jan 2025 11:28:54 +0100 (CET)
From: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
Date: Mon, 13 Jan 2025 11:42:52 +0100
Message-Id: <20250113104252.889738-2-guillaume.chaye@zeetim.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250113104252.889738-1-guillaume.chaye@zeetim.com>
References: <20250113104252.889738-1-guillaume.chaye@zeetim.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=zeetim.com; s=mail1; t=1736764984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cZSOsYAG2SaG4pyjwzBQE5cfCQWP1yQ8Y81k1q3oWm0=;
 b=QDFc6EjyyaQulicRjAwGEEKc2Apz5tsaztVYAhRIv833h0jprFH3lBBuVgOmhuXcpKc9kQ
 XRVJhg2fRLEaLPWcFHu1I5fw6rrN3OXhwRBW9It9992oUa/9No7JmlSXthwxfouSbB73hb
 DoGnKbmyebsbGu54Ri/cCWog5fjpAEk5DeIhWgwnYHSMOxBfGyKy/sQHQ8ItMHfcYfHSZM
 EjZANWqsSIQe3IKZTbsC0aD9xt+/89qrsWDF0F0mM1CG4eXt3fVb61sT0N6dPkCAr3fqRe
 Fqf2LvjW6DLn3hERPC+imIkINukbEYZ3+AN/8ImrBnTw6apxHgiSNjWfOhatBw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zeetim.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=zeetim.com header.i=@zeetim.com
 header.a=rsa-sha256 header.s=mail1 header.b=QDFc6Ejy
Subject: [Buildroot] [PATCHv3 2/2] package/librsvg: Enable gdk-pixbuf,
 so gdk-pixbuf is able to open SVG
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
