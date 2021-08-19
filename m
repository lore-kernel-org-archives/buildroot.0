Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11108C432BE
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 21:31:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DB2F60FDC
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 21:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7DB2F60FDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BD0A60639;
	Thu, 19 Aug 2021 21:31:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IQHzm8sAuwEv; Thu, 19 Aug 2021 21:31:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBF9260775;
	Thu, 19 Aug 2021 21:31:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7A0F41BF4D5
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 21:31:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 708F560639
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 21:31:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KKgPtyz6u0se for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 21:31:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E10560607
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 21:31:42 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id dj8so10902247edb.2
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 14:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fs6aJliJvm8OFr7W7OaRHbYPBLAdP40NbYNxRLJio9Y=;
 b=Jo8SMsFZL7Mj9KopfbZk5M2J4Fp3OAQtQPw2irpRmgulOPYQ0awuX+qEYFQnZSscaG
 1lTP8iK4wUgIZuqolIM03bZGhthxIexlDw8Gr/XiwHeBM3MYJN22wpK+l2qv901FeeRQ
 3nU0cC/PwvLnzy27L/r5JSUlM1eAcebLi/z2gKnOQbzDHY+7OVaWhcWN8uyUMOlPdYlv
 +4GbtJMr3f4NA6CmK/9RCHRTozMA5qhSNJhPsapj+qOBPovNS2e6t2S81w83dOv5OSYT
 wgOyJkFqLs6TPgjSH3XI6gR6kboQ+so5cWM3Y4stw6hWR2z5eJ298z+2sY7kYBCMIkf7
 BqDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fs6aJliJvm8OFr7W7OaRHbYPBLAdP40NbYNxRLJio9Y=;
 b=WxcWDPHpWbjYvLdT5+YVP+2l3jqOn9OgXLp1MJgEoBPwmykdA43ICNfmAtPszcIZ5t
 sBH8CeoefHfSjQjT5btIjJpq6hhPDJH3bCXqvoqXjmi9FeBEpOC9b2OLAIEFchuFxY21
 x2DNX1qVxyr1LspJMW77wJNPSEnWVd07brkOi2Fr0yydffcyoxEMEnfUa2kQnP7TK5EC
 y0gcja/w3ryyi2hmCmF/4/yOWX3bYwGOwDNRx1ymP0qq6+dl/+9uO3NRz0uDkQMOWcJF
 54SGHDeFJ5AfZUrWAwQe+vIkJcnIP19Nz+5bgbPMGEvEFIGSPrkdQSAJzRk6YpY8bZ0z
 Ky+g==
X-Gm-Message-State: AOAM531W/E7ntsMeNV+CHu3ZBlJx592UdQtgwuY6JKTqwn6gEvJv8mvW
 hfFDtIDuX0+6vsCqWhpkl9ov9DvrEAGiLqJiLQk=
X-Google-Smtp-Source: ABdhPJxfi6uzs3B3bgNuEgYcZ7KqSt8t/CVnFwKGRi6ZCIo2q3ktN2SSnWVJZijiTsJ3H+sExO5dNw==
X-Received: by 2002:a05:6402:1c0f:: with SMTP id
 ck15mr18567134edb.125.1629408700552; 
 Thu, 19 Aug 2021 14:31:40 -0700 (PDT)
Received: from localhost.localdomain (94-224-129-106.access.telenet.be.
 [94.224.129.106])
 by smtp.gmail.com with ESMTPSA id bm1sm1819249ejb.38.2021.08.19.14.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 14:31:40 -0700 (PDT)
From: Illia Bitkov <illia.bitkov@mind.be>
To: buildroot@buildroot.org
Date: Thu, 19 Aug 2021 23:31:31 +0200
Message-Id: <20210819213131.1212610-1-illia.bitkov@mind.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/mono: force internal
 libatomic-ops for some arm variants
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Illia Bitkov <illia.bitkov@mind.be>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Error:
/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: ../../external/bdwgc/.libs/libgc.a(gc.o): in function `GC_steal_mark_stack':
gc.c:(.text+0x2020): undefined reference to `AO_store_full_emulation'
/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: ../../external/bdwgc/.libs/libgc.a(gc.o): in function `GC_mark_from':
gc.c:(.text+0x51c0): undefined reference to `AO_store_full_emulation'
/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: gc.c:(.text+0x54dc): undefined reference to `AO_store_full_emulation'
/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: gc.c:(.text+0x5584): undefined reference to `AO_store_full_emulation'
/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: ../../external/bdwgc/.libs/libgc.a(gc.o): in function `GC_mark_and_push':
gc.c:(.text+0x574c): undefined reference to `AO_store_full_emulation'
/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: ../../external/bdwgc/.libs/libgc.a(gc.o):gc.c:(.text+0x5f0c): more undefined references to `AO_store_full_emulation' follow
/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: ../../external/bdwgc/.libs/libgc.a(gc.o): in function `GC_mark_local':
gc.c:(.text+0xfae4): undefined reference to `AO_fetch_compare_and_swap_emulation'
/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: ../../external/bdwgc/.libs/libgc.a(gc.o): in function `GC_finalize':
gc.c:(.text+0x10990): undefined reference to `AO_store_full_emulation'
/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: gc.c:(.text+0x10ae8): undefined reference to `AO_store_full_emulation'
/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: ../../external/bdwgc/.libs/libgc.a(gc.o): in function `GC_malloc_kind':
gc.c:(.text+0x1682c): undefined reference to `AO_store_full_emulation'
/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: gc.c:(.text+0x16880): undefined reference to `AO_store_full_emulation'
/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: ../../external/bdwgc/.libs/libgc.a(gc.o): in function `GC_make_descriptor':
gc.c:(.text+0x16e04): undefined reference to `AO_store_full_emulation'
/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: ../../external/bdwgc/.libs/libgc.a(gc.o):gc.c:(.text+0x177bc): more undefined references to `AO_store_full_emulation' follow
collect2: error: ld returned 1 exit status

Fixes:
http://autobuild.buildroot.net/results/18b017dd5b9c1d8d6c91303ea4f1fdd3e1b086e0/
http://autobuild.buildroot.net/results/1d262e9ad5bf8bf437bc3f2a709d84acf854d298/
Signed-off-by: Illia Bitkov <illia.bitkov@mind.be>
---
 package/mono/Config.in |  2 +-
 package/mono/mono.mk   | 10 ++++++++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/mono/Config.in b/package/mono/Config.in
index 44b8cf8581..3f26bd4092 100644
--- a/package/mono/Config.in
+++ b/package/mono/Config.in
@@ -16,7 +16,7 @@ config BR2_PACKAGE_MONO
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_LIBATOMIC_OPS
+	select BR2_PACKAGE_LIBATOMIC_OPS if !BR2_xscale && !BR2_arm926t
 	help
 	  An open source, cross-platform, implementation of C#
 	  and the CLR that is binary compatible with Microsoft.NET.
diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index 27f7886224..b1ee184c8a 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -43,8 +43,14 @@ endif
 
 MONO_DEPENDENCIES += \
 	host-mono \
-	$(if $(BR2_PACKAGE_LIBUNWIND),libunwind) \
-	libatomic_ops
+	$(if $(BR2_PACKAGE_LIBUNWIND),libunwind)
+
+ifeq ($(BR2_xscale)$(BR2_arm926t),y)
+#force use of internal libatomic-ops
+MONO_CONF_OPTS += --with-libatomic-ops=no
+else
+MONO_DEPENDENCIES += libatomic_ops
+endif
 
 ## Mono managed
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
