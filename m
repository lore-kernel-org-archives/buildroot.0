Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A744C83F1A
	for <buildroot@archiver.kernel.org>; Mon, 14 Jul 2025 14:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E9C040A87;
	Mon, 14 Jul 2025 14:53:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E3wk6UX6LT1v; Mon, 14 Jul 2025 14:53:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 637FB40A94
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 637FB40A94;
	Mon, 14 Jul 2025 14:53:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 333FDDF
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 14:53:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24EDA40A94
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 14:53:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VEHdiChlP7p0 for <buildroot@buildroot.org>;
 Mon, 14 Jul 2025 14:52:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3002B40A87
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3002B40A87
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3002B40A87
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 14:52:58 +0000 (UTC)
Received: from charybdis.. (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id 810D0E0029C;
 Mon, 14 Jul 2025 16:52:56 +0200 (CEST)
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>, Florian Larysch <fl@n621.de>,
 "Yann E. MORIN" <yann.morin@orange.com>,
 Romain Naour <romain.naour@smile.fr>
Date: Mon, 14 Jul 2025 16:52:41 +0200
Message-ID: <20250714145242.27516-1-fl@n621.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611162152.32353-1-fl@n621.de>
References: <20250611162152.32353-1-fl@n621.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1752504776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bc9FSLziMgvcetSQVkBPooSfzBXLboMpDddYA5JaO1k=;
 b=Z2l/Ldidt9KPp2Zd6JvVcOOKNPKp1jJdgY/YAOQkofdV7wmhK0BIDFh7AQGXJkKXOiF4sz
 7TeFNPM4ZD0f9I3oB+FBlQxANvO7X/boEYKExqTHm2EC6yOtgfNmx3jlllA7ukHPv46xHL
 QWbfYg0SpkQ21/AWgbX72aP7GFHKiPo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=Z2l/Ldid
Subject: [Buildroot] [PATCH v2 1/1] package/go: make pre-built compiler
 provide target support too
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

All Go packages must depend on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS,
which ensures that we do have a Go compiler available for that target.

BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS is currently restricted to the
availability of a full host Go compiler bootstrap. However, there are
architectures like AArch64 for which a full bootstrap is not supported.

Thus, currently, on an AArch64 host, we can't build Go packages (for
target or host), because we can't bootstrap a Go compiler.

However, note that a single Go compiler can generate code for all the
architectures supported by Go and for some host architectures, there are
pre-built toolchains available. When host-go-bin was added in commit
7b2a164b7460 ("package/go/go-bin: new host-go provider"), the host
dependency was properly accounted for: It is already possible to build
host-go packages with go-bin. However, the fact that a Go compiler, in
addition to its native target, can also generate code for all supported
architectures, was missed at the time.

Thus, we can fix this problem by relaxing the condition under which
BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS is set to allowing go-bin
along with go-bootstrap. This allows a situation where the host can't
bootstrap, but for which there is a pre-built toolchain to build Go
packages for a supported target.

Signed-off-by: Florian Larysch <fl@n621.de>
Cc: Yann E. MORIN <yann.morin@orange.com>
Cc: Romain Naour <romain.naour@smile.fr>
---
v1->v2:
 - Reworded commit message after discussion with Romain and Yann.

 package/go/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index 7e354b3298..a42e37f90b 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -2,7 +2,7 @@
 config BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	bool
 	default y
-	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS || BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
 	# See https://go.dev/doc/install/source#environment
 	# See src/go/build/syslist.go for the list of supported architectures
 	depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
