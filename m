Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E22D68BDA
	for <buildroot@archiver.kernel.org>; Fri, 15 Nov 2024 23:59:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7EDE610B5;
	Fri, 15 Nov 2024 23:59:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eoT-oW4OeSqb; Fri, 15 Nov 2024 23:59:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB954610AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB954610AE;
	Fri, 15 Nov 2024 23:59:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4585CBF
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 23:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26E82610F9
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 23:59:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ar8xV_3Cm78F for <buildroot@buildroot.org>;
 Fri, 15 Nov 2024 23:59:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 61F6D610C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61F6D610C2
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 61F6D610C2
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 23:59:39 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2af:22b0:c8e6:f99:ce4c:c68])
 (Authenticated sender: vjardin@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 5FDF9B0051E;
 Sat, 16 Nov 2024 00:59:34 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Cc: vjardin@free.fr,
	Vincent Jardin <vjardin@iliad-free.fr>
Date: Sat, 16 Nov 2024 00:57:57 +0100
Message-ID: <20241115235757.43480-4-vjardin@free.fr>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241115235757.43480-1-vjardin@free.fr>
References: <20241115235757.43480-1-vjardin@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731715177;
 bh=CiOwh8N92yp4Ujqi6U3d70btDjT4iTx5ymC/jCP0JkY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tYF4ZjGpzk9W2cAc7rbVkCLC3rJ1oXcq/zqFY0wdb0NeqKzZN5aGLk0XOtVn+lvJ2
 A/yEpSGaad99hdVvZ5W3/6xuuoQU3FaLkLtdhUcpApbwmYfn7yKCwLZyPAh+8NZjzj
 epYSfZae/TUvL2FvulhCCblQwf2L/ZO6APGa4IDnqTGYU1YB89ERKo4cFeMPqfEKGr
 6FDxd853HWmaz2MLatO8XJEFdqMae60WK/ZD2GRbsC1EYUWmrV+AtFe42r4B11kFlP
 QjUALg74wpFMj2o2yfEKxxYyMzniTF7V0wyaKM8Jf3GLpqp0JHJfZYYVT+VXEuy/MS
 YjcMDmYJAby7g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tYF4ZjGp
Subject: [Buildroot] [PATCH v1 3/3] package/dpdk: add dependency on mstflint
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
Signed-off-by: Vincent Jardin <vjardin@iliad-free.fr>
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
