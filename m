Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2111AC4167B
	for <buildroot@archiver.kernel.org>; Fri,  8 Dec 2023 23:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2A636FA21;
	Fri,  8 Dec 2023 23:14:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2A636FA21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bMe_FcTgIyfL; Fri,  8 Dec 2023 23:14:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21B216F6A0;
	Fri,  8 Dec 2023 23:14:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21B216F6A0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2F1B81BF5D7
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 23:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 060F1409DD
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 23:14:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 060F1409DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xefgZk0K_zYR for <buildroot@lists.busybox.net>;
 Fri,  8 Dec 2023 23:14:24 +0000 (UTC)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C5376409BD
 for <buildroot@buildroot.org>; Fri,  8 Dec 2023 23:14:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5376409BD
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-333630e9e43so2630659f8f.2
 for <buildroot@buildroot.org>; Fri, 08 Dec 2023 15:14:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702077261; x=1702682061;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZWR/lV8FnDnunTktpjc25hCZGr5/1y+DReBmuB0fzS4=;
 b=Krmk+tfefbdasjxp99qSxNAys8WFzo4y/wINVrWhi5HDwSJCu5py+d9Asb8rtHqXPt
 lNzTodtwvlxI4MvdzbHgbGMMk6cUFalqLb7Bv2O1+TkzsCEIH59GsWogm/JBaKQ6d/5s
 5FF4eP/HsGZxyIdAA+hks88soSMB+zWXDru9fVlmLrSd64Wxiv04Aie9GoeNzdywPSeM
 v5amGyjEn9o4MD8romaUUH9omFf4iPxEKi04vWLZhKXtW2s8egBQqC65+TGey5WjAASc
 IG1r8ynI8o4y5abTnxfClR2jBEm/wf744ZKChnOKEZsCc9PNPySay4e/5N2p2/xPcT6D
 eBcQ==
X-Gm-Message-State: AOJu0YxFOoUaHIOLPZpQcKgfmx/GoMWuYRpiAl0X6W9Er0ggCx8SBnMS
 CJa9CAuJIIM3mVth2gLEp9OqLLX13Jc=
X-Google-Smtp-Source: AGHT+IFbR4AVkld2YZLuRgL8+WYyquLwh+Iu6rva6DX7NgHm8QEsuAHRJUyXihYnlkEGdRma+PjPlA==
X-Received: by 2002:a5d:5107:0:b0:333:4165:7151 with SMTP id
 s7-20020a5d5107000000b0033341657151mr230905wrt.175.1702077260860; 
 Fri, 08 Dec 2023 15:14:20 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 e18-20020a056000121200b00333404e9935sm2895101wrx.54.2023.12.08.15.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 15:14:20 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Dec 2023 00:14:13 +0100
Message-ID: <20231208231413.656734-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702077261; x=1702682061; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZWR/lV8FnDnunTktpjc25hCZGr5/1y+DReBmuB0fzS4=;
 b=WIDJnrRxDu6JHbcnd0J5m7/Ua8kWTmx8YJNltXxCe4nzIqH2nBnpecBpwXj+zZNoke
 oO6Rl8+govrgV+oUYGV1G5X2EkeMznKGW7gZhJl6S57SK9Cfz+9vLLKj92D3WZ015rYV
 5ozXU6GQzKljRjfHGumXpLqMOBHYdJ6PJouWefouU7XKWDca0pQQlDc+AzW1zDILARbw
 3WZroh9UnlL8DgmWWGomIf7fDffIqGVSc2wJWI50hyHL9XDY9Obr2y8v0djqI7jQCfly
 PA5rTtyI32ktwmMK1ALxAThFA61W2DoJ/aKFU9VL0YJwTBxwnHNwICNIJk/V27wD/iNQ
 7umw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WIDJnrRx
Subject: [Buildroot] [PATCH 1/1] package/llvm-project/clang: link with
 -latomic if needed
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Daniel Lang <dalang@gmx.at>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump to version 15.0.3 in
commit d8291fde5ee19fd475953f41d9c519e817554d6b:

/home/autobuild/autobuild/instance-4/output-1/host/lib/gcc/riscv32-buildroot-linux-gnu/13.2.0/../../../../riscv32-buildroot-linux-gnu/bin/ld: ../../lib/Basic/CMakeFiles/obj.clangBasic.dir/FileManager.cpp.o: in function `.L0 ':
FileManager.cpp:(.text._ZN4llvm17TrackingStatisticppEv[_ZN4llvm17TrackingStatisticppEv]+0x20): undefined reference to `__atomic_fetch_add_8

Fixes:
 - http://autobuild.buildroot.org/results/83d059e74b771aad1ed9db80a4f5572361fb3494

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/llvm-project/clang/clang.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/llvm-project/clang/clang.mk b/package/llvm-project/clang/clang.mk
index 0bafd6461b..82a06a8e59 100644
--- a/package/llvm-project/clang/clang.mk
+++ b/package/llvm-project/clang/clang.mk
@@ -105,6 +105,11 @@ ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
 HOST_CLANG_CONF_OPTS += -DGCC_INSTALL_PREFIX:PATH=`realpath --relative-to=$(HOST_DIR)/bin/ $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)`
 endif
 
+# Uses __atomic_fetch_add_8
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+CLANG_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
+endif
+
 define HOST_CLANG_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
 	$(Q)cd $(HOST_DIR)/bin; \
 	rm -f clang-$(CLANG_VERSION_MAJOR).br_real; \
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
