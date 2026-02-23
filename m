Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB75EC1109
	for <buildroot@archiver.kernel.org>; Mon, 23 Feb 2026 16:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47C0560870;
	Mon, 23 Feb 2026 16:42:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ubioWwJY4_WV; Mon, 23 Feb 2026 16:42:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 516E360879
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771864967;
	bh=Up/7B+j20Ip+7YscNeyyVV4eA7TtzVO4WO0ei2OsFY4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eqe/YJyz2Hm7SxpeoscNANgy1e5JvynojrzN8efjxJNJs7MnMoUErDV30upZE2xGQ
	 4/NZ+pa3YTk9Ik92J4PxF6JP0aW1cwqz2twabzMrsGCmSlFusRCHOhLrgH5NkXTdBL
	 CLzeESQEmRi8+HvQNZmUO5lbWiTE9L8F2uS7j3p3qxE37MKcu1o9L7lElw1qOemV+R
	 bf/8et874aOAWbIPoDe+g+v+qFCYqNlt2NsSGnQuLpvY9m70YgedgWGdWRYmxtF5bE
	 IgMz1HecyRV3DqzjghcQChRn7iXXwuHSkiYNLWjS5JSV1HijuxixLUwesHMpU/mPEz
	 u52bfKU92LMug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 516E360879;
	Mon, 23 Feb 2026 16:42:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C7152237
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 16:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC8AF40AEF
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 16:42:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MxijsxqAEriP for <buildroot@buildroot.org>;
 Mon, 23 Feb 2026 16:42:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3673040A97
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3673040A97
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3673040A97
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 16:42:44 +0000 (UTC)
Received: from framework-OT (unknown [61.8.151.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id D4DD52C8443D
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 17:42:41 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 23 Feb 2026 17:42:56 +0100
Message-ID: <20260223164257.486598-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1771864961; bh=LgFfINQ0Vx54s3MgqkAUF7Ke9j98OAH5rddBe8n9Kd0=;
 h=From:To:Subject:Date;
 b=bp7B+g0+/Avxp9A727ZBNBJZE8ZzX6DR/VyaBZWEwPBXNPhqTQwIYpSo5q4LTPn0Z
 GGj84aysdvlV1Edv4XvdjkIuyDF7PnGEGN4lXS+lDiDAqq+brr5gET9gWa04AqR8EZ
 7P1vGGIgKg7+6MKmc+rJxpPP05skdxWqPtGMyJkkhYwhto5KuLUK7PTfwy2fMib+fs
 NCFnYMmFrGyen7lNOBBn5X5APMhMxWLrZnBkIvHG2TUs/Me/HJHuxjCqi3Wc5R8Nw4
 BOVmz+AYZ3Vgb+EViHLsDd8RC29/chpIHPp5HNEL4pO26RGISFZBrsLJzg/YnRBbs/
 KIYpvz129ZcUQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=bp7B+g0+
Subject: [Buildroot] [PATCH] package/pkg-cargo: fix building packages with
 OVERRIDE_SRCDIR
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

Only add --offline and --locked if a cargo package isn't being built
with OVERRIDE_SRCDIR enabled as the vendoring stage doesn't take place
in this case.

We don't particularly care about offline builds during development and
also not about the Cargo.lock file being outdated (which happens when
adding/updating/removing dependencies during development).

The cargo install call also has --offline and --locked parameters, but
these don't seem to cause any problems, for now at least.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/pkg-cargo.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index 47a6353f25..9fc9619067 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -240,10 +240,10 @@ define $(2)_BUILD_CMDS
 		$$(PKG_CARGO_ENV) \
 		$$($(2)_CARGO_ENV) \
 		cargo build \
-			--offline \
+			$$(if $$($$(PKG)_OVERRIDE_SRCDIR),,--offline) \
 			$$(if $$(BR2_ENABLE_DEBUG),,--release) \
 			--manifest-path Cargo.toml \
-			--locked \
+			$$(if $$($$(PKG)_OVERRIDE_SRCDIR),,--locked) \
 			$$($(2)_CARGO_BUILD_OPTS)
 endef
 else # ifeq ($(4),target)
@@ -254,10 +254,10 @@ define $(2)_BUILD_CMDS
 		$$(HOST_PKG_CARGO_ENV) \
 		$$($(2)_CARGO_ENV) \
 		cargo build \
-			--offline \
+			$$(if $$($$(PKG)_OVERRIDE_SRCDIR),,--offline) \
 			--release \
 			--manifest-path Cargo.toml \
-			--locked \
+			$$(if $$($$(PKG)_OVERRIDE_SRCDIR),,--locked) \
 			$$($(2)_CARGO_BUILD_OPTS)
 endef
 endif # ifeq ($(4),target)
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
