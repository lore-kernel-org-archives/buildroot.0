Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0757FD68BC6
	for <buildroot@archiver.kernel.org>; Fri, 15 Nov 2024 15:59:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5504610DE;
	Fri, 15 Nov 2024 15:59:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OU5lUGfwPRsR; Fri, 15 Nov 2024 15:59:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD7E9610EC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD7E9610EC;
	Fri, 15 Nov 2024 15:59:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 99AC627DF
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 15:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8662643131
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 15:59:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2AdzeCKrZ6Pw for <buildroot@buildroot.org>;
 Fri, 15 Nov 2024 15:59:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7516843128
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7516843128
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7516843128
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 15:59:27 +0000 (UTC)
Received: from localhost.localdomain (unknown [213.36.7.11])
 (Authenticated sender: vjardin@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id BA6B0780371;
 Fri, 15 Nov 2024 16:59:23 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Cc: vjardin@free.fr
Date: Fri, 15 Nov 2024 16:59:21 +0100
Message-ID: <20241115155921.29410-1-vjardin@free.fr>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731686364;
 bh=m/tPVWhihvV3ZVzS4Qg5tWptOzf4x7atDOFsF8+0srg=;
 h=From:To:Cc:Subject:Date:From;
 b=msuGel/okzmIWZ7MWnYlhxoJ1hu6BreHu6wRy0h4nxz7+nDsKb+Qxoqbef5UIe5Pw
 dQvEuwVTDPNa8k2WnQMsxROd8lwxJOZpncvGzniNQveKotNiSSPoXbb6K3K4/M/sd/
 kDGR2PXlZgUHHDERxwOGyxU+SEqNRf4KWKxCpVIBjKjp4ErsoLsqLx1rsUPx6jue7B
 N/HGhRQ45J9erDee2hJ652h5r7iLi9udDaP09wB4pFcEAj/8UweAbRCv5v/vkht7Oc
 DfQbJPwfes30AyTjgbULNqu4jPUl5jFM3w8DrNNTyGd4rE+UpKHXanLkifhiqcr2dG
 CUzFzQlin/Bjg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=msuGel/o
Subject: [Buildroot] [PATCH 1/1] package/dpdk: install to staging
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

It will be needed for the upcoming user packages
that will use the DPDK.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 package/dpdk/dpdk.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
index b685e12408..2200f5fa00 100644
--- a/package/dpdk/dpdk.mk
+++ b/package/dpdk/dpdk.mk
@@ -35,6 +35,8 @@ DPDK_LICENSE_FILES = \
 	license/exceptions.txt \
 	license/mit.txt
 
+DPDK_INSTALL_STAGING = YES
+
 DPDK_DEPENDENCIES = \
 	host-pkgconf \
 	host-python-pyelftools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
