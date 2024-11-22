Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99732E6ADCB
	for <buildroot@archiver.kernel.org>; Fri, 22 Nov 2024 23:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D4754065A;
	Fri, 22 Nov 2024 23:02:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6LWVetb6Mbgs; Fri, 22 Nov 2024 23:02:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49BFF4065B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49BFF4065B;
	Fri, 22 Nov 2024 23:02:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D4771E39
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 23:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E23F74065B
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 23:02:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IDYwOyJOcwmI for <buildroot@buildroot.org>;
 Fri, 22 Nov 2024 23:02:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2E1C640652
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E1C640652
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E1C640652
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 23:02:53 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2af:22b0:c192:5f44:1fb7:e350])
 (Authenticated sender: vjardin@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 5EB57B0051B;
 Sat, 23 Nov 2024 00:02:48 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
	Vincent Jardin <vjardin@free.fr>
Date: Sat, 23 Nov 2024 00:01:20 +0100
Message-ID: <20241122230120.96898-3-vjardin@free.fr>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241122230120.96898-1-vjardin@free.fr>
References: <3dfed5b9a6cf85883a65e432ff53c3b5@free.fr>
 <20241122230120.96898-1-vjardin@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732316571;
 bh=4ns49+dHf/OtRtGha89+BFnVV4BiAryZL86TkBOj4CE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=m4XRVRQ2t/imbpahSqtPX5KweBwICbHx+QdW1cVsU7XvPRa9LM+z0m17kSclRTeUd
 dpflcAR7QSbcdB7PXW/0mbVDIq6VB9b2UadqZPx4b4yPoBFfL54x/HqJx00Nx5ekqb
 yqYs5elw5DPhA90mWc18zb+pDKDGR1gZDrrl600llEN6QRCCiwdxfy8Ao6bC/gi+Bw
 +NBQqebRammI7dDPQ4pbgibTxTPQYd9UgueuRF3mdvmkPkYZMrK/5ib8kP3uET2jSv
 fg66+vG8FgcVNJ54J1D2K5uxYphlWcGaa4BAoO7vmBlqToZ77TE5qJSGqSpNffnyQS
 eCAQ4XD6Bmpbw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=m4XRVRQ2
Subject: [Buildroot] [PATCH v3 2/2] package/dpdk: add dependency on mstflint
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

mstflint shall be compiled before DPDK. It enables the mlx5 drivers
for the userland DPDK libraries.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 package/dpdk/dpdk.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
index b685e12408..41809a007f 100644
--- a/package/dpdk/dpdk.mk
+++ b/package/dpdk/dpdk.mk
@@ -37,7 +37,8 @@ DPDK_LICENSE_FILES = \
 
 DPDK_DEPENDENCIES = \
 	host-pkgconf \
-	host-python-pyelftools
+	host-python-pyelftools \
+	$(if $(BR2_PACKAGE_MSTFLINT),mstflint)
 
 ifeq ($(BR2_PACKAGE_DPDK_EXAMPLES),y)
 DPDK_CONF_OPTS += -Dexamples=all
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
