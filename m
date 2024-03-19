Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CCEFC54E68
	for <buildroot@archiver.kernel.org>; Tue, 19 Mar 2024 20:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06E19414A2;
	Tue, 19 Mar 2024 20:07:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Km_PFASsCyI6; Tue, 19 Mar 2024 20:06:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B02D4148C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B02D4148C;
	Tue, 19 Mar 2024 20:06:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C4A441BF834
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 20:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BBD5E400EE
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 20:06:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Y6J2_eMt2Xy for <buildroot@lists.busybox.net>;
 Tue, 19 Mar 2024 20:06:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8E460400ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E460400ED
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8E460400ED
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 20:06:51 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2d68651e253so13543221fa.0
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 13:06:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710878809; x=1711483609;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xz2tlTsLnlgzs0d8pF59NjN6irjBjnSW8K7TL4e36aI=;
 b=vNqw+BweLpP79bRgJs2EdF828RtiWnnUtmF8WfhsTOmhzcMYRmmyjxCW3dMqD0f9am
 XCr04fqBBf1/ePExAYO2ufRhDNcYBDp+fnWVgOzeZXG9BSsGrAtGHTlPj0LOaQO5AnsP
 Jth/F+hE4rtfTWHYBab5Ax/AWPhDbbIW5T9UALT7AI2VglPa33dgQ9FZ6UWOoQ7Ppc5v
 G3gTs6BIXGISkKYwQs7DY5ccVcpDB4p1pd8LcEqbH3ieXnJ6PUoLhKL7+qD90v36mI6C
 v0LDtTyRkA139AehEaEyAUFOIsi8oeZiP81sGgVszKOYksoOazS1N5mTZIZvPyx5f0Qj
 509g==
X-Gm-Message-State: AOJu0YyElHlha4K+4qINGh69EdvI8fr/xtU4fjFFHvMR3Ncj9q48qSpy
 cS/0Nxjbw3hSz4PFEQS55wZR7FvgorUi/NeUmPEsYCTB5IFIWVArycTc0zLK
X-Google-Smtp-Source: AGHT+IG3TsKnXB0sToPs7Ld9gJk0N1x2DMkW4O4uFTS8Y1wHaSz/kC57EI9dYusKV+X0Xahz5WrBxQ==
X-Received: by 2002:a2e:9057:0:b0:2d4:7829:4d11 with SMTP id
 n23-20020a2e9057000000b002d478294d11mr68275ljg.39.1710878808710; 
 Tue, 19 Mar 2024 13:06:48 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p6-20020adff206000000b0033cf5094fcesm13069019wro.36.2024.03.19.13.06.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Mar 2024 13:06:48 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 19 Mar 2024 21:06:46 +0100
Message-ID: <20240319200646.45266-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710878809; x=1711483609; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xz2tlTsLnlgzs0d8pF59NjN6irjBjnSW8K7TL4e36aI=;
 b=gT87MlwhvkrgbfWu68lfgxmfw9437EII23MkP98tvtA3SQUQ/uBjG+wlLDEC/LKi4v
 b6SP865YGe/7gd92PpPtyUinZEB3GRvC7eW/euoJ/VaVUXI0rFXBXnw0UNB4vSTBp0Md
 ktN2AU4kvZJc2twrF4e2ST4RXhfjGUtw7fAjTrepRy8kJ/i+1KXnEWvwE20oq5FVQ6Ou
 4U7Xx8LmZpJ/k3xrTCullaigIJ+2LPc5jGwumWPXxnl6eOIp1PD6IKbKrVAGgHFeJQ1r
 +p7lyiKzrgP5QzSRXc7rLb2X8Q1TnA8XIBZQs/qjzTijCS9bQRawZ6MgKEb41LOwg/5x
 vhLw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gT87Mlwh
Subject: [Buildroot] [PATCH 1/1] package/putty: fix arm uclibc build
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
Cc: Alexander Dahl <post@lespocky.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following arm uclibc build failure raised since bump to version
0.78 in commit 5673ea3ce4d4dd721bb17fc8d5b1283f5c1080b4 which wrongly
removed patch because file was renamed. Patch was sent upstream in 2021
but rejected, even a second iteration defining AT_HWCAP2 to 26 if needed
was also rejected.

Fixes: 5673ea3ce4d4dd721bb17fc8d5b1283f5c1080b4
 - http://autobuild.buildroot.org/results/547d1c0e8a89e1e4b601aa756d26886bfc3d586f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-arm_arch_queries.h-fix-uclibc-build.patch | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/putty/0001-unix-utils-arm_arch_queries.h-fix-uclibc-build.patch

diff --git a/package/putty/0001-unix-utils-arm_arch_queries.h-fix-uclibc-build.patch b/package/putty/0001-unix-utils-arm_arch_queries.h-fix-uclibc-build.patch
new file mode 100644
index 0000000000..f6b5fe6f91
--- /dev/null
+++ b/package/putty/0001-unix-utils-arm_arch_queries.h-fix-uclibc-build.patch
@@ -0,0 +1,40 @@
+From 2631c745f986b356fbe5e1d418cff63b46134df6 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 19 Mar 2024 20:37:33 +0100
+Subject: [PATCH] unix/utils/arm_arch_queries.h: fix uclibc build
+
+Build on uclibc is broken since version 0.75 and commit
+65383082bf0c49cec63f4b36001a40bd9b13edf6 because AT_HWCAP2 is used
+even if <sys/auxv.h> is not available:
+
+/home/buildroot/autobuild/run/instance-3/output-1/build/putty-0.80/unix/utils/arm_arch_queries.c: In function 'platform_aes_neon_available':
+/home/buildroot/autobuild/run/instance-3/output-1/build/putty-0.80/unix/utils/arm_arch_queries.c:18:22: error: 'AT_HWCAP2' undeclared (first use in this function)
+   18 |     return getauxval(AT_HWCAP2) & HWCAP2_AES;
+      |                      ^~~~~~~~~
+
+To fix this build failure, include <elf.h>
+
+Fixes:
+ - http://autobuild.buildroot.org/results/547d1c0e8a89e1e4b601aa756d26886bfc3d586f
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ unix/utils/arm_arch_queries.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/unix/utils/arm_arch_queries.h b/unix/utils/arm_arch_queries.h
+index fa46c622..5cce7f31 100644
+--- a/unix/utils/arm_arch_queries.h
++++ b/unix/utils/arm_arch_queries.h
+@@ -18,6 +18,8 @@
+ 
+ #if defined __arm__ || defined __aarch64__
+ 
++#include <elf.h>
++
+ #if HAVE_SYS_TYPES_H
+ #include <sys/types.h>
+ #endif
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
