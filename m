Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C93C3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 18:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 911F2812D5;
	Thu, 22 Aug 2024 18:16:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D3vIC3H3Ki2j; Thu, 22 Aug 2024 18:16:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABD468133A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABD468133A;
	Thu, 22 Aug 2024 18:16:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 641461BF381
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 18:16:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4EF9C60DE5
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 18:16:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RMfzTQ9GFmn9 for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 18:16:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7499A60E0A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7499A60E0A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7499A60E0A
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 18:16:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0a54.dip0.t-ipconnect.de [91.58.10.84])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 70C7FA4C25D1;
 Thu, 22 Aug 2024 20:15:47 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44610)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1shCLa-000000005D0-36Ca;
 Thu, 22 Aug 2024 18:15:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 22 Aug 2024 20:15:42 +0200
Message-Id: <20240822181546.64900-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822181546.64900-1-bernd@kuhls.net>
References: <20240822181546.64900-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1724350547;
 bh=U01WJnXfVAdizx95WpDSHTUBsWxFCI5BeRj/U/YK3WU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Vpex0zOEwNhah/2bsJJGS/M9soVnzDHUqlcSsasC18e6/Z5qV0rRgLwxeQ5b6Z7bU
 UgFYZxOI0JYyIaWtHNYQUkAkzBstIfPOJFFrzdTXhpQcCQhBv8UdHnn9kpIvTxjbpw
 nIRlW504RkN2qKUL2ZLkjQBWsdRvCFSadG5TxHRyVfEOSiWIyKPtH7uYz3XE0jiXep
 wNXsocB9MjvayGK1W9jwjimUiiuf3evK3Qu2UUlCBwWLzqN8zez2/xoK6VeyQ657G6
 dw04OqDcS4bK7Z9N7wbEZBBmbCV6QqWgCxQ3GsLQ5b7vRLMRrZIpnTJgFuMlZHlEp+
 Ao9qUIGXCjNGQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=Vpex0zOE
Subject: [Buildroot] [PATCH/next 2/6] package/llvm-project/libclc: add host
 variant
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Daniel Lang <dalang@gmx.at>,
 Samuel Martin <s.martin49@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Needed for mesa3d bump to 24.1.0.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/llvm-project/libclc/libclc.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/llvm-project/libclc/libclc.mk b/package/llvm-project/libclc/libclc.mk
index 9f303d6d2f..cfa978a8ac 100644
--- a/package/llvm-project/libclc/libclc.mk
+++ b/package/llvm-project/libclc/libclc.mk
@@ -11,6 +11,7 @@ LIBCLC_LICENSE = Apache-2.0 with exceptions or MIT
 LIBCLC_LICENSE_FILES = LICENSE.TXT
 
 LIBCLC_DEPENDENCIES = host-clang host-llvm host-spirv-llvm-translator
+HOST_LIBCLC_DEPENDENCIES = host-clang host-llvm host-spirv-llvm-translator
 LIBCLC_INSTALL_STAGING = YES
 
 # CMAKE_*_COMPILER_FORCED=ON skips testing the tools and assumes
@@ -39,4 +40,8 @@ LIBCLC_CONF_OPTS = \
 	-DCMAKE_CXX_COMPILER="$(CMAKE_HOST_CXX_COMPILER)" \
 	-DLLVM_CONFIG="$(HOST_DIR)/bin/llvm-config"
 
+HOST_LIBCLC_CONF_OPTS = \
+	-DLIBCLC_TARGETS_TO_BUILD=spirv64-mesa3d-
+
 $(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
