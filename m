Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA4BC001B0
	for <buildroot@archiver.kernel.org>; Mon, 14 Aug 2023 06:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E613340972;
	Mon, 14 Aug 2023 06:36:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E613340972
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PN_cHekdyoW6; Mon, 14 Aug 2023 06:36:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0ADCA401B2;
	Mon, 14 Aug 2023 06:36:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0ADCA401B2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1BF921BF3D1
 for <buildroot@lists.busybox.net>; Mon, 14 Aug 2023 06:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8E5A60BE3
 for <buildroot@lists.busybox.net>; Mon, 14 Aug 2023 06:36:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8E5A60BE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BjJh8Gba7ctK for <buildroot@lists.busybox.net>;
 Mon, 14 Aug 2023 06:36:47 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D3CB86059C
 for <buildroot@buildroot.org>; Mon, 14 Aug 2023 06:36:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3CB86059C
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-3fe426b8583so40541105e9.2
 for <buildroot@buildroot.org>; Sun, 13 Aug 2023 23:36:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691995004; x=1692599804;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hiKNyck3v4ZGG2HJgo8FQib42rjo9P8MdNQDutge9S8=;
 b=U1HxH51TTWtDXx2uVCBKZVDQssDywbloADcrXvTnuRLEYVVyuaNkIg0q2rNF+XsAnp
 mYR9wOL1U/3GzTiqo36vjNrjO+xRmIaYDgD32DNsd5fpx151im7zg2AF1khEHXrsao1G
 0KeFqa8OmmQiJHn8ws2enqP0d4vhq9ueNfXEX90AjCpCZqiDrcwNfFbGLj6FBcJi2mwX
 K5tStcGQYi/rgU7YlKePregMDAa/g5sbCpHvRAtFc/+xF/qGmPcfPJpACKbDxgUQFec7
 8Y4v9YJg7/SnAMNVW/tN+hPkUdWPc66tIh4LusSvbAHQT+xSUVJAW/yccG0k/AF2O7Uj
 /E3g==
X-Gm-Message-State: AOJu0YxhoPLGFvSS9XahRtAFzQUrcylxB+qOcNRUNx1Qpsx2AtKdLwFI
 X84+WG32NoayhKOmiIFNo72nZz1R/IXmWw==
X-Google-Smtp-Source: AGHT+IH8Gnllc75Enl+QTNNpA4oat++7/sNzc+hrYKeuhrwTexukS3dMxaZlrk3i26c6WT5kM+WEug==
X-Received: by 2002:a05:600c:2055:b0:3fe:46ea:62c6 with SMTP id
 p21-20020a05600c205500b003fe46ea62c6mr6833747wmg.21.1691995004189; 
 Sun, 13 Aug 2023 23:36:44 -0700 (PDT)
Received: from KORLIN44614.barco.com
 ([2a02:a03f:eb68:2f00:4790:80ac:bb55:e50f])
 by smtp.gmail.com with ESMTPSA id
 q11-20020adff94b000000b00317c742ca9asm13211093wrr.43.2023.08.13.23.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Aug 2023 23:36:43 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Mon, 14 Aug 2023 08:36:39 +0200
Message-Id: <20230814063639.1145396-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808180200.GB421096@scaer>
References: <20230808180200.GB421096@scaer>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,
 next] package/llvm-project/compiler-rt: fix circular dependency
 warning
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>, Daniel Lang <dalang@gmx.at>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

make[4]: Circular include/sanitizer/allocator_interface.h <- include/sanitizer/allocator_interface.h dependency dropped.
make[4]: Circular include/sanitizer/asan_interface.h <- include/sanitizer/asan_interface.h dependency dropped.
make[4]: Circular include/sanitizer/common_interface_defs.h <- include/sanitizer/common_interface_defs.h dependency dropped.
make[4]: Circular include/sanitizer/coverage_interface.h <- include/sanitizer/coverage_interface.h dependency dropped.
make[4]: Circular include/sanitizer/dfsan_interface.h <- include/sanitizer/dfsan_interface.h dependency dropped.
make[4]: Circular include/sanitizer/hwasan_interface.h <- include/sanitizer/hwasan_interface.h dependency dropped.
make[4]: Circular include/sanitizer/linux_syscall_hooks.h <- include/sanitizer/linux_syscall_hooks.h dependency dropped.
make[4]: Circular include/sanitizer/lsan_interface.h <- include/sanitizer/lsan_interface.h dependency dropped.
make[4]: Circular include/sanitizer/msan_interface.h <- include/sanitizer/msan_interface.h dependency dropped.
make[4]: Circular include/sanitizer/netbsd_syscall_hooks.h <- include/sanitizer/netbsd_syscall_hooks.h dependency dropped.
make[4]: Circular include/sanitizer/scudo_interface.h <- include/sanitizer/scudo_interface.h dependency dropped.
make[4]: Circular include/sanitizer/tsan_interface.h <- include/sanitizer/tsan_interface.h dependency dropped.
make[4]: Circular include/sanitizer/tsan_interface_atomic.h <- include/sanitizer/tsan_interface_atomic.h dependency dropped.
make[4]: Circular include/sanitizer/ubsan_interface.h <- include/sanitizer/ubsan_interface.h dependency dropped.
make[4]: Circular include/fuzzer/FuzzedDataProvider.h <- include/fuzzer/FuzzedDataProvider.h dependency dropped.
make[4]: Circular include/sanitizer/memprof_interface.h <- include/sanitizer/memprof_interface.h dependency dropped.
make[4]: Circular include/profile/MemProfData.inc <- include/profile/MemProfData.inc dependency dropped.
make[4]: Circular include/xray/xray_interface.h <- include/xray/xray_interface.h dependency dropped.
make[4]: Circular include/xray/xray_log_interface.h <- include/xray/xray_log_interface.h dependency dropped.
make[4]: Circular include/xray/xray_records.h <- include/xray/xray_records.h dependency dropped.
make[4]: Circular include/orc/c_api.h <- include/orc/c_api.h dependency dropped.
make[4]: Circular include/profile/InstrProfData.inc <- include/profile/InstrProfData.inc dependency dropped.

It's not clear why this cycle happens, but compiler-rt also proposes to
create a separate build folder on their site: https://compiler-rt.llvm.org/.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v2:
  - This patch was orignally submitted to fix the ninja build, which does a hard assert on circular dependencies.
    Make is less strict on it, and retries with arbitrary dropping dependencies. The oringal git message was wrong
    to mention that it fixes the ninja build since ninja is not enabled by default anyway. So in v2, I just
    changed the git message to only mention the circular dependency warning.

  - Original Ninja error:

  ninja: error: dependency cycle: include/sanitizer/allocator_interface.h -> include/sanitizer/allocator_interface.h

---
 package/llvm-project/compiler-rt/compiler-rt.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/llvm-project/compiler-rt/compiler-rt.mk b/package/llvm-project/compiler-rt/compiler-rt.mk
index 03dc76eaea..5d9c3d8fa8 100644
--- a/package/llvm-project/compiler-rt/compiler-rt.mk
+++ b/package/llvm-project/compiler-rt/compiler-rt.mk
@@ -11,6 +11,7 @@ COMPILER_RT_LICENSE = NCSA MIT
 COMPILER_RT_LICENSE_FILES = LICENSE.TXT
 COMPILER_RT_CPE_ID_VENDOR = llvm
 COMPILER_RT_DEPENDENCIES = host-clang llvm
+COMPILER_RT_SUPPORTS_IN_SOURCE_BUILD = NO
 
 COMPILER_RT_INSTALL_STAGING = YES
 COMPILER_RT_INSTALL_TARGET = NO
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
