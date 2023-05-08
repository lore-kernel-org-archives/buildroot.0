Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD852C7EE22
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 18:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5876041E05;
	Mon,  8 May 2023 18:10:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5876041E05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TQW1fTWB8omS; Mon,  8 May 2023 18:10:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1281241DB5;
	Mon,  8 May 2023 18:10:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1281241DB5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F0BF81BF342
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 18:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C888F40A5B
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 18:10:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C888F40A5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pfBXCwAH1VP5 for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 18:10:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 049344016F
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 049344016F
 for <buildroot@buildroot.org>; Mon,  8 May 2023 18:10:17 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.170.150.105])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id B9A43780512;
 Mon,  8 May 2023 20:10:13 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon,  8 May 2023 20:10:00 +0200
Message-Id: <20230508181001.18771-1-ju.o@free.fr>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683569415;
 bh=MTGpaELDhbdPRvCbbgECV+IVfKT/jCbOr7t3eJuYiMc=;
 h=From:To:Cc:Subject:Date:From;
 b=YicutiHvmQIrhuXg1ilzpUjjGwznPWRrDICbgip+/2QCAGMqR9CktfoFMOh9KCpGF
 Ub9YoHOprJ9zr5OBlbt4AboUoSDavHJloD+Hz/HLIx6taGlYrK4ZbxI7lab8+9/GBf
 nk329sx1SmceNGVjDnEI5eLal+yMixdMrcQiCOHzoCsY8PNWY3lTyMxC7W1WHvTEXy
 7G3tqW9mOu64re7Kiz2fNxYnP62Wn005BViKAhk+zfY0a8NTXYqZJJL1j/P359L/sT
 0VRsJRR33Jqj+RVMHp+cmZkEoEd9EbviVE7WCsZwaU1YEoj+qyzedB/ueClUShtkBK
 O5ohWGgFSqrsg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YicutiHv
Subject: [Buildroot] [PATCH 1/2] package/openblas: add a new option to
 install tests
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This option can be used for runtime testing or package debugging.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/openblas/Config.in   |  5 +++++
 package/openblas/openblas.mk | 18 ++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/package/openblas/Config.in b/package/openblas/Config.in
index 0144e93a3f..58976e657a 100644
--- a/package/openblas/Config.in
+++ b/package/openblas/Config.in
@@ -94,4 +94,9 @@ config BR2_PACKAGE_OPENBLAS_USE_LOCKING
 	  function calls from multiple threads, then locking is
 	  mandatory for correct operation.
 
+config BR2_PACKAGE_OPENBLAS_INSTALL_TESTS
+	bool "install tests"
+	help
+	  Install C test programs on target.
+
 endif
diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index f7a50d7bc7..3fa0bbfce7 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -77,4 +77,22 @@ define OPENBLAS_INSTALL_TARGET_CMDS
 		-C $(@D) install PREFIX=$(TARGET_DIR)/usr
 endef
 
+ifeq ($(BR2_PACKAGE_OPENBLAS_INSTALL_TESTS),y)
+# The actual test list depends on the architecture and/or some build
+# options. This macro installs all the test programs and input data
+# found in the ctest build directory.
+define OPENBLAS_INSTALL_TESTS
+	mkdir -p $(TARGET_DIR)/usr/libexec/openblas/tests
+	find $(@D)/ctest \
+		-type f -name "x[sdcz]cblat[123]" -perm -0100 \
+		-exec $(INSTALL) -m 0755 {} \
+			$(TARGET_DIR)/usr/libexec/openblas/tests \;
+	find $(@D)/ctest \
+		-type f -name "[sdcz]in[123]" \
+		-exec $(INSTALL) -m 0644 {} \
+			$(TARGET_DIR)/usr/libexec/openblas/tests \;
+endef
+OPENBLAS_POST_INSTALL_TARGET_HOOKS += OPENBLAS_INSTALL_TESTS
+endif
+
 $(eval $(generic-package))
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
