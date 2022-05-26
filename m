Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A69C433EF
	for <buildroot@archiver.kernel.org>; Thu, 26 May 2022 11:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 177D5845B1;
	Thu, 26 May 2022 11:38:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZNuiq4ChHgm1; Thu, 26 May 2022 11:38:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD83684576;
	Thu, 26 May 2022 11:38:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8EA121BF299
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 11:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B7576105C
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 11:37:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JbyUSvxLRxlL for <buildroot@lists.busybox.net>;
 Thu, 26 May 2022 11:37:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB1906105A
 for <buildroot@buildroot.org>; Thu, 26 May 2022 11:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tvsKaA+0mKUFfOnZCuw/TV8S+/htC7HBtWZ67Ma7/KM=; b=macPMFSHS8rEAXYK3Vt6OBcJcS
 hM7f2u7zqdTu5UqWxHuH6sYbhu4mAJclmVZOjnblLhcAypsYYiq4kTAdjPAiAXEABsKefJMGv96E7
 m97Tsk5NewwHlxpU3alEqxY1gLhJL4ZwwPpaUYzpRjoHbd/zLCm2VRdu7KowqsEKjE1oPnv+ndBxb
 cwu81Ox9eMkzVOCYqdTAy6TtU4AztiXGrByMeSk8rrKQTxuVxoGdcuHbyxLBZgAArRJYWpmns7pTg
 Q5WNYW3z6VVki1WtNkcH/LDkamFpwFogcTxk+OXexbD6XQ5R3a59AXhBH8EY71pq9ivV5AVixlm92
 5zmQqyOw==;
Received: from 91-153-34-181.elisa-laajakaista.fi ([91.153.34.181] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1nuBoL-00228u-KL; Thu, 26 May 2022 13:37:49 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id c734ae5b;
 Thu, 26 May 2022 11:37:34 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Thu, 26 May 2022 14:37:34 +0300
Message-Id: <20220526113734.754047-2-aperez@igalia.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220526113734.754047-1-aperez@igalia.com>
References: <20220526113734.754047-1-aperez@igalia.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/webkitgtk: allow building for risc-v
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WebKitGTK works just fine on RISC-V. For the current stable version the
build system automatically picks the LLint JavaScript interpreter, and
the upcoming 2.38.x release series will include (and automatically
enable) JIT support.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/webkitgtk/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index bc8207d93b..052800c8cf 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -7,6 +7,10 @@ config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	# Disabled on MIPS big endian due to sigbus
 	default y if BR2_mipsel || BR2_mips64el
 	# Disabled on PowerPC pending runtime testing
+	# RISC-V needs the g/imafd ISA.
+	default y if BR2_riscv && BR2_RISCV_ISA_RVI \
+		&& BR2_RISCV_ISA_RVM && BR2_RISCV_ISA_RVA \
+		&& BR2_RISCV_ISA_RVF && BR2_RISCV_ISA_RVD
 	# Disabled on SuperH because of segfault
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
