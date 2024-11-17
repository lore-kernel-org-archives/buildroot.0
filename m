Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B871D10F21
	for <buildroot@archiver.kernel.org>; Sun, 17 Nov 2024 16:21:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D05FE42C9D;
	Sun, 17 Nov 2024 16:21:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aJalawyuLopt; Sun, 17 Nov 2024 16:21:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C795C42CA8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C795C42CA8;
	Sun, 17 Nov 2024 16:21:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B245AF0
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 16:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F3A384460
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 16:21:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MNKgsgKJTDxu for <buildroot@buildroot.org>;
 Sun, 17 Nov 2024 16:21:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 98AFE84B83
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98AFE84B83
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 98AFE84B83
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 16:20:58 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2af:22b0:4a2:8c06:3742:179a])
 (Authenticated sender: vjardin@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id DAF4A2003BE;
 Sun, 17 Nov 2024 17:20:53 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
	Vincent Jardin <vjardin@free.fr>
Date: Sun, 17 Nov 2024 17:19:27 +0100
Message-ID: <20241117161927.27620-3-vjardin@free.fr>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241117161927.27620-1-vjardin@free.fr>
References: <3313806598076f4509530136ba913320@free.fr>
 <20241117161927.27620-1-vjardin@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731860457;
 bh=4ns49+dHf/OtRtGha89+BFnVV4BiAryZL86TkBOj4CE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UR4AFYoY3iO375X0FzmZNWuQZtCjdu+ejxqYZOlgVQ2sexHcZK23UnnUdY+L9fIUn
 Uy81dKX18/KtXmtKHSP21ECigI4Y6pRt8b1/X+bGlwEHZaqsMvwkaRy8dGQpn2I+af
 p3OA63+xIpJjbr2o4zDa1lZxZfaINFvHVFsw4BA3tAGd235IvGwivLVwNyl03JMmpC
 Ol9w6JKQSru75mBF24E8yAmvTgpLC3ZNNqYd0n/wqRviPYtmIRTmJ3pyAY4zBa3BpL
 dCHPUf8JQAotpPqi1jmm5yylDlUVO4MrOaw9G0+iFWtl099xcxed3+FeaScYwDPbQ5
 WgM3sjWUPBDkQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UR4AFYoY
Subject: [Buildroot] [PATCH v2 2/2] package/dpdk: add dependency on mstflint
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
