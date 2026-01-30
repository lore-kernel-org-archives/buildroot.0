Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E0CE6BF0B
	for <buildroot@archiver.kernel.org>; Fri, 30 Jan 2026 13:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32B6040D97;
	Fri, 30 Jan 2026 13:19:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SEP57hzfHf3w; Fri, 30 Jan 2026 13:19:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2470540D28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769779195;
	bh=6SyrdVfSPpqDAGvR5c4YoA89FtTranhn22JwfrQrVm4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=JXYPM0kq/cj5CKxdM4Lj0YAVj05rQqnFIEvoHbEvYMmsJ4wKy+f4mFc2JvRUiS4vt
	 ogx4rCcRlsOb8ZyVEr8s4SGrYUBVrQ9wz8QH4iJ1b4QPgzWel6UIAbNnIJkFnqD2uU
	 3RZm+9IZqKu8NzQu/yJou4QqiLP+sFcsqa8P/S8LhbeMR2YRT0JX81o3EmrtJUPIGT
	 O8PnNvbjNEJrmxBCFoNV6iSeAjmv+mySLLz4Cfe82CUukJObPpy0LPZBhQACev0UJF
	 gppGujDuAbQYkflhwb/heP3rp5BHLuKKLBt4iWbsWO0cuUCdyrujxUPyA/sTNiV5RI
	 aV/I4N5crB+pg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2470540D28;
	Fri, 30 Jan 2026 13:19:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 730E469
 for <buildroot@buildroot.org>; Fri, 30 Jan 2026 13:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 562E681463
 for <buildroot@buildroot.org>; Fri, 30 Jan 2026 13:19:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o8o6-Kr6nKSa for <buildroot@buildroot.org>;
 Fri, 30 Jan 2026 13:19:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CBE9681259
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBE9681259
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CBE9681259
 for <buildroot@buildroot.org>; Fri, 30 Jan 2026 13:19:51 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id C33C12C89639;
 Fri, 30 Jan 2026 14:10:02 +0100 (CET)
To: buildroot@buildroot.org
Date: Fri, 30 Jan 2026 14:10:13 +0100
Message-ID: <20260130131014.1506555-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1769778602; bh=HQYneeXSUj0V3zKT09o8PBV9KOiBdQoKZVgotMQykEU=;
 h=From:To:Cc:Subject:Date;
 b=TyhmbCaeTTX1LMROBMiuO9pToMsYsrGs/LXgLG2MZseGtPHihIIY+Q5NvGZ/m6id8
 K2aDfY0aaeoKLmifbBLlMWK+nhnTBIy/eQ017oXMm1WTArwQD1nbOWT/pDzGfA11rw
 CqcCt+/KpLzf5kfcGVMjsLLisP5v6dAo2Rbq+p6zEyBK3Rl0V0mKZ+A/V8CJ8IwMIB
 I6Z6/mNH6/Qm7DSxcBiaw2g6tGf+eGZpri0uXImKLIlsy42YTU4hQa1umKio7DCcpZ
 /u4ucxuWKTP81SxztEKNeDx9m8+dNY73SJqxRDdrPjLHSKJx1S/n0gd+Fobm68LQ9t
 DD1KsZyAKuQRg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=TyhmbCae
Subject: [Buildroot] [PATCH] package/libgpiod2: add option to enable gpioset
 interactive mode
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
Cc: Boerge Struempfel <boerge.struempfel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/libgpiod2/Config.in    | 11 ++++++++++-
 package/libgpiod2/libgpiod2.mk |  7 +++++++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/package/libgpiod2/Config.in b/package/libgpiod2/Config.in
index 5a13bfc344..279b1e40e7 100644
--- a/package/libgpiod2/Config.in
+++ b/package/libgpiod2/Config.in
@@ -21,7 +21,16 @@ config BR2_PACKAGE_LIBGPIOD2_TOOLS
 	help
 	  Include a set of command-line tools for managing GPIOs.
 
-endif
+if BR2_PACKAGE_LIBGPIOD2_TOOLS
+
+config BR2_PACKAGE_LIBGPIOD2_GPIOSET_INTERACTIVE
+	bool "gpioset interactive"
+	select BR2_PACKAGE_LIBEDIT
+	help
+	  Build with gpioset interactive mode.
+endif # BR2_PACKAGE_LIBGPIOD2_TOOLS
+
+endif # BR2_PACKAGE_LIBGPIOD2
 
 comment "libgpiod2 needs kernel headers >= 5.10"
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
diff --git a/package/libgpiod2/libgpiod2.mk b/package/libgpiod2/libgpiod2.mk
index c5b53f631b..62d6173418 100644
--- a/package/libgpiod2/libgpiod2.mk
+++ b/package/libgpiod2/libgpiod2.mk
@@ -24,6 +24,13 @@ else
 LIBGPIOD2_CONF_OPTS += --disable-tools
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGPIOD2_GPIOSET_INTERACTIVE),y)
+LIBGPIOD2_DEPENDENCIES += libedit
+LIBGPIOD2_CONF_OPTS += --enable-gpioset-interactive
+else
+LIBGPIOD2_CONF_OPTS += --disable-gpioset-interactive
+endif
+
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 LIBGPIOD2_CONF_OPTS += --enable-bindings-cxx
 else
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
